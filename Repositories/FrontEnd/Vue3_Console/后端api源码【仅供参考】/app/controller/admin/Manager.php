<?php

namespace app\controller\admin;

use think\Request;
// 引入基类控制器
use app\controller\common\Base;

class Manager extends Base
{

    // 不需要验证
    protected $excludeValidateCheck = ['logout',"getinfo"];
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $keyword = getValByKey('keyword',$param,'');
        $where = [
        	[ 'username','like','%'.$keyword.'%' ]
        ];
        
        $totalCount = $this->M->where($where)->count();
        $list = $this->M->page($param['page'],$limit)
        		->where($where)
        		->with([
        		    'role'=>function($q){
        		        $q->field("id,name");
        		    }
        		])
		        ->order([ 'id'=>'desc' ])
				->select()
				->hidden(['password']);
		$role = \app\model\admin\Role::field(['id','name'])->select();
        return showSuccess([
        	'list'=>$list,
        	'totalCount'=>$totalCount,
        	'roles'=>$role
        ]);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save()
    {
    	$param = request()->param();
    	if (!array_key_exists('password',$param) || $param['password'] == '') {
    		ApiException('密码不能为空');
    	}
    	$param["super"] = 0;
    	$res = $this->M->create($param)->toArray();
    	unset($res["password"]);
        return showSuccess($res);
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        
        $user = request()->Model->append(['role.rules'])->toArray();
        return showSuccess($user);
    }

    // 设置给用户设置权限
    public function setRole(){
        $roleId = request()->param('role_id');
        $user = request()->Model;
        return showSuccess($this->M->setRole($user,$roleId));
    }

    // 用户是否有某个权限
    public function hasRule(){
        $user = $request->UserModel;
        $rule_id = request()->param('rule_id');
        return showSuccess($this->M->hasRule($user,$rule_id));
    }


    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        // 演示数据
        $id = intval($id);
    	if ($id == 50) {
    		$this->TestException();
    	}
        
    	$param = $this->M->unsetCommonParams(request()->param());
    	// 超级管理员和演示数据禁止操作
    	if ($request->Model->super) {
    		ApiException('超级管理员禁止修改');
    	}
    	if (array_key_exists('password',$param) && $param['password'] == '') {
    		unset($param['password']);
    	}
    	if(array_key_exists("super",$param)){
    	    unset($param["super"]);
    	}
    	
        $res = request()->Model->save($param);
        return showSuccess($res);
    }
    
    public function updatepassword(Request $request)
    {
    //     // 演示数据
    // 	if ($id == 50) {
    // 		$this->TestException();
    // 	}
    //     // 超级管理员和演示数据禁止操作
    // 	if ($request->Model->super) {
    // 		ApiException('超级管理员禁止修改');
    // 	}
        
    	$param = $request->param();
    	$user = $request->UserModel;
    	
    	if (array_key_exists('password',$param) && $param['password'] == '') {
    		ApiException('新密码不能为空');
    	}

    	if(!password_verify($param["oldpassword"],$user->password)){
    	    ApiException('旧密码不正确');
    	}
    	
    	if ($param['password'] != $param['repassword']) {
    		ApiException('新密码和确认密码不一致');
    	}
    	
    	if($user->id == 50 || $user->super){
    	    ApiException('你运行到这一步，代表已经修改成功了，但由于当前账号是课程演示账号，所以不会真实修改~');
    	}
    	
    	
    	$user->password = $param['password'];
        $res = $user->save();
        
        if($res){
            // 让当前登录失效
            cms_logout([
                'token'=>$request->header('token')
            ]);
        }
        
        return showSuccess($res);
    }

    // 修改状态
    public function updateStatus(Request $request)
    {
        // 演示数据
        $id = $request->Model->id;
    	if ($id == 50) {
    		$this->TestException();
    	}
        
    	if ($request->Model->super) {
    		ApiException('超级管理员禁止操作');
    	}
        return showSuccess($this->M->_UpdateStatus());
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        // 演示数据
        $id = intval($id);
    	if ($id <= 50) {
    		$this->TestException();
    	}
        
    	// 超级管理员不能删除
    	$manager = request()->Model;
    	if($manager->super || $manager->id == 3){
    		ApiException('超级管理员不能删除');
    	}

        return showSuccess($this->M->Mdelete());
    }


    // 管理员登录
    public function login(Request $request){
        $user = cms_login([
            'data'=>$request->UserModel
        ]);
        return showSuccess([
            "token" => $user['token']
        ]);
    }

    // 获取当前管理员详细信息
    public function getinfo(Request $request){
        $user = $request->UserModel;
        // 获取当前用户所有权限
        $data = $this->M->where('id',$user['id'])->with([
        	'role'=>function($query){
        		$query->with([
        			'rules'=>function($q){
        				$q->order([
                        	'order'=>'asc',
                        	'id'=>'asc'
                        ])
        				->where('status',1);
        			}
        		])->where("status",1)->field("id,name");
        	}
        ])->find()->toArray();
        
        $data['tree'] = [];
        // 规则名称，按钮级别显示
        $data['ruleNames'] = [];
        // 无限级分类
        $rules = [];
        if($data['role']){
            $rules = $data['role']['rules'];
            unset($data['role']['rules']);
        }
        // 超级管理员
        if($data['super'] == 1){
            $rules =  \app\model\admin\Rule::where('status',1)->order([
                        	'order'=>'asc',
                        	'id'=>'asc'
                        ])->select()->toArray();
        }
        
        $data['tree'] = list_to_tree2($rules,'rule_id','child',0,function($item){
        	return $item['menu'] == 1;
        });
        // 权限规则数组
    	foreach ($rules as $v) {
    		if($v['condition'] && $v['name']){
    			$data['ruleNames'][] = $v['condition'].','.$v["method"];
    		}
    	}

        return showSuccess([
            "id"=>$data["id"],
            "username"=>$data["username"],
            "avatar"=>$data["avatar"],
            "super"=>$data["super"],
            "role"=>$data["role"],
            "menus"=>$data["tree"],
            "ruleNames"=>$data["ruleNames"]
        ]);
    }

    // 管理员退出
    public function logout(Request $request){
        cms_logout([
            'token'=>$request->header('token')
        ]);
        return showSuccess("退出登录成功");
    }

}
