<?php

namespace app\controller\admin;

use app\controller\common\Base;
use think\Request;
class User extends Base
{
    // 定义自动实例化模型
    protected $ModelPath = 'common\\User';
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
        $user_level_id = getValByKey('user_level_id',$param,0);
        $method = $this->M->filterLoginMethod($keyword);
        $where = [
        	[ $method,'like','%'.$keyword.'%' ]
        ];
        
        if($user_level_id != 0){
        	$where[] = ['user_level_id','=',$user_level_id];
        }
        
        $totalCount = $this->M->where($where)->count();
        $list = $this->M->page($param['page'],$limit)
        		->where($where)
		        ->with([
		            'userLevel'=>function($q){
		                $q->field("id,name");
		            }
		           ])
		        ->order([ 'id'=>'desc' ])
				->select()
				->hidden(['password']);
		$user_level = \app\model\common\UserLevel::field(['id','name'])->select();
        return showSuccess([
        	'list'=>$list,
        	'totalCount'=>$totalCount,
        	'user_level'=>$user_level
        ]);
    }


    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save()
    {
    	$param = request()->param();
    	$this->M->checkUnique('username','用户名');
    	if(!array_key_exists('password',$param)){
    		return ApiException('密码不能为空');
    	}
    	if(request()->param("phone")){
    	    $this->M->checkUnique('phone','手机');
    	}
    	if(request()->param("email")){
    	    $this->M->checkUnique('email','邮箱');
    	}
        return showSuccess($this->M->Mcreate());
    }


    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        // 演示数据
        $id = intval($id);
    	if ($id <= 41) {
    		$this->TestException();
    	}
        
        return showSuccess($this->M->Mupdate());
    }

    // 修改状态
    public function updateStatus(){
        // 演示数据
        $id = request()->Model->id;
    	if ($id <= 41) {
    		$this->TestException();
    	}
    	
        return showSuccess($this->M->_updateStatus());
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
    	$id = request()->param('id');
    	// 演示数据
    	if ($id <= 41) {
    		$this->TestException();
    	}
    	
        return showSuccess($this->M->Mdelete());
    }

}
