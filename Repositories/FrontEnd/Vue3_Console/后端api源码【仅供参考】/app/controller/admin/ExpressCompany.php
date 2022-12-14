<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;

class ExpressCompany extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        return showSuccess($this->M->Mlist());
    }
}
