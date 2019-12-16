const express = require("express")
const pool = require("../pool")
const router = express.Router()

router.post("/getElement",(req,res)=>{
    console.log(1)
    pool.query("SELECT id,type,name,img_url,is_show FROM element"),((err,result)=>{
        if (err) throw err;
        res.send(result)
    })

})

module.exports = router