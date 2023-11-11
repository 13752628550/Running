<template>
    <div class="B">
        ComponB
        <button @click="btnChange">Change</button>
        <button @click="btnDelete">Delete</button>
    </div>
</template>
<script setup>
    /*************************************************************************
     *  defineEmits
     *  作用：子组件接受父组件方法 
     *  语法: 
     *      父组件
     *          <子组件 @方法名 = "函数名">                 // 发送方法
     * 
     *      子组件
     *          const emit = defineEmits(["父组件方法名"])   // 定义接受
     *          emit("父组件方法名",参数)                    // 执行方法
     *************************************************************************/
    const emit = defineEmits(['change','delete'])
    const btnChange = ()=>{
        emit("change",7)
    }
    const btnDelete = ()=>{
        emit("delete",7)
    }
</script>
<style scoped>
    .B{
        background: hotpink;
    }
</style>