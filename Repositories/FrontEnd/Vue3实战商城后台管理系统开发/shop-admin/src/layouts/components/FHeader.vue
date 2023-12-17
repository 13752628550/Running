<template>
    <!-- 头部主容器 -->
    <div class="f-header">
        <!-- 头部 Logo 及文字 -->
        <span class="logo">
            <el-icon class="logopic">
                <Sunrise />
            </el-icon>
            帝莎编程
        </span>

        <!-- 头部折叠按钮 -->
        <el-icon class="icon-btn" @click="$store.commit('handleAsideWidth')">
            <Fold v-if="$store.state.asideWidth == '250px'"/>
            <Expand v-else/>
        </el-icon>
        
        <!-- 头部刷新按钮 -->
        <el-tooltip effect="dark" content="刷新" placement="bottom">
            <el-icon class="icon-btn" @click="handleRefresh">
                <Refresh />
            </el-icon>
        </el-tooltip>
        
        <!-- 头部右边容器 -->
        <div class="right">
            <!-- 定义全屏按钮 -->
            <el-tooltip effect="dark" content="全屏" placement="bottom">
                <el-icon class="icon-btn" @click="toggle">
                    <FullScreen v-if="!isFullscreen" />
                    <Aim v-else />
                </el-icon>
            </el-tooltip>
            
            <!-- 下拉菜单文字及图像 -->
            <el-dropdown class="dropdown" @command="handleCommand">
                <span class="el-dropdown-link">
                    <el-avatar :size="25" :src="$store.state.user.avatar" />
                    {{$store.state.user.username}}
                    <el-icon class="el-icon--right">
                        <arrow-down />
                    </el-icon>
                </span>
                <!-- 下拉菜单子选项 -->
                <template #dropdown>
                    <el-dropdown-menu>
                        <el-dropdown-item command="rePassword">修改密码</el-dropdown-item>
                        <el-dropdown-item command="logout">退出登录</el-dropdown-item>
                    </el-dropdown-menu>
                </template>
            </el-dropdown>
        </div>
    </div>
    
    
    <!-- 加载抽屉组件 -->
    <form-drawer 
    ref="formDrawerRef" 
    title="修改密码" 
    destroyOnClose 
    @submit="onSubmit">
        <!-- 用户修改密码表单容器 -->    
        <el-form ref="formRef" 
        :model="form" 
        :rules="rules" 
        label-width="80px" 
        size="small">
            <!-- 旧密码输入 -->
            <el-form-item prop="oldpassword" label="旧密码">
                <el-input type="password" v-model="form.oldpassword" placeholder="请输入旧密码">
                </el-input>
            </el-form-item>
            
            <!-- 新密码输入 -->
            <el-form-item prop="password" label="新密码">
                <el-input type="password" v-model="form.password" placeholder="请输入密码" >
                </el-input>
            </el-form-item>    
            
            <!-- 确认新密码输入 -->
            <el-form-item prop="repassword" label="确认密码">
                <el-input type="password" v-model="form.repassword" placeholder="请输入确认密码" >
                </el-input>
            </el-form-item>  
        </el-form>
    </form-drawer>
    
</template>

<script setup>
    import { useFullscreen } from '@vueuse/core'   // 引入全屏组件 vueuse
    import FormDrawer from "~/components/FormDrawer.vue"  // 引入抽屉组件
    import { useRepassword, useLogout } from "~/composables/useManager"  // 引入退出登录和修改密码的函数
    const { isFullscreen, toggle } = useFullscreen()  // 定义全屏执行事件
    const {
        formDrawerRef,
        form,
        rules,
        formRef,
        onSubmit,
        openRepasswordForm
    } = useRepassword()

    const {
        handleLogout
    } = useLogout()

    // 监听下拉菜单事件
    const handleCommand =(c)=>{
        switch (c) {
            case "logout":
                handleLogout()
                break;
            case "rePassword":
                openRepasswordForm()
                break;
        }
    }

    // 刷新按钮事件
    
    const handleRefresh=()=> location.reload()

</script>


<style>
    /************************************************************
    *   头部通用布局设置
    *   1. windi css 设置垂直居中 items-center
    *   2. windi css flex 布局
    *   3. windi css 设置背景色 bg-indigo-700
    *   4. windi css 设置文字颜色 text-light-50
    *   5. windi css 设置位置顶部固定 fixed top-0 left-0 right-0;
    *************************************************************/
    .f-header{
        @apply flex items-center bg-indigo-700 text-light-50 fixed top-0 left-0 right-0;
        height: 64px;
    }
    /************************************************************
    *   头部右侧布局设置
    *   1. windi css 设置位置右对齐 ml-auto
    *   2. windi css 设置垂直方向居中 justify-center items-center
    *************************************************************/        
    .right{
        @apply ml-auto flex justify-center items-center;
    }
    /************************************************************
    *   头部 logo 布局
    *   1. 设置宽度 250px
    *   2. windi css 设置布局垂直、水平均居中 
    *   3. windi css 设置字体 text-xl font-thin
    *************************************************************/   
    .logo{
        width: 250px;
        @apply flex justify-center items-center text-xl font-thin;
    }
    /************************************************************
    *   logo 图片设置 
    *   1. windi css 设置间隔 mr-1 ( margin-right: 02.5rem; )
    *************************************************************/ 
    .logopic{
        @apply mr-1;
    }
    /************************************************************
    *   通用图片按钮 
    *   1. windi css flex 布局垂直水平居中
    *   2. 宽和高 41px 65px
    *   3. 鼠标经过图标 
    *************************************************************/
    .icon-btn{
        @apply flex justify-center items-center;
        width: 41px;
        height: 65px;
        cursor: pointer;
    }
    /************************************************************
    *   通用图片鼠标经过 
    *   1. windi css 经过背景颜色变浅
    *************************************************************/
    .icon-btn:hover{
        @apply bg-indigo-600;
    }    
    /************************************************************
    *   右侧下拉菜单 
    *   1. 设置高  65px
    *   2. 鼠标经过图标 cursor: pointer
    *   3. windi css 垂直水平居中
    *************************************************************/
    .f-header .dropdown{
        height: 65px;
        cursor: pointer;
        @apply flex justify-center items-center mx-5 ;
    }
    /************************************************************
    *   右侧下拉菜单
    *   1. windi css 设置文字颜色 text-light-50
    *   2. windi css 设置字符间距 mr-2
    *   3. 垂直水平居中 
    *************************************************************/
    .right span{
        @apply text-light-50 mr-2;
    }
</style>