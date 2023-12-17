<script setup>
  import xppMainFrm from '~/pages/xppMainFrm.vue'
</script>
<template>
  <div class="container">
    <router-view></router-view>
    <!-- <xppMainFrm msg="PBASS 扩展应用程序" /> -->
  </div>
 
</template>

<style scoped>
 .container {
    width: 1000px;
    @apply flex-col;
  }
  
</style>
