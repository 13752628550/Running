const http = require('http');
const fs = require('fs');
const path = require('path');
const server = http.createServer();
server.on('request', (req, res) => {
    const url = req.url;
    let fpath = ""
    if (url === '/') {
        fpath = path.join(__dirname, '/cssvariables/index-finished.html');
    } else {
        fpath = path.join(__dirname, './cssvariables', url)
    }
    console.log(fpath);
    fs.readFile(fpath, 'utf-8', (err, datastr) => {
        if (err) return res.end("404 Not found")
        res.end(datastr);
    });
    res.setHeader("content-type", "text/html; charset=utf-8");







});
server.listen(80, () => {
    console.log('Server running at http://127.0.0.1');




























































})







