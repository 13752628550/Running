<?php

namespace app\controller\mobile;

use think\Request;
use app\controller\common\Base;
class Category extends Base
{
	protected $excludeValidateCheck = ['app_category'];
    protected $ModelPath = 'admin\Category';
    // app分类
    public function app_category()
    {
    	$list = $this->M->where([
    	        'status'=>1,
    	        'category_id'=>0
    	    ])->order([
            	'order'=>'asc',
            	'id'=>'desc'
            ])->with(['appCategoryItems'=>function($q){
                    return $q->order('id','desc');
                }])->select();
            
        return showSuccess($list);
    }
}
