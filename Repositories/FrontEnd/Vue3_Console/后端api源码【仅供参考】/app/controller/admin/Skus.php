<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
class Skus extends Base
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
    	if ($id <= 211) {
    		$this->TestException();
    	}
    	
        return showSuccess($this->M->Mupdate());
    }


    public function updateStatus(){
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
    	if ($id <= 211) {
    		$this->TestException();
    	}
    	
        return showSuccess($this->M->Mdelete());
    }
    
    // 批量删除
    public function deleteAll(){
        // 演示数据
        $ids = request()->param("ids");
    	if ($ids[0] <= 211) {
    		$this->TestException();
    	}
        return showSuccess($this->M->MdeleteAll());
    }
}
