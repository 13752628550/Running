<template>
  <div class="Camera">
    <!-- canvas 用于展示视频流与识别到的二维码位置 -->
    <canvas id='canvas' @click="startScan">
    </canvas>
    <!-- 中间的扫描框 -->
    <!-- <div class="box">
      <div class="line"></div>
      <div class="angle"></div>
    </div> -->
    <!-- 开始识别按钮 -->
    <!-- <div> -->
      <!-- <button @click="startScan" class="strButton">开始扫描</button> -->
    <!-- </div> -->
  </div>
</template>

<script setup>
  import { ref } from 'vue' 
  import jsQR from 'jsqr'
  const emit = defineEmits(['getQRC']);
  // if (origin.indexOf('https') === -1) throw '请在 https 环境中调用摄像头。'
  // 获取当前屏幕可用的宽高，用于设置全屏扫描
  const windowWidth =  300 // document.documentElement.clientWidth
  const windowHeight = 300 // document.documentElement.clientHeight
  const rtnCode =ref('')
  console.log(windowWidth,windowHeight);
  function startScan (){ 
    // alert(`props.RNumber is ${props.RNumber}` )
    // 获取页面上的 canvas 组件，用上面获取的宽高来设置 canvas 为全屏，并且创建出 画布
    const canvas = document.getElementById('canvas')
    canvas.width = windowWidth
    canvas.height = windowHeight
    // console.log(canvas);
     // 创建画布
    const canvas2d = canvas.getContext('2d')
    // console.log(canvas2d); 
    // 创建一个 video 标签,并且设置 video 的尺寸为全屏，用于接收摄像头的数据
    const video = document.createElement('video')
    video.width = windowWidth
    video.height = windowHeight
    // 设置 video 标签不显示进度条
    video.setAttribute('playsinline', 'true')
    video.setAttribute('webkit-playsinline', 'true')
    // 设置调用摄像头的参数
    // 调用摄像头时的分辨率，摄像头的分辨率是以横屏计算的，
    // 所以要把屏幕的高度当作视频宽度，屏幕的宽度当作视频高度度，
    // 这样就可以获取到一个和手机物理分辨率一样的视频尺寸。这里是可以传递比分辨率高的数字，只要尺寸的比例是一样即可
    const width = windowHeight
    const height = windowWidth
    const videoParam = {
      audio: false,
      video: {
        facingMode:  {exact: 'environment'},
        // {  /** 使用后置摄像头：facingMode: {exact: 'environment'}  */
        //    /** 使用前置摄像头：facingMode: "user"}                 
        width,  // 刚刚设置的宽度
        height  // 刚刚设置的高度
      }
    } 
    // 调用摄像头。此 api 是一个 promise
    navigator.mediaDevices.getUserMedia(videoParam)
    .then(stream => {
      // 回调中回返回 stream 获取到的视频流数据
      // 把视频流数据给到 video 中
      video.srcObject = stream
      // 播放 video
      video.play()
      // 调用下面写的解析函数
      tick()
      // // 关闭摄像头
      // const tracks = stream.getTracks();
      // tracks.forEach(track => track.stop());
    })
    .catch(function (err) {
      console.log(err.name + ": " + err.message);
    })        

    // 解析函数,用于截取视频每一帧来解析二维码
    function tick() {
      // 判断video中是否加载好视频流数据，只有加载好后才解析
      if (video.readyState === video.HAVE_ENOUGH_DATA) {
        // 把视频的每一帧截取画到刚刚创建的画布上
        canvas2d.drawImage(video, 0, 0, windowWidth, windowHeight)
        // 通过 canvas画布 获取到当前每一帧的 图片对象 数据
        const imageData = canvas2d.getImageData(0, 0, windowWidth, windowHeight)
        // 把 图片对象 数据交给 jsQR 这个库进行解析
        const codeRes = jsQR(imageData.data, imageData.width, imageData.height, {
          inversionAttempts: 'dontInvert'
        })
        // 判断是否获取到二维码数据
        if (codeRes && codeRes.data) {
          // codeRes.data 中就是二维码中的数据了
          // console.log(codeRes.data)
          let codNum = codeRes.data
          // alert(codNum )
          emit('getQRC',codNum)
          // alert(codeRes.data) // props.RNumber
          // alert(`props.RNumber is ${props.RNumber}` ) // props.RNumber
          // 关闭摄像头
          const tracks = this.stream.getTracks();
          tracks.forEach(track => track.stop());
        }
      }
      // 每当这个函数执行完后，马上就执行这个函数
      // requestAnimationFrame 这个方法可以百度一下
      requestAnimationFrame(tick)
    }  
  }
  defineExpose({ startScan,rtnCode })
</script>
<style scoped>
.Camera{
  width: 300px;
  height: 300px;
  margin: 10px ;
  background-color: black;
}
/* 在这里可以添加样式 */
  #canvas{
    display:flex;
    justify-content: center;
    align-items: center;
    width: 300px;
    height: 300px;
    /* border: 3px; */
    /* border-color: grap; */
  }
  .strButton{
    background: skyblue;
    color: white;
    border-color: aquamarine;
  }
</style>