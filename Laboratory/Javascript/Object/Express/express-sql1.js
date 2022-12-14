const express = require('express');
const mysql = require('mysql');
const db = mysql.createPool({
    protocol: 'mysql',
    host: '172.26.32.223',
    user: 'root',
    password: 'mysql.sys',
    database: 'm_db_01',
    port: 3306
})
db.query('select * from users', (err, result) => {
    if (err) return console.log(err.message);
    console.log(result);
})
