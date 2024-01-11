<template>
    <!-- 主体 -->
    <el-main class="image-main">
        <!-- 主体上 -->
        <div class="top">
            <div v-for="i in 100" :key="i">{{ i }}</div>
        </div>
        <!-- 主体下 -->
        <div class="bottom">
            分页区域
        </div>
    </el-main>
</template>
<script setup>
</script>
<style scoped>
    .image-main{
        position: relative;
    }
    .image-main .top{
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 50px;
        overflow-y: auto;
    }
    .image-main .bottom{
        position: absolute;
        bottom: 0;
        height:50px;
        left:0;
        right:0;
        @apply flex items-center justify-center;
    }

</style>