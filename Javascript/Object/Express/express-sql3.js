// 更新数据代码
// const mysql = require('mysql');
// const db = mysql.createPool({
//     host: '172.26.32.126',
//     user: 'root',
//     password: 'mysql.sys',
//     database: 'm_db_01',
//     port: '3306',
//     protocol: 'mysql'
// });
// const user = { id: 6, username: 'aaaa', password: '0000' };
// const sqlstr = 'update users set ? where id =?';
// db.query(sqlstr, [user, user.id], (err, results) => {
//     if (err) return console.log(err.message);
//     if (results.affectedrows === 1) console.log("数据更新成功！");
// });


// 删除数据代码
// const mysql = require('mysql')
// const db = mysql.createPool({
//     host: '172.26.32.126',
//     user: 'root',

//     password: 'mysql.sys',
//     database: 'm_db_01',
//     port: '3306',
//     protocol: 'mysql'
// });
// const sqlstr = 'delete form users where id=?';                                 // 通过占位符设置条件         
// db.query(sqlstr, 7, (err, results) => {                                        // 通过数据更新设条件          
//     if (err) return console.log(err.message);                                  // 当然能够通过数组设
//     if (results.affectedrows === 1) console.log("删除数据成功！");       
// });




























// 标记删除状态
const mysql = require('mysql')
const db = mysql.createPool({
    host: '172.26.32.126',
    user: 'root',
    password: 'mysql.sys',
    database: 'm_db_01',

    port: '3306',
    protocol: 'mysql'
});
const sqlstr = 'update users set status=? where id=?';                         // 通过占位符设置条件                     
db.query(sqlstr, [1, 6], (err, results) => {                                    // 通过数据更新设条件              
    if (err) return console.log(err.message);                                  // 当然能够通过数组设               
    if (results.affectedrows === 1) console.log("删除数据成功！");










});