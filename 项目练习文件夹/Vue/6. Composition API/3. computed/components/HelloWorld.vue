<template>
  <h1>information</h1>
  姓：<input type="text" v-model ="person.firstName">
  <br>
  名：<input type="text" v-model="person.lastName">
  <br>
  全名：<input type="text" v-model="person.fullName">
</template>
  
<script>
  import {reactive,computed} from 'vue'
  export default {
    name: 'HelloWorld',
    setup(){
      const person = reactive({
        firstName:'张',
        lastName:'三'
      })
      person.fullName = computed({
        get(){ return person.firstName + '-' + person.lastName },
        set(value){
          const nameArr = value.split('-')
          person.firstName = nameArr[0]
          
          person.lastName = nameArr[1]
        }
      })
      
      function btnClick(){
        console.log(fullName);
      }
      
      return({
        person
      })
    }
  };

</script>













































<!-- Add "scoped" attribute to limit CSS to this component only -->

<style scoped>

</style>