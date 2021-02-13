/**
 * @title : recipeRoutes.js
 * @author : Adame Naji
 * @description : Routes relate to a recipe and the functions associated with it
 */

const express = require('express');
const router = express.Router();

/* Recipe routes */
router
    .route("/:name_recipe")
    .get((req, res) => {
        res.send("GET /:name_recipe");
    })
    .post((req, res) => {
        res.send("POST /:name_recipe");
    })
    .put((req, res) => {
        res.send("PUT /:name_recipe");
    })
    .delete((req, res) => {
        res.send("DELETE /:name_recipe");
    });

module.exports = router;