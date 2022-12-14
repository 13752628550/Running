<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;

class Image extends Base
{

    // 默认相册0 图片列表
    public function index(){
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
        return showSuccess($this->M->Mupdate());
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
    	if ($id <= 468) {
    		$this->TestException();
    	}
        
        return showSuccess($this->M->Mdelete());
    }

    // 批量删除
    public function deleteAll(){
        // 演示数据
        $ids = request()->param("ids");
    	if ($ids[0] <= 493) {
    		$this->TestException();
    	}
        
        return showSuccess($this->M->MdeleteAll());
    }
}
