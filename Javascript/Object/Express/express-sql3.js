const mysql = require('mysql')
const db = mysql.createPool({
    host: '172.26.32.126',
    user: 'root',
    password: 'mysql.sys',
    database: 'm_db_01',
    port: '3306',
    protocol: 'mysql'
});
const sqlstr = '';