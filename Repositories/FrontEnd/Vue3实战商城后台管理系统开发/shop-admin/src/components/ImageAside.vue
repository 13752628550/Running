<template>
    <!-- 侧边 -->
    <el-aside width="220px" class="image-aside" v-loading="loading">
        <!-- 侧边上 -->
        <div class="top">     <!--   -->
            <AsideList :active="activeId == item.id" v-for=" (item,index) in list" :key="index" @edit="handleEdit(item)">
                {{ item.name }}
            </AsideList>
        </div>
        <!-- 侧边下 -->
        <div class="bottom">
            <!-- 分页栏 -->
            <el-pagination background layout="prev, next" :total="total" :current-page="currentPage" :page-size="limit" @current-change="getData" />
        </div>
    </el-aside>
    <!-- 新增分类图片抽屉 -->
    <FormDrawer title="新增" ref="formDrawerRef" @submit="handleSubmit" label-width="73px" :inline="false">
        <el-form :model="form" ref="formRef" :rules="rules">
            <el-form-item label="分类名称" prop="name">
                <el-input v-model="form.name" placeholder="请输入分类名称"></el-input>
            </el-form-item>
            <el-form-item label="      排序" prop="order">
                <el-input-number v-model="form.order" :min="0" :max="1000"/>  
            </el-form-item>
        </el-form>
    </FormDrawer>
</template>
<script setup>
    import { ref,reactive } from "vue";
    import FormDrawer from "./FormDrawer.vue"
    import {getImageClassList, createImageClass,updateImageClass} from "~/api/image_class.js"
    import AsideList from './AsideList.vue'; 
    import {toast} from "~/composables/util.js"
    
    // 加载动画
    const loading = ref(false)
    const list = ref([])
    
    // 激活状态
    const activeId = ref(0)
    
    // 分页数据
    const currentPage = ref(1)   // 当前页码默认为1
    const total = ref(0)         // 总条数默认为 0
    const limit = ref(10)        // 每页条数默认为 10

    // 获取数据
    function getData(p=null){
        if(typeof p=="number"){       // p 为当前页改变时数字
            currentPage.value = p
        }
        loading.value = true
        getImageClassList(currentPage.value)
        .then(res =>{
            total.value = res.totalCount      // 总条数 = api 返回总条数
        
            list.value = res.list             // 列表数据 = api 返回列表数据
            let item = list.value[0]
            if(item){
                activeId.value = item.id      // 默认选中第一个数据 
            }
        })
        .finally(()=>{
            loading.value = false
        })
    }
    getData()

    // 抽屉组件
    const formDrawerRef = ref(null)
    // 打开抽屉
    const handleCreate = ()=> formDrawerRef.value.open()
    // 表单数据
    const form = reactive({
        name:"",
        order:50
    })
    // 表单规则
    const rules = {
        name: [{ 
            required: true, 
            message: '图库分类名称不能为空', 
            trigger: 'blur' 
        }],
    }
    // 表单实例
    const formRef = ref(null)
    // 提交表单
    const handleSubmit = ()=>{
        formRef.value.validate((valid)=>{
            if(!valid) return
            console.log("提交成功");
            formDrawerRef.value.showLoading()
            createImageClass(form)                  // 将表单数据发送接口
            .then(res=>{
                toast("新增成功")
                getData(1)                          // 刷新新增数据
                formDrawerRef.value.close()         // 关闭抽屉窗口
            }) 
            .finally(()=>{
                formDrawerRef.value.hideLoading()
            })
        })
    }



    // 编辑分类
    const handleEdit = (row)=>{
        form.name = row.name
        form.order = row.order
        formDrawerRef.value.open()                  // 打开抽屉修改数据
    }

    // 暴露打开抽屉方法
    defineExpose({
        handleCreate
    })

</script>
<style scoped>
    .image-aside{
        border-right: 1px solid #eeeeee;
        position: relative;
    }
    .image-aside .top{
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 50px;
        overflow-y: auto;
    }
    .image-aside .bottom{
        position: absolute;
        bottom: 0;
        height:50px;
        left:0;
        right:0;
        @apply flex items-center justify-center;
    }




</style>