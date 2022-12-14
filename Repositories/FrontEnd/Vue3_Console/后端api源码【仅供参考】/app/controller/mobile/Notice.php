<?php

namespace app\controller\mobile;

use think\Request;
use app\controller\common\Base;
use think\model\Relation;

class Notice extends Base
{
    protected $ModelPath = 'admin\Notice';
    public function index(){
        $params = request()->param();
        // 分页
        $page = getValByKey('page',$params,1);
        $list = $this->M->page($page,10)->select();
        
        return showSuccess($list);
    }

}
