<template>
  <div>
    about
    <router-link to="/about/news" class="operation">news</router-link>
    <router-link to=" {
                        path:'/about/message',
                        query:{ key:'abcdefghi' }
                    } " 
    class="operation"> message </router-link>
    <div>
      <router-view> </router-view>
    </div>
  </div>
</template>

<script>
  export default {
  }
</script>

<style scoped>
  .operation{
    padding: 33px;
  
  }
</style>
