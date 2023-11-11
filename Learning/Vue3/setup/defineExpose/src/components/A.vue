<template>
    <div class="A">
        ComponA
        <button @click="componafun">button</button>
        <B ref="xxx"></B>
    </div>
</template>
<script setup>
    import B from "./B.vue"
    import {ref} from "vue"
    const xxx = ref(null)
    const componafun = ()=>{
        console.log(xxx.value.age)
        xxx.value.running()
    }
    // console.log(xxx)
    // xxx.value.count)
</script>
<style scoped>
    .A{
        background: fuchsia;
    }
</style>