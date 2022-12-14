<?php

namespace app\controller\admin;

use app\controller\common\Base;
use think\Request;
use think\facade\Db;
class Agent extends Base
{
    // 定义自动实例化模型
    protected $ModelPath = 'common\\User';
    protected $excludeValidateCheck = ["statistics"];

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
    	$param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $keyword = getValByKey('keyword',$param,'');
        // 关键词
        $method = $this->M->filterLoginMethod($keyword);
        
        $model = $this->M;

        // 开始结束时间
        if (array_key_exists('starttime',$param) && array_key_exists('endtime',$param)) {
        	$model = $model->whereTime('create_time', 'between', [$param['starttime'], $param['endtime']]);
        } else if(array_key_exists('type',$param)){
	        switch ($param["type"]) {
                case 'today': // 今天
                    $model = $model->whereDay('create_time');
                    break;
                case 'yesterday': // 昨天
                    $model = $model->whereDay('create_time', 'yesterday');
                    break;
                case 'last7days': // 最近7天
                    $model = $model->whereWeek('create_time');
                    break;
            }
	    }

        // 用户类型
        if(array_key_exists("user_id",$param)){
            $user_id = intval(getValByKey('user_id',$param,0));
            $level = intval(getValByKey('level',$param,0));
            if($level != 0){
                $model = $model->where("p".$level,"=",$user_id);
            } else {
                $model = $model->whereOr([
                    [
                        [ "p1","=",$user_id ]
                    ],[
                        [ "p2","=",$user_id ]
                    ]
                ]);
            }
        }
        
        $model = $model->whereLike($method,'%'.$keyword.'%');

        $totalCount = $model->count();
        $list = $model->page($param['page'],$limit)
                ->withoutField('user_level_id,update_time,last_login_time,wechat_openid,')
		        ->with([
		            'userInfo'
		        ])
		        ->order([ 'create_time'=>'desc' ])
				->select()
				->hidden(['password']);
        return showSuccess([
        	'list'=>$list,
        	'totalCount'=>$totalCount
        ]);
    }

    // 统计
    public function statistics()
    {
        // 总分销人数
        $totalAgent = Db::table('user')->count("id");
        // 总推广订单数
        $totalOrderNum = Db::table('user_bill')->where(['status'=>1])->count("id");
        // 总推广订单金额
        $totalOrderPrice = Db::table('user')->sum("order_price");
        // 总提现次数(次)
        $totalExtractTimes = Db::table('user_extract')->where(['status'=>1])->count("id");

        return showSuccess([
            "panels"=>[
                [ 
                    "color"=>"bg-blue-400",
                    "label"=>"分销员人数(人)",
                    "value"=>$totalAgent
                ],
                [
                    "color"=>"bg-orange-400",
                    "label"=>"订单数(单)",
                    "value"=>$totalOrderNum
                ],
                [
                    "color"=>"bg-green-400",
                    "label"=>"订单金额(元)",
                    "value"=>$totalOrderPrice
                ],
                [
                    "color"=>"bg-indigo-400",
                    "label"=>"提现次数(次)",
                    "value"=>$totalExtractTimes
                ]
            ]
        ]);
    }
}