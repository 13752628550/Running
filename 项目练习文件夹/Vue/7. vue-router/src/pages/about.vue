<template>
  <div>
    <button @click="query"> query </button>
    <button @click="params">params</button>
    <div>
      <router-view> </router-view>
    </div>
  </div>
</template>
<script>
  import { useRouter } from 'vue-router'
  export default {
    name:'about',
    setup(){
      const router = useRouter()
      const query = ()=>{
        router.push({
          path:"/about/query",
          query:{
            key:"abcdefgh",
            name:"zhang",
            age:"89"
          }
        
        })   
      }
      const params =()=>{
        router.push({
          name:'params',
          params:{
            id:89,
            val:'params',
            str:"parstr"
          }
        })
      }
      return{query,params}
    }
  }
</script>













































<style scoped>
  button{
    margin: 33px;
  }
</style>