<?php

namespace app\model\common;
/**
 * @mixin think\Model
 */
class UserLevel extends BaseModel
{

    // 获取当前等级下的会员
    public function users(){
        return $this->hasMany('User');
    }
    
    // 列表
    public function Mlist(){
        $param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $totalCount = $this->count();
        $list = $this->page($param['page'],$limit)->order([
    		'id'=>'desc'
		])->select();
        return [
        	'list'=>$list,
        	'totalCount'=>$totalCount
        ];
    }
    /**
     * 删除之后操作
     * 1. 初始化对应会员的user_level_id为0
     * @param [type] $userLevel
     * @return void
     */
    public static function onBeforeDelete($userLevel){
        // 获取当前等级下的所有会员
        $users = $userLevel->users;
        $users->each(function($user){
            $user->user_level_id = 3;
            $user->save();
        });
    }
}
