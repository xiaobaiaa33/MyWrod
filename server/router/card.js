const express = require("express")
const pool = require("../pool")
const router = express.Router()

// 获取卡片信息
router.post("/getCards", (req, res) => {
    const sql = "SELECT id,title,value,sex FROM card";
    pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send({ code: 200, data: result })
    })
})

// 新增卡片
router.post("/addCard", (req, res) => {
    const { title, value, sex } = req.body;
    const sql = "INSERT INTO card VALUES(NULL,?,?,?)";
    pool.query(sql, [title, value, sex], (err, result) => {
        if (err) throw err;
        res.send({ code: 200, msg: "新建卡片成功" });
    })
})

// 删除卡片
router.post("/delCard", (req, res) => {
    const sql = "DELETE FROM card WHERE id = ?";
    pool.query(sql, [req.body.id], (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0) 
            res.send({ code: 200, msg: "删除卡片成功" })
        else
            res.send({ code: 400, msg: "删除卡片失败" })
    })
})

module.exports = router