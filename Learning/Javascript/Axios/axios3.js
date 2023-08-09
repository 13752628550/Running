const btns = document.querySelectorAll('button');
const instancf = axios.create({
    baseURL: 'http://localhost:3000',
    timeout: 3000
});
console.log(instancf);
btns[0].onclick = () => {
    instancf({
        url: '/posts',
        method: 'get'
    }).then((response) => {
        console.log(response);
    });


};








































































