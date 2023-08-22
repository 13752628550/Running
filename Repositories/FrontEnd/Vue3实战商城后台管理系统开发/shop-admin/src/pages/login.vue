<template>
    <div class="container">
        <!-- 左侧窗口 -->
        <div class="left">
            <div>
                <!-- 主副标题 -->
                <div class="ltitle a">欢迎光临</div>
                <div class="ltitle b">此站点是 《vue3 + vite实战商城后台开发》 视频课程的演示地址</div>  
            </div>
        </div>
    
        <!-- 右侧窗口 -->
        <div class="right">
            <!-- 右侧窗口标题文字 -->
            <h2 class="rtitle a">欢迎回来</h2>
            <div class="rtitle b">
                <span class="horizontal"></span>
                <span>账号密码登录</span>
                <span class="horizontal"></span>
            </div>
            <!-- 右侧窗口表单 -->
            <el-form ref="formRef" :model="form" :rules="rules" class="rform">
                <!-- 右侧用户名输入 -->
                <el-form-item prop="username">
                    <el-input v-model="form.username" placeholder="请输入用户名">
                        <template #prefix>
                            <el-icon><User /></el-icon>
                        </template>
                    </el-input>
                </el-form-item>
                <!-- 右侧用户密码输入 -->
                <el-form-item prop="password">
                    <el-input type="password" v-model="form.password" placeholder="请输入密码" show-password>
                        <template #prefix>
                            <el-icon><Lock /></el-icon>
                        </template>
                    </el-input>
                </el-form-item>    
                <!-- 右侧按钮登录 -->
                <el-form-item>
                    <el-button round color="#6a6aef" class="rfbutton" type="primary" @click="onSubmit">登 录</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script setup>
    import { ref,reactive } from 'vue'
    import { ElNotification } from 'element-plus'  // 引入 element-plus Notification
    import { useRouter } from 'vue-router'         // 用于登录成功，转入新页面
    import { login } from '~/api/manager'          // 导入登录请求 axios
    import { useCookies } from '@vueuse/integrations/useCookies'
    
    const router = useRouter()
    
    // do not use same name with ref
    const form = reactive({
        username:[],
        password:[]
    })

    // 验证规则设置
    const rules = {
        username:[
            {
                required: true,                 // 必填项
                message: '用户名不能为空',       // 提示
                trigger: 'blur'                 // 规则触发条件
            },
        ],
        password:[
            {
                required: true,                    // 必填项
                message: '密码不能为空',            // 提示
                trigger: 'blur'                    // 规则触发条件
            },
        ]
    }
    
    const formRef = ref(null)                       // 用于点击登录按钮时验证规则
    // 定义提交按钮事件
    const onSubmit = () => {
        formRef.value.validate((valid,fields)=>{
            if(!valid){
                return false
            }
            
            login(form.username,form.password)      // 执行登录请求 axios
            .then(res =>{                           // 登录请求成功
                // 提示登录成功
                ElNotification({
                    message: "登录成功",
                    type: 'success',
                    duration:3000
                })

                // 存储 token 和用户相关信息
                const cookie = useCookies()
                cookie.set("admin-token",res.data.data.token)

                // 跳转到后台主页
                
                router.push("/")
            })
            .catch(err=>{                           // 登录请求失败
                // 通过 element-plus 通知发送信息 
                ElNotification({
                    message: err.response.data.msg || "请求失败",
                    type: 'error',
                    duration:3000
                })

            })
        })
    }
</script>

<style scoped>
    .container{
        /****************************************
        *   容器样式
        *   1. 设置 flex 布局
        *   2. 屏幕高度 100vh
        *   3. 屏幕宽度 100vw
        *   4. windi css 设置背景色 indigo-500
        *****************************************/
        display:flex;
        min-height: 100vh;
        min-width: 100vw;
        @apply bg-indigo-500;
    }
    
    .left{
        /****************************************
        *   左侧样式
        *   1. 子容器设置占比 6/9 
        *   2. windi css 设置 flex 布局
        *   3. windi css 设置水平居中
        *   4. windi css 设置垂直居中
        *   5. windi css 设置子项方向纵向 
        *****************************************/
        flex:6;
        @apply  flex items-center justify-center flex-col;
    }
    
    .ltitle{
        /****************************************
        *   左侧通用标题
        *   1. windi css 设置文字颜色 light-50
        *   2. windi css 设置文字间距 mb-4
        *****************************************/
        @apply text-light-50 mb-4;
    }
    
    .ltitle.a{
        /****************************************
        *   左侧主标题
        *   1. windi css 设置字体加粗
        *   2. windi css 设置文字号 5xl
        *****************************************/    
        @apply font-bold text-5xl;
    }
    
    .ltitle.b{
        /****************************************
        *   左侧副标题
        *   1. windi css 设置文字颜色 text-gray-200
        *   2. windi css 设置文字号 text-sm
        *****************************************/
        @apply  text-gray-200 text-sm;
    }    
        
    .right{
        /****************************************
        *   右侧样式
        *   1. 子容器设置占比 3/9 
        *   2. windi css 设置背景颜色 light-50  
        *   3. windi css 设置 flex 布局 
        *   4. windi css 设置水平居中 
        *   5. windi css 设置垂直居中
        *   6. windi css 设置子项方向纵向 
        *****************************************/
        flex:3;
        @apply bg-light-50 flex items-center justify-center flex-col;
    }

    .rtitle.a{
        /****************************************
        *   右侧主标题
        *   1. windi css 设置字体加粗
        *   2. windi css 设置文字号 3xl
        *   3. windi css 设置文字颜色 gray-800
        *****************************************/
        @apply font-bold text-3xl text-gray-800;
    }    
    
    .rtitle.b{
        /****************************************
        *   右侧副标题
        *   1. windi css 设置 flex 布局
        *   2. windi css 设置水平居中
        *   3. windi css 设置垂直居中
        *   4. windi css 设置外间距 5
        *   5. windi css 设置文字颜色 gray-300
        *   6. windi css 设置子项目间距 x-2
        *****************************************/
        @apply flex items-center justify-center my-5 text-gray-300 space-x-2;
    }    
    
    .horizontal{
        /****************************************
        *   右侧副标题横线
        *   1. windi css 设置高 1px
        *   2. windi css 设置宽 16        
        *   3. windi css 设置背景颜色 gray-200
        *****************************************/
        @apply h-[1px] w-16 bg-gray-200;
    }
    
    .rform{
        /****************************************
        *   右侧提交表单        
        *   1. windi css 设置宽 250px
        *****************************************/
        @apply w-[250px];
    }
    
    .rfbutton{
        /****************************************
        *   右侧提交表单按钮        
        *   1. 设置宽 
        *****************************************/
        width: 100%;
    }
</style>