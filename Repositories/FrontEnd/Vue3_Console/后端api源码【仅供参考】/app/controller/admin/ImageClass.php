<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;

class ImageClass extends Base
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

    public function images(){
        return showSuccess($this->M->MimageList());
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
    	if ($id <= 174) {
    		$this->TestException();
    	}
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
    	if ($id <= 174) {
    		$this->TestException();
    	}
    	
        return showSuccess($this->M->Mdelete());
    }
}
