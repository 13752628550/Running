<?php

namespace app\validate;

class Goods extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id'=>'require|integer|>:0|isExist:true,admin\Goods',
        'page'=>'require|integer|>:0',
        'status'=>'require|in:0,1',
        'title'	=>'require|NotEmpty',	 		
        'category_id' =>'require|integer|>=:0|isExist:false,admin\Category',
        'cover'	=>'url',	       
        'unit' => 'require|NotEmpty',	        
        'stock'  => 'require|integer|>=:0',	   
        'min_oprice'  => 'require|float|>=:0',	 
        'min_stock'=>'require|integer|>=:0',	
        'ischeck'=>'require|in:0,1,2',	 	     	
        'stock_display'	=> 'require|in:0,1',	
        'express_id'=> 'require|integer|>:0|isExist:false,admin\Express',
        'sku_type'	=> 'require|in:0,1',		
        'sku_value'=> 'requireIf:sku_type,0|array',	
        // 'goods_type_id'	=> 'require|integer|>:0|isExist:false,admin\GoodsType',
        'content'=> 'require',			
        'discount'=> 'require|integer|between:0,100', 	
        'order'	=> 'require|integer|>:0',	
        'goods_skus_card_ids'=>'requireIf:sku_type,1|array|NotEmpty',
        'goods_attrs'=>'require|array|NotEmpty',
        
        'goodsSkus'=>'requireIf:sku_type,1|array',
        
        'comment_type'=>'in:good,bad,middle',
        
        'all'=>'in:desc,asc',
        'sale_count'=>'in:desc,asc',
        
        'ids'=>'require|array',
        
        'banners'=>'require|array',
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    protected $scene = [
        'index'=>['page'],

		'checkGoods'=>['id','ischeck'],
		'restore'=>['ids'],
		'destroy'=>['ids'],
		'deleteAll'=>['ids'],
		'changeStatus'=>['ids','status'],
        'save'=>["title","category_id","cover","desc", "unit","stock","min_stock","status","stock_display","min_oprice"],

        // 'update'=>['id',"title","category_id","cover","desc", "unit","stock","min_stock","ischeck","status","stock_display","express_id","sku_type","sku_value","goods_type_id","content","discount",'goods_attrs','goods_skus'],
        'update'=>['id'],

        'delete'=>['id'],

        //'updateStatus'=>['id','status'],

        // 'read'=>['id'],
        'adminread'=>['id'],
        'banners'=>['id'],
        'updateBanners'=>['id','banners'],
        'updateAttrs'=>['id','goods_attrs'],
        
        'comments'=>['id','comment_type'],
        
        'search'=>['title','page','all','sale_count'],
        
        'updateSkus'=>['id','sku_type','sku_value','goodsSkus']
    ];

    // 正确的skuValue
    protected function rightSkuValue($value,$rule,$data = '',$field = '',$title='记录'){
        return true;
    }

    // 正确的GoodsSkus
    protected function rightGoodsSkus($value,$rule,$data = '',$f = ''){
        $field = [
            "image"     =>  "string",
            "pprice"    =>  "integer",
            "oprice"    =>  "integer",
            "cprice"    =>  "integer",
            "stock"     =>  "integer",
            "volume"    =>  "integer",
            "weight"    =>  "integer",
            "code"      =>  "string",
            "skus"      =>  "array"
        ];

        $Skusfield = [
            "goods_skus_card_id" => "integer",
            "id"                 => "integer",
            "name"               => "string",
            "value"              => "string"
        ];
        
        $newValue = [];

        // 验证数量
        if (count($value) === 0) {
            return ApiException("商品规格不能为空");
        }

        for ($i=0; $i < count($value); $i++) { 
            foreach ($field as $key => $rule) {
                // 验证不存在
                if (!array_key_exists($key,$value[$i])) {
                    return ApiException("商品规格中的 ".$key." 字段缺失");
                }
                // 验证类型
                if (gettype($value[$i][$key]) != $rule) {
                    ApiException("商品规格中的 ".$key." 格式不是 ".$rule."类型");
                }
                $newValue[$i][$key] = $value[$i][$key];
            }
        }

        request()->$f = $newValue;
        return true;
    }
}
