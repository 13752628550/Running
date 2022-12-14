<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
use think\facade\Db;
use think\facade\Queue;

class Index extends Base
{
    protected $autoNewModel = false;
    protected $excludeValidateCheck = ["statistics1","statistics2","statistics3"];
    
    // 统计1
    public function statistics1(){
        // 总订单量
        $totalOrder = Db::table('order')->count("id");
        // 总销售额
        $totalSale = Db::table('order')->whereNotNull('payment_method')->sum('total_price');
        // 总会员数
        $totalUser = Db::table('user')->count("id");
        // 总支付数
        $totalPay = Db::table('order')->whereNotNull('payment_method')->count("id");
    
        return showSuccess([
            "panels"=>[
                [ 
                    "title"=>"支付订单",
                    "value"=>$totalPay,
                    "unit"=>"年",
                    "unitColor"=>"success",
                    "subTitle"=>"总支付订单",
                    "subValue"=>$totalPay,
                    "subUnit"=>""
                ],
                [
                    "title"=>"订单量",
                    "value"=>$totalOrder,
                    "unit"=>"周",
                    "unitColor"=>"danger",
                    "subTitle"=>"转化率",
                    "subValue"=>"60%",
                    "subUnit"=>""
                ],
                [
                    "title"=>"销售额",
                    "value"=>$totalSale,
                    "unit"=>"年",
                    "unitColor"=>"",
                    "subTitle"=>"总销售额",
                    "subValue"=>$totalSale,
                    "subUnit"=>""
                ],
                [
                    "title"=>"新增用户",
                    "value"=>$totalUser,
                    "unit"=>"年",
                    "unitColor"=>"warning",
                    "subTitle"=>"总用户",
                    "subValue"=>$totalUser,
                    "subUnit"=>"人"
                ]
            ]
        ]);
    }
    
    // 统计2
    public function statistics2(){
        // 审核中
	    $checking = Db::table('goods')->where('ischeck',0)
        						 ->whereNull('delete_time')
        						 ->count("id");
        // 销售中
        $saling = Db::table('goods')->where('ischeck',1)
        						 ->where('status',1)
        						 ->count("id");
	    // 已下架
	    $off = Db::table('goods')->where('status',0)
        				  ->count("id");
        	
        // 库存预警					 
        $min_stock = Db::table('goods')->where('status',0)
        						 ->whereColumn('stock','<=','min_stock')
        						 ->count("id");						 
	    
	    // 待付款
	    $nopay = Db::table('order')->where('closed',0)
        		            ->whereNull('payment_method')
        		            ->count("id");
        // 待发货
        $noship = Db::table('order')->where('closed',0)
            			    ->whereNotNull('payment_method')
            				->where('ship_status','pending')
            				->where('refund_status','pending')
                		    ->count("id");
        // 已发货		   
        $shiped = Db::table('order')->where('closed',0)
        					->whereNotNull('payment_method')
        					->where('ship_status','delivered')
        					->where('refund_status','pending')
                		    ->count("id");
        // 退款中	   
        $refunding = Db::table('order')->where('closed',0)
                    			->where('refund_status','applied')
                    		    ->count("id");
        return showSuccess([
            "goods"=>[
                [ "label"=>"审核中","value"=>$checking ],
                [ "label"=>"销售中","value"=>$saling ],
                [ "label"=>"已下架","value"=>$off ],
                [ "label"=>"库存预警","value"=>$min_stock ]
            ],
            "order"=>[
                [ "label"=>"待付款","value"=>$nopay ],
                [ "label"=>"待发货","value"=>$noship ],
                [ "label"=>"已发货","value"=>$shiped ],
                [ "label"=>"退款中","value"=>$refunding ]
            ]
        ]);
    }
    
	// 统计3
	public function statistics3(){
	    
	    $type = request()->param("type","week");
	    
	    $d = "2021-07-24";
	    $time = strtotime($d);
	    $endTime = date('Y-m-d', strtotime('+1 day', $time));
	    $table = Db::table('order');
	    $res = [];
	    if($type == "week"){
	        $startTime = date('Y-m-d', strtotime('-6 day', $time));
	        $res = $table->field('FROM_UNIXTIME(create_time,"%m-%d") as time,COUNT(id) AS num')
	            ->whereBetweenTime('create_time', $startTime, $endTime)
	            ->group('time')->select()->toArray();
	    } elseif($type == "month"){
	        $startTime = date('Y-m-d', strtotime('-29 day', $time));
	        $res = $table->field('FROM_UNIXTIME(create_time,"%m-%d") as time,COUNT(id) AS num')
	            ->whereBetweenTime('create_time', $startTime, $endTime)
	            ->group('time')->select()->toArray();
	    } elseif($type == "hour"){
	        $startTime = date('Y-m-d', strtotime('-23 hour', $time));
	        $res = $table->field('FROM_UNIXTIME(create_time,"%H") as time,COUNT(id) AS num')
	            ->whereBetweenTime('create_time', $startTime, $endTime)
	            ->group('time')->select()->toArray();
	    }

	    $lables = getLatelyTime($type,$d);
        
	    $result = [
	        "x"=>[],
	        "y"=>[]
	    ];
	    foreach ($lables as $x) {
	        $arr = array_filter($res,function($v) use($x){
	            return $v["time"] == $x;
	        });
	        $result["x"][] = $x;
	        $result["y"][] = count($arr) > 0 ? (current($arr))["num"] : 0;
	    }
	    
	    return showSuccess($result);
	}
}
