<template>
    <div class="A">
        ComponA 
        <div class="B">
            <B msg="A -> B STR"></B>
        </div>
    </div>
</template>
<script setup>
    import B from './B.vue'
</script>

<style scoped>
    .A{
        background: fuchsia;
    }
    .B{
        background-color: hotpink;
        
    }
</style>