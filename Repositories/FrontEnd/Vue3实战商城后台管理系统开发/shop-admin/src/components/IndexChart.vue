<template>
    <el-card shadow="never" >
        <!-- 卡片头部数据 -->
        <template #header>
            <div class="flex justify-between">
                <span class="text-sm">订单统计</span>
                <div>
                    <!-- 三个日期选项 -->
                    <el-check-tag v-for="(item,index) in options" :key="index" :checked="current == item.value" style="margin-right:8px" @click="handleChoose(item.value)">
                        {{ item.text }} 
                    </el-check-tag>
                </div>
            </div>
        </template>
        <!-- 图表数据容器 -->
        <div ref="el" id="chart" style="height: 300px;">
        </div>
    </el-card>
</template>
<script setup>
    import { ref,onMounted,onBeforeUnmount } from "vue";
    import * as echarts from 'echarts';
    import { getStatistics3 } from '~/api/index.js'

    import { useResizeObserver } from '@vueuse/core'
    const current = ref("week")
    const options = [{
        text:"近1个月",
        value:"month"
    },{
        text:"近1周",
        value:"week"
    },{
        text:"近1天",
        value:"hour"
    },]

    const handleChoose = (type) =>{
        current.value = type
        getData()
    }

    var myChart = null
    
    
    
    onMounted(()=>{
        var chartDom = document.getElementById('chart');
        if(chartDom){
            myChart = echarts.init(chartDom);
            getData()
        }
    })
    
    // 当页面关闭时销毁echarts实例 
    onBeforeUnmount(()=>{
        if(myChart){
            echarts.dispose(myChart)
        }
    })

    function getData(){
        let option = {
            xAxis: {
                type: 'category',
                data: []
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                data: [],
                type: 'bar'
                }
            ]
        };
        // 添加表格加载动画
        myChart.showLoading()
        getStatistics3(current.value).then( res=>{
            option.xAxis.data = res.x
            option.series[0].data = res.y

            myChart.setOption(option)
        }).finally(()=>{
            myChart.hideLoading()
        })
    }

    // 表格窗体大小变化时，自动绘制表格窗体
    const el=ref(null)
    useResizeObserver(el, (entries) => {
        myChart.resize()
    })

</script>
<style scoped>
</style>