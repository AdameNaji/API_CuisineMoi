/**
 * @title : foodRoutes.js
 * @author : Adame Naji
 * @description : Routes relate to a food and the functions associated with it
 */

const express = require('express');
const router = express.Router();

/* Foods routes */
router
    .route("/:name_food")
    .get((req, res) => {
        res.send("GET /:name_food");
    })
    .post((req, res) => {
        res.send("POST /:name_food");
    })
    .put((req, res) => {
        res.send("PUT /:name_food");
    })
    .delete((req, res) => {
        res.send("DELETE /:name_food");
    });

module.exports = router;
