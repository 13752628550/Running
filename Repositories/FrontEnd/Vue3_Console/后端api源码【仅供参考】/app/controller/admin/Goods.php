<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
use think\facade\Db;
class Goods extends Base
{
	protected $excludeValidateCheck = ['hotList','create'];
    
    // 审核商品
    public function checkGoods(){
    	$request = request();
    	
        // 演示数据
    	$id = $request->Model->id;
    	if ($id <= 49) {
    		$this->TestException();
    	}
    	
        return showSuccess($request->Model->save([
            'ischeck'=>$request->param('ischeck')
        ]));
    }
    
    // 后台商品列表
    public function index()
    {
    	
    	$param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $tab = getValByKey('tab',$param,'all');
        $model = $this->M;
        // 订单类型
        switch ($tab) {
        	case 'checking': // 审核中
        		$model = $this->M->where('ischeck',0)
        						 ->whereNull('delete_time');
        		break;
        	case 'saling': // 销售中
        		$model = $this->M->where('ischeck',1)
        						 ->where('status',1);
        		break;
        	case 'off': // 已下架
        		$model = $this->M->where('status',0);
        		break;
        	case 'min_stock': // 库存预警
        		$model = $this->M->where('status',0)
        						 ->whereColumn('stock','<=','min_stock');
        		break;
        	case 'delete': // 回收站
        		$model = $this->M->onlyTrashed();
        		break;	
        }
        // 搜索条件
        if (array_key_exists('category_id',$param)) {
        	$model = $model->where('category_id',$param['category_id']);
        }
        if (array_key_exists('title',$param)) {
        	$model = $model->where('title','like','%'.$param['title'].'%');
        }
        
        $totalCount = $model->count();
        $list = $model->page($param['page'],$limit)
		        ->with(['category','goodsBanner','goodsAttrs','goodsSkus','goodsSkusCard.goodsSkusCardValue'])
		        ->order([ 'order'=>'desc','id'=>'desc' ])
				->select();
		// 分类
        $cates = (new \app\model\admin\Category())->select();
        $cates = list_to_tree($cates->toArray(),'category_id');
        return showSuccess([
        	'list'=>$list,
        	'totalCount'=>$totalCount,
        	'cates'=>$cates
        ]);
    	
        return showSuccess($this->M->Mlist());
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
    	// 分类
        $cates = (new \app\model\admin\Category())->select();
        $cates = list_to_tree($cates->toArray(),'category_id');
        // 运费模板
        // $express = (new \app\model\admin\Express())->Mlist();
        // 商品类型列表
        // $type = (new \app\model\admin\GoodsType())->with(['goodsTypeValues'=>function($q){
        // 	$q->where('status',1);
        // }])->where('status',1)->select();
        // 获取goods_id为0的商品规格列表
        // $goodsSkusCard = (new \app\model\admin\GoodsSkusCard())->with(['goodsSkusCardValue'])->where('goods_id',0)->select();
        return showSuccess(compact(
            'cates',
            // 'express',
            // 'type',
            // 'goodsSkusCard'
        ));
    }

	// 后端商品详情
	public function adminread($id)
    {
    	$goods = request()->Model->append(['goodsBanner','goodsAttrs','goodsSkus','goodsSkusCard.goodsSkusCardValue']);
    	// 商品类型列表
        $types = (new \app\model\admin\GoodsType())->with(['goodsTypeValues'=>function($q){
        	$q->where('status',1);
        }])->where('status',1)->select();
        
        $goods->types = $types;
        return showSuccess($goods);
    }

	// 获取当前商品的轮播图
	public function banners(){
        return showSuccess(request()->Model->goodsBanner);
	}
	
	// 更新当前商品的轮播图
	public function updateBanners(){
		// 删除之前
		$goods_id = request()->Model->id;
		request()->Model->goodsBanner()->where([
			'goods_id'=>$goods_id
		])->delete();
		$banners = request()->param('banners');
		$data = array_map(function($item) use($goods_id){
			return [
				'url'=>$item,
				'goods_id'=>$goods_id
			];
		},$banners);
		$res = request()->Model->goodsBanner()->saveAll($data);
		return showSuccess($res);
	}

	// 更新商品属性
	public function updateAttrs(){
	    ApiException('演示数据，禁止操作');
		// 删除之前
		$goods_id = request()->Model->id;
		request()->Model->goodsAttrs()->where([ 'goods_id'=>$goods_id ])->delete();
		// 创建新的
		$goods_attrs = request()->param('goods_attrs');
		$res = request()->Model->goodsAttrs()->saveAll($goods_attrs);
		return showSuccess($res);
	}

	// 更新商品规格
	public function updateSkus(){
	    // 演示数据
    	$id = request()->Model->id;
    	if ($id == 48 || $id == 49) {
    		$this->TestException();
    	}
	    
	    $result = Db::transaction(function (){
	        $params = request()->param();
    		$goods = request()->Model;
    		$GoodsSkus = new \app\model\admin\GoodsSkus();
    		// 单规格
    		if ($params['sku_type'] == 0) {
    			// 原本多规格
    			if ($goods->sku_type == 1) {
    		        $GoodsSkus->where('goods_id',$goods->id)->delete();
    			}
    			$goods->sku_type = 0;
    			$goods->sku_value = $params['sku_value'];
    			$res = $goods->save();
    			return showSuccess($res);
    		}
    		// 多规格
    		$goods->sku_type = 1;
    		$goods->save();
    		// 清除多规格
    		Db::name('goods_skus')->where('goods_id',$goods->id)->delete();
            // $GoodsSkus->where('goods_id',$goods->id)->delete();
    		// 创建新的
    		$params['goodsSkus'] = array_map(function($v) use($goods){
    		    $v['skus'] = json_encode((object)$v['skus']);
    		    $v['goods_id'] = $goods->id;
    		    return $v;
    		},$params['goodsSkus']);
    // 		halt($params['goodsSkus']);
            $res = Db::name('goods_skus')->insertAll($params['goodsSkus']);
    // 		$res = $GoodsSkus->saveAll($params['goodsSkus']);
    		return $res;
	    });
	    
		return showSuccess($result);
	}

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        $param = $request->param();
        $param['ischeck'] = 0;
        return showSuccess($this->M->create($param));
    }


    // 更新
    public function update(Request $request, $id)
    {	
        // 演示数据
    	$id = request()->Model->id;
    	if ($id == 48 || $id == 49) {
    		$this->TestException();
    	}
        
    	$param = $request->param();
    	if (count($param) <= 1) {
    		ApiException('参数错误');
    	}
    	
        return showSuccess($request->Model->save($param));
    }


    public function updateStatus(){
        return showSuccess($this->M->_updateStatus());
    }
    
    // 删除
    public function delete($id)
    {
        // 演示数据
    	if ($id <= 49) {
    		$this->TestException();
    	}
    	
        return showSuccess($this->M->Mdelete());
    }
    
    
    // 彻底删除
    public function destroy(){
    	$ids = request()->param('ids');
    	
    	// 演示数据
    	if ($ids[0] <= 49) {
    		$this->TestException();
    	}
    	
    	$res = $this->M->onlyTrashed()->where('id','in',$ids)->select();
    	$res->each(function($item){
    		$item->force()->delete();
    	});
    	return showSuccess('ok');
    }
    
    // 批量恢复
    public function restore(){
    	$ids = request()->param('ids');
    	
    	// 演示数据
    	if ($ids[0] <= 49) {
    		$this->TestException();
    	}
    	
    	$res = $this->M->onlyTrashed()->where('id','in',$ids)->select();
    	$res->each(function($item){
    		$item->restore();
    	});
    	return showSuccess('ok');
    }
    
    // 批量删除
    public function deleteAll(){
    	$ids = request()->param('ids');
    	
    	// 演示数据
    	if ($ids[0] <= 49) {
    		$this->TestException();
    	}
    	
    	$res = $this->M->where('id','in',$ids)->select();
    	$res->each(function($item){
    		$item->delete();
    	});
    	return showSuccess('ok');
    }
    
    // 上架/下架
    public function changeStatus(){
    	$params = request()->param();
    	
    	// 演示数据
    	if ($params['ids'][0] <= 49) {
    		$this->TestException();
    	}
    	
    	$res = $this->M->where('id','in',$params['ids'])->update([
    		'status'=>$params['status']
    	]);
    	return showSuccess($res);
    }
    
}
