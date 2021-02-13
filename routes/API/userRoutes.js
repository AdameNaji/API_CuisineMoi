/**
 * @title : userRoutes.js
 * @author : Adame Naji
 * @description : Routes relate to a user and the functions associated with it
 */

const express = require('express');
const router = express.Router();

/* Routes relating to a user's home page */
router
    .route("/:firstname")
    .get((req, res) => {
        res.send("GET /:firstname");
    });

/* Routes relating to the updating of user information */
router
    .route("/:firstname/update")
    .get((req, res) => {
        res.send("GET /:firstname/update");
    })
    .put((req, res) => {
        res.send("PUT /:firstname/update");
    })
    .delete((req, res) => {
        res.send("DELETE /:firstname/update");
    });

/* Routes relating to a user's weekly recipes */
router
    .route("/:firstname/week")
    .get((req, res) => {
        res.send("GET /:firstname/week");
    })
    .put((req, res) => {
        res.send("PUT /:firstname/week");
    });

/* Routes relating to a user's prohibited foodstuffs */
router
    .route("/:firstname/forbidden-food")
    .get((req, res) => {
        res.send("GET /:firstname/forbidden-food");
    })
    .put((req, res) => {
        res.send("PUT /:firstname/forbidden-food");
    })
    .delete((req, res) => {
        res.send("DELETE /:firstname/forbidden-food");
    });

module.exports = router;
