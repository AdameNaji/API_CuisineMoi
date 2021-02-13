/**
 * @title : database_config.js
 * @author : Adame Naji
 * @description : Database tables creation file
 */


const mariadb = require('mariadb');
const fs = require('fs');

let connection = mariadb.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    connectionLimit: 5,
    database: "cuisinemoi",

    multipleStatements: true
});

function createDatabase() {
    try {
        let data = fs.readFileSync('createDatabaseScript.sql', 'utf8');
        connection.query(data)
            .then(res => console.log("Database table created !\n", res))
            .catch(err => console.log(err))
    } catch(e) {
        console.log('Error:', e.stack);
    }
}
