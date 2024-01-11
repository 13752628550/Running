<template>
    <!-- 抽屉通用代码 -->
    <el-drawer 
    v-model = "showDrawer" 
    :title = "title" 
    :size = "size" 
    :close-on-click-modal = "false"
    :destroy-on-close = "destroyOnClose">
        <!-- 表单显示部分 -->
        <div class="formDrawer">
            <!-- 正文 -->
            <div class="body">
                <slot></slot>
            </div>
            <!-- 按钮 -->
            <div class="actions">
                <el-button class="rfbutton" type="primary" @click="submit" :loading="loading">{{ confirmText }}</el-button>
                <el-button class="rfbutton" type="default" @click="close">取消</el-button>
            </div>
        </div>
    </el-drawer>  
</template>
<script setup>
    import { ref } from 'vue';
    const showDrawer = ref(false) 
    
    // 定义 props 接收父组件
    const props = defineProps({
        title:String,             // 显示标题
        size:{                    // 窗口大小
            type:String,
            default:"35%"
        },                         
        destroyOnClose:{          // 关闭时是否销毁
            type:Boolean,
            default:false
        },
        closeOnClickModal:{        // 点击遮罩层是否关闭
            type:Boolean,
            default:false
        },
        confirmText:{              // 提交按钮文字
            type:String,
            default:"提交"            
        } 
    })
    
    
    // 定义 loading 当前状态及方法
    const loading = ref(false)
    const showLoading = ()=>loading.value = true
    const hideLoading = ()=>loading.value = false
    
    // 定义打开抽屉方法
    const open= ()=> showDrawer.value=true
    
    // 定义关闭抽屉方法
    const close= ()=>showDrawer.value=false

    // 提交按钮事件，接收父组件发送事件
    const emit = defineEmits(["submit"])  
    const submit = ()=> emit("submit")

    // 向父组件暴露以下方法
    defineExpose({
        open,
        close,
        showLoading,
        hideLoading
    })
</script>

<style>
    .formDrawer{
        width: 100%;
        height: 100%;
        position:relative;
        @apply flex flex-col; 
    }
    .formDrawer .body{
        flex:1;
        position:absolute;
        top:0;
        left:0;
        right:0;
        bottom: 50px;
        overflow-y:auto;
    }
    .formDrawer .actions{
        height: 50px;
        @apply mt-auto flex items-center;
    }
</style>