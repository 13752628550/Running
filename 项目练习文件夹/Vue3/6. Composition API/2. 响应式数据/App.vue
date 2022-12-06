<template>
  <h1>information</h1>
  <h2>姓名:{{name}}</h2>
  <h2>年龄:{{age}}</h2>
  <h3>工作种类：{{job.type}}</h3>
  <h3>工作薪水：{{job.salary}}</h3>
  <button @click = "changeInfo">修改人员信息</button>
</template>

<script>
/* ***********************************************************************************
 *  定义响应式数据
 *
 *   1. ref() 函数
 *      概念：定义响应式数据
 *      引用：import {ref} from 'vue'
 *      语法：const xxx = ref(initValue)         // 响应式数据
 *            xxx.value                         // js 中操作数据             
 *            <div>{{xxx}}</div>                // 模板中操作数据
 *            
 *            const xxx = ref({ aaa:'abc' })    // 响应式对象            
 *            xxx.value.aaa                     // js 中操作对象
 *            <div>{{xxx.aaa}}</div>            // 模板中操作对象
 *      
 *    2. reactive() 函数    
 *       概念：定义响应式对象(数组)
 *       引用：import {reactive} from 'vue'   
 *       语法：const xxx = reactive({ aaa:'abc' })   // 响应式对象      
 *             xxx.aaa                              // js 中操作对象      
 *             <div>{{xxx.aaa}}</div>               // 模板中操作对象        
 * ***********************************************************************************/
  
 import {ref,reactive} from 'vue' 
 export default {
    name: 'App',
    setup() {
      
      //数据
      let name = ref('张三')
      let age = ref(18)
      
      
      let job = reactive({
        type:'前端工程师',
        salary:'30k'
      })

      
      
      //方法
      function changeInfo(){
        name.value ='赵六'
        age.value ='65'
        job.type = 'UI设计师'
        job.salary = '60k'
      }

      return{
        name,
        age,
        job,
        changeInfo
      }
    
    }
  }


</script>

















<style>

</style>