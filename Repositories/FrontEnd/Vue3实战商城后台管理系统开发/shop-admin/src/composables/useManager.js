import { ref, reactive } from 'vue'
import { logout, updatepassword } from "~/api/manager"
import { showModal, toast } from "~/composables/util"
import { useRouter } from "vue-router"
import { useStore } from "vuex"

export function useRepassword() {
    const router = useRouter()
    const store = useStore()
    // 定义子组件接收变量
    const formDrawerRef = ref(null)
    const form = reactive({
        oldpassword: "",
        password: "",
        repassword: ""
    })

    // 定义验证规则 
    const rules = {
        oldpassword: [
            {
                required: true,                 // 必填项
                message: '旧密码不能为空',       // 提示
                trigger: 'blur'                 // 规则触发条件
            },
        ],
        password: [
            {
                required: true,                    // 必填项
                message: '新密码不能为空',            // 提示
                trigger: 'blur'                    // 规则触发条件
            },
        ],
        repassword: [
            {
                required: true,                    // 必填项
                message: '确认密码不能为空',            // 提示
                trigger: 'blur'                    // 规则触发条件
            },
        ]
    }

    const formRef = ref(null)                       // 用于点击登录按钮时验证规则

    // 定义提交按钮事件
    const onSubmit = () => {
        formRef.value.validate((valid, fields) => {
            if (!valid) {
                return false
            }
            formDrawerRef.value.showLoading()                    // 加载时 loading
            updatepassword(form)
                .then(res => {
                    toast("修改密码成功，请重新登录")
                    store.dispatch("logout")
                    router.push("/login")
                })
                .finally(() => {
                    formDrawerRef.value.hideLoading()
                })
        })
    }
    const openRepasswordForm = () => formDrawerRef.value.open()

    return {
        formDrawerRef,
        form,
        rules,
        formRef,
        onSubmit,
        openRepasswordForm
    }
}
export function useLogout() {
    const router = useRouter()
    const store = useStore()
    // 退出登录按钮事件 
    function handleLogout() {
        showModal("是否要退出登录").then((res) => {
            logout().finally(() => {
                // 清除用户状态及 cookie
                store.dispatch("logout")
                // 跳转回登录页
                router.push("/login")
                // 提示退出登录成功
                toast("退出登录成功")
            })
        }).catch()
    }
    return {
        handleLogout
    }



}