<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;

class ExpressValue extends Base
{
    // 列表
    public function index()
    {
        $param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $page = intval(getValByKey('page',$param,1));
        $totalCount = $this->M->count();
        $list = $this->M->page($page,$limit)
        		->order([
					'order'=>'desc',
    				'id'=>'desc'
				])
				->select();
        return showSuccess([
        	'list'=>$list,
        	'totalCount'=>$totalCount,
        ]);
    }

    // 显示创建资源表单页
    public function create()
    {
        //
    }

    // 保存新建的资源
    public function save(Request $request)
    {
        return showSuccess($this->M->Mcreate());
    }

    // 显示指定的资源
    public function read($id)
    {
        //
    }

    // 显示编辑资源表单页.
    public function edit($id)
    {
        
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
