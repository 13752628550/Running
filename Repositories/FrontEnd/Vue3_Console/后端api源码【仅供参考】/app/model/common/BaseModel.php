<?php

namespace app\model\common;

use think\Model;
/**
 * @mixin think\Model
 */
class BaseModel extends Model
{
    // 可写入字段
    protected $createFields = [];
    // 可更新字段
    protected $updateFields = [];

    /** 
     * 模型事件
     */
    // 查询后
    public static function onAfterRead($M){
       
    }
    // 写入前
    public static function onBeforeWrite($M){
        // 过滤可写入字段
        if (!empty($M->createFields)) {
            $M->allowField($M->createFields);
        }
    }
    // 更新前
    public static function onBeforeUpdate($M){
        // 过滤可更新字段
        if (!empty($M->updateFields)) {
            $M->allowField($M->updateFields);
        }
    }

    // 定义全局的查询范围

    /**
     * 封装简化查询范围（更加语义化，重要）
     */
    // 开启状态
    public function scopeStatus($query,$status = 1){
        $query->where('status',$status);
    }
    
    // 搜索器（非常重要）
    // 创建时间
    public function searchCreateTimeAttr($query, $value, $data)
    {
        $query->whereBetweenTime('create_time', $value[0], $value[1]);
    }  
    
    // 更新时间
    public function searchUpdateTimeAttr($query, $value, $data)
    {
        $query->whereBetweenTime('update_time', $value[0], $value[1]);
    }  

    // 获取器（处理输出字段）
    // 常用增删改查方法
    /**
     * 1. 修改状态
     * 前提：
     * (1) 参数：id和status
     * (2) 使用 validate 的isExist 
     */
    public function _UpdateStatus()
    {
        $request = request();
        return $request->Model->save([
            'status'=>$request->param('status')
        ]);
    }

    // 判断当前用户是否有操作该信息的权限
    public function __checkActionAuth(){
        $request = request();
        if ($request->Model->user_id !== $request->UserModel->id) {
            return ApiException('非法操作');
        }
    }

    // 列表
    public function Mlist(){
        $param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $page = intval(getValByKey('page',$param,1));
        $totalCount = $this->count();
        $list = $this->page($page,$limit)->order([
			'order'=>'desc',
    		'id'=>'desc'
		])->select();
        return [
        	'list'=>$list,
        	'totalCount'=>$totalCount
        ];
    }
    
    // 移除多余字段
    public function unsetCommonParams($param){
        if(array_key_exists("create_time",$param)){
            unset($param["create_time"]);
        }
        if(array_key_exists("update_time",$param)){
            unset($param["update_time"]);
        }
        return $param;
    }
    
    // 创建
    public function Mcreate(){
        $param = $this->unsetCommonParams(request()->param());
        return $this->create($param);
    }
    // 修改
    public function Mupdate(){
        $param = $this->unsetCommonParams(request()->param());
        return request()->Model->save($param);
    }
    // 删除
    public function Mdelete(){
        return request()->Model->delete();
    }
    
    public function MdeleteAll(){
        $param = request()->param('ids');
        // 找到所有数据并删除
        return $this->where('id','in',$param)->delete();
    }
}
