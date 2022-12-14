<?php

namespace app\model\admin;

use app\model\common\BaseModel;
/**
 * @mixin think\Model
 */
class Category extends BaseModel
{
	// 关联商品
	public function appCategoryItems(){
		return $this->hasMany('AppCategoryItem');
	}

    // 关联子分类
    public function categories(){
        return $this->hasMany('Category');
    }
    
	// 关联商品
	public function goods(){
		return $this->hasMany('Goods');
	}

    // 列表
    public function Mlist(){
        $param = request()->param();
        $arr = $this->order([
        	'order'=>'asc',
        	'id'=>'desc'
        ])->select();
        return list_to_tree2($arr->toArray(),'category_id');
    }

    /**
     * 删除规则之前操作
     * 1. 删除关联关系
     * 2. 删除对应的子分类
     * @param [type] $category
     * @return void
     */
    public static function onAfterDelete($category){
        // 删除对应的子分类
        $category->categories->each(function($v){
            $v->delete();
        });
    }
}
