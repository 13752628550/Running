<template>
  <h2>当前求和为：{{sum}}</h2>
  <button @click="sum++">点我+1</button>
  <hr>
  <h2>当前信息展示：{{msg}}</h2>
  <button @click="msg+='!'">修改信息</button>
  <hr>
  <h2>姓名：{{person.name}}</h2>
  <h2>年龄：{{person.age}}</h2>
  <button @click="person.name+='~'">修改姓名</button>
  <button @click="person.age+=1">修改年龄</button>
</template>
  
<script>
  import {ref,reactive,watch} from 'vue'
  export default {
    name: 'HelloWorld',
    setup(){
      let sum = ref(0)
      let msg = ref('你好')
      let person = reactive({
        name:'张三',
        age:89
      
      })
      watch([sum,msg],(newValue,oldValue)=>{
        console.log('sum 发生变化了',newValue,oldValue);
        },{
          immediate:true,            // 初始就执行测试
      })
      watch(person,(newValue,oldValue)=>{
        console.log('person 发生变化了',newValue,oldValue);
      },{
          immediate:true,            // 响应式对象
      })
      watch(()=>person.age,(newValue,oldValue)=>{
        console.log('person 发生变化了',newValue,oldValue);
      },{
          immediate:true,            // 监测某个属性
      })

      
      return({
        sum,msg,person
      })
    }
  };
</script>




































<!-- Add "scoped" attribute to limit CSS to this component only -->

 <style scoped>

</style>