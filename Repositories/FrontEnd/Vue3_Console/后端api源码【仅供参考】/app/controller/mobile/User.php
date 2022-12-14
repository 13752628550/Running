<?php

namespace app\controller\mobile;

use app\controller\common\Base;
use think\Request;
class User extends Base
{
    // 不需要验证
    protected $excludeValidateCheck = ['logout'];
    // 定义自动实例化模型
    protected $ModelPath = 'common\\User';
    
    // 登录
    public function login(Request $request){
    	$user = cms_login([
            'data'=>$request->UserModel,
            'tag'=>'user'
        ]);
        return showSuccess($user);
    }

    // 注册
    public function reg(Request $request){
        // 是否开启注册
        $conf = cmsConfig();
        
        if(!$conf['open_reg']){
            ApiException('商家已关闭了注册功能');
        }
    	$param = request()->param();
    	$this->M->checkUnique('username','用户名');
    	if(!array_key_exists('password',$param)){
    		return ApiException('密码不能为空');
    	}

    	$validate = \think\facade\Validate::rule([
            'password'  => function($value) use($conf) { 
                $r = null;
                $msg = '密码必须';
                if($conf['password_encrypt']){
            	    $m = null;
            	    $password_encrypt = explode(",", $conf['password_encrypt']);
            	    if(in_array(0,$password_encrypt)){
            	        $r = '(?=.*[0-9])';
            	        $m .= ' 数字';
            	    }
                    if(in_array(1,$password_encrypt)){
                        $r .= '(?=.*[a-z])';
                        $m .= ' 小写字母';
                    }
                    if(in_array(2,$password_encrypt)){
                       $r .= '(?=.*[A-Z])';
                       $m .= ' 大写字母';
                    }
            	    if($m){
            	        $msg .= '由'.$m.'组成';
            	    }
            	}
            	$len = ( $conf['password_min'] ? intval($conf['password_min']) : 6);
            	$r .= '.{'.$len.',}';
            	$msg .= '且长度大于'.$len;
            	return preg_match('/'.$r.'/', $value) ? true : $msg;
            },
        ]);
        if (!$validate->check([
            'password'  => $param['password']
        ])) {
            ApiException($validate->getError());
        }
    	
    	if(!array_key_exists('repassword',$param)){
    		return ApiException('重复密码不能为空');
    	}
    	if($param['password'] != $param['repassword']){
    	    return ApiException('密码和重复密码不相等');
    	}
    	$user = $this->M->create([
    	    "username"=>$param['username'],
    	    "password"=>$param['password'],
    	    "status"=>1
    	])->toArray();
    	
    	unset($user['password']);
    	
        return showSuccess($user);
    }


    // 退出
    public function logout(Request $request){
        return showSuccess(cms_logout([
            'tag'=>'user',
            'token'=>$request->header('token')
        ]));
    }
}
