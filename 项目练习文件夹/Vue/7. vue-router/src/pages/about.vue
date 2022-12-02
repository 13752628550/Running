<template>
  <div>
    <router-link to="/about/news" class="operation">news</router-link>
    <button @click="btnClick" active-class="active">message</button>
    <div>
      <router-view> </router-view>
    </div>
    about
    <!-- <router-link @click="btnClick"  class="operation"> message </router-link> -->
  </div>
</template>
<script>
  import { useRouter } from 'vue-router'
  export default {
    name:'about',
    setup(){
      const router = useRouter()
      const btnClick = ()=>{
        router.push({
          name:"message",
          query:{
            key:"abcdefgh",
            name:"zhang",
            
            age:"89"
          }
        })   
      }
      return{btnClick}
    }
  }

</script>



















































<style scoped>
  .operation{
    padding: 33px;
  }
</style>