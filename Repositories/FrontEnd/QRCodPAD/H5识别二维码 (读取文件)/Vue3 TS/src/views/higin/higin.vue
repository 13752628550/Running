<!--
 * @Author: 木木
 * @LastEditors: 木木
 * @Date: 2022-06-01 17:38:18
 * @LastEditTime: 2022-06-02 09:15:01
 * @Description: 高清识别
-->
<template>
  <div class="one">
    <MumuGetQrcode @success="success" definition />
    <div class="mask" v-if="code">
      {{ code }} <br />
      <button @click="back">返回</button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import MumuGetQrcode from '@/components/mumu-getQrcode'

const router = useRouter()
const code = ref('')
const success = (data: string) => {
  code.value = data
}
const back = () => {
  router.back()
}
</script>

<style scoped lang="scss">
.one {
  background-color: #333;
}

.mask {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 500px;
  height: 320px;
  background-color: aliceblue;
  z-index: 999;

  button {
    width: 100%;
    margin-top: 10px;
  }
}
</style>
