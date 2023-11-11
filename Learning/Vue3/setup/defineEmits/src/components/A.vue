<template>
    <div class="A">
        ComponA
    </div>
    <div class="B">
        <B @change = "changeFun" @delete = "deleteFun"></B>
    </div>
</template>
<script setup>
    import B from './B.vue'
    const changeFun = (val)=>{
        console.log("changeFun",val);   
    }
    const deleteFun = (val)=>{
        console.log("deleteFun",val);
    }
</script>
<style scoped>
</style>