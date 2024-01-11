<template>
    <div class="f-tag-list" :style="{left:$store.state.asideWidth}">
        <!-- 左侧标签容器 -->
        <el-tabs v-model="activeTab" type="card" class="flex-1" @tab-remove="removeTab" @tab-change="changeTab" style="min-width: 100px;">
            <el-tab-pane :closable="item.path != '/' "  v-for="item in tabList" :key="item.path" :label="item.title" :name="item.path"></el-tab-pane>
        </el-tabs>
        <!-- 右侧下拉按钮容器 -->
        <span class="tag-btn">
            <el-dropdown  @command="handleClose">
                <span class="el-dropdown-link">
                    <el-icon> <arrow-down /></el-icon> 
                </span>
                <template #dropdown>
                <el-dropdown-menu>
                    <el-dropdown-item command="clearOther">关闭其他</el-dropdown-item>
                    <el-dropdown-item command="clearAll">全部关闭</el-dropdown-item>
                </el-dropdown-menu>
                </template>
            </el-dropdown>
        </span>
    </div>
    <div style="height: 44px;"></div>
</template>
<script setup>
import { useTabList } from "~/composables/useTabList.js"
const { activeTab,
        tabList,
        changeTab,
        removeTab,
        handleClose,} = useTabList()
    
</script>
<style scoped>
    .f-tag-list{
        @apply fixed bg-gray-100 flex items-center;
        top: 64px;
        right: 0;
        height: 44px;
        z-index:100;     /* 指定元素层级 */
    }
    .tag-btn{
        @apply bg-white rounded ml-auto flex items-center justify-center px-2;
        height: 32px;
        width: 32px;
    }
    :deep(.el-tabs__header){                               /* 此语句用于设置，封装组件样式 */   
        border: 0!important;
        @apply flex items-center justify-start mb-0;
    }
    :deep(.el-tabs__nav){
        border: 0!important;
    }
    :deep(.el-tabs__item){
        border:0!important;
        height: 32px;
        line-height: 33px;                                  /* 默认行高比较矮，更改默认行距   */
        @apply bg-white mx-1 rounded;
    }
    :deep(.el-tabs__nav-next),:deep( .el-tabs__nav-prev){
        line-height: 33px;                                  /* 更改默认行高，滚动条能剧中 */
        height: 33px;
    } 
    :deep(.is-disabled){                                    /* 滚动条鼠标样式，滚动到头时成不可选 */
        cursor: not-allowed;
        @apply text-gray-300;
    }
</style>