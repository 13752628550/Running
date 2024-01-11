<template>
    <div style="display:flex; justify-content: space-around; gap: 33px; margin-top:30px;">
        <!-- 建立图标导航 -->
        <div style="flex: 1;" v-for="(item,index) in iconNavs" :key="index">
            <!-- 卡片 -->
            <el-card shadow="hover" @click="$router.push(item.path)">
                <div class="flex flex-col items-center justify-center cursor-pointer">
                    <!-- 图标 -->
                    <el-icon :size="16" :class="item.color">
                        <component :is="item.icon" />
                    </el-icon>
                    <!-- 标题 -->
                    <span class="text-sm mt-2">
                        {{item.title}}
                    </span> 
                </div>
            </el-card>
        </div>
    </div>
</template>
<script setup>
    const iconNavs = [{
        icon:"user",
        color:"text-light-blue-500",
        title:"用户",
        path:"/user/list"
    },{
        icon:"shopping-cart",
        color:"text-violet-500",
        title:"商品",
        path:"/goods/list"
    },{
        icon:"tickets",
        color:"text-fuchsia-500",
        title:"订单",
        path:"/order/list"
    },{
        icon:"chat-dot-square",
        color:"text-teal-500",
        title:"评价",
        path:"/comment/list"
    },{
        icon:"picture",
        color:"text-rose-500",
        title:"图库",
        path:"/image/list"
    },{
        icon:"bell",
        color:"text-green-500",
        title:"公告",
        path:"/notice/list"
    },{
        icon:"set-up",
        color:"text-gray-500",
        title:"配置",
        path:"/setting/base"
    },{
        icon:"files",
        color:"text-yellow-500",
        title:"优惠券",
        path:"/coupon/list"
    },]
</script>
<style scoped>
    
</style>