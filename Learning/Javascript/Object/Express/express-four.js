const express = require('express');
const app = express();
app.use((req, rec, next) => {
    const time = Date.now();
    req.startTime = time;                 // 给 req 对象，挂载自定义属性，从而把时间共享给后面所有路由
    next();
});
app.get('/', (req, res) => {
    res.send('Home page.' + req.startTime);
});
app.get('/user', (req, res) => {
    res.send('User page.' + req.startTime);
});
app.listen(8000, () => {
    console.log('http://127.0.0.1');
}); 