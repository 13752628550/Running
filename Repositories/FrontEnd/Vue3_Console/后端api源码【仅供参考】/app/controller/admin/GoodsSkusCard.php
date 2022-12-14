<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
use think\facade\Db;
use app\model\admin\GoodsSkusCardValue;
class GoodsSkusCard extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        return showSuccess($this->M->Mlist()->append(['goodsSkusCardValue']));
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
        $id = $request->param("goods_id");
        if ($id == 48) {
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
        if ($request->param("goods_id") == 48) {
    		$this->TestException();
    	}
        
        return showSuccess($this->M->Mupdate());
    }

	
	// 排序
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
        $goods_id = request()->Model->goods_id;
        if ($goods_id == 48) {
    		$this->TestException();
    	}
    	
        return showSuccess($this->M->Mdelete());
    }
    
    // 选择设置规格
    public function set(){
        $param = request()->param();
        // 演示数据
        if (request()->Model->goods_id == 48) {
    		$this->TestException();
    	}
        
        $data = array_map(function ($v) use($param){
            return [
                "goods_skus_card_id"=>$param["id"],
                "name"=>$param["name"],
                "value"=>$v,
                "order"=>50
            ];
        },$param["value"]);
        
        
        $this->M->where("id",$param["id"])->update([
            "name"=>$param["name"]
        ]);
        
        $GoodsSkusCardValue = new GoodsSkusCardValue();
        $GoodsSkusCardValue->where("goods_skus_card_id",$param["id"])->delete();
        $list = [];
        if(count($data) > 0){
            $list = $GoodsSkusCardValue->saveAll($data)->toArray();
        }
        
        return showSuccess([
            "goods_skus_card"=>[
                "id"=>$param["id"],
                "name"=>$param["name"],
            ],
            "goods_skus_card_value"=>$list
        ]);
    }
}
