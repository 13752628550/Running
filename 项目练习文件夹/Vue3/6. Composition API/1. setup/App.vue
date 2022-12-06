<template>
  <h1>information</h1>
  <h2>姓名:{{name}}</h2>
  <h2>年龄:{{age}}</h2>
  <button @click = "sayHello">发信息</button>
</template>

<script>
/* ***********************************************************************************
 *  setup
 *      概念：Vue3.0 新语法 值为一个函数，setup 是所有 Composition API (组合API) 配置口
 *      语法：export default{
 *                      setup(props,context){ 
 *                        ...          // 定义属性方法
 *                        return{}     // 定义属性方法返回
 *                      }
 *            }                                           
 *      
 *      语法糖：<script setup>      
 *      
 *      两种返回值：
 *          1.对象：    则对象中属性、方法，在模板中均可直接使用
 *          2.渲染函数：能够自定义渲染函数，此方法了解就行，日常不会经常用
 * 
 * ***********************************************************************************/
  
  
 export default {
    name: 'App',
    setup() {
      
      //数据
      let name = '张三'
      let age = 18
      
      //方法
      function sayHello(){
        console.log(`我叫${name}，我${age}岁了，你好啊！`);
      }

      
      
      
      
      return{
        name,
        age,
        sayHello
      
      }
    }
  }


</script>































<style>

</style>