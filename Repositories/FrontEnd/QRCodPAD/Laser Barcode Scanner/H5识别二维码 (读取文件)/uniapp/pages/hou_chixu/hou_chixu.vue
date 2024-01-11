<template>
	<view>
		<mumu-get-qrcode @success="qrcodeSucess" @error="qrcodeError" :continue="true"></mumu-get-qrcode>
		<view class="msg">
			<scroll-view scroll-y="true" style="height: 30vh;" :scroll-top="scrollTop">
				<view>
					<view v-for="(item, i) in data" :key="i">
						<view>序号：{{ i }}</view>
						<view>数据：{{ item }}</view>
					</view>
				</view>
			</scroll-view>
		</view>
	</view>
</template>

<script>
import mumuGetQrcode from '@/uni_modules/mumu-getQrcode/components/mumu-getQrcode/mumu-getQrcode.vue'
export default {
	components: {
		mumuGetQrcode
	},
	data() {
		return {
			data: [],
			scrollTop: 200
		}
	},
	methods: {
		qrcodeSucess(data) {
			this.scrollTop += this.scrollTop
			this.data.push(data)
		},
		qrcodeError(err) {
			console.log(err)
			uni.showModal({
				title: '摄像头授权失败',
				content: '摄像头授权失败，请检测当前浏览器是否有摄像头权限。',
				success: () => {
					uni.navigateBack({})
				}
			})
		}
	}
}
</script>

<style lang="scss" scoped>
.msg {
	position: fixed;
	bottom: 20rpx;
	left: 00rpx;
	color: #ffffff;
	font-size: 24rpx;
	background-color: rgba(#2c3e50, 0.4);
	z-index: 9999;
}
</style>
