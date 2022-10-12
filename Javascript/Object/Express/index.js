const express = require('express');
const router = require('./express-three');
const app = express()
app.use('/api', router);
app.listen(80, () => {
    console.log('Express server running');
})