<template>
    <!-- 主体 -->
    <el-main class="image-main" v-loading="loading">
        <!-- 主体上 -->
        <div class="top">
            <div v-for="(item,index) in list" :key="index">  {{ item.url }} </div>
            <!-- <div v-for="i in 100">{{i}}</div> -->
        </div>
        <!-- 主体下 -->
        <div class="bottom">
            <!-- 分页栏区域 --> 
            <el-pagination 
            background 
            layout="prev,pager, next" 
            :total="total" 
            :current-page="currentPage" 
            :page-size="limit" 
            @current-change="getData" />
        </div>
    </el-main>
</template>
<script setup>
    import { ref,reactive } from "vue";
    import { getImageList } from "~/api/image.js";

    // 分页数据
    const currentPage = ref(1)   // 当前页码默认为1
    const total = ref(0)         // 总条数默认为 0
    const limit = ref(10)        // 每页条数默认为 10
    const list = ref([])
    const loading = ref(false)
    const image_class_id = ref(0)   // 图片分类id 
    
    // 获取数据
    function getData(p=null){
        if(typeof p=="number"){       // p 为当前页改变时数字
            currentPage.value = p
        }
        loading.value = true
        getImageList(image_class_id.value,currentPage.value)
        .then(res =>{
            console.log(res);
            
            total.value = res.totalCount      // 总条数 = api 返回总条数
            list.value = res.list             // 列表数据 = api 返回列表数据
            
        })
        .finally(()=>{
            loading.value = false
        })
    }

    
    
    
    
    // 更具分类 id 重新加载图片列表
    const LoadData = (id) =>{
        currentPage.value = 1
        image_class_id.value = id
        getData()
    }

    defineExpose({
        LoadData
    
    })

</script>

<style scoped>
    .image-main{
        position: relative;
    }
    .image-main .top{
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 50px;
        overflow-y: auto;
    }
    .image-main .bottom{
        position: absolute;
        bottom: 0;
        height:50px;
        left:0;
        right:0;
        @apply flex items-center justify-center;
    }









</style>
