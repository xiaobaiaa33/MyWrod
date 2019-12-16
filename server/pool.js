const mysql = require("mysql")
const pool = mysql.createPool({
    user:"root",
    password:"root",
    host:"127.0.0.1",
    port:3306,
    connectionLimit:10,
    database:"world"
})
pool.getConnection((err)=>{
    if (err) console.log("mysql数据库连接失败")
    else console.log("mysql数据库连接成功")
})

module.exports = pool