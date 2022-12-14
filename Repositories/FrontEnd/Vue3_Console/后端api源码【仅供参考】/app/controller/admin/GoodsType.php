<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
class GoodsType extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    { 
    	$param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $totalCount = $this->M->count();
        $list = $this->M->page($param['page'],$limit)
        		->order([
					'order'=>'desc',
		    		'id'=>'desc'
				])
				->with(['skus','goodsTypeValues'])
				->select();
        return showSuccess([
        	'list'=>$list,
        	'totalCount'=>$totalCount
        ]);
    }


    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        ApiException('演示数据，禁止操作');
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
        ApiException('演示数据，禁止操作');
        return showSuccess($this->M->Mupdate());
    }

    public function updateStatus(){
        ApiException('演示数据，禁止操作');
        return showSuccess($this->M->_updateStatus());
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        ApiException('演示数据，禁止操作');
        return showSuccess($this->M->Mdelete());
    }
    
    // 批量删除
    public function deleteAll(){
        ApiException('演示数据，禁止操作');
        return showSuccess($this->M->MdeleteAll());
    }
}
