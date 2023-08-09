<template>
    <div>
        <ul>
            <li>{{a}}</li>
            <li>{{id}}</li>
            <li>{{$route.params.val}}</li>
            <li>{{$route.params.str}}</li>
        </ul>
    </div>
</template>
<script>
    import { ref } from 'vue'
    export default{
        name:'params',
        props:['a','id'],
    }
    
    
    
    
    
    
    
    
    
    






</script>





















































<style scoped>
    li{ list-style: none; }
</style>