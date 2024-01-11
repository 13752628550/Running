<template>
    <div class="container">
        <div class="header">
            <!-- 摄像头扫描 -->
            <div class="camera">
                <getUserMedia ref="getCamera" @getQRC="getRNumber"></getUserMedia>
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
                        <span style="margin-right:7px"><b>[仓库类型]</b></span> {{ mapView1.length>0 ? mapView1[0].stock_loca : "" }}
                    </el-card>
                    <el-card shadow="always" class="box-card">
                        <span style="margin-right:7px"><b>[在库]</b></span> {{ mapView1.length>0 ? mapView1[0].stock_quantity : "" }}
                    </el-card>
                    
                </div>
                <div class="table3">
                    <el-button :icon="Camera" @click="startScan" type="primary" round>开始扫描</el-button>
                    <el-button  @click="mysqlaxi" type="success" round>返回主菜单</el-button>
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
    import { Camera } from '@element-plus/icons-vue'        
    import { ref, watch } from 'vue'  
    import { xppcx } from '~/api/manager' 
    import {toast} from '~/composables/util' // H:\Design\Running\Repositories\FrontEnd\QRCodPAD\src\composables\util.js
    const getCamera=ref(null)
    const RNumber=ref('')
    const mapView1=ref([])
    const mapView2=ref([])
    const mapView3=ref([])
    
    
    function getRNumber(val){
        // alert(val)
        RNumber.value = val
    }
    function startScan() {
        getCamera.value.startScan() //getCamera.value.rtnCode)
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
    }
    watch(RNumber,(newValue, oldValue)=>{
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
        margin-top: auto;
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