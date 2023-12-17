const express = require('express');
const app = express();
const cors = require('cors');
app.use(cors());
const mysql = require('mysql');
const fs = require('fs');
// const https = require('https');
const db = mysql.createConnection({
    host: '172.26.32.135',
    user: 'root',
    password: 'mysql@linux',
    database: 'PBASS',
    port: 3306,
    protocol: 'mysql'
});
db.connect();
app.get('/xppcx', (req, res) => {
    const sqlView = req.query.sqlView
    const sqlRNumber = req.query.RNumber;
    if (sqlView == undefined || sqlRNumber == undefined) {
        res.send("Please enter the sqlView and RNumber")
        return;
    }

    console.log(sqlView, sqlRNumber);
    const query1 = "SELECT * FROM " + sqlView + " WHERE item_no = " + "'" + sqlRNumber + "'"
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
    // const sqlView = "V_Prod_StockInfo"
    // const sqlRNumber = "R 810010  D";
    // if (sqlView == undefined || sqlRNumber == undefined) {
    res.send("Please enter the sqlView and RNumber")
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
const privateKey = fs.readFileSync('./cert/new_server.key');
const certificate = fs.readFileSync('./cert/server.crt');
// https.createServer({
//     key: privateKey,
//     cert: certificate,
// }, app)
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${3000}`);
});