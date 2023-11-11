<script setup>
  import {computed} from 'vue' 
  import {useStore,mapState} from 'vuex';  
  const store = useStore()
  /************************************************
   *                state 数据访问方法
   ************************************************/
    
  // 方式一：computed 常规写法 
    const count=computed(()=> store.state.count )
    const name =computed(()=>store.state.name)
    const age = computed(()=>store.state.age)
  
   

  // 方式二：mapState 对象写法
    //  computed:mapState(['count'])
    

  
    // 方式三：mapState 数组写法
    // computed:mapState(['count','name','age'])
  
  // *   const count = computed( ()=>store.state.count )
  // * 
  // *  mapState() 
  // *   作用：多状态获取
  // *   computed: mapState([]) 或 computed: mapState({})
  // * *****************************************************/ 
    
    // const storeArr = mapState(["count","name","age"])
    // console.log(storeArr.name)

  /************* mutations 对象访问方法 **********************
  *  方式一: store.commit('increment')
  *   store.commit('increment')
  * 
  *  方式二：mapGetters()
  * *********************************************************/
    function btnclick(){
      store.commit('increment')
      
      console.log(store.state.count);
    }
</script>
<template>
  <b>A组件</b><br>
  <button @click="btnclick">增加</button> <br>
  count: {{ count }} <br>
  name: {{ name }} <br>
  age: {{ age }} <br>
  {{ count }}



</template>









<style scoped>
  





</style>






















