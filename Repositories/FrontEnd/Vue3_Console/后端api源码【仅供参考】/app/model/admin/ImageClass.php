<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class ImageClass extends BaseModel
{
    // 获取当前相册下的图片
    public function images(){
        return $this->hasMany('Image');
    }

    // 相册列表
    public function Mlist(){
        $param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $totalCount = $this->count();
        $list = $this->withCount('images')->page($param['page'],$limit)->order([
        			'order'=>'desc',
	        		'id'=>'desc'
        		])->select();
        return [
        	'list'=>$list,
        	'totalCount'=>$totalCount
        ];
    }
    
    // 指定相册下的图片列表
    public function MimageList(){
        $param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $model = request()->Model->images();
        $totalCount = $model->count();
        $order = getValByKey('order',$param,'desc');
        $where = [];
        $keyword = getValByKey('keyword',$param,false);
        if($keyword){
        	$where[] = [
        		['name','like','%'.$keyword.'%']
        	];
        }
        return [
        	'list'=>$model->page($param['page'],$limit)->where($where)->order('id',$order)->select(),
        	'totalCount'=>$totalCount
        ];
    }

    // 创建相册
    public function Mcreate(){
        $param = request()->param();
        return $this->create($param);
    }

    // 修改相册
    public function Mupdate(){
        $param = request()->param();
        return request()->Model->save($param);
    }

    // 删除相册
    public function Mdelete(){
        $count = request()->Model->images()->count();
        if($count > 0){
            ApiException("请先删除该图库分类下的所有图片");
        }
        return request()->Model->delete();
    }
}
