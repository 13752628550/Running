const btns = document.querySelectorAll('button');
axios.defaults.method = 'get';
axios.defaults.baseURL = 'http://localhost:3000';
axios.defaults.params = { id: 111 };
axios.defaults.timeout = 3000;
btns[0].onclick = () => {
    axios({
        method: 'get',
        url: '/posts'
    }).then((response) => {
        console.log(response);
    });
};













































































