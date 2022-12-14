<?php

namespace app\controller\mobile;

use app\controller\common\Base;
class AppIndexCategory extends Base
{
    // 不需要验证
    protected $excludeValidateCheck = ['index'];
    protected $ModelPath = 'admin\AppIndexCategory';
    
    // 获取分类和首页数据
    public function index(){
        $category = $this->M->select();
        $data =  count($category) > 0 ? $category[0]->indexData()->limit(5)->select()->toArray() : [];
        $data = array_map(function($v){
            if($v["data"]){
                if($v["type"] != "threeAdv"){
                    $v["data"] = object_array($v["data"]);
                } else {
                    $v["data"]->{'big'} = $v["data"]->{'0'};
                    $v["data"]->{'smalltop'} = $v["data"]->{'1'};
                    $v["data"]->{'smallbottom'} = $v["data"]->{'2'};
                }
            }
            return $v;
        },$data);
        return showSuccess([
            'category'=>$category,
            'data'=>$data
        ]);
    }
    // 获取分类下的数据
    public function read()
    {
        $param = request()->param();
        $data = request()->Model->indexData()->page($param['page'],5)->select();
        return showSuccess($data);
    }
}
