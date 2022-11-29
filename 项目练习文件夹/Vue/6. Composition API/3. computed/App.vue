<template>
  <HelloWorld />
</template>

<script>
/* ***********************************************************************************
 *  computed 函数
 *      概念：定义计算属性
 *      引用：import {computed} from 'vue'
 *      语法：let fullName = computed({
 *              get(){ return ... }
 *              set(value){ ... }
 *            })
 *      简写：let fullName = computed( ()={ return ... } )
 *     
 * ***********************************************************************************/
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