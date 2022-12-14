const express = require('express');
const app = express();
const mw1 = (req, res, next) => {
    console.log('当前执行了第一个局部生效中间件');
    next();
}
const mw2 = (req, res, next) => {
    console.log('执行了局部生效中间件');
    next();
}
app.get('/', mw1, mw2, (req, res) => {
    res.send('Home page.');
})
app.get('/user', (req, res) => {
    res.send('User page.');
})
app.listen(8000, () => {
    console.log('http://127.0.0.1');
})