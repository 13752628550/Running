<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
use think\facade\Db;
class GoodsSkusCardValue  extends Base
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
        // 演示数据
    	$goods_skus_card_id = $request->param("goods_skus_card_id");
    	$goods_id = Db::table("goods_skus_card")->where("id",$goods_skus_card_id)->value("goods_id");
    	if ($goods_id == 48) {
    		$this->TestException();
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
    	$goods_skus_card_id = $request->param("goods_skus_card_id");
    	$goods_id = Db::table("goods_skus_card")->where("id",$goods_skus_card_id)->value("goods_id");
    	if ($goods_id == 48) {
    		$this->TestException();
    	}
        
        return showSuccess($this->M->Mupdate());
    }


    public function updateStatus(){
        return showSuccess($this->M->_updateStatus());
    }
    
    public function sort(){
		$data = request()->param('sortdata');
		return showSuccess($this->M->saveAll($data));
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
        $goods_skus_card_id = request()->Model->goods_skus_card_id;
    	$goods_id = Db::table("goods_skus_card")->where("id",$goods_skus_card_id)->value("goods_id");
    	if ($goods_id == 48) {
    		$this->TestException();
    	}
        
        return showSuccess($this->M->Mdelete());
    }
}
