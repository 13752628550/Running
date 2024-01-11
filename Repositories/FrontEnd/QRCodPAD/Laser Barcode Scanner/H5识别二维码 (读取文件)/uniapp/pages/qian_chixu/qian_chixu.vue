<template>
		<view>
			<mumu-get-qrcode @success='qrcodeSucess' :continue='true' exact='user'></mumu-get-qrcode>
			<view class="msg">
				<scroll-view scroll-y="true" style="height: 30vh;" :scroll-top='scrollTop'>
					<view>
						<view v-for="(item,i) in data" :key='i'>
							<view>序号：{{i}}</view>
							<view>数据：{{item}}</view>
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
		}
	}
</script>

<style lang="scss" scoped>
	.msg {
		position: fixed;
		bottom: 20rpx;
		left: 00rpx;
		color: #FFFFFF;
		font-size: 24rpx;
		background-color: rgba(#2C3E50, 0.4);
		z-index: 9999;
	}
</style>
