<template>
  <div class="container">
    <div class="top"></div>
    <div class = msgbox>
      <div class="left">
        <router-link active-class="active" to="/">index</router-link>
        <router-link active-class="active" to="/login">login</router-link>
        <router-link active-class="active" to="/about">about</router-link>
      </div>
      <div class="bottom">
        <router-view ></router-view>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    name: 'App',
    components: {
    }
  }
</script>
<style>
  
  *{
    padding: 0;
    margin: 0;
    list-style: none;
  }
  .container{
    display:flex;
    flex-direction: column;
  }
  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    /* margin-top: 60px; */
  }
  
  
  .msgbox{
    display: flex;
    flex-direction: row;
  }
  
  .left{
    display: flex;
    flex-direction: column;
    padding: 10px;
    height: 100vh;
    width: 300px;
    background-color: gainsboro;
    font-size: 33px;
  }
  a{
    text-decoration: none
  }
  /* .left button:hover{
    background-color: aliceblue;
  } */
  .active{
    background-color:hotpink;
    color: aliceblue;
  }
  .top{
    height: 100px;
    width: 100%;
    background-color: grey;
  }
  

















</style>