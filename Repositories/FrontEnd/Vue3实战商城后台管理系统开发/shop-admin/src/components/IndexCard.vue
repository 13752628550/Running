<template>
    <el-card shadow="never">
        <!-- 卡片表头布局 -->
        <template #header>
            <div class="flex justify-between">
                <!-- 表头左侧标题 -->
                <span class="text-sm">{{ title }}</span>
                <!-- 表头右侧信息 -->
                <el-tag type="danger" effect="plain">
                    {{ tip }}
                </el-tag>
            </div>
        </template>
        
        <!-- 卡片正文布局 -->
        <div style="display:flex; justify-content: space-around; gap: 33px; "> <!-- margin-top: ; -->
            <div style="flex:1" v-for="(item,index) in btns" :key="index"> <!--  -->
                <el-card shadow="hover" class="border-0 bg-light-400" > 
                    <div class="flex flex-col items-center justify-center">
                        <span class="text-xl mb-2">
                            {{item.value}}
                        </span>
                        <span class="text-xs text-gray-500">{{item.label}}</span>
                    </div>
                </el-card>
            </div>
        </div>
    </el-card>
</template>
<script setup>
    defineProps({
        title:String,
        tip:String,
        btns:Array,

    })
</script>
<style scoped>
    
</style>