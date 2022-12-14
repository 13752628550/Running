<?php

namespace app\model\admin;

use app\model\common\BaseModel;
/**
 * @mixin think\Model
 */
class Manager extends BaseModel
{
    // 用户有哪些角色
    public function role(){
        return $this->belongsTo('Role');
    }

    /**
     * 用户是否有某个权限
     *
     * @param [type] $user  当前用户模型
     * @param [type] $rule  需要验证规则模型
     * @return boolean
     */
    public function hasRule($user,$rule,$method = false){
    	// 当前规则属于哪些用户组
    	$where = [ 'status'=>1 ];
    	$key = is_string($rule) ? 'condition' : 'id';
    	$where[$key] = $rule;
    	// 请求类型
    	if($method){
    		$where['method'] = $method;
    	}
    	$r = \app\model\admin\Rule::where($where)->find();
    	// 规则不存在
    	if(!$r){
    		return false;
    	}
    	// 获取规则对应角色
    	$roles = $r->roles;
        // 对比当前用户的角色
        $res = $roles->filter(function($v) use($user){
            return $v->id === $user->role->id;
        });
        return !!$res->count();
    }

    // 修改用户角色
    public function setRole($user,$roleId){
        return $user->save([
            'role_id'=>$roleId
        ]);
    }
    
    /**
     * 搜索器
     */
    // 搜索用户名
    public function searchUsernameAttr($query,$val,$data){
        $query->where('username','like','%'.$val.'%');
    }

    /** 
     * 修改器
     */
    // 自动加密
    public function setPasswordAttr($value,$data){
        return password_hash($value,PASSWORD_DEFAULT);
    }

}
