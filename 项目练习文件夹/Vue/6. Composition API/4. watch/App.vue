<template>
  <HelloWorld />
</template>

<script>
/* ***************************************************************************************************
 *  watch 函数
 *      概念：定义监视属性
 *      引用：import {watch} from 'vue'
 *      语法：
 *        1. 监视 ref 定义响应式              
 *          watch(sum,(newValue,oldValue)=>{},{immediate:true})
 * 
 *        2. 监视多 ref 定义响应式
 *          watch([sum,msg],(newValue,oldValue)=>{},{immediate:true})
 * 
 *        3. 监视 reactive 定义响应式    
 *           // oldValue = newValue 此处应属于问题
 *           // 系统强制开启深层，deep 配置不能来关闭
 *          watch( person,(newValue,oldValue)=>{},{immediate:true,deep:false} )
 *        
 *        4. 监视 reactive 定义某属性
 *          watch( ()=>person.job,(newValue,oldValue)=>{},{immediate:true,deep:false} )
 *        
 *        5. 监视 reactive 定义某些属性
 *          watch( [()=>a.x,()=>a.y],(newValue,oldValue)=>{},{immediate:true,deep:false} )
 * ***************************************************************************************************/
 import  HelloWorld from './components/HelloWorld.vue'
 export default {
    name: 'App',
    components:{HelloWorld},
    setup() {
      return{

      
      }
    
    }
  }

</script>













































<style>

</style>