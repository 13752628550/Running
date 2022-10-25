const http = require('http');
const server = http.createServer();
server.on('request', (req, res) => {
    const url = req.url;
    const method = req.method;
    const str = `Your request url is ${url}, and request method is ${method};`
    console.log(str);
    res.end(str);
})
server.listen(80, () => {
    console.log('server running at http://127.0.0.1');
})