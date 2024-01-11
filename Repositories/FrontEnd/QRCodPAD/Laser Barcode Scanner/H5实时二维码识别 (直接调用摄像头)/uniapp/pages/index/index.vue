<template>
	<view class="content">
		<view class="title">后置摄像头</view>
		<view class="btnBox">
			<view @click="navigateTo('hou_one')" class="no1" hover-class="active">
				<image src="../../static/shao02.svg" mode="widthFix"></image>
				<text>监听一次</text>
			</view>
			<view  @click="navigateTo('hou_chixu')"class="no2" hover-class="active">
				<image src="../../static/shao.svg" mode="widthFix"></image>
				<text>持续监听</text>
			</view>
			<view  @click="navigateTo('hou_balf')"class="no2" hover-class="active">
				<image src="../../static/shao03.svg" mode="widthFix"></image>
				<text>半屏扫码</text>
			</view>
			<view  @click="navigateTo('hou_definition')"class="no2" hover-class="active">
				<image src="../../static/shao04.svg" mode="widthFix"></image>
				<text>高清识别</text>
			</view>
		</view>
		<view class="title">前置摄像头</view>
		<view class="btnBox">
			<view  @click="navigateTo('qian_one')" class="no1" hover-class="active">
				<image src="../../static/qian.svg" mode="widthFix"></image>
				<text>监听一次</text>
			</view>
			<view  @click="navigateTo('qian_chixu')" class="no2" hover-class="active">
				<image src="../../static/qian02.svg" mode="widthFix"></image>
				<text>持续监听</text>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {

			}
		},
		onLoad() {

		},
		methods: {
			navigateTo(url) {
				setTimeout(()=>{
					uni.navigateTo({
						url: `/pages/${url}/${url}`
					})
				},300)
			}
		}
	}
</script>

<style scoped lang="scss">
	page {
		background-color: #6a6a6a;
	}
	
	.title {
		color: #FFFFFF;
		padding: 15rpx 15rpx 5rpx;
		font-size: 28rpx;
	}
	.btnBox {
		display: flex;
		padding: 5rpx;

		>view {
			color: #fff;
			width: 170rpx;
			height: 170rpx;
			font-size: 26rpx;
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			background-color: #777777;
			margin: 8rpx;
				border: 1px solid #777777;
			image {
				margin-bottom: 12rpx;
				width: 60rpx;
			}
		}
		
		>view.active {
			border: 1px solid #C0C0C0;
			background-color: #868686;
		}
	}
	

</style>
