const fs = require('fs');
fs.readFile("./index.css", "utf8", (err, dataStr) => {
    if (err) {
        return console.log(err);
    }
    console.log(dataStr);
})