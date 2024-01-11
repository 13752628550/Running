<template>
	<view>
		<mumu-get-qrcode @success='qrcodeSucess' exact='user'></mumu-get-qrcode>
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

			}
		},
		methods: {
			qrcodeSucess(data) {
				uni.showModal({
					title: '成功',
					content: data,
					success: () => {
						uni.navigateBack({})
					}
				})
			},
		}
	}
</script>

<style>

</style>
