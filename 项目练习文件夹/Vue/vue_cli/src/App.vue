<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <HelloWorld msg="Welcome to Your Vue.js App"/>
  <AppTODOLis></AppTODOLis>
</template>
<script>
import HelloWorld from './components/HelloWorld.vue'
import AppTODOLis from './components/AppTODOLis.vue'
export default {
  name: 'App',
  components: {
    HelloWorld,
    AppTODOLis
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  
  color: #2c3e50;
  margin-top: 60px;
}
</style>
