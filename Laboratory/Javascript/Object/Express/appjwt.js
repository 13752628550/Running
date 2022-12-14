const express = require('express');
const app = express();
const jwt = require('jsonwebtoken');
const expressJWT = require('express-jwt');
const cors = require('cors');
app.use(cors());
const bodyParser = require('body-parser');
const secretKey = 'itheima No1 ^_^';
app.use(expressJWT({ secret: secretKey }).unless({ path: [/^\/api\//] }));
api.post('/api/login', (req, res) => {
    const userinfo = req.body;
    if (userinfo.username !== 'admin' || userinfo.password !== '000000') {
        return res.send({
            status: 400,
            message: '登录失败'
        })
    }
    const tokenStr = jwt.sign({ username: userinfo.username }, secretKey, { expiresIn: '30s' })
    res.send({
        status: 200,
        message: '登录成功！',
        token: tokenStr,
    })

})
app.get('admin/getinfo', (req, res) => {
    console.log(req.user);
    res.send({
        status: 200,
        message: '获取用户信息成功！',
        data: req.user,
    })
})

app.use((err, req, res, next) => {
    if (err.message === 'UnauthorizedError') {
        return res.send({
            status: 401,
            message: '无效的token',
        })
    }

    res.send({
        status: 500,
        message: '未知的错误'
    })

})

app.listen(8888, () => {




































    console.log('Server running at http://127.0.0.1:8888/api/login');

})