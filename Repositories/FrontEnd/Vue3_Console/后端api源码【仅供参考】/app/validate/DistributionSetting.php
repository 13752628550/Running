<?php

namespace app\validate;

use think\Validate;

class DistributionSetting extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
		"distribution_open"=>'in:0,1',
        "store_first_rebate"=>'integer|>=:0|<=:100',
        "store_second_rebate"=>'integer|>=:0|<=:100',
        "spread_banners"=>'array',
        "is_self_brokerage"=>'in:0,1',
        "settlement_days"=>'integer|>=:0',
        "brokerage_method"=>'in:hand,wx'
	];
    
    
    protected $scene = [
    	'set'=>[
            'distribution_open',
            'store_first_rebate',
            'store_second_rebate',
            'spread_banners',
            'is_self_brokerage',
            "settlement_days",
            "brokerage_method"
        ]
    ];
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];
}
