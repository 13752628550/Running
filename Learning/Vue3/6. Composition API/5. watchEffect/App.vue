<template>
  <HelloWorld />
</template>

<script>
/* ***************************************************************************************************
 *  watchEffect 函数
 *      概念：定义监视属性
 *      区别：
 *        1. watch: 既要指名监视属性，也要指名监视回调
 *        2. watchEffect: 不指监视属性，监视回调中用属性，那就监视哪个属性
 *        3. 和 computer 函数区别为，computer 关心计算出来数值，在函数中必写返回值 return 
 *      
 *      引用：import {watchEffect} from 'vue'
 *      语法：watchEffect( ()=>{ ... } )
 *        
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