<?php

namespace app\controller\mobile;

use think\Request;
use app\controller\common\Base;
class Goods extends Base
{
	protected $excludeValidateCheck = ['hotList','create','read'];
    protected $ModelPath = 'admin\\Goods';
    // 前端商品详情
    public function read($id)
    {
        $goods = $this->M->where([
            'ischeck'=>1,
            "status"=>1
        ])->find($id);
        if($goods){
            $goods->append(['goodsBanner','goodsAttrs','goodsSkus','goodsSkusCard.goodsSkusCardValue']);
            $goods->hotComments = $goods->comments()->with(['user'=>function($query){
        		$query->field(['id','nickname','avatar']);
        	}])->field(['id','rating','review','review_time','goods_num','user_id'])->order('goods_num','desc')->limit(3)->select();
        	$goods->hotList = $this->M->hotList();
        	if($goods->sku_type == 1 && (count($goods->goodsSkus) == 0)){
        	    ApiException('该商品的多规格参数缺失');
        	}
        } else {
            ApiException('该商品ID不存在');
        }
        return showSuccess($goods);
    }
	

    // 商品评论
    public function comments(){
    	$params = request()->param();
    	
    	$where = [];
    	
    	if (array_key_exists('comment_type',$params)) {
    		$type = [
    			'good'=>'4,5',
    			'middle'=>'3',
    			'bad'=>'1,2'
    		];
    		$where = [
    			['rating','in',$type[$params['comment_type']]]
    		];
    	}
    	
    	$page = array_key_exists('page',$params) ? (int)$params['page'] : 1;
    	
    	$comments = request()->Model->comments()->with(['user'=>function($query){
    		$query->field(['id','nickname','avatar']);
    	}])
    	->field(['id','rating','review','review_time','goods_num','user_id','extra'])
    	->where($where)
    	->order('goods_num','desc')
    	->page($page,10)
    	->select();
    	
    	$total = request()->Model->comments()->count();
    	
    	$good = request()->Model->comments()->where('rating','in','4,5')->count();
    	
    	return showSuccess([
    		'list'=>$comments,
    		'total'=>$total,
    		'good_rate'=>$total > 0 ? ($good/$total) : 0
    	]);
    }
    
    
    // 搜索商品
    public function search(){
        $params = request()->param();
        // 条件
        $where = [
            [ 'title','like','%'.$params['title'].'%' ]
        ];
        
        if(array_key_exists('price',$params)){
        	$price = explode(',',$params['price'],2);
        	$where[] = [
        		'min_price',$price[0],$price[1]
        	];
        }
        // 排序
        $order = [];
        
        if(array_key_exists('all',$params)){
        	$order['sale_count'] = $params['all'];
        	$order['min_price'] = $params['all'];
        }
        
        if(array_key_exists('sale_count',$params)){
        	$order['sale_count'] = $params['sale_count'];
        }
        
		if(array_key_exists('min_price',$params)){
        	$order['min_price'] = $params['min_price'];
        }

        // 分页
        $page = getValByKey('page',$params,1);
        $list = $this->M
        ->field(['id','title','cover','min_price','desc'])
        ->withCount(['comments','comments'=>function($query,&$alias){
        	$query->where('rating','in','4,5');
        	$alias = 'comments_good_count';
        }])
        ->where($where)
        ->order($order)
        ->page($page,10)
        ->select();
        
        return showSuccess($list);
    }
    
    // 热门推荐
    public function hotList(){
    	$hotList = $this->M->hotList();
    	return showSuccess($hotList);
    }
}
