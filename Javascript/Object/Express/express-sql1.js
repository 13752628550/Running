const express = require('express');
const mysql = require('mysql');
const db = mysql.createPool({
    host: '172.26.32.199',
    user: 'root',
    password: 'root@mysql',
    database: 'my_db_01'
})
db.query('select * from users', (err, result) => {
    if (err) return console.log(err.message);
    console.log(result);
})
