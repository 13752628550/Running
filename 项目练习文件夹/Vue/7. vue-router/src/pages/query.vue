<template>
    <div> 
        <ul>
            <li> {{msgval1}} </li>
            <li> {{msgval2}} </li>
            <li> {{msgval3}} </li>
        </ul>
    </div>   
</template>
<script>
    import { useRoute } from 'vue-router'
    import { ref } from 'vue'
    export default{
        name:'query',
        setup(){
            const route = useRoute()
            let msgval1 = ref(route.query.age)
            let msgval2 = ref(route.query.key)
            let msgval3 = ref(route.query.name)
            return{
                msgval1,msgval2,msgval3
            }
        }}

</script>
<style scoped>
    li{
        list-style: none;
    }



</style>