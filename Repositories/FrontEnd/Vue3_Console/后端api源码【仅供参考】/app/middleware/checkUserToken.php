<?php

namespace app\middleware;

class checkUserToken
{
    public function handle($request, \Closure $next)
    {
        $tag = 'user';
        $model = '\\app\\model\\common\\User';
        // token是否存在
        $token = $request->header('token');
        if (!$token) return ApiException('非法token');
        // 获取用户信息
        $user = cms_getUser([
            'token'=>$token,
            'tag'=>$tag
        ]);
        if (!$user) return ApiException('非法token，请先登录！');
        // 成功，返回当前用户实例
        if ($model) {
            // 当前用户实例
            $request->UserModel = $model::find($user['id']);
        }else{
            // 当前用户数据（数组）
            $request->userInfo = $user;
        }
        return $next($request);
    }
}
