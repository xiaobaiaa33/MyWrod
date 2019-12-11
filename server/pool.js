const mysql = require("mysql")
const pool = mysql.createPool({
    user:"root",
    password:"",
    host:"127.0.0.1",
    port:3306,
    connectionLimit:10,
    database:"world"
})

module.exports = pool