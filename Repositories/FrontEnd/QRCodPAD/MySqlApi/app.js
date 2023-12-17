const express = require('express');
const mysql = require('mysql2/promise'); // 使用带有 promises 的 mysql2

const app = express();
const port = 3000;

// MySQL 数据库配置
const dbConfig = {
    host: '172.26.32.135',
    user: 'root',
    password: 'mysql@linux',
    database: 'PBASS',
};

// API 端点以查询数据库
app.get('/api/data/:number', async (req, res) => {
    try {
        // 从 URL 提取数字参数
        const number = 'R 810010  D' // req.params.number;

        // 创建 MySQL 连接池
        const connection = await mysql.createConnection(dbConfig);

        // 使用提供的数字执行简单查询
        const [results, fields] = await connection.execute('SELECT * FROM V_Prod_StockInfo WHERE item_no = ?', [number]);

        // 关闭 MySQL 连接
        await connection.end();

        // 将查询结果作为 JSON 响应发送
        res.json({ success: true, data: results });
    } catch (error) {
        console.error('执行 MySQL 查询时出错：', error);
        res.status(500).json({ success: false, error: '内部服务器错误' });
    }
});

// 启动服务器
app.listen(port, () => {
    console.log(`服务器正在监听端口 ${port}`);
});