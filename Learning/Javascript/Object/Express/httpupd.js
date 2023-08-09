const http = require('http');
const server = http.createServer();
server.on('request', (req, res) => {
    const url = req.url;
    let content = "<h1>404 Not found<h1>";
    if (url === '/' || url === '/index.html') {
        content = "<h1>首页<h1>";
    } else if (url === '/about') {
        content = "<h1>关于页面<h1>";
    }
    res.setHeader("content-type", "text/html; charset=utf-8");
    res.end(content);
})
server.listen(80, () => {
    console.log('Server running at http://127.0.0.1')









































































})