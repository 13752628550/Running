<template>
    <div class="container">
        <!-- R番号输入检索框 -->
        <div class="searchBox">
            <el-input v-model="input" placeholder="请扫描 / 输入R番" autofocus id="inputBox" style="width: 700px;">
                <template #prepend>
                    <el-button @click="clearInput" :icon="Close" />
                </template>
                <template #append>
                    <el-button @click="fullScr" :icon="HomeFilled" />
                </template>
            </el-input>
        </div>
            
        <div style="width: 350px; height: 50px;"></div>
        <!-- 表头 -->
        <div class="tableHeader">
            <div class="briefTab">  
                <span class="tabTitle" style="margin-right:7px">[R 番]</span> 
                <span class="tabValue">{{ mapView1.length>0 ? mapView1[0].item_no : "" }}</span>
            </div>
            <div class="briefTab"> 
                <span class="tabTitle" style="margin-right:7px">[品名]</span> 
                <span class="tabValue">{{ mapView3.length>0 ? mapView3[0].ITEM_NAME : "" }}</span> 
            </div>
            <div class="briefTab">
                <span class="tabTitle" style="margin-right:7px">[仓库]</span> 
                <span class="tabValue">{{ mapView1.length>0 ? mapView1[0].stock_loca : "" }}</span>
            </div>
            <div class="briefTab">
                <span class="tabTitle" style="margin-right:7px">[在库]</span> 
                <span style="font-size: 17px; color: #ff0000;">
                    <b>{{ mapView1.length>0 ? numeral(mapView1[0].stock_quantity).format('0,0') : "" }} </b>
                </span>
            </div>
        </div>
        
        <!-- 汇总  -->
        <div v-if="mapView2.length>0" class="categories">
            <div class="category">
                <span class="categoryTitle"><b>期<br/>初</b></span>
                <span class="categoryNumber"><input type="text" style="width: 100%; "></span>
            
            </div>
            <div class="category">
                <span class="categoryTitle">  <b>本<br/>月</b> </span>  <!-- : ""-->
                <span class="categoryNumber" > {{ numeral(categories[0].quantity).format('0,0')}}  </span>
            </div>
            
            <div class="category">
                <span class="categoryTitle"> <b>剩<br/>余</b> </span>   
                <span class="categoryNumber"> <input type="text" style="width: 100%; "> </span>
            </div>
        </div>

        <!-- 表体 -->
        <div v-if="mapView2.length>0" size="small" class="tableBody">
            <el-table :data="mapView2" border style="width: 700px ;height: 500px" > <!-- mapView2.length > 0 ? mapView2[0] : '' -->>
                <!-- <el-table-column align="center" fixed prop="item_NO" label="R番" width="50px"  /> -->
                <el-table-column align="center"  fixed  prop="出入库类型" label="出入库类型" width="100" />
                <el-table-column align="center" prop="quantity" label="出入库数量" width="100"/>
                <el-table-column align="center" prop="sys_date_yymmdd" label="出入库时间" />
            </el-table>
        </div>
    </div>
</template>
<script setup>
    import { Close, Camera, HomeFilled, Search, DArrowRight } from '@element-plus/icons-vue'        
    import { ref, watch } from 'vue'  
    import { xppcx, login } from '~/api/manager' 
    import numeral from 'numeral';
    import {toast} from '~/composables/util' // H:\Design\Running\Repositories\FrontEnd\QRCodPAD\src\composables\util.js
    import { useRouter } from 'vue-router' 
    import { useFullscreen } from '@vueuse/core'   // 引入全屏组件 vueuse
    const { isFullscreen, toggle, enter } = useFullscreen()
    
    // import * as echarts from 'echarts';
    const mapView1=ref([])
    const mapView2=ref([])
    const mapView3=ref([])
    const input=ref("")  // R 169715
    const inputBox = ref(null) 
    const router = useRouter()
    const categories = ref([])
    const inputFocus = ()=>{
        const inputBox = document.querySelector("#inputBox")
        inputBox.focus()
    }
    function clearInput(){
        input.value=""
        mapView1.value.length = 0
        mapView2.value.length = 0
        mapView3.value.length = 0 
        inputFocus()
    }
    function fullScr(){
        toggle()
        inputFocus()
    }
    function searchInput(){
        // var chartDom = document.getElementById('tabGarph');
        // var myChart = echarts.init(chartDom);
        // var option;

        // option = {
        // xAxis: {
        //     type: 'category',
        //     data: ['203', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        // },
        // yAxis: {
        //     type: 'value'
        // },
        // series: [
        //     {
        //     data: [120, 200, 150, 80, 70, 110, 130],
        //     type: 'bar'
        //     }
        // ]
        // };
        // option && myChart.setOption(option);
    }

    function goMainform(){
        router.push("/")
        // window.location.href = "https://172.26.32.179:3000/xppcx?sqlView=V_Prod_StockInfo&RNumber=R 16A766"  ;
        // https://172.26.32.179:3000/xppcx?sqlView=V_Prod_StockInfo&RNumber=R 16A767   GPA-CS610  66222         ;
    }
    function getRNumber(val){
        // alert(val)
        RNumber.value = val
    }
    
    // function startScan() {
    //     RNumber.value = ''
    //     getCamera.value.startScan() //getCamera.value.rtnCode)
    // }
    
    function handleInput(){
        console.log("handleInput");
        if(input.value ==""||input.value==null||input.value==undefined ){
            return
        }
        input.value = ""
    }
    function homepage(){
        RNumber.value = ""
    }

    async function mysqlaxi(val){
        mapView1.value.length = 0
        mapView2.value.length = 0
        mapView3.value.length = 0
        categories.value.length = 0
        let view = ["V_Prod_StockInfo","V_Prod_StockMoveInfo","V_ProdInfo"];
        for (let index = 0; index < view.length; index++) {
            await xppcx(view[index],val)      
            .then(function (response) {
                console.log(`视图 ${view[index]}: `,response.data);
                if(response.data.length == 0) {return} // console.log(response.data.length); 
                if (index == 0){
                    mapView1.value.push(...response.data)
                    console.log("mapView1数组：",mapView1.value);         
                }
                else if(index == 1){
                    mapView2.value.push(...response.data.map(item => ({ ...item, quantity: numeral(item.quantity ).format('0,0')})))  //numeral(mapView1[0].stock_quantity).format('0,0') + 1
                    response.data.forEach((item,index) => 
                    { 
                        const date = item.sys_date_yymmdd.split('-').slice(0, 2).join('-'); // 提取年月部分
                        const quantity = item.quantity * (item.出入库类型.includes("入库") ? 1 : -1);
                        console.log(`index:${index}, date:${date} , quantity:${quantity}`);
                        let i = categories.value.findIndex((a)=>a.date == date)
                        // console.log("i:",i);
                        if (i==-1){
                            categories.value.push({date,quantity})
                        } else {
                            console.log("quantity:",`${categories.value[i].quantity} + ${quantity} = ${categories.value[i].quantity + quantity}`);
                            categories.value[i].quantity += quantity 
                        }
                        // if (acc[date] !== undefined) {
                        //     // 如果日期月份已存在，累加或减去 quantity
                        //     acc[date] += quantity;
                        // } else {
                        //     // 如果日期月份不存在，创建新的键值对
                        //     acc[date] = quantity;
                        //     console.log("acc",acc);
                        // }
                        
                        // return acc;
                    },)
                    
                    
                    console.log("mapView数组2：",mapView2.value,"graphView数组：",categories.value);
                }
                else {
                    mapView3.value.push(...response.data)
                    console.log("mapView数组3：",mapView3.value)
                }
                input.value=""
            })
            .catch(function (error) {
                console.log(error);
                toast(error.message)
            });
        
        
        
        }
        inputFocus()
    }
    
    
    watch(input,(newValue, oldValue)=>{
        if(newValue ==''){
            console.log("newValue为空");
            return
        }
        console.log(newValue);
        // toast(` 扫码成功：${newValue}`)
        mysqlaxi(newValue)
    })
</script>

<style scoped>
    .container{
        position: relative;
        width: 356px;
        display: flex;
        
        flex-direction: column;
        /* @apply flex flex-col;   */
    }
    .searchBox{
        position: fixed;
        top: 0;
        width: 355px;
        background-color: #fff;
        height: 50px;
        display:flex;
        justify-content: left;
        align-items: center;     
        margin-left: 5px;
        z-index: 100;
        /* border-bottom: 3px solid #b9a3a3; */
        /* @apply w-full h-10 bg-gray-100; */
    }
   
    camera
    .tableHeader{
        height: 300px;
        flex:1;
        margin-top: 10px;
        @apply flex flex-col flex-auto;
        /* @apply flex-;  */
    }

    .briefTab{
        display: flex;
        justify-content: left;
        align-items: center;
        width: 350px;
        height: 35px;
        margin-left: 5px;
        margin-bottom: 5px;
        /* background-color: #ecf0f3; */
        border-radius: 7px;
        box-shadow: -3px -3px 7px #ffffff,
                      3px 3px 5px #ceced1;
        /* opacity: 60%; */
        border:1px solid #e6e8ec;
        font: 100%/1.5 "Segoe UI", "Helvetica Neue", Helvetica, Arial, sans-serif;
        padding: 0 10px;
    }
    .tabTitle{
        font-size: 16px;
        font-weight: 500;
        color: #31344b;
    }
    .tabValue{
        font-size: 16px;
        font-weight: 400;
        color: #44476a;
    }
    
    
    
    
    .categories{
       display: flex; 
       justify-content: space-between; 
       width: 350px; 
       margin-top: 6px; 
       margin-left: 5px; 
    }
    .category{
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 32%;
        height: 35px;
        border-radius: 7px;
        /* margin-right: 6px; */
        box-shadow: -3px -3px 5px #ffffff,
                      3px 3px 5px #ceced1;
        font-size: 13px;
        font-weight: 500;
        color: #31344b;
    }

    .categoryTitle{
        flex:1;
        display: flex;
        justify-content: center;
        height: 100%; 
        font-size: 13px; 
        background-color: #ecf0f3;
        color:#31344b
    }
    
    .categoryNumber{
        flex:2;
        margin-left:10px; 
        font-weight: 500; 
        margin-left: 6px;
        color:#77777a;
    }

    .tableBody{
        width: 350px;
        margin-left: 5px;
        margin-top: 10px;
        /* @apply flex flex-row flex-auto flex-shrink; */
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }


</style>