<template>
    <div class="mainform">
        <div class="fullScreen" @click="toggle">
            <el-icon style="font-size: 30px;"><FullScreen /></el-icon>  
        </div>
        <div class="maintitle">主菜单</div>
        <div class="buttonGroup">
            <!-- 现品票查询 -->
            <div class="buttonCombo" @click="handleButtonCombo">
                <div class="picGroup">
                    <el-icon><Checked /></el-icon>
                </div>
                <span class="buttonCaption">
                    现品票查询
                </span>
            </div>
            <!-- 开发中1 -->
            <div class="buttonCombo">
                <div class="picGroup"> 
                    <el-icon><Histogram /></el-icon>
                </div>
                <span class="buttonCaption">
                    开发中
                </span>
            </div>
            <div class="buttonCombo">
                <div class="picGroup"> 
                    <el-icon><Histogram /></el-icon>
                </div>
                <div class="buttonCaption">
                    开发中
                </div>
            </div>
            <div class="buttonCombo">
                <div class="picGroup"> 
                    <el-icon><Histogram /></el-icon>
                </div>
                <div class="buttonCaption">
                    开发中
                </div>
            </div>
        </div>
        
        <div class="maintitle">浏览器</div>
        
        <div class="buttonGroup">
            <div class="buttonCombo" @click="openWebsite">
                <div class="picGroup"> 
                    <el-icon><ChromeFilled /></el-icon>
                </div>
                <div class="buttonCaption">
                    证书
                </div>
            </div>
            
            <div class="buttonCombo" @click="openSetsite">
                <div class="picGroup"> 
                    <el-icon><Setting /></el-icon>
                </div>
                <div class="buttonCaption">
                    调试
                </div>
            </div>
        </div>    
        
        
        <div class="maintitle">关于和帮助</div>
        <div class="buttonGroup">
            <div class="buttonCombo" @click="about">
                <div class="picGroup"> 
                    <el-icon><Grid /></el-icon>
                </div>
                <div class="buttonCaption">
                    关于
                </div>
           </div>
            <div class="buttonCombo">
                <div class="picGroup"> 
                    <el-icon><QuestionFilled /></el-icon>
                </div>
                <div class="buttonCaption">
                    帮助
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
    import { FullScreen, Aim } from '@element-plus/icons-vue'; // import { Camera, HomeFilled } from '@element-plus/icons-vue'
    import { useRouter } from 'vue-router' 
    import { useFullscreen } from '@vueuse/core'   // 引入全屏组件 vueuse
    const { isFullscreen, toggle } = useFullscreen()
    const router = useRouter()
    function handleButtonCombo(){router.push("/xpp/")}
    function about(){router.push("/about/" )}
    function openWebsite() {
      // 设置当前页面的 URL 为新的网站地址
      window.location.href = "https://172.26.32.179:3000/login"; // https://172.26.32.179:3000/xppcx?sqlView=V_Prod_StockInfo&RNumber=R 16A766
    }
    function openSetsite() {
      // 设置当前页面的 URL 为新的网站地址
      window.open("chrome://flags/");
    }
</script>
<style scoped>
    .mainform{
        width: 100vw;
        height: 100vh;
        background-color: #535050;
        display: flex;
        flex-direction: column;
        justify-content:flex-start;
        align-items: center;
        /* opacity: 73%; */
    }

    .fullScreen{
        width: 60px;
        height: 60px;
        color: #fff;
        background-color: #777777;
        margin-top: 10px;
        margin-right: 335px;
        display:flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .maintitle{
        width: 395px;
        font: 16px "microsoft yahei" ;
        color: #fff;
        padding: 15px 6px 0px;
    }

    .buttonGroup{
        width: 400px;
        display:flex;
        justify-content: flex-start;
        align-items: flex-start;
        flex-wrap: wrap ;
    }

    .buttonCombo{
        width: 111px;
        height: 111px;
        background-color: #777777;
        margin: 5px 5px;
        display:flex;
        flex-direction: column;
        justify-content:center;
        align-items: center;
    }

    .picGroup{
        width: 50px;
        height: 50px;
        margin: 5px 10px;
        font-size: 50px;
        color: #fff;
        /* opacity:0 */
    }
    .buttonCaption{
        font: 13px "microsoft yahei";
        color: #fff;
        margin-top: 5px;
    }
    .fullScreen:active{
        opacity: 30%;
    }
    .buttonCombo:active {
        opacity: 30%;
    }

</style>