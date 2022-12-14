<?php
namespace app\lib\file;

use OSS\OssClient;
use OSS\Core\OssException;

use think\facade\Filesystem;

class Oss
{
    protected $accessKeyId = null;
    protected $accessKeySecret = null;
    // Endpoint以杭州为例，其它Region请按实际情况填写。
    protected $endpoint = null;
    // 存储空间名称
    protected $bucket= null;

    protected $ossClient = null;

    // 初始化
    public function __construct(){
        // 初始化配置
        $c = cmsConfig('upload_config');
        $o = config('cms.oss');
        $this->accessKeyId = $c['ACCESS_KEY'] ? $c['ACCESS_KEY'] : $o['ACCESS_KEY'];
        $this->accessKeySecret = $c['SECRET_KEY'] ? $c['SECRET_KEY'] : $o['SECRET_KEY'];
        $this->endpoint = $c['http'] ?  $c['http'] :  $o['http'];
        $this->bucket = $c['Bucket'] ? $c['Bucket'] : $o['Bucket'];
        try {
            $this->ossClient = new OssClient(
                $this->accessKeyId, 
                $this->accessKeySecret, 
                $this->endpoint
            );
        } catch (OssException $e) {
            print $e->getMessage();
        }
    }

    /**
     * 获取附件列表
     *
     * @param string $nextMarker 下一页标识
     * @return void
     */
    public function listObjects($nextMarker = '')
    {
        // 为空获取根目录所有文件和目录
        $prefix = '';
        $delimiter = '/';
        $maxkeys = 1000;
        $options = array(
            'delimiter' => $delimiter,
            'prefix' => $prefix,
            'max-keys' => $maxkeys,
            'marker' => $nextMarker,
        );
        try {
            $listObjectInfo = $this->ossClient->listObjects($this->bucket, $options);
        } catch (OssException $e) {
            // 获取失败，失败信息
            return ApiException($e->getMessage());
        }

        $objectList = $listObjectInfo->getObjectList(); // object list（文件）
        $prefixList = $listObjectInfo->getPrefixList(); // directory list（目录）

        $result = [
            'marker'=>$listObjectInfo->getMarker(),
            'nextMarker'=> $listObjectInfo->getNextMarker(),
            'list'=>[]
        ];
        // 文件
        if (!empty($objectList)) {
            foreach ($objectList as $objectInfo) {
                $result['list'][] = [
                    'isdir'=>false,
                    // 文件名称
                    'name'=>$objectInfo->getKey(),               
                    // 更新时间
                    'update_time'=>$objectInfo->getLastModified(),
                    // ETag
                    'eTag'=>$objectInfo->getETag(),
                    // 状态
                    'type'=>$objectInfo->getType(),
                    // 文件大小
                    'size'=>$objectInfo->getSize(),
                    // 存储类型
                    'storageClass'=>$objectInfo->getStorageClass(),
                ];
            }
        }
        // 目录
        if (!empty($prefixList)) {
            foreach ($prefixList as $prefixInfo) {
                $result['list'][] = [
                    'isdir'=>true,
                    // 文件名称
                    'name'=>$prefixInfo->getPrefix(),               
                ];
            }
        }
        return $result;
    }

    /**
     * 上传文件（单图多图）
     *
     * @param string $dir   文件目录
     * @param [type] $file  图片/图片列表
     * @return void
     */
    public function uploadFile($file,$dir='public')
    {
        if ($file == '') return ApiException('请选择要上传的图片');
        // 图片处理
        //$resResult = \think\Image::open($file);

        try {
            $res = $this->ossClient->doesBucketExist($this->bucket);
        } catch (OssException $e) {
            return ApiException($e->getMessage());
        }

        if ($res === true) {
            try {
                // 单图上传
                if (!is_array($file)) {
                    //生成文件名
                    $fileName = Filesystem::putFile($dir, $file,'uniqid');
                    // 上传
                    $info = $this->ossClient->uploadFile($this->bucket,$fileName, $file->getRealPath());
                    // 成功返回
                    $result = [
                        //图片地址
                        'url' => $info['info']['url'],
                        //数据库保存名称
                        'name' => $fileName
                    ];
                    return $result;
                }
                // 多图上传
                $result = [];
                foreach ($file as $v) {
                    //生成文件名
                    $fileName = Filesystem::putFile($dir, $v,'uniqid');
                    try {
                        $res= $this->ossClient->uploadFile($this->bucket, $fileName, $v->getRealPath());
                    } catch (OssException $e) {
                        return ApiException($e->getMessage());
                    }
                    $result[] = [
                        //图片地址
                        'url' => $res['info']['url'],
                        //数据库保存名称
                        'name' => $fileName
                    ];
                }
                return $result;
            } catch (OssException $e) {
                return ApiException($e->getMessage());
            }
        } 
        return ApiException('服务端存储空间不存在');
    }

    /**
     * 删除
     *
     * @param [type] $object 字符串或数组
     * @return void
     */
    public function delete($object)
    {
        try {
            if (is_array($object)) {
                $this->ossClient->deleteObjects($this->bucket, $object);
            }else{
                $this->ossClient->deleteObject($this->bucket, $object);
            }
        } catch (OssException $e) {
            return ApiException($e->getMessage());
        }
        return true;
    }


    /**
     * 获取图片url
     *
     * @param string $object   图片名称 
     * @param array $options   配置
     * @return void
     */
    public function url(string $object,array $options = [])
    {
        $con = [
            /**
             * resize 缩放
             * crop 裁剪
             * rotate 旋转
             * format 格式
             * info 信息
             */
            'action'=>'resize',
            'resize'=>[],
            // jpg,png,webp,bmp,gif,tiff
            'format'=>'png'
        ];

        $op = array_merge($con,$options);

        // $res = $this->ossClient->signUrl($this->bucket, $object, 0, "GET", [
        //     OssClient::OSS_PROCESS => "image/resize,m_lfit,h_100,w_100"
        // ]);
        return 'https://'.$this->bucket.'.'.$this->endpoint.'/'.$object.'?x-oss-process=image/'.$op['action'].$this->imageStyle($op);
    }

    /**
     * 获取图片样式
     *
     * @param array $options 配置
     * @return void
     */
    public function imageStyle(array $options){
         switch ($options['action']) {
             case 'resize':
                 $w = array_key_exists('w',$options['resize']) ? ',w_'.$options['resize']['w'] : '';
                 $h = array_key_exists('h',$options['resize']) ? ',h_'.$options['resize']['h'] : '';
                 $p = array_key_exists('p',$options['resize']) ? ',p_'.$options['resize']['p'] : '';
                 return $w.$h.$p;
                 break;
             case 'format':
                 return '.'.$options['format'];
                 break;
        }
    }
}
