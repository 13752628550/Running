<template>
    <div>
        <!-- 后台首页统计1 -->
        <div class="statistics1" style="display:flex; justify-content: space-around; gap: 33px;" v-permission="['getStatistics1,GET']">
            <!-- 骨架屏 -->
            <template v-if="panels.length == 0"> 
                <div style="flex:1" v-for="i in 4" :key="i">
                    <el-skeleton style="width: 100%;" animated loading>
                        <template #template>
                            <el-card shadow="hover" class="border-0">
                                <!-- 页眉 -->
                                <template #header>
                                    <div class="flex justify-between"> 
                                        <el-skeleton-item variant="text" style="width: 50%" />
                                        <el-skeleton-item variant="text" style="width: 10%" />
                                    </div>
                                </template>
                                <!-- 正文 -->
                                <el-skeleton-item variant="h3" style="width: 80%" />
                                <el-divider />
                                <!-- 页脚 -->
                                <div class="flex justify-between text-sm text-gray-500 ">
                                    <el-skeleton-item variant="text" style="width: 50%" />
                                    <el-skeleton-item variant="text" style="width: 10%" />
                                </div>
                            </el-card>
                        </template>
                    </el-skeleton>
                </div>
            </template>
            <!-- 正式屏 -->
            <div style="flex:1" v-for="(item,index) in panels" :key="index">
                <el-card shadow="hover" class="border-0">
                    <!-- 页眉 -->
                    <template #header>
                        <div class="flex justify-between">
                            <span class="text-sm">{{ item.title }}</span>
                            <el-tag :type="item.unitColor" effect="plain"> {{ item.unit }} </el-tag>
                        </div>
                    </template>
                    
                    
                    <!-- 正文 -->
                    <span class="text-3xl font-bold text-gray-500"> 
                        <CountTo :value="item.value" />
                    </span>
                    <el-divider />
                    <!-- 页脚 -->
                    <div class="flex justify-between text-sm text-gray-500 ">
                        <span>{{ item.subTitle }}</span>
                        <span>{{ item.subValue }}</span>
                    </div>
                </el-card>
            </div>
        </div>
        <!-- 分类组件布局 -->
        <indexNavs />
        <!-- 后台首页统计2 + 后台首页统计3 -->
        <div style="display:flex; justify-content: space-around; gap: 33px; margin-top:30px;">
            <!-- 图表组件布局 后台首页统计3 -->
            <div style="flex:1">
                <IndexChart v-permission="['getStatistics3,GET']"/>
            </div>
            <!-- 后台首页统计2 -->
            <div style="flex:1" v-permission="['getStatistics2,GET']">
                <IndexCard title="店铺及商品提示" tip="店铺及商品提示" :btns="goods" class="mb-3" />
                <IndexCard title="交易提示" tip="立即处理交易数据" :btns="order"/>
            </div>

        </div>

    </div>

</template>
<script setup>
    import { ref } from "vue";
    import CountTo from "~/components/CountTo.vue"
    import IndexNavs from "~/components/IndexNavs.vue"
    import IndexChart from "~/components/IndexChart.vue"
    import IndexCard from "~/components/IndexCard.vue"
    import { getStatistics1,getStatistics2 } from "~/api/index.js"
    const panels = ref([])
    getStatistics1()
    .then(res => {
        panels.value = res.panels
    })
    const goods = ref([])
    const order = ref([])
    getStatistics2()
    .then(res => {
        goods.value = res.goods
        order.value = res.order
    })
</script>
<style scoped>






</style>