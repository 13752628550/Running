<?php

namespace app\controller\admin;

use think\Request;
// 引入基类控制器
use app\controller\common\Base;

class Notice extends Base
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
        return showSuccess($this->M->Mcreate());
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
        // 演示数据
        $id = intval($id);
    	if ($id <= 2) {
    		$this->TestException();
    	}
        
        return showSuccess($this->M->Mupdate());
    }


    // 修改状态
    public function updateStatus(Request $request)
    {
        return showSuccess($this->M->_UpdateStatus());
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        $id = intval($id);
    	if ($id <= 2) {
    		$this->TestException();
    	}
        
        return showSuccess($this->M->Mdelete());
    }
}
