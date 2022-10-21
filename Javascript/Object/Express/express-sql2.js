const mysql = require('mysql');
const user = { username: "Spider-Man", password: "pcc321" };                          // 插入数
const db = mysql.createPool({
    host: '172.26.32.223',
    user: 'root',
    password: 'mysql.sys',
    database: 'm_db_01',
    port: 3306,
    protocol: 'mysql',
});
const sqlstr = 'insert into users(username,password,status) values(?,?,0)'       // ? 占位符
db.query(sqlstr, [user.username, user.password], (err, results) => {               // 使用数组形式，给？占位符指定
    if (err) return console.log(err.message);
    if (results.affectedrows === 1) {
        console.log("插入数据成功");
    }
})