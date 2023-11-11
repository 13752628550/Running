<template>
    <div class="B">
        ComponB
    </div>
</template>
<script setup>
    /**************************************************************
     *  defineExpose
     *  作用：子组件暴露自己属性、方法
     *  语法：
     *      父组件
     *          <子组件 ref="xxx"></子组件>
     *          const xxx = ref(null)
     *          xxx.value.方法名()
     *          xxx.value.属性名
     *      
     *      子组件
     *          defineExpose({
     *              方法名,
     *              属性名: 属性值
     *          })
     *  通讯方向： 子组件 -> 父组件
     **************************************************************/   
    import {ref} from 'vue'
    const age=ref(99)
    const running = ()=>{
        console.log("running");
    }
    defineExpose({
        age,
        running
    })
</script>
<style scoped>
    .B{
        background: hotpink;
    }
</style>