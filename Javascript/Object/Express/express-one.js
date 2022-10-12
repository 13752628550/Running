const express = require('express');
const app = express();
app.get('/user', (req, res) => {
    res.send({ name: 'za', age: 89, gender: '男' });
    console.log(req.query)
})
app.post('/user', (req, res) => {
    console.log(req.query.name);
    res.send('数据请求成功');
})
app.get('/',
    (req, res) => {
        console.log(req.query);
        res.send(req.query.name);
    })
app.get('/user/:ids/:username',
    (req, res) => {
        console.log(req.params);
        res.send(req.params.ids);
    })
app.listen(80, () => {
    console.log('express server running');
})