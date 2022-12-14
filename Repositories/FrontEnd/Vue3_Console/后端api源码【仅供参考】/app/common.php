<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

function getLatelyTime($type = '',$now = ""){
    $now = $now ? strtotime($now) : time();
    $result = [];
    if ($type == 'hour') {
        //最近一天
        for ($i = 0; $i < 24; $i++) {
            $result[] = date('H', strtotime('-' . $i . ' hour', $now));
        }
    }elseif ($type == 'week') {
        //最近一周
        for ($i = 0; $i < 7; $i++) {
            $result[] = date('m-d', strtotime('-' . $i . ' day', $now));
        }
    } elseif ($type == 'month') {
        //最近一个月
        for ($i = 0; $i < 30; $i++) {
            $result[] = date('m-d', strtotime('-' . $i . ' day', $now));
        }
    } elseif ($type == 'year') {
        //最近一年
        for ($i = 0; $i < 12; $i++) {
            $result[] = date('Y-m', strtotime('-' . $i . ' month', $now));
        }
    }
    return $result;
}

// 对象转数组
 function object_array($array) {  
    if(is_object($array)) {  
        $array = (array)$array;  
    } 
    if(is_array($array)) {
        foreach($array as $key=>$value) {  
            $array[$key] = object_array($value);  
        }  
    }  
    return $array;  
}


// 抛出异常
function ApiException($msg = '请求错误',$errorCode = 20000,$statusCode = 400)
{
    if (env('APP_DEBUG')) {
        // 其他错误交给系统处理
        halt($msg);
    }
    abort($errorCode, $msg,[
        'statusCode' => $statusCode
    ]);
}

// 成功返回
function showSuccess($data = '',$msg = 'ok',$code = 200){
    return json([ 'msg' => $msg, 'data' => $data ],$code);
}

// 失败返回
function showError($msg = 'error',$code = 400){
    return json([ 'msg' => $msg ],$code);
}

// 获取数组指定key的value
function getValByKey(string $key,array $arr,$default = false)
{
    return array_key_exists($key,$arr) ? $arr[$key] : $default;
}

/**
 * 登录（设置并存储token）
 *
 * @param array $param  参数配置(data,password,tag,expire)
 * @return void
 */
function cms_login(array $param){
    // 获取参数
    $data = getValByKey('data',$param);
    if (!$data) return false;
    // 标签分组
    $tag = getValByKey('tag',$param,'manager');
    //$token = getValByKey('token',$param);
    // 是否返回密码
    $password = getValByKey('password',$param);
    // 登录有效时间 0为永久
    $expire = getValByKey('expire',$param,0);

    $CacheClass = \think\facade\Cache::store(config('cms.'.$tag.'.token.store'));
    // 生成token
    $token = sha1(md5(uniqid(md5(microtime(true)),true)));
    // 拿到当前用户数据
    $user = is_object($data) ?  $data->toArray() : $data;
    // 获取之前并删除token
    // $beforeToken = $CacheClass->get($tag.'_'.$user['id']);
    // // 删除之前token对应的用户信息
    // if ($beforeToken){
    //     cms_logout([
    //         'token'=>$beforeToken,
    //         'tag'=>$tag,
    //         'password'=>$password
    //     ]);
    // }
    // 存储token - 用户数据
    $CacheClass->set($tag.'_'.$token,$user,$expire);
    // 存储用户id - token
    $CacheClass->set($tag.'_'.$user['id'],$token,$expire);
    // 隐藏密码
    if (!$password) unset($user['password']);
    // 返回token
    $user['token'] = $token;
    return $user;
}
/**
 * 获取用户信息（token校验）
 *
 * @param array $param 参数配置(tag,token,password)
 * @return void
 */
function cms_getUser(array $param){
    $tag = getValByKey('tag',$param,'manager');
    $token = getValByKey('token',$param);
    $password = getValByKey('password',$param);
    $user = \think\facade\Cache::store(config('cms.'.$tag.'.token.store'))->get($tag.'_'.$token);
    if (!$password) unset($user['password']);
    return $user;
}
/**
 * 退出登录（删除token）
 *
 * @param array $param 参数配置 (tag,token,password)
 * @return void
 */
function cms_logout(array $param){
    $tag = getValByKey('tag',$param,'manager');
    $token = getValByKey('token',$param);
    $password = getValByKey('password',$param);
    
    $user = \think\facade\Cache::store(config('cms.'.$tag.'.token.store'))->pull($tag.'_'.$token);

    if (!empty($user)) \think\facade\Cache::store(config('cms.'.$tag.'.token.store'))->pull($tag.'_'.$user['id']);

    if (!$password) unset($user['password']);
    return $user;
}


/**
* 数据集组合分类树(一维数组)
* @param     cate 分类查询结果集
* @param     html 格式串
* @return    array
*/
function list_to_tree($array,$field = 'pid',$pid = 0,$level = 0,$callback = false){
    //声明静态数组,避免递归调用时,多次声明导致数组覆盖
    static $list = [];
    foreach ($array as $key => $value){
        $extra = true;
        if(is_callable($callback)){
        	$extra = $callback($value);
        }
        if ($value[$field] == $pid && $extra){
            $value['level'] = $level;
            $list[] = $value;
            list_to_tree($array,$field,$value['id'], $level+1,$callback);
        }
        unset($array[$key]);
    }
    return $list;
}

/**
* 数据集组合分类树(多维数组)
* @param     cate 分类结果集
* @param     child 子树
* @return    array
*/
function list_to_tree2($cate,$field = 'pid',$child = 'child',$pid = 0,$callback = false){
	if(!is_array($cate)) return [];
    $arr = [];
    foreach($cate as $v){
    	$extra = true;
    	if(is_callable($callback)){
        	$extra = $callback($v);
        }
        if($v[$field] == $pid && $extra){
            $v[$child] = list_to_tree2($cate,$field,$child,$v['id'],$callback);
            $arr[]     = $v;
        }
    }
    return $arr;
}
/**
* 通过子级ID返回父级
* @param     cate 分类结果集
*/
function get_parents_by_id($cate,$field='pid',$id){
    $arr = array();
    foreach($cate as $v){
        if($v['id'] == $id){
            $arr[] = $v;
            $arr = array_merge(get_parents_by_id($cate,$field,$v[$field]),$arr);
        }
    }
    return $arr;
}

/**
* 通过父级ID返回子级
* @param     cate 分类结果集
*/
function get_childs_by_pid($cate,$field='pid',$pid){
    $arr = [];
    foreach($cate as $v){
        if($v[$field] == $pid){
            $arr[] = $v;
            $arr = array_merge($arr,get_childs_by_pid($cate,$field,$v['id']));
        }
    }
    return $arr;
}

// 验证图片
function uploadImage($file,$kb = 2048){
    // 验证图片
    try {
        $M = 1024*$kb;
        validate([
            'img'=>'fileSize:'.$M.'|fileExt:jpg,png,gif,jpeg'
        ])->check(request()->file());
    } catch (think\exception\ValidateException $e) {
        ApiException($e->getMessage());
    }
    // 上传
    $Oss = new \app\lib\file\Oss();
    return $Oss->uploadFile($file);
}

function httpWurl($url, $params, $method = 'GET', $header = array(), $multi = false){
    date_default_timezone_set('PRC');
    $opts = array(
        CURLOPT_TIMEOUT        => 30,
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSL_VERIFYHOST => false,
        CURLOPT_HTTPHEADER     => $header,
        CURLOPT_COOKIESESSION  => true,
        CURLOPT_FOLLOWLOCATION => 1,
        CURLOPT_COOKIE         =>session_name().'='.session_id(),
    );
    /* 根据请求类型设置特定参数 */
    switch(strtoupper($method)){
        case 'GET':
            // $opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
            // 链接后拼接参数  &  非？
            $opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
            break;
        case 'POST':
            //判断是否传输文件
            $params = $multi ? $params : http_build_query($params);
            $opts[CURLOPT_URL] = $url;
            $opts[CURLOPT_POST] = 1;
            $opts[CURLOPT_POSTFIELDS] = $params;
            break;
        default:
        ApiException('不支持的请求方式！');
    }
    /* 初始化并执行curl请求 */
    $ch = curl_init();
    curl_setopt_array($ch, $opts);
    $data  = curl_exec($ch);
    $error = curl_error($ch);
    curl_close($ch);
    if($error) ApiException('请求发生错误：' . $error);
    return  $data;
}

function dcurl($url, $method = 'GET', $postFields = null, $header = null) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
    curl_setopt($ch, CURLOPT_FAILONERROR, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 5);

    if (strlen($url) > 5 && strtolower(substr($url, 0, 5)) == "https") {
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    }

    switch ($method) {
        case 'POST':
            curl_setopt($ch, CURLOPT_POST, true);
            if (!empty($postFields)) {
                if (is_array($postFields) || is_object($postFields)) {
                    if (is_object($postFields)) {
                        $postFields = object2array($postFields);
                    }
                    $postBodyString = "";
                    $postMultipart = false;
                    foreach ($postFields as $k => $v) {
                        if ("@" != substr($v, 0, 1)) { //判断是不是文件上传
                            $postBodyString .= "$k=" . urlencode($v) . "&";
                        } else { //文件上传用multipart/form-data，否则用www-form-urlencoded
                            $postMultipart = true;
                        }
                    }
                    unset($k, $v);
                    if ($postMultipart) {
                        curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
                    } else {
                        curl_setopt($ch, CURLOPT_POSTFIELDS, substr($postBodyString, 0, -1));
                    }
                } else {
                    curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
                }
            }
            break;
        default:
            if (!empty($postFields) && is_array($postFields)) {
                $url .= (strpos($url, '?') === false ? '?' : '&') . http_build_query($postFields);
            }
            break;
    }
    curl_setopt($ch,CURLOPT_URL, $url);

    if (!empty($header) && is_array($header)) {
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
    }
    $response = curl_exec($ch);
    if (curl_errno($ch)) {
        throw new Exception(curl_error($ch), 0);
    }
    curl_close($ch);

    return $response;
}

// 获取配置信息
function cmsConfig($key = null){
    $conf = (new \app\model\admin\SysSetting())->find(1)->toArray();
    
    if(!$key){
        return $conf;
    }
    
    $k = explode(".", $key);
    $v = null;
    for ($i = 0; $i < count($k); $i++) {
        $v = $v ? $v[$k[$i]] : $conf[$k[$i]];
    }
    // $v = $v == null ? config("cms.".$key) : $v;
    return $v;
}





