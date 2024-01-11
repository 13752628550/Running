<template>
    <div class="ProductHeader">
        <div class="content">

            <el-breadcrumb separator=">" style="margin-bottom:30px;margin-left:3px;font-size: 16px; color:#1d2129 ;" >
                <el-breadcrumb-item :to="{ path: '/' }">主页</el-breadcrumb-item>
                <el-breadcrumb-item ><a href="./page-header.html"></a>关于</el-breadcrumb-item>
            </el-breadcrumb>
            <el-divider />
            <div class="title1">
                <h1>关于本软件</h1>
                <h3>本软件用于生管系统辅助，致力于提供便捷、高效方案。</h3>
                <h1 style="margin-top: 30px;">开发者</h1>
                <h3>数据库设计：张彬</h3>
                <h3>主程序设计：孙宝禄</h3>
            </div>
        </div>
    </div>
</template>
<script setup>
</script>
<style scoped>
    .content{
        width: 100vw;
        height: 389px;
        margin-top: 80px;
        margin-left: 80px;
    }
    .title1{
        width: 840px;
        height: 88px;
    }

    .title1 h1{
        font-size: 30px;
        color: #1d2129;
        font-family:'microsoft yahei','Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif, Helvetica, sans-serif;
        margin-top: 10px;
        margin-bottom:  10px;
    }
    .title1 h3{
        font-size: 16px;
        color: #1d2129;
    }






























</style>