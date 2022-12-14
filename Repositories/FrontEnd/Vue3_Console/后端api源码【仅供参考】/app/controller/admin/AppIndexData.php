<?php

namespace app\controller\admin;

use app\controller\common\Base;
class AppIndexData extends Base
{
    // 不需要验证
    // protected $excludeValidateCheck = ['index'];
    // protected $ModelPath = 'admin\AppIndexCategory';
    
    public function index(){
        $param = request()->param();
        $d = $this->M->where('app_index_category_id',$param['app_index_category_id'])->order([
                'order'=>'asc',
                'id'=>'asc'
            ])->select();
        return showSuccess($d);
    }
    // 新增数据
    public function save(){
        ApiException('演示数据，禁止操作');
    	return showSuccess($this->M->Mcreate());
    }
    // 修改数据
    public function update(){
        ApiException('演示数据，禁止操作');
    	$param = request()->param();
        return request()->Model->save($param);
    }
    // 排序
	public function sortData(){
	    ApiException('演示数据，禁止操作');
		$data = request()->param('sortdata');
		$data = json_decode($data,true);
		return showSuccess($this->M->saveAll($data));
	}
    // 删除数据
    public function delete($id)
    {
        ApiException('演示数据，禁止操作');
    	return showSuccess($this->M->Mdelete());
    }
}
