<template>
		<div class="canvasBox">
				<div class="box">
					<div class="line"></div>
					<div class="angle"></div>
				</div>
			<!-- 	<div class="msg">
					{{outputData}}
				</div> -->
		
		</div>

</template>


<script>
	import jsQR from './jsQR.js'

	export default {
		data() {
			return {
				video: undefined,

				canvas2d: undefined,
				outputData: '未发现码',
				canvasWidth: 320,
				canvasHeight: 480,

				c: undefined,
			}
		},
		mounted() {
			this.$nextTick(() => {
				this.video = document.createElement('video')
				this.c = document.createElement('canvas')
				this.c.id = 'c'
				this.c.width = this.canvasWidth
				this.c.height = this.canvasHeight
				this.c.style.width = '100%'
				document.querySelector('.canvasBox').append(this.c)
				this.openScan()
			})
		},
		destroyed() {
			this.closeCamera()
		},
		methods: {
			openScan() {
				const videoParam = { audio: false, video: { facingMode: { exact: "environment" } } }
				navigator.mediaDevices.getUserMedia(videoParam).then((stream) => {
					this.video.srcObject = stream
					this.video.setAttribute('playsinline', true)
					this.video.play()
					requestAnimationFrame(this.tick)
				}).catch((err) => {
					console.log('设备不支持', err);
				})
			},

			closeCamera() {
				if (this.video.srcObject) {
					this.video.srcObject.getTracks().forEach(function(track) {
						track.stop()
					})
				}
			},
			tick() {
				if (this.video.readyState === this.video.HAVE_ENOUGH_DATA) {
					this.canvasHeight = this.video.videoHeight
					this.canvasWidth = this.video.videoWidth
					this.c.width = this.canvasWidth
					this.c.height = this.canvasHeight
					this.canvas2d == undefined && (this.canvas2d = this.c.getContext('2d'))

					this.canvas2d.drawImage(this.video, 0, 0, this.canvasWidth, this.canvasHeight)

					const imageData = this.canvas2d.getImageData(0, 0, this.canvasWidth, this.canvasHeight)

					const code = jsQR(imageData.data, imageData.width, imageData.height, {
						inversionAttempts: 'dontInvert'
					})

					if (code) {
						this.drawLine(code.location.topLeftCorner, code.location.topRightCorner, '#FF3B58')
						this.drawLine(code.location.topRightCorner, code.location.bottomRightCorner, '#FF3B58')
						this.drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, '#FF3B58')
						this.drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, '#FF3B58')
						this.outputData = code.data
					} else {
						this.outputData = undefined
					}
				}
				requestAnimationFrame(this.tick)
			},
			drawLine(begin, end, color) {
				this.canvas2d.beginPath()
				this.canvas2d.moveTo(begin.x, begin.y)
				this.canvas2d.lineTo(end.x, end.y)
				this.canvas2d.lineWidth = 4
				this.canvas2d.strokeStyle = color
				this.canvas2d.stroke()
			}
		}
	}
</script>

<style scoped>
	page {
		background-color: #333333;
	}
	
	.canvasBox {
		width: 100vw;
		position: relative;
		
		
		background-image:
			linear-gradient(0deg,
				transparent 24%,
				rgba(32, 255, 77, 0.1) 25%,
				rgba(32, 255, 77, 0.1) 26%,
				transparent 27%,
				transparent 74%,
				rgba(32, 255, 77, 0.1) 75%,
				rgba(32, 255, 77, 0.1) 76%,
				transparent 77%,
				transparent),
			linear-gradient(90deg,
				transparent 24%,
				rgba(32, 255, 77, 0.1) 25%,
				rgba(32, 255, 77, 0.1) 26%,
				transparent 27%,
				transparent 74%,
				rgba(32, 255, 77, 0.1) 75%,
				rgba(32, 255, 77, 0.1) 76%,
				transparent 77%,
				transparent);
		background-size: 3rem 3rem;
		background-position: -1rem -1rem;
		z-index: 10;
		background-color: #1110;
	}



	 .box {
		width: 191px;
		height: 191px;
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		overflow: hidden;
		border: 0.1rem solid rgba(0, 255, 51, 0.2);
		z-index: 11;
	}


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

	.box:after,
	.box:before,
	 .angle:after,
	 .angle:before {
		content: '';
		display: block;
		position: absolute;
		width: 3vw;
		height: 3vw;
		z-index: 12;
		border: 0.2rem solid transparent;
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
	
	.msg {
		text-align: center;
		padding: 20rpx 0;
	}
</style>
