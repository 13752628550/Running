<?php

namespace app\controller\mobile;

use think\Request;
use app\controller\common\Base;

use think\model\Relation;
use app\model\admin\Goods;
class Cart extends Base
{
    // 不需要验证的方法
    protected $excludeValidateCheck = ['index'];
    protected $ModelPath = 'admin\Cart';
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $carts = request()->UserModel->carts()->order('id','desc')->select();
        $carts->where('skus_type',1)->load(['goodsSkus.goods']);
        $carts->where('skus_type',0)->load(['goods']);
        
        $arr = [];
        
        $carts = $carts->toArray();
        
        // halt($carts);
        
        $arr =[];
        foreach ($carts as $item){
        	if ($item['skus_type'] === 1) {
        	   // halt($item);
        		$skus = $item['goods_skus']['skus'];
				$skusArr = [];
				foreach ($skus as $k=>$v){
					$skusArr[] = $v['value'];
				}
				$arr[] = [
					"checked"=>false,
					"id"=>$item['id'],
					"goods_id"=>$item['goods_skus']['goods_id'],
					"shop_id"=>$item['shop_id'],
					"title"=>$item['goods_skus']['goods']['title'],
					"cover"=>$item['goods_skus']['goods']['cover'],
					"pprice"=>$item['goods_skus']['pprice'],
					"num"=>$item['num'],
					"minnum"=>$item['goods_skus']['stock'] > 0 ? 1 : 0,
					"maxnum"=>$item['goods_skus']['stock'],
					"skus_type"=>1,
					"skusText"=>implode(',',$skusArr)
				];
        	} else {
        		$arr[] = [
	        		"checked"=>false,
					"id"=>$item["id"],
					"goods_id"=>$item['goods']['id'],
					"title"=>$item["goods"]["title"],
					"cover"=>$item["goods"]["cover"],
					"pprice"=>$item['goods']['sku_value']->pprice,
					"num"=>$item["num"],
					"minnum"=>$item["goods"]["stock"] > 0 ? 1 : 0,
					"maxnum"=>$item["goods"]["stock"],
					"skus_type"=>0
				];
        	}
        }
        
        
        return showSuccess($arr);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        return showSuccess($this->M->addCart());
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
    	$goods_id = request()->Model->goodsSkus->goods->id;
    	$goods = Goods::with(['goodsSkus','goodsSkusCard.goodsSkusCardValue'])->field(['id','title','cover','min_price'])->find($goods_id);
    	return showSuccess($goods);
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
        $param = request()->param();
        $cart = request()->Model;
        $cart->shop_id = $param['shop_id'];
        $cart->num = $param['num'];
        // 存在，数量合并 移除当前
        $before = $this->M->where('shop_id',$param['shop_id'])->find();
        if ($before) {
            // 库存不足
            if (($before->num + $param['num']) > request()->goodsStock) {
               ApiException('商品库存不足');
            }
            $before->num = $param['num'];
            return showSuccess($before->save());
        }
        // 不存在 直接创建
        return showSuccess($cart->save());
    }
    
    public function updateNumber(Request $request, $id)
    {
        $param = request()->param();
        $cart = request()->Model;
        $cart->num = $param['num'];
        return showSuccess($cart->save());
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete()
    {
        $param = request()->param();
        $data = array_unique(explode(',',$param['shop_ids']));
        if (count($data) === 0) {
            ApiException('请选择要删除的商品id');
        }
        $result = request()->UserModel->carts()->where('id','in',$data)->delete();
        return showSuccess($result);
    }
}
