/*
 *
 *    ┏┓　　　┏┓
 *  ┏┛┻━━━┛┻┓
 *  ┃　　　　　　　┃
 *  ┃　　　━　　　┃
 *  ┃　＞　　　＜　┃
 *  ┃　　　　　　　┃
 *  ┃...　⌒　...　┃
 *  ┃　　　　　　　┃
 *  ┗━┓　　　┏━┛
 *      ┃　　　┃
 *      ┃　　　┃
 *      ┃　　　┃
 *      ┃　　　┃  神兽保佑
 *      ┃　　　┃  代码无bug
 *      ┃　　　┃
 *      ┃　　　┗━━━┓
 *      ┃　　　　　　　┣┓
 *      ┃　　　　　　　┏┛
 *      ┗┓┓┏━┳┓┏┛
 *        ┃┫┫　┃┫┫
 *        ┗┻┛　┗┻┛
 * @Author: 木木
 * @LastEditors: 木木
 * @Date: 2022-06-02 09:46:06
 * @LastEditTime: 2022-06-02 10:41:42
 * @Description:调用摄像头识别二维码
 */

/**
 * @description: 初始化
 * @param {*} options {
 *  使用后置还是前置摄像头
 *  exact: 'environment' | 'user'
 *  获取摄像头视频像素 false 正常， true高清
 *  definition: boolean
 *  是否持续监听
 *  continue: boolean
 *  成功事件
 *  onSuccess: ():string => {}
 * }
 * @param {*} onSuccess ():string=>{} 成功事件
 * @return {*} MumuQrcode
 */
function MumuQrcode(options = {}, onSuccess) {
  if (origin.indexOf('https') === -1) throw '请在 https 环境中调用摄像头。'

  this.exact = options.exact || 'environment'
  this.definition = options.definition || false
  this.continue = options.continue || false
  this.onSuccess = onSuccess || null

  this.__init()

  return this
}

MumuQrcode.prototype.__init = function () {
  var js = document.createElement('script')
  js.type = 'text/javascript'
  js.src = './mumu-qrcode/jsQR.js'
  document.body.append(js)
  js.addEventListener('load', () => {
    this.start()
  })
}
MumuQrcode.prototype.start = function () {
  this.windowWidth = document.documentElement.clientWidth || document.body.clientWidth
  this.windowHeight = document.documentElement.clientHeight || document.body.clientHeight

  this.video = null
  this.canvas = null
  this.canvas2d = null

  /** 闪光灯相关 */
  this.stream = null
  this.track = null
  this.isUseTrack = false
  this.trackStatus = false

  this.video = document.createElement('video')
  this.video.setAttribute('playsinline', 'true')
  this.video.setAttribute('webkit-playsinline', 'true')
  this.video.width = this.windowWidth
  this.video.height = this.windowHeight
  this.canvas = document.createElement('canvas')
  this.canvas.width = this.windowWidth
  this.canvas.height = this.windowHeight
  this.canvas2d = this.canvas.getContext('2d')

  const mumuQrcode = document.getElementById('mumuQrcode')
  this.mumuQrcode = mumuQrcode
  mumuQrcode.style =
    'position: absolute; top: 0;left: 0;  background-color: #333;width:' +
    this.windowWidth +
    'px;height:' +
    this.windowHeight +
    'px'
  mumuQrcode.append(this.canvas)
  mumuQrcode.append(this.video)

  const box = document.createElement('div')
  box.className = 'box'
  const line = document.createElement('div')
  line.className = 'line'
  const angle = document.createElement('div')
  angle.className = 'angle'
  box.append(line)
  box.append(angle)
  mumuQrcode.append(box)

  /** 闪关灯操作 */
  const box2 = document.createElement('div')
  box2.className = 'box2'
  box2.innerText = '打开闪光灯'
  this.box2Dom = box2
  box2.addEventListener('click', () => {
    if (this.trackStatus) {
      box2.innerText = '打开闪光灯'
    } else {
      box2.innerText = '关闭闪光灯'
    }
    this.trackStatus = !this.trackStatus
    this.openTrack()
  })

  this.addStyle()
  this.openScan()
}

MumuQrcode.prototype.openScan = function () {
  var width = this.transtion(this.windowHeight)
  var height = this.transtion(this.windowWidth)
  var videoParam = {
    audio: false,
    video: {
      facingMode: { exact: this.exact },
      width,
      height
    }
  }

  navigator.mediaDevices
    .getUserMedia(videoParam)
    .then((stream) => {
      this.video.srcObject = stream
      this.video.play()
      this.tick()

      this.stream = stream
      this.track = stream.getVideoTracks()[0]
      setTimeout(() => {
        const t = this.track.getCapabilities()
        this.isUseTorch = t.torch || null
        if (this.isUseTorch) return this.mumuQrcode.append(this.box2Dom)
      }, 500)
    })
    .catch((error) => {
      console.log('设备不支持,请检查是否允许摄像头权限', error)
      throw error
    })
}

MumuQrcode.prototype.tick = function () {
  if (this.video.readyState === this.video.HAVE_ENOUGH_DATA) {
    this.canvas2d.drawImage(this.video, 0, 0, this.windowWidth, this.windowHeight)
    const imageData = this.canvas2d.getImageData(0, 0, this.windowWidth, this.windowHeight)
    const codeRes = jsQR(imageData.data, imageData.width, imageData.height, {
      inversionAttempts: 'dontInvert'
    })

    if (codeRes) {
      this.drawLine(codeRes.location.topLeftCorner, codeRes.location.topRightCorner, '#FF3B58')
      this.drawLine(codeRes.location.topRightCorner, codeRes.location.bottomRightCorner, '#FF3B58')
      this.drawLine(
        codeRes.location.bottomRightCorner,
        codeRes.location.bottomLeftCorner,
        '#FF3B58'
      )
      this.drawLine(codeRes.location.bottomLeftCorner, codeRes.location.topLeftCorner, '#FF3B58')
      if (codeRes.data) {
        this.getData(codeRes.data)
      }
    }
  }
  requestAnimationFrame(this.tick.bind(this))
}

MumuQrcode.prototype.drawLine = function (begin, end, color) {
  this.canvas2d.beginPath()
  this.canvas2d.moveTo(begin.x, begin.y)
  this.canvas2d.lineTo(end.x, end.y)
  this.canvas2d.lineWidth = 4
  this.canvas2d.strokeStyle = color
  this.canvas2d.stroke()
}

MumuQrcode.prototype.getData = function (code) {
  this.onSuccess && this.onSuccess(code)
  if (this.continue) return
  if (!this.stream) return
  this.stream.getTracks().forEach((track) => {
    track.stop()
  })
}

MumuQrcode.prototype.openTrack = function () {
  if (!this.stream) return
  const ww = {
    advanced: [{ torch: this.trackStatus }]
  }
  this.track.applyConstraints(ww)
}

MumuQrcode.prototype.transtion = function (number) {
  return this.definition ? number * 1.6 : number
}

MumuQrcode.prototype.addStyle = function () {
  const style = document.createElement('style')
  style.innerHTML = `
  .box {
    width: 4rem;
    height: 4rem;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    overflow: hidden;
    border: 0.1rem solid rgba(0, 255, 51, 0.2);
    z-index: 10;
  }

  .box .line {
    height: calc(100% - 2px);
    width: 100%;
    background: linear-gradient(180deg, rgba(0, 255, 51, 0) 43%, #00ff33 211%);
    border-bottom: 3px solid #00ff33;
    transform: translateY(-100%);
    animation: radar-beam 2s infinite alternate;
    animation-timing-function: cubic-bezier(0.53, 0, 0.43, 0.99);
    animation-delay: 1.4s;
  }

  .box:after,
  .box:before,
  .angle:after,
  .angle:before {
    content: '';
    display: block;
    position: absolute;
    width: 0.2rem;
    height: 0.2rem;
    z-index: 12;
    border: 0.1rem solid transparent;
  }

  .box:after,
  .box:before {
    top: 0;
    border-top-color: #00ff33;
  }

  .angle:after,
  .angle:before {
    bottom: 0;
    border-bottom-color: #00ff33;
  }

  .box:before,
  .angle:before {
    left: 0;
    border-left-color: #00ff33;
  }

  .box:after,
  .angle:after {
    right: 0;
    border-right-color: #00ff33;
  }

  @keyframes radar-beam {
    0% {
      transform: translateY(-100%);
    }
  
    100% {
      transform: translateY(0);
    }
  }

  .box2 {
    width: 2rem;
    height: 1rem;
    position: absolute;
    left: 50%;
    bottom: 1.2rem;
    transform: translate(-50%);
    z-index: 20;
    font-size: 0.28rem;
    display: flex;
    align-items: center;
    justify-content: center;
    color: aliceblue;
    background-color: rgba(000, 000, 000, 0.35);
  }
  `

  document.body.append(style)
}
