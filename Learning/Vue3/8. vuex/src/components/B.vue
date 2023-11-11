<script setup>
  import { ref,computed } from 'vue'
  import { useStore } from 'vuex';
  const store = useStore()
  const count = computed(()=>store.state.count)
  store.commit('increment')
</script>

<template>
  <b>B组件</b><br>
  {{ count }}

</template>

<style scoped>
 
</style>
