<?php

namespace app\validate;

use think\Validate;

class BaseValidate extends Validate
{
    // 不能为空
    protected function NotEmpty($value, $rule='', $data='', $field='')
    {
        if (empty($value)) return $field."不能为空";
        return true;
    }

    // 根据id判断是否存在，存在将实例加入request
    protected function isExist($value, $rule, $data='', $field='',$title = '记录'){
        $arr = explode(',',$rule);
        if (!$value) return true;
        $Model = count($arr) > 1 ? '\\app\\model\\'.$arr[1] :'\\app\\model\\'.str_replace('.','\\',request()->controller());
        $M = $Model::find($value);
        if (!$M) {
            return '该'.$title.'不存在';
        }
        // 将当前实例挂在到Request上
        if ($arr[0] !== 'false') request()->Model = $M;
        return true;
    }

    // 验证账号密码
    public function checklogin($value, $rule='', $data='', $field=''){
        $arr = explode(',',$rule);
        if (!$value) return true;
        // 判断参数
        if (!array_key_exists('username',$data)) {
            return '用户名不能为空';
        }
        if (empty($data['username'])) return "用户名不能为空";
        // 获取当前模型
        $Model = $arr[0] ? '\\app\\model\\'.$arr[0] : '\\app\\model\\'.str_replace('.','\\',request()->controller());
        // 验证账号
        $M = count($arr) > 1 ? $Model::where('username',$data['username'])->with([$arr[1]])->find() : $Model::where('username',$data['username'])->find();
        if (!$M) return '用户名错误';
        // 验证密码
        if (!password_verify($data['password'],$M->password)) {
           return '密码错误';
        }
        // 将当前用户实例挂在到request
        request()->UserModel = $M;
        return true;
    }

    // 移除不存在的id
    public function removeNoExist($value, $rule='', $data='', $field=''){
        $arr = explode(',',$rule);
        if (empty($value)){
            return true;
        }
        // 去除重复
        $value = array_unique($value);
        // 获取当前模型
        $Model = '\\app\\model\\'.$arr[0];
        $param = [];
        foreach ($value as $v) {
            $item = $Model::find((int)$v);
            if ($item) $param[] = (int)$v;
        }
        request()->$field = $param;
        return true;
    }

    /**
     * 验证当前商品的sku是否合法
     *
     * @param [type] $skusId    需要验证的sku的id
     * @param [type] $skusType  单规格用goods表，多规格用goods_skus表
     * @param [type] $num       验证商品数量和库存
     * @return void
     */
    public function checkGoodsSkus($skusId,$skusType,$num){
        // 验证单规格多规格
        $Model = $skusType === 1 ? '\\app\\model\\admin\\GoodsSkus':'\\app\\model\\admin\\Goods';
        // 拿到当前规格
        $goodsSkus = $Model::find($skusId);
        // 1. 商品是否存在
        if (!$goodsSkus) {
            ApiException('该商品不存在');
        }
        // 拿到当前商品
        $goods = $skusType === 1 ? $goodsSkus->goods : $goodsSkus;
        
        // 2. 商品是否上架
        if ($goods->status != 1 || $goods->ischeck != 1) {
            ApiException('商品未上架');
        }
        // 3. 是否售完
        if ($goods->stock == 0) {
            ApiException('商品已售完');
        }
        // 4. 库存不足
        if ($num > $goods->stock) {
            ApiException('该商品库存不足');
        }

        // 存储当前商品的库存数
        request()->goodsStock = $goods->stock;

        return true;
   }
}
