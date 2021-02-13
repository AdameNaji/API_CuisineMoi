/**
 * @title : app.js
 * @author : Adame Naji
 * @description : Server launch file
 */

const express = require('express');
const app = express();
const http = require('http').createServer(app);
const port = 3000;

const router = require("./routes/router");

/* Launching the server  */
http.listen(port, function (err) {
    if (err) {
        console.error(err);
    }
    console.log(`Server listening at http://localhost:${port}`);
})

/* Basic route */
app.use("/api", router);

