<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class Rule extends BaseModel
{

    // 角色-规则多对多关系
    public function roles(){
        return $this->belongsToMany('Role','role_rule');
    }

    // 清除与角色之间的关系
    public function delRoles($roleId){
        return $this->roles()->detach($roleId);
    }

    // 关联子分类
    public function childRules(){
        return $this->hasMany('Rule');
    }

    // 列表
    public function Mlist(){
        $param = request()->param();
        $arr = $this->order([
        	'order'=>'asc',
        	'id'=>'asc'
        ])->select();
        $totalCount = $this->count();
        $list = list_to_tree2($arr->toArray(),'rule_id');
        return [
        	'list'=>$list,
        	'totalCount'=>$totalCount,
        	'rules'=> list_to_tree2($arr->toArray(),'rule_id','child',0,function($v){
        	    return $v['menu'] == 1;
        	})
        // 	'rules'=>list_to_tree($arr->toArray(),'rule_id',0,0,function($v){
        // 	    return $v['menu'] == 1;
        // 	})
        ];
    }
    /**
     * 删除规则之前操作
     * 1. 删除角色和规则的关联关系
     * 2. 删除对应的子分类
     * @param [type] $rule
     * @return void
     */
    public static function onBeforeDelete($rule){
       // 删除角色和规则的关联关系
       $roleIds = $rule->roles->map(function($v){
            return $v->id;
       })->toArray();
       if (count($roleIds)) $rule->delRoles($roleIds);

       // 删除对应的子分类
       $rule->childRules->each(function($v){
            $v->delete();
       });
    }
}
