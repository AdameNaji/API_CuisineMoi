/**
 * @title : router.js
 * @author : Adame Naji
 * @description : File concentrating the API route files and defining the system for connecting and creating a user
 */

"use strict";
const express = require('express');
const router = express.Router();

/* API routes */
router.use("/user", require("./API/userRoutes"));
router.use("/recipe", require("./API/recipeRoutes"));
router.use("/food", require("./API/foodRoutes"));

router.get('/', (req, res) => {
    res.send("GET /");
});

/* Routes relating to the connection */
router
    .route("/login")
    .get((req, res) => {
        res.send("GET /login");
    })
    .post((req, res) => {
        res.send("POST /login");
    });

/* Routes relating to the creation of an user account */
router
    .route("/create-account")
    .get((req, res) => {
        res.send("GET /create-account");
    })
    .post((req, res) => {
        res.send("POST /create-account");
    });

module.exports = router;
