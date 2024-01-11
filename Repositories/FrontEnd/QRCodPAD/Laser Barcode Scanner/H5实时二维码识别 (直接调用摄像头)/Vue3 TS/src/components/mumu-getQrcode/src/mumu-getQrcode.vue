<!--
 * 
 * 　　┏┓　　　┏┓+ +
 * 　┏┛┻━━━┛┻┓ + +
 * 　┃　　　　　　　┃ 　
 * 　┃　　　━　　　┃ ++ + + +
 *  ████━████ ┃+
 * 　┃　　　　　　　┃ +
 * 　┃　　　┻　　　┃
 * 　┃　　　　　　　┃ + +
 * 　┗━┓　　　┏━┛
 * 　　　┃　　　┃　　　　　　　　　　　
 * 　　　┃　　　┃ + + + +
 * 　　　┃　　　┃
 * 　　　┃　　　┃ +  神兽保佑
 * 　　　┃　　　┃    代码无bug　　
 * 　　　┃　　　┃　　+　　　　　　　　　
 * 　　　┃　 　　┗━━━┓ + +
 * 　　　┃ 　　　　　　　┣┓
 * 　　　┃ 　　　　　　　┏┛
 * 　　　┗┓┓┏━┳┓┏┛ + + + +
 * 　　　　┃┫┫　┃┫┫
 * 　　　　┗┻┛　┗┻┛+ + + +
 * 
 * @Author: 木木
 * @LastEditors: 木木
 * @Date: 2022-06-01 16:03:45
 * @LastEditTime: 2022-06-01 17:22:58
 * @Description: 木木 网页中调用摄像头
-->
<template>
  <div class="getQrcode" :style="{ width: windowWidth + 'px', height: windowHeight + 'px' }">
    <div class="box">
      <div class="line"></div>
      <div class="angle"></div>
    </div>

    <div class="box2" v-if="isUseTorch">
      <div class="track" @click="openTrack">
        {{ trackStatus ? '关闭闪光灯' : '打开闪光灯' }}
      </div>
    </div>

    <canvas ref="canvasRef"></canvas>
  </div>
</template>

<script setup lang="ts">
import { nextTick, ref } from 'vue'
import jsQr from 'jsqr'

const emit = defineEmits(['success'])
interface IProps {
  /** 使用后置还是前置摄像头 */
  exact?: 'environment' | 'user'
  /** 获取摄像头视频像素 false 正常， true高清 */
  definition?: boolean
  /** 是否持续监听 */
  continue?: boolean
}
const props = withDefaults(defineProps<IProps>(), {
  exact: 'environment',
  definition: false,
  continue: false
})

if (origin.indexOf('https') === -1) throw '请在 https 环境中调用摄像头。'

const canvasRef = ref<HTMLCanvasElement>()
const windowWidth = document.documentElement.clientWidth || document.body.clientWidth
const windowHeight = document.documentElement.clientHeight || document.body.clientHeight
let video: HTMLVideoElement,
  canvas2d: CanvasRenderingContext2D,
  stream: MediaStream,
  track: MediaStreamTrack,
  isUseTorch = ref(false)

const trackStatus = ref(false)

nextTick(() => {
  video = document.createElement('video')
  video.setAttribute('playsinline', 'true')
  video.setAttribute('webkit-playsinline', 'true')
  video.width = windowWidth
  video.height = windowHeight

  canvasRef.value!.width = windowWidth
  canvasRef.value!.height = windowHeight
  canvas2d = canvasRef.value!.getContext('2d')!
  openScan()
})

async function openScan() {
  const width = transtion(windowHeight)
  const height = transtion(windowWidth)
  const videoParam = {
    audio: false,
    video: {
      facingMode: { exact: props.exact },
      width,
      height
    }
  }

  try {
    stream = await navigator.mediaDevices.getUserMedia(videoParam)
    video.srcObject = stream
    video.play()
    tick()

    track = stream.getVideoTracks()[0]
    setTimeout(() => {
      const t: any = track.getCapabilities()
      isUseTorch.value = t.torch || null
    }, 500)
  } catch (error) {
    console.log('设备不支持,请检查是否允许摄像头权限', error)
    throw error
  }
}

function tick() {
  if (video.readyState === video.HAVE_ENOUGH_DATA) {
    canvas2d.drawImage(video, 0, 0, windowWidth, windowHeight)
    const imageData = canvas2d.getImageData(0, 0, windowWidth, windowHeight)

    const codeRes = jsQr(imageData.data, imageData.width, imageData.height, {
      inversionAttempts: 'dontInvert'
    })

    if (codeRes) {
      drawLine(codeRes.location.topLeftCorner, codeRes.location.topRightCorner, '#FF3B58')
      drawLine(codeRes.location.topRightCorner, codeRes.location.bottomRightCorner, '#FF3B58')
      drawLine(codeRes.location.bottomRightCorner, codeRes.location.bottomLeftCorner, '#FF3B58')
      drawLine(codeRes.location.bottomLeftCorner, codeRes.location.topLeftCorner, '#FF3B58')
      if (codeRes.data) {
        getData(codeRes.data)
      }
    }
  }
  requestAnimationFrame(tick)
}

interface Point {
  x: number
  y: number
}
function drawLine(begin: Point, end: Point, color: string) {
  canvas2d.beginPath()
  canvas2d.moveTo(begin.x, begin.y)
  canvas2d.lineTo(end.x, end.y)
  canvas2d.lineWidth = 4
  canvas2d.strokeStyle = color
  canvas2d.stroke()
}

function getData(data: string) {
  emit('success', data)
  if (!props.continue) return closeCamera()
}

function closeCamera() {
  if (stream) {
    stream.getTracks().forEach((track) => {
      track.stop()
    })
  }
}

function transtion(number: number) {
  return props.definition ? number * 1.6 : number
}

const openTrack = () => {
  trackStatus.value = !trackStatus.value
  const ww: any = {
    advanced: [{ torch: trackStatus.value }]
  }
  track.applyConstraints(ww)
}
</script>

<style scoped lang="scss">
.getQrcode {
  position: relative;
  height: 100vh;
  background-color: #333;

  .box {
    width: 400px;
    height: 400px;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    overflow: hidden;
    border: 0.1rem solid rgba(0, 255, 51, 0.2);
    z-index: 10;

    .line {
      height: calc(100% - 2px);
      width: 100%;
      background: linear-gradient(180deg, rgba(0, 255, 51, 0) 43%, #00ff33 211%);
      border-bottom: 3px solid #00ff33;
      transform: translateY(-100%);
      animation: radar-beam 2s infinite alternate;
      animation-timing-function: cubic-bezier(0.53, 0, 0.43, 0.99);
      animation-delay: 1.4s;
    }

    &:after,
    &:before,
    .angle:after,
    .angle:before {
      content: '';
      display: block;
      position: absolute;
      width: 20px;
      height: 20px;
      z-index: 12;
      border: 10px solid transparent;
    }

    &:after,
    &:before {
      top: 0;
      border-top-color: #00ff33;
    }

    .angle:after,
    .angle:before {
      bottom: 0;
      border-bottom-color: #00ff33;
    }

    &:before,
    .angle:before {
      left: 0;
      border-left-color: #00ff33;
    }

    &:after,
    .angle:after {
      right: 0;
      border-right-color: #00ff33;
    }
  }

  .box2 {
    width: 300px;
    height: 200px;
    position: absolute;
    left: 50%;
    bottom: 50px;
    transform: translate(-50%, -50%);
    z-index: 20;

    .track {
      z-index: 20;
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
  }
}

@keyframes radar-beam {
  0% {
    transform: translateY(-100%);
  }

  100% {
    transform: translateY(0);
  }
}
</style>
