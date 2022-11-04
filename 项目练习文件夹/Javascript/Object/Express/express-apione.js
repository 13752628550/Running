const express = require('express');
const app = express();
const cors = require('cors');
app.get('/api/json', (req, res) => {
    const funcName = req.query.callback;                                // 客户端回调函数
    const data = { name: 'zhangsan', age: '22', gender: '男' }          // 发送给用户相关数据
    const scriptStr = `${funcName}(${JSON, stringify(data)})`           // 来拼接出函数字符串
    res.send(scriptStr)                                                 // 相应给用户标签数据
})
app.use(cors());
const router = require('./apiRouter');
app.use(express.urlencoded({ extended: false }));
app.use('/api', router);
app.listen(80, () => {
    console.log('Express server running at http://127.0.0.1');
})