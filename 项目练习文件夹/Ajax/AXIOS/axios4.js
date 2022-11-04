const btns = document.querySelectorAll('button');
btns[0].onclick = () => {
    axios.interceptors.request.use((config) => {
        console.log('请求拦截器 成功 - 1号');
        return config;
    }), (error) => {
        console.log('请求拦截器 失败 - 1号');
        return Promise.reject(error);
    }
    axios.interceptors.request.use((config) => {
        console.log('请求拦截器 成功 - 2号');
        return config;
    }), (error) => {
        console.log('请求拦截器 失败 - 2号');
        return Promise.reject(error);
    }
    axios.interceptors.response.use((response) => {
        console.log('响应拦截器 成功 - 1号');
        return response;
    }), (error) => {
        console.log('响应拦截器 失败 - 1号');
        return Promise.reject(error);
    }

    axios.interceptors.response.use((response) => {
        console.log('响应拦截器 成功 -2号');
        return response;
    }), (error) => {
        console.log('响应拦截器 失败 -2号');
        return Promise.reject(error);
    }

    axios({
        method: 'get',
        url: 'http://localhost:3000/posts'
    }).then((response) => {
        console.log(response);

    })
}
















































