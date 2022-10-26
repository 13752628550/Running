const express = require('express');
const app = express();
const jwt = require('jsonwebtoken');
const expressJWT = require('express-jwt');
const cors = require('cors');
app.use(cors());
const bodyParser = require('body-parser');
const secretKey = 'itheima No1 ^_^';
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