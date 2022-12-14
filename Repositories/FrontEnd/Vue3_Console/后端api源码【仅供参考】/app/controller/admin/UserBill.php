<?php

namespace app\controller\admin;
use think\Request;
use app\controller\common\Base;

class UserBill extends Base
{
    public function index()
    {
    	$param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $keyword = getValByKey('keyword',$param,'');
        
        $model = $this->M;

        // 关键词
        if($keyword){
            $model = $model->hasWhere("order",[
                [ "no",'like','%'.$keyword.'%' ]
            ]);
        }

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
        if(array_key_exists("level",$param) && intval($param["level"]) != 0){
            $model = $model->where("level","=",intval($param["level"]));
        }

        if(array_key_exists("user_id",$param)){
            $user_id = intval(getValByKey('user_id',$param,0));
            $model = $model->where("user_id","=",$user_id);
        }

        $totalCount = $model->count();
        $list = $model->page($param['page'],$limit)
		        ->with([
		            'order'=>function($query){
                        return $query->field("id,no,user_id")->with([
                                    "user"=>function($query){
                                        return $query->field("id,username,nickname,phone");
                                    },
                               ]);
                    },
                    // 'user'=>function($query){
                    //     return $query->field("id,username,nickname,phone");
                    // },
		        ])
		        ->order([ 'create_time'=>'desc' ])
				->select();
        return showSuccess([
        	'list'=>$list,
        	'totalCount'=>$totalCount
        ]);
    }

}
