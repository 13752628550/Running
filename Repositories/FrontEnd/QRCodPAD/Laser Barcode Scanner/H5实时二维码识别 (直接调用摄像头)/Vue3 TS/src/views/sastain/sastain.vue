<!--
 * @Author: 木木
 * @LastEditors: 木木
 * @Date: 2022-06-01 17:36:26
 * @LastEditTime: 2022-06-01 17:37:37
 * @Description: 持续监听
-->
<template>
  <div>
    <MumuGetQrcode @success="success" continue />
  </div>
</template>

<script setup lang="ts">
import MumuGetQrcode from '@/components/mumu-getQrcode'

const success = (data: string) => {
  console.log(data)
}
</script>

<style scoped lang="scss"></style>
