const express = require('express');
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extemded: false }));
app.post('/user', (req, res) => {
    console.log(req.body);
    res.send('ok');
});

app.post('/book', (req, res) => {
    console.log(req.body);
    res.send("url");
})
app.listen(80, () => {
    console.log('Express server running at http://127.0.0.1');
})