<?php

namespace app\middleware;

class checkManagerToken
{
    public function handle($request, \Closure $next)
    {
        $tag = 'manager';
        $model = '\\app\\model\\admin\\Manager';
        // 获取用户信息
        $token = $request->header('token');
        // token不存在
        if (!$token) return ApiException('非法token，请先登录！');
        // 没有登录
        $user = cms_getUser([
            'token'=>$token,
            'tag'=>$tag
        ]);
        if (!$user) return ApiException('非法token，请先登录！');
        // 成功，返回当前用户实例
        // 当前用户实例
        $request->UserModel = $model::find($user['id']);
        // 当前用户已被禁用
        if(!$request->UserModel->status){
            return ApiException('当前用户已被禁用');
        }
        // 当前用户数据
        $request->userInfo = $user;
        // 验证当前用户权限(超级管理员无需验证)
        if(!$request->UserModel->super){
        	if (!$request->UserModel->role->status) {
        		return ApiException('你所在角色组已被禁用');
        	}
        // 	$url = strtolower($request->controller().'/'.$request->action());
            $ruleName = $request->rule()->getName();
			$r = (new $model)->hasRule($request->UserModel,$ruleName,$request->method());
			if(!$r){
				return ApiException('你没有权限');
			}
        }
        
        return $next($request);
    }
}
