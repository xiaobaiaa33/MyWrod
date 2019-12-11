const express = require("express")
const pool = require("../pool")
const router = express.Router()

router.post("/getA",(req,res)=>{
    res.send({code:200,msg:"我是A"})
})

module.exports = router