<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
class Category extends Base
{
	protected $excludeValidateCheck = ['index'];
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
    	if ($id <= 372) {
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
    	if ($id <= 372) {
    		$this->TestException();
    	}
        return showSuccess($this->M->Mdelete());
    }

	
	// 排序
	public function sortCategory(){
		$data = request()->param('sortdata');
		$data = json_decode($data,true);
		return showSuccess($this->M->saveAll($data));
	}

}
