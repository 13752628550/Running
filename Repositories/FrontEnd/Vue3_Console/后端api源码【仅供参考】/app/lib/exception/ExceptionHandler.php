<?php
namespace app\lib\exception;

use think\exception\Handle;
use think\Response;
use think\exception\HttpException;
use think\exception\ValidateException;
use Throwable;

class ExceptionHandler extends Handle
{
    public function render($request, Throwable $e): Response
    {
        // 参数验证错误
        if ($e instanceof ValidateException) {
            return json($e->getError(), 422);
        }
        // 请求异常
        if ($e instanceof HttpException && $request->isAjax()) {
            return response($e->getMessage(), $e->getStatusCode());
        }
        // 调试模式
        if (env('APP_DEBUG')) {
            // 其他错误交给系统处理
            return parent::render($request, $e);
        }
        $headers = $e->getHeaders();
        return json([
            'msg'=>$e->getMessage(),
            'errorCode'=>$e->getStatusCode()
        ],array_key_exists('statusCode',$headers) ? $headers['statusCode'] : 404);
    }
}
