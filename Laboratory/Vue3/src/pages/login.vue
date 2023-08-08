<template>
  <div>login</div>
  <router-link to="/login/props1">props对象方式</router-link>
  <router-link to="/login/props2/89/props/prostr">props布尔方式</router-link>
  <router-link to="/login/props3/89/props/prostr">props函数方式</router-link>
  <router-view></router-view>
</template>
<script>
import { onBeforeRouteLeave, onBeforeRouteUpdate } from 'vue-router';

  export default {
    setup(){
      onBeforeRouteUpdate((to,from,next)=>{
        console.log("onbeforeoruteupdate",to);
        next()
      })
      onBeforeRouteLeave((to,from,next)=>{
        console.log("onbeforerouteleave",to);
        next()
      })
    }
  }
</script>































































<style scoped>
  *{margin: 33px;}
</style>