<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class ExpressValue extends BaseModel
{
    protected $json = ['region'];
	protected $jsonAssoc = true;
}
