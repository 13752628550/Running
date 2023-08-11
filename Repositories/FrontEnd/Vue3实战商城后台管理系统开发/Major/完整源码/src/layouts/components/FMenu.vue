<template>
    <div class="f-menu" :style="{ width: $store.state.asideWidth }">
        <el-menu :default-active="defaultActive" unique-opened :collapse="isCollapse" default-active="2" class="border-0"
            @select="handleSelect" :collapse-transition="false">
            <el-menu-item index="video">
                <el-icon :size="20">
                    <VideoCamera />
                </el-icon>
                <span>完整视频课程</span>
            </el-menu-item>
            <template v-for="(item, index) in asideMenus" :key="index">
                <el-sub-menu v-if="item.child && item.child.length > 0" :index="item.name">
                    <template #title>
                        <el-icon :size="20">
                            <component :is="item.icon"></component>
                        </el-icon>
                        <span>{{ item.name }}</span>
                    </template>
                    <el-menu-item v-for="(item2, index2) in item.child" :key="index2" :index="item2.frontpath">
                        <el-icon :size="20">
                            <component :is="item2.icon"></component>
                        </el-icon>
                        <span>{{ item2.name }}</span>
                    </el-menu-item>
                </el-sub-menu>

                <el-menu-item v-else :index="item.frontpath">
                    <el-icon :size="20">
                        <component :is="item.icon"></component>
                    </el-icon>
                    <span>{{ item.name }}</span>
                </el-menu-item>
            </template>
        </el-menu>
    </div>
</template>
<script setup>
import { computed, ref } from 'vue';
import { useRouter, useRoute, onBeforeRouteUpdate } from 'vue-router';
import { useStore } from 'vuex';
const router = useRouter()
const store = useStore()
const route = useRoute()

// 默认选中
const defaultActive = ref(route.path)

// 监听路由变化
onBeforeRouteUpdate((to, from) => {
    defaultActive.value = to.path
})

// 是否折叠
const isCollapse = computed(() => !(store.state.asideWidth == '250px'))

const asideMenus = computed(() => store.state.menus)

const handleSelect = (e) => {
    if (e == "video") {
        return window.open("https://study.163.com/course/courseMain.htm?courseId=1212775807&share=2&shareId=480000001892585")
    }
    router.push(e)
}
</script>
<style>
.f-menu {
    transition: all 0.2s;
    top: 64px;
    bottom: 0;
    left: 0;
    overflow-y: auto;
    overflow-x: hidden;
    @apply shadow-md fixed bg-light-50;
}

.f-menu::-webkit-scrollbar {
    width: 0px;
}
</style>