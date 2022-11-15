<template>
  <div>
    <img alt="Vue logo" src="./assets/logo.png" />
    <HelloWorld msg="Welcome to Your Vue.js App"> </HelloWorld>
    <AppTODOLis> </AppTODOLis>
    <el-row class="mb-4">
      <el-button @click="handlebutclick">Default</el-button>
      <el-button type="primary">Primary</el-button>
      <el-button type="success">Success</el-button>
      <el-button type="info">Info</el-button>
      <el-button type="warning">Warning</el-button>
      <el-button type="danger">Danger</el-button>
      <el-button plain>Plain</el-button>
    </el-row>
  </div>
</template>
<script>
import HelloWorld from "./components/HelloWorld.vue";
import AppTODOLis from "./components/AppTODOLis.vue";

export default {
  name: "App",
  components: {
    HelloWorld,
    AppTODOLis,
  },
  methods: {
    handlebutclick() {
      alert("handlebutclick");
    },
  },
};
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
