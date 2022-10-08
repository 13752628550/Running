const http = require('http');
const server = http.createServer();
server.on('request', (req, res) => {
    const str = `您请求 URL 地址为 ${req.url}, 您请求 method 类型为 ${req.method}`
    res.setHeader('Content-type', 'text/html; charset=utf-8')
    res.end(str);
})
server.listen(80, () => {
    console.log('server is running at http://127.0.0.1');
})    
