const express = require('express');
const app = express();
const cors = require('cors');
const https = require('https');
const mysql = require('mysql');
const fs = require('fs');
const db = mysql.createConnection({
    host: '172.26.32.135',
    user: 'root',
    password: 'mysql@linux',
    database: 'PBASS',
    port: 3306,
    protocol: 'mysql'
});
app.use(cors());
db.connect();
app.get('/xppcx', (req, res) => {
    const sqlView = req.query.sqlView
    const sqlRNumber = req.query.RNumber;
    let query1 = "";
    if (sqlView == undefined || sqlRNumber == undefined) {
        res.send("Please enter the sqlView and RNumber")
        return;
    }

    console.log(`[时间]：${new Date().toLocaleString()}   [视图]：${sqlView}  [R番号]：${sqlRNumber}`);

    if (sqlView == "V_Prod_StockMoveInfo") {
        query1 = "SELECT * FROM " + sqlView + " WHERE item_no = " + "'" + sqlRNumber + "'" + "ORDER BY sys_date_yymmdd DESC"
    } else {
        query1 = "SELECT * FROM " + sqlView + " WHERE item_no = " + "'" + sqlRNumber + "'"
    }
    const results = db.query(query1, (err, result) => {
        if (err) {
            res.send(err.message)
            return;
        } else {
            res.send(result);
        }
    });
})
app.get('/login', (req, res) => {
    res.send("<b>证书更新成功了，请按后退键继续操作！</b> </br> <a href='https://172.26.32.179:5173'> 返回主页面</a>")
    // const sqlView = "V_Prod_StockInfo"
    // const sqlRNumber = "R 810010  D";
    // if (sqlView == undefined || sqlRNumber == undefined) {
    //     return;
    // }
    // console.log(sqlView, sqlRNumber);
    // const query1 = "SELECT * FROM " + sqlView + " WHERE item_no = " + "'" + sqlRNumber + "'"
    // const results = db.query(query1, (err, result) => {
    //     if (err) {
    //         res.send(err.message)
    //         return;
    //     } else {
    //         res.send(result);
    //     }
    // });
})
const port = 3000;
// const privateKey = fs.readFileSync('./cert/new_server.key');
// const certificate = fs.readFileSync('./cert/server.crt');
// https.createServer({
//     key: privateKey,
//     cert: certificate,
// }, app).listen(port, () => {
//     console.log(`Example app listening at https://localhost:${3000}`);
// });
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${3000}`);
});