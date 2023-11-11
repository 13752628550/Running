import { createStore } from 'vuex'
const store = createStore({
    state() {
        return {
            count: 0,
            name: '张三',
            age: 73,
        }
    },
    mutations: {
        increment(state) {
            state.count++
        }
    }
})

export default store

