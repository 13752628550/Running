<?php

namespace app\model\admin;

use app\model\common\BaseModel;
/**
 * @mixin think\Model
 */
class Image extends BaseModel
{

    // 默认相册0 图片列表
    public function Mlist(){
        $param = request()->param();
        $order = getValByKey('order',$param,'desc');
        return $this->where('image_class_id',0)->order([
	        		'id'=>$order
        		])->page($param['page'],10)->select();
    }

    // 增加（上传oss和记录数据）
    public function Mcreate(){
        // 获取数据
        $file = request()->file('img');
        $classId = getValByKey('image_class_id',request()->param(),0);
        // 验证并上传图片
        $result = uploadImage($file);
        // 写入数据库
        if (!is_array($file)){  //单图上传
            $data = [
                'url'=>$result['url'],
                'name'=>$result['name'],
                'path'=>$result['name'],
                'image_class_id'=>$classId
            ];
            return $this->create($data);
        }
        // 多图上传
        $data = [];
        foreach ($result as $v) {
            $data[] = [
                'url'=>$v['url'],
                'name'=>$v['name'],
                'path'=>$v['name'],
                'image_class_id'=>$classId
            ];
        }
        return $this->saveAll($data);
    }
    // 修改（修改昵称）
    public function Mupdate(){
        return request()->Model->save([
            'name'=>request()->param('name')
        ]);
    }
    // 删除（删除oss和数据表数据）
    public function Mdelete(){
        $image = request()->Model;
        // 删除oss图片
        (new \app\lib\file\Oss())->delete($image->path);
        // 删除数据
        return $image->delete();
    }

    public function MdeleteAll(){
        $param = request()->param('ids');
        // 找到所有数据
        $data = $this->where('id','in',$param)->select();
        $Oss = new \app\lib\file\Oss();
        $data->each(function($v) use($Oss){
            // 删除oss上的附件
            $Oss->delete($v->path);
            // 删除当前数据
            $v->delete();
        });
        return true;
    }
    
}
