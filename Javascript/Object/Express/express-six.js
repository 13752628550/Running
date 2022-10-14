const express = require('express');
const app = express();
app.get('/', (req, res) => {
    throw new Error('服务器内部发生信息！');
    res.send('Home Page.');
});
app.use((err, req, res, next) => {
    console.log('发生了信息:' + err.message);
    res.send('Error!' + err.message);
})

app.listen(8000, () => {
    console.log('http://127.0.0.1');
})