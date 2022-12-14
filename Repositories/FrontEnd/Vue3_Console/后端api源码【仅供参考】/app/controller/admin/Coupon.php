<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
use app\model\admin\CouponUser;
use think\model\Relation;

class Coupon extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        return showSuccess($this->M->Mlist());
    }


    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        $p = $this->M->unsetCommonParams(request()->param());
        $p["status"] = 1;
        $p = $this->M->unsetCommonParams(request()->param());
        $p["start_time"] = strlen($p["start_time"]) != 10 ? intval($p["start_time"]/1000) : $p["start_time"];
        $p["end_time"] = strlen($p["end_time"]) != 10 ? intval($p["end_time"]/1000) : $p["end_time"];
        
        $now = time();
        if ($p["start_time"] >= $p["end_time"]) {
            ApiException("结束时间必须大于开始时间");
        }
        
        if ($p["start_time"] < $now) {
            ApiException("开始时间必须大于当前时间");
        }
        return showSuccess($this->M->create($p));
    }



    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    { 
        if(request()->Model->status == 0){
            ApiException('当前优惠券已失效');
        }
        $p = $this->M->unsetCommonParams(request()->param());
        $p["start_time"] = strlen($p["start_time"]) != 10 ? intval($p["start_time"]/1000) : $p["start_time"];
        $p["end_time"] = strlen($p["end_time"]) != 10 ? intval($p["end_time"]/1000) : $p["end_time"];
        
        // 处于领取中，禁止修改
        $now = time();
        if(!($p["start_time"] > $now)){
            ApiException("当前优惠券状态禁止修改");
        }
        
        if ($p["start_time"] >= $p["end_time"]) {
            ApiException("结束时间必须大于开始时间");
        }
        
        if ($p["start_time"] < $now) {
            ApiException("开始时间必须大于当前时间");
        }
        
        return showSuccess(request()->Model->save($p));
    }

    public function updateStatus(){
        // 演示数据
    	$id = request()->Model->id;
    	if ($id <= 10) {
    		$this->TestException();
    	}
    	
        if(request()->Model->status == 0){
            ApiException('当前优惠券已失效');
        }
        return showSuccess($this->M->_updateStatus());
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        // 演示数据
        $id = intval($id);
    	if ($id <= 10) {
    		$this->TestException();
    	}
        
        $p = request()->Model->toArray();
        $p["start_time"] = strtotime($p["start_time"]);
        $p["end_time"] = strtotime($p["end_time"]);
        $p["start_time"] = strlen($p["start_time"]) != 10 ? intval($p["start_time"]/1000) : $p["start_time"];
        $p["end_time"] = strlen($p["end_time"]) != 10 ? intval($p["end_time"]/1000) : $p["end_time"];
        
        $now = time();
        if ($p["start_time"] <= $now && $now <= $p["end_time"] && $p["status"] == 1) {
            ApiException("当前优惠券领取中，无法删除");
        }
        
        return showSuccess($this->M->Mdelete());
    }

}
