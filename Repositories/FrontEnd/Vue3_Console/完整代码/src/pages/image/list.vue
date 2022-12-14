<template>
    <el-container class="bg-white rounded" :style="{ height: (h + 'px') }">
      <el-header class="image-header">
        <el-button type="primary" size="small" @click="handleOpenCreate">新增图片分类</el-button>
        <el-button type="warning" size="small" @click="handleOpenUpload">上传图片</el-button>
      </el-header>
      <el-container>
        <ImageAside ref="ImageAsideRef" @change="handleAsideChange"/>
        <ImageMain ref="ImageMainRef"/>
      </el-container>
    </el-container>
</template>
<script setup>
import { ref } from "vue";
import ImageAside from "~/components/ImageAside.vue"
import ImageMain from "~/components/ImageMain.vue"

const windowHeight = window.innerHeight || document.body.clientHeight
const h = windowHeight - 64 - 44 - 40

const ImageAsideRef = ref(null)
const handleOpenCreate = ()=>ImageAsideRef.value.handleCreate()

const ImageMainRef = ref(null)
const handleAsideChange = (image_class_id)=> ImageMainRef.value.loadData(image_class_id)

const handleOpenUpload = ()=>ImageMainRef.value.openUploadFile()
</script>
<style>
.image-header{
  border-bottom: 1px solid #eeeeee;
  @apply flex items-center;
}
</style>