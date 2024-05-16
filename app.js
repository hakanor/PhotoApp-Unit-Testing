// app.js

const express = require('express');
const app = express();
const port = 3001;

app.post('/urlRequest', (req, res) => {
    res.json({ "status": "ok" });
});

app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});
