<?php

namespace app\model\admin;

use app\model\common\BaseModel;
/**
 * @mixin think\Model
 */
class SysSetting extends BaseModel
{
    protected $json = ['upload_config','alipay','wxpay'];
    protected $jsonAssoc = true;
}
