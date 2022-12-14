<?php

namespace app\controller\admin;

use app\controller\common\Base;
class AppCategoryItem extends Base
{
    // 不需要验证
    // protected $excludeValidateCheck = ['index'];
    
    // 列表
    public function index(){
        $param = request()->param();
        $data = $this->M->where('category_id',$param['category_id'])->order([
            'id'=>'desc'
        ])->select();
        return showSuccess($data);
    }
    // 新增数据
    public function save(){

        $param = request()->param();
        $g = (new \app\model\admin\Goods())->where('id','in',$param['goods_ids'])->field('id,title,cover')->select()->toArray();
        $g = array_map(function($v) use($param){
            $v['goods_id'] = $v['id'];
            $v['category_id'] = $param['category_id'];
            $v['name']=$v['title'];
            $v['order'] = 50;
            unset($v['id']);
            return $v;
        },$g);
        if(count($g)){
            $this->M->saveAll($g);
        } else {
            ApiException('没有选中的关联商品');
        }

    	return showSuccess('ok');
    }
    // 删除数据
    public function delete($id)
    {
    	return showSuccess($this->M->Mdelete());
    }
}
