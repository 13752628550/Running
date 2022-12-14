<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;

class Express extends Base
{
    // 列表
    public function index()
    {
        $param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $page = intval(getValByKey('page',$param,1));
        $totalCount = $this->M->count();
        $list = $this->M->page($page,$limit)
        		->with(['expressValues'])
        		->order([
					'order'=>'desc',
    				'id'=>'desc'
				])
				->select();
		
		$area = \app\model\admin\SysProvince::with(['citys.districts'])->select();
		
        return showSuccess([
        	'list'=>$list,
        	'totalCount'=>$totalCount,
        	'area'=>$area
        ]);
    }


    // 保存新建的资源
    public function save(Request $request)
    {
        return showSuccess($this->M->Mcreate());
    }


    // 更新
    public function update(Request $request, $id)
    {
        return showSuccess($this->M->Mupdate());
    }



    // 删除
    public function delete($id)
    {
    	ApiException('演示数据，禁止删除');
        return showSuccess($this->M->Mdelete());
    }

}
