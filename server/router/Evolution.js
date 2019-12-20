const express = require("express")
const pool = require("../pool")
const router = express.Router()

// 获取元素
router.post("/getElement",(req,res)=>{
    const sql = "SELECT id,type,name,img_url as imgUrl,is_show as isShow FROM element"
    pool.query(sql,(err,result)=>{
        if (err) throw err
        res.send({code:200,data:result})
    })
})

// 合成元素
router.post("/compoundElement",(req,res)=>{
    const length = Object.keys(req.body).length
    if (!req.body | length <= 0) res.send({ code:400,msg:"参数错误" });
    const { first,second } = req.body
    const sql = "SELECT composition FROM compound WHERE (first_element = ? OR first_element = ?) AND (second_element = ? OR second_element = ?)"
    const params = [first,second,first,second]
    pool.query(sql,params,(error,result)=>{
        console.log(result)
        if (error) throw error
        res.send({ code:200,data:result })
        // newElement(result.data[0])
    })
})

// 显示新元素
function newElement(name){
    const sql = "UPDATE element SET is_show = 1 WHERE name = ?"
    pool.query(sql,[name],(err,res)=>{
        if (err) throw err
        res.send({ code:200,msg:`创造了新元素${name}` })
    })
}


module.exports = router