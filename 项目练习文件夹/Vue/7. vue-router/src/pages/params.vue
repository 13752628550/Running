<template>
    <div>
        <ul>
           <li>{{route.params.id}}</li>
           <li>{{route.params.val}}</li>
           <li>{{route.params.str}}</li>
        </ul>
    </div>
</template>
<script>
    import { useRoute } from 'vue-router'
    import { ref } from 'vue'
    export default{
        name:'params',
        setup(){
            const route = useRoute()
            ref(route)
        return { route }
        }
    }
    
    
    
    
    
    
    
    
    
    



</script>





















































<style scoped>
    li{ list-style: none; }
</style>