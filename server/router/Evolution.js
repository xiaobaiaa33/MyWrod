const express = require("express")
const pool = require("../pool")
const router = express.Router()

router.post("/getElement",(req,res)=>{
    res.send({code:200,msg:"成功"})
})

module.exports = router