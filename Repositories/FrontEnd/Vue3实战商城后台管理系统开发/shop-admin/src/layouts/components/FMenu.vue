<template>
    <div class="f-menu" :style="{width:$store.state.asideWidth}">
        <!-- 定义侧边栏 -->
        <el-menu :default-active="defaultActive" unique-opened :collapse="isCollapse" default-active="2" class="border-0" @select="handleSelect" :collapse-transition="false">
            <!-- 遍历侧边栏菜单 -->
            <template v-for ="(item,index) in asideMenus" :key="index">       
                <!-- 1. 如有子菜单，执行此代码 -->
                <el-sub-menu v-if="item.child && item.child.length > 0" :index="item.name">
                    <!-- 1.1 定义菜单图标、标题 -->
                    <template #title>
                        <el-icon>
                            <component :is="item.icon"></component>     
                        </el-icon>
                        <span>
                            {{item.name}}
                        </span>
                    </template>
                    <!-- 1.2 遍历子菜单 child 项，生成 child 图标、标题 -->
                    <el-menu-item v-for="(item2,index2) in item.child" :key="index2" :index="item2.frontpath">
                        <el-icon>
                            <component :is="item2.icon"></component>
                        </el-icon>
                        <span>
                            {{item2.name}}
                        </span>
                    </el-menu-item>
                </el-sub-menu>
                
                <!-- 2.如不存在子菜单，执行此代码，不进行 child 遍历操作 -->
                <el-menu-item v-else :index="item.frontpath" >
                    <!-- 2.1 定义菜单图标、标题 -->
                    <el-icon>
                        <component :is="item.icon"></component>
                    </el-icon>
                    <span>
                        {{item.name}}
                    </span>
                </el-menu-item>
            </template>
      </el-menu>
    </div>

</template>
<script setup>
    import { computed,ref } from 'vue'
    import { useRouter,useRoute } from 'vue-router'
    import { useStore } from 'vuex';
    const router = useRouter() 
    const store = useStore()
    const route = useRoute() 


    
    
    // 菜单选中和路由关联
    const defaultActive = ref(route.path)

    // 是否折叠侧边栏
    const isCollapse = computed(() =>!(store.state.asideWidth == '250px') )

    // 监听侧边栏点击事件
    const handleSelect = (e)=>{
        router.push(e)
    }

    // 侧边栏数据加载
    const asideMenus = computed(()=>store.state.menus)
    /*  侧边栏数据格式
    [
        {
            name: "后台面板",
            icon: "help",
            path: '/dashboard',
            child: [
                {
                    name: "主控台",
                    icon: "home-filled",
                    frontpath: '/',
                }
            ],
        }, 
        {
            name: "商城管理",
            icon: "shopping-bag",
            path: '/dashboard',
            child: [
                {
                    name: "商品管理",
                    icon: "shopping-cart-full",
                    frontpath: '/goods/list',
                }
            ],
        } 
    ]
    */
</script>
<style scoped>
    /***************************************************************************
    *   侧边栏设置
    *   1. 设置动画效果
    *   2. 设置宽度为 250px
    *   3. 设置距头部 64px
    *   4. 设置距底部 0px
    *   5. 设置距左部 0px
    *   6. 设置是否滚动 overflow-y:auto; overflow-x: hidden 
    *   7. windi css 设置阴影 固定 背景 @apply shadow-md fixed bg-light-50
    ****************************************************************************/
    .f-menu{
        transition:all 0.2s;
        width: 250px;
        top: 64px;
        bottom: 0;
        left: 0;
        overflow-y:auto;
        overflow-x: hidden;
        @apply shadow-md fixed bg-light-50;
    }
    /***************************************************************************
    *   1. 隐藏侧边栏滚动条   width: 0px
    ****************************************************************************/
    .f-menu::-webkit-scrollbar{ 
        width: 0px;
    }
</style>