const express = require("express")
const pool = require("../pool")
const router = express.Router()

// 获取元素
router.post("/getElement",(req,res)=>{
    const sql = "SELECT id,type,name,img_url,is_show FROM element"
    pool.query(sql,(err,result)=>{
        if (err) throw err
        res.send({code:200,data:result})
    })
})

// 合成元素
router.post("/compoundElement",(req,res)=>{
    const { first,second } = req.query
    const sql = "SELECT composition FROM compound WHERE first_element = ? AND second_element = ?"
    let params = [first,second]
    pool.query(sql,params,(error,result)=>{
        if (error) throw error
        if (result.length === 0){
            params = [second,first]
            pool.query(sql,params,(err,r)=>{
                if (err) throw err
                res.send({code:200,data:r})
            })
        }else res.send({code:200,data:result})
    })
})

module.exports = router