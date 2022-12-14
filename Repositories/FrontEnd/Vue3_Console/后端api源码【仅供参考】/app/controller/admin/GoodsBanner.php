<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
class GoodsBanner extends Base
{
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
}
