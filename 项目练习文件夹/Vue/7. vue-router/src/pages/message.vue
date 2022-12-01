<template>
    <div>
        <ul>
            <li>
                <a href="">message1</a>
            </li>
            <li>
                <a href="">message2</a>
            </li>
            <li>
                <a href="">message3</a>
            </li>
        </ul>
    </div>
</template>
<script>
    export default{
        name:'message',
        mounted(){
            console.log(this)
        },
    }
</script>

<style scoped>
    li{
        list-style: none;
    
    }



</style>