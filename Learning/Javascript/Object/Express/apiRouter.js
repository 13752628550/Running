const express = require('express');
const Router = express.Router();
Router.get('/get', (req, res) => {
    const query = req.query
    res.send({
        status: 0,
        msg: 'GET 请求成功!',
        data: query
    })
})
Router.post('/post', (req, res) => {
    const body = req.body;
    res.send({
        status: 0,
        msg: 'POST请求成功!',
        data: body
    })
})



module.exports = Router;

