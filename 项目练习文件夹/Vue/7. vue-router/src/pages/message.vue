<template>
    <div>
        <ul>
            <li>
                <a href="">{{msgval1}}</a>
            </li>
            <li>
                <a href="">{{msgval2}}</a>
            </li>
            <li>
                <a href="">{{msgval3}}</a>
            </li>
        </ul>
    </div>
</template>
<script>
    import { useRoute } from 'vue-router'
    import{ ref } from 'vue'
    export default{
        name:'message',
        // mounted(){
        //     console.log(this)
        // },
       
        setup(){
            const route = useRoute()
            console.log(route.query.age)
            let msgval1 = ref(route.query.age)
            let msgval2 = ref(route.query.key)
            let msgval3 = ref(route.query.name)
            return{
                msgval1,
                msgval2,
                msgval3
            }
        }
    }
</script>
















































<style scoped>
    li{
        list-style: none;
    }
</style>