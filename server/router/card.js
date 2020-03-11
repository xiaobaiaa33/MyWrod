const express = require("express")
const pool = require("../pool")
const router = express.Router()

// 获取卡片信息
router.post("/getCards", (req, res) => {
    const { sex, employ } = req.body;
    let sql = "SELECT id,title,value,sex,employ FROM card";
    let arr = [];
    if (sex !== 0) {
        sql += " WHERE sex = ? AND employ = ?";
        arr.push(sex);
        arr.push(employ);
    } else {
        sql += " WHERE employ = ?";
        arr.push(employ);
    }
    sql += " Order By id";
    pool.query(sql, arr, (err, result) => {
        if (err) throw err;
        res.send({ code: 200, data: result });
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

// 修改卡片
router.post("/setCard", (req, res) => {
    const { id, title, value, sex } = req.body;
    const sql = "UPDATE card SET title = ?,value = ?,sex = ? WHERE id = ?";
    pool.query(sql, [title, value, sex, id], (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0)
            res.send({ code: 200, msg: "修改卡片成功" })
        else
            res.send({ code: 400, msg: "修改卡片失败" })
    })
})

// 使用卡片
router.post("/useCard", (req, res) => {
    let { id, employ } = req.body;
    if (employ === 0)
        employ = 1
    else
        employ = 0
    const sql = "UPDATE card SET employ = ? WHERE id = ?";
    pool.query(sql, [employ, id], (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0)
            res.send({ code: 200, msg: "使用卡片" })
        else
            res.send({ code: 400, msg: "使用失败" })
    })
})

module.exports = router