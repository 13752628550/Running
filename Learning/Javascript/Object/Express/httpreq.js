
const http = require('http');
const server = http.createServer();
server.on('request', (req, res) => {
    console.log(`Someone visit our web server.req.url: ${req.url} req.method:${req.method}`);
})
server.listen(8080, () => {
    console.log('server running at http://127.0.0.1:8080');
})