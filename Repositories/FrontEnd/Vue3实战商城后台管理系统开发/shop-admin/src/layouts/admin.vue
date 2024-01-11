<template>
    <el-container>
        <el-header>
            <f-header/>
        </el-header>
        <el-container>
            <el-aside :width="$store.state.asideWidth">
                <f-menu></f-menu>
            </el-aside>
            <el-main >
                <f-tag-list/>
                <router-view v-slot="{Component}"> 
                    <transition name="fade">
                        <keep-alive :max="10">
                            <component :is="Component"></component>
                        </keep-alive>
                    </transition>
                </router-view>
            </el-main>
        </el-container>
    </el-container>
</template>
<script setup>
    import FHeader from './components/FHeader.vue';
    import FMenu from './components/FMenu.vue';
    import FTagList from './components/FTagList.vue';
</script>
<style scoped>
    .el-aside{
    transition: all 0.2s;
}

.fade-enter-from{          /* 进入之前执行动画   */
    opacity: 0;
}
.fade-enter-to{           /* 进入之后执行动画   */
    opacity: 1;
}
 .fade-leave-from{        /* 离开之前执行动画  */
    opacity: 1;
}
 
.fade-leave-to{           /* 离开之后执行动画  */
    opacity: 0;
}
.fade-enter-active,         /* 进入离开动画时长 */
.fade-leave-active{
    transition: all 0.3s;
}
.fade-enter-active{
    transition-delay: 0.3s;
}
</style>