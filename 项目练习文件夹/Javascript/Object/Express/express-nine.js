const express = require('express');
const app = express();
const router = require("./apiRouter");
app.use('/api', router);
app.listen(80, () => {
    console.log('express server running at http://127.0.0.1');
})