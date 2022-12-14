<?php

namespace app\controller\admin;

use app\controller\common\Base;
class AppIndexCategory extends Base
{
    // 不需要验证
    protected $excludeValidateCheck = ['index'];
    // protected $ModelPath = 'admin\AppIndexCategory';
    // 列表
    public function index(){
        $data = $this->M->select();
        return showSuccess($data);
    }
    // 新增
    public function save(){
        ApiException('演示数据，禁止操作');
    	return showSuccess($this->M->Mcreate());
    }
    // 删除
    public function delete($id)
    {
    	$id = intval($id);
    	if($id <= 7){
    		ApiException('演示数据，禁止删除');
    	}
    	if (count(request()->Model->indexData) > 0) {
    		ApiException('请先删除该分类下的数据');
    	}
        return showSuccess($this->M->Mdelete());
    }
}
