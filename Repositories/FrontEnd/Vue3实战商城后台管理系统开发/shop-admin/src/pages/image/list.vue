<template>
    <el-container class="bg-white rounded" :style="{ height: (h + 'px')}">
        <!-- 头部 -->
            <el-header class="image-header">
                <!-- 新增分类图片按钮 -->
                <el-button type="primary" size="small" @click="handleOpenCreate">
                    新增图片分类
                </el-button>  
            </el-header>
        <el-container>
            <ImageAside ref="ImageAsideRef" @change="handleAsideChange" />
            <ImageMain ref="ImageMainRef" />
        </el-container>
    </el-container>
</template>
<script setup>
    import { ref } from "vue";
    import ImageAside from "~/components/ImageAside.vue"
    import ImageMain from "~/components/ImageMain.vue"
    const windowHeight = window.innerHeight || document.body.clientHeight    // 获取浏览器可视区域高度
    const h = windowHeight - 65 - 44 - 40
    const ImageAsideRef = ref(null)
    
    
    const handleOpenCreate = ()=>ImageAsideRef.value.handleCreate()
    const ImageMainRef = ref(null)
    const handleAsideChange= (image_class_id)=> ImageMainRef.value.LoadData(image_class_id)
</script>
<style scoped>
    .image-header{
       border-bottom: 1px solid #eeeeee;
       @apply flex items-center;
    }
</style>