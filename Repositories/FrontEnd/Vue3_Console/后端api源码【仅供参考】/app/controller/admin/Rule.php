<?php

namespace app\controller\admin;

use think\Request;
// 引入基类控制器
use app\controller\common\Base;
use think\facade\Db;
class Rule extends Base
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
        $rule_id = $request->param("rule_id");
        if($rule_id != 0){
            $menu = Db::table("rule")->where("id",$rule_id)->value("menu");
            if($menu == null){
                ApiException("父级菜单不存在");
            }
            if($menu != 1){
                ApiException("rule_id必须是菜单");
            }
        }
        
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
    	if ($id <= 346) {
    		$this->TestException();
    	}
    	
        return showSuccess($this->M->Mupdate());
    }


    // 修改状态
    public function updateStatus(Request $request)
    {
        // 演示数据
        $id = $request->Model->id;
    	if ($id <= 346) {
    		$this->TestException();
    	}
    	
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
        // 演示数据
        $id = intval($id);
    	if ($id <= 346) {
    		$this->TestException();
    	}
    	
        return showSuccess($this->M->Mdelete());
    }
}
