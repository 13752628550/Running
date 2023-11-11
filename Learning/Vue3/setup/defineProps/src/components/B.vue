<template>
    ComponB
    <div class="msg">{{ msg }}</div>
</template>
<script setup>
/***********************************************************
 *  defineProps()
 *  作用：此函数来定义父组件传递 props
 *  语法：defineProps({
 *            msg:{
 *              type: String,
 *              require: true,
 *              default: "xxx"
 *            }
 *        })
 *  通讯方向：父组件 -> 子组件
 ************************************************************/
    import { ref } from 'vue';
    defineProps({
        msg:{
            type:String,
            requite:true,
            default:" msgstr"
        }
    })
</script>

<style scoped>
    .msg{
        background: firebrick;
        color: indigo;
    }
</style>