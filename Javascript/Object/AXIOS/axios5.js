const btns = document.querySelectorAll('button');
let cancel = null;
btns[0].onclick = () => {
    axios({
        method: 'get',
        url: 'http://localhost:3000/posts',
        cancelToken: new axios.CancelToken((c) => {
            cancel = c;
        })
    }).then((response) => {
        console.log(response);
    })
}
btns[1].onclick = () => {
    cancel();
}








































































