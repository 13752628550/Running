<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
use app\model\admin\SysSetting as SysSettingModel;
class SysSetting extends Base
{
	protected $excludeValidateCheck = ['get','upload'];
	
	// 演示数据禁止操作
    public function TestException(){
        ApiException('你已经操作成功了，只不过当前是《<a href="https://study.163.com/course/courseMain.htm?courseId=1212775807&share=2&shareId=480000001892585" target="_blank" style="color: #409eff;text-decoration-line: underline;">Vue3实战商城后台管理系统</a>》课程的演示站点，所以数据不会发生更改',40000);
    }
    
    /**
     * 设置
     *
     * @return \think\Response
     */
    public function set()
    {
        $this->TestException();
    	$p = request()->param();

    	$conf = cmsConfig();
    	
    	$p['upload_config'] = $conf['upload_config'];
    	
    	unset($p['alipay']);
    	unset($p['wxpay']);
    	
        // oss配置	
    // 	if($this->_isPrivate($p['upload_config']['ACCESS_KEY'])){
    // 	    $p['upload_config']['ACCESS_KEY'] = $conf['upload_config']['ACCESS_KEY'];
    // 	}
    // 	if($this->_isPrivate($p['upload_config']['SECRET_KEY'])){
    // 	    $p['upload_config']['SECRET_KEY'] = $conf['upload_config']['SECRET_KEY'];
    // 	}
    
    //     // 支付宝配置
    //     $alipay = $conf['alipay'];
    // 	if($this->_isPrivate($p['alipay']['app_id'])){
    // 	    $p['alipay']['app_id'] = $alipay['app_id'];
    // 	}
    // 	if($this->_isPrivate($p['alipay']['ali_public_key'])){
    // 	    $p['alipay']['ali_public_key'] = $alipay['ali_public_key'];
    // 	}
    // 	if($this->_isPrivate($p['alipay']['private_key'])){
    // 	    $p['alipay']['private_key'] = $alipay['private_key'];
    // 	}
    	
    // 	// 微信支付配置
    // 	$wxpay = $conf['wxpay'];
    // 	if($this->_isPrivate($p['wxpay']['app_id'])){
    // 	    $p['wxpay']['app_id'] = $wxpay['app_id'];
    // 	}
    // 	if($this->_isPrivate($p['wxpay']['miniapp_id'])){
    // 	    $p['wxpay']['miniapp_id'] = $wxpay['miniapp_id'];
    // 	}
    // 	if($this->_isPrivate($p['wxpay']['secret'])){
    // 	    $p['wxpay']['secret'] = $wxpay['secret'];
    // 	}
    // 	if($this->_isPrivate($p['wxpay']['appid'])){
    // 	    $p['wxpay']['appid'] = $wxpay['appid'];
    // 	}
    // 	if($this->_isPrivate($p['wxpay']['mch_id'])){
    // 	    $p['wxpay']['mch_id'] = $wxpay['mch_id'];
    // 	}
    // 	if($this->_isPrivate($p['wxpay']['key'])){
    // 	    $p['wxpay']['key'] = $wxpay['key'];
    // 	}
    // 	if($this->_isPrivate($p['wxpay']['cert_client'])){
    // 	    $p['wxpay']['cert_client'] = $wxpay['cert_client'];
    // 	}
    // 	if($this->_isPrivate($p['wxpay']['cert_key'])){
    // 	    $p['wxpay']['cert_key'] = $wxpay['cert_key'];
    // 	}
    
      	if($this->_isPrivate($p['ship'])){
    	    $p['ship'] = $conf['ship'];
    	}
    	
        $res = SysSettingModel::update($p,['id' => 1]);
        
        return showSuccess('ok');
    }
    
    public function _isPrivate($v){
        return strpos($v,'**') !== false;
    }

    /**
     * 获取.
     *
     * @return \think\Response
     */
    public function get()
    {
        $data = $this->M->find(1)->toArray();
        $data['upload_config']['ACCESS_KEY'] = "****************";
        $data['upload_config']['SECRET_KEY'] = "****************";
        
        $data['alipay'] = [
            "app_id" => $data['alipay']['app_id'] ? "****已配置****" : '',
            "ali_public_key" => $data['alipay']['ali_public_key'] ? "****已配置****" : '',
            "private_key" => $data['alipay']['private_key'] ? "****已配置****" : '',
        ];
        
        $data['wxpay'] = [
            "app_id" => $data['wxpay']['app_id'] ? "****已配置****" : '',
            "miniapp_id" => $data['wxpay']['miniapp_id'] ? "****已配置****" : '',
            "secret" => $data['wxpay']['secret'] ? "****已配置****" : '',
            "appid" => $data['wxpay']['appid'] ? "****已配置****" : '',
            "mch_id" => $data['wxpay']['mch_id'] ? "****已配置****" : '',
            "key" => $data['wxpay']['key'] ? "****已配置****" : '',
            "cert_client" => $data['wxpay']['cert_client'] ? "****已配置****.pem" : '',
            "cert_key" => $data['wxpay']['cert_key'] ? "****已配置****.pem" : '',
        ];
        
        $data['ship'] = $data['ship'] ? '****已配置****' : '';

        return showSuccess($data);
    }
    
    // 上传
    public function upload(){
        // $this->TestException();
    	try {
            validate(['file'=>'fileSize:10240|fileExt:pem'])->check(request()->file());
        } catch (\think\exception\ValidateException $e) {
            ApiException($e->getMessage(),40000);
        }
    	// 上传到本地服务器
    	$file = request()->file('file');
    	$savename = \think\facade\Filesystem::putFile( 'wx', $file);
    	return showSuccess('/storage/'.$savename);
    }
}
