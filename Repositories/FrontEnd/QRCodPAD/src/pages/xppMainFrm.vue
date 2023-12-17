<template>
    <div class="container">
        <div class="header">
            <!-- 摄像头扫描 -->
            <div class="camera">
                <getUserMedia ref="getCamera" @getQRC="getRNumber"></getUserMedia>
                <el-input v-model="input" style="width: 300px; margin: 3px 10px;" placeholder="请输入 R 番号码" clearable > 
                    <template #prefix>
                        <el-icon><DArrowRight /></el-icon> 
                    </template>
                </el-input>
            </div>
            <!-- 表头 -->
            <div class="tableHeader">
                <div class="table1">
                    <el-card shadow="always" class="box-card">  
                        <span style="margin-right:7px"><b>[R番]</b></span> {{ mapView1.length>0 ? mapView1[0].item_no : "" }}
                    </el-card>
                    <el-card shadow="always" class="box-card"> 
                        <span style="margin-right:7px"><b>[品名]</b></span> {{ mapView3.length>0 ? mapView3[0].ITEM_NAME : "" }} 
                    </el-card>
                </div>
                <div class="table2">
                    <el-card shadow="always" class="box-card">
                        <span style="margin-right:7px"><b>[仓库号]</b></span> {{ mapView1.length>0 ? mapView1[0].stock_loca : "" }}
                    </el-card>
                    <el-card shadow="always" class="box-card">
                        <span style="margin-right:7px"><b>[在库]</b></span> 
                        <span style="font-size: 17px; color: #ff0000;"><b>{{ mapView1.length>0 ? numeral(mapView1[0].stock_quantity).format('0,0') : "" }} </b></span>
                    </el-card>
                </div>
                <div class="table3" style="margin:10px;">
                    <el-button :icon="Camera" @click="startScan" type="primary" round >扫码</el-button>
                    <el-button :icon="Search" @click="handleInput" type="primary" round >查询</el-button>
                    <el-button :icon="HomeFilled" @click="goMainform" type="success" round >主页</el-button>
                </div>
            </div>
        </div>
        <!-- 表体 -->
        <div class="table-body">
            <el-table :data="mapView2" border style="width: 900px"> <!-- mapView2.length > 0 ? mapView2[0] : '' -->>
                <el-table-column prop="item_NO" label="R番" width="180" />
                <el-table-column prop="出入库类型" label="出入库类型" width="180" />
                <el-table-column prop="quantity" label="出入库数量" width="180"/>
                <el-table-column prop="sys_date_yymmdd" label="出入库时间" />
            </el-table>
        </div>
    </div>
</template>
<script setup>
    import getUserMedia from '../components/getUserMedia.vue'
    import { Camera, HomeFilled, Search, DArrowRight } from '@element-plus/icons-vue'        
    import { ref, watch } from 'vue'  
    import { xppcx, login } from '~/api/manager' 
    import numeral from 'numeral';
    import {toast} from '~/composables/util' // H:\Design\Running\Repositories\FrontEnd\QRCodPAD\src\composables\util.js
    import { useRouter } from 'vue-router' 
    const getCamera=ref(null)
    const RNumber=ref('')
    const mapView1=ref([])
    const mapView2=ref([])
    const mapView3=ref([])
    const input=ref("")  // R 169715
    const router = useRouter()
    function goMainform(){
        router.push("/")
        // window.location.href = "https://172.26.32.179:3000/xppcx?sqlView=V_Prod_StockInfo&RNumber=R 16A766";
    }
    function getRNumber(val){
        // alert(val)
        RNumber.value = val
    }
    function startScan() {
        RNumber.value = ''
        getCamera.value.startScan() //getCamera.value.rtnCode)
    }
    function handleInput(){
        if(input.value ==""||input.value==null||input.value==undefined ){
            return
        }
        RNumber.value = input.value 
    }
    function homepage(){
        // 发送请求时将配置传递给 Axios
        // axios.get('https://172.26.32.179:3000/login')
        // .then(response => {
        //     alert(response.data);
        // })
        // .catch(error => {
        //     alert('Error:', error.message);
        // });
        RNumber.value = ""
    }
    async function mysqlaxi(val){
        mapView1.value.length = 0
        mapView2.value.length = 0
        mapView3.value.length = 0
        let view = ["V_Prod_StockInfo","V_Prod_StockMoveInfo","V_ProdInfo"];
        for (let index = 0; index < view.length; index++) {
            await xppcx(view[index],val)      
            .then(function (response) {
                console.log(`视图 ${view[index]}: `,response.data);
                if (index == 0){
                    mapView1.value.push(...response.data)
                    console.log("mapView1数组：",mapView1.value);         
                }
                else if(index == 1){
                    mapView2.value = response.data
                    console.log("mapView数组2：",mapView2.value);
                }
                else {
                    mapView3.value.push(...response.data)
                    console.log("mapView数组3：",mapView3.value)
                }
            })
            .catch(function (error) {
                console.log(error);
            });
        }
        RNumber.value = ''
    }
    watch(RNumber,(newValue, oldValue)=>{
        if(newValue ==''){
            console.log("newValue为空");
            return
        }
        console.log(newValue);
        toast(` 扫码成功：${newValue}`)
        mysqlaxi(newValue)
        // alert(`myData changed from ${oldValue} to ${newValue}`);
        // xppcx("V_Prod_StockInfo",newValue)
        // .then(function (response) {
        //     console.log(response.data);
        // })
        // .catch(function (error) {
        //     console.log(error);
        // });
    })
</script>
<style scoped>
    .container{
        width: 100%;
        @apply flex-col;  
    }
    .header{
        /* widows: 100%; */
        display : flex;
        /* justify-content: space-between;  */
        /* @apply flex flex-row flex-shrink-0 ;  */
        
    }
    .camera{
        flex:0 0 300px;
    }
    .tableHeader{
        height: 300px;
        flex:1;
        margin-top: 10px;
        @apply flex flex-col flex-auto;
        /* @apply flex-;  */
    }
    .table1{
        /* @apply flex flex-row flex-auto flex-shrink; */
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    .table2{
        /* @apply flex flex-row flex-auto flex-shrink; */
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    .table3{
        /* margin-top: auto; */
        display: flex;
        /* flex-direction: column; */
        justify-content:flex-start;
        align-items: flex-end;
        
        /* @apply flex flex-col flex-none flex-grow-0; */
    }
    .box-card{
        width:300px;
        margin-right:10px;  
        margin-bottom :10px;
    }

    @media (max-width: 1000px) {
        .table1,.table2 {
            flex-direction: column; 
            justify-content: flex-start;
            align-items: flex-start; 
      }
    }
    .table-body{
        margin-top: 30px;
        margin-left: 10px;
        width: 100%;
    }
</style>