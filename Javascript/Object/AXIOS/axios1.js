console.log(axios);
const btns = document.querySelectorAll('button');
btns[0].onclick = () => {
    // 发送 AJAX 请求
    axios({
        method: 'get',                                   // 请求类型
        url: 'http://localhost:3000/posts',              // 请求 URL
    }).then((response) => {                              // 返回信息
        console.log(response);
    });
}
btns[1].onclick = () => {
    // 发送 AJAX 请求
    axios({
        method: 'POST',                                   // 请求类型
        url: 'http://localhost:3000/posts',               // 请求 URL 添加新文章
        data: {                                           // 设置请求体 
            title: "今天天气好了，还挺风和日丽的",
            author: "张三",
        }
    }).then((response) => {                               // 请求返回信息
        console.log(response);
    });

}
btns[2].onclick = () => {                                 // 更新数据
    // 发送 AJAX 请求
    axios({
        method: 'put',                                   // 请求类型
        url: 'http://localhost:3000/posts/3',            // 请求 URL 添加新文章   
        data: {                                          // 设置请求体  
            title: "今天天气好了，还挺风和日丽的",
            author: "李六",
        }
    }).then((response) => {                               // 请求返回信息
        console.log(response);
    });
}




btns[3].onclick = () => {                                   // 删除数据
    // 发送 AJAX 请求
    axios({
        method: 'delete',                                   // 请求类型
        url: 'http://localhost:3000/posts/7',               // 请求 URL 添加新文章  
    }).then((response) => {                                 // 请求返回信息
        console.log(response);
    });
}






































































