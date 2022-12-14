<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
use app\model\admin\DistributionSetting as DistributionSettingModel;
class DistributionSetting extends Base
{
	protected $excludeValidateCheck = ['get'];
	
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
        $res = DistributionSetting::update($p,['id' => 1]);
        
        return showSuccess('ok');
    }
    /**
     * 获取.
     *
     * @return \think\Response
     */
    public function get()
    {
        $data = $this->M->find(1)->toArray();
        if($data){
            $data["spread_banners"] = $data["spread_banners"] ? explode(",",$data["spread_banners"]) : [];
        }
        return showSuccess($data);
    }
    
}
