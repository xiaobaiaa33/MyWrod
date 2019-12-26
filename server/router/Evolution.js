const express = require("express")
const pool = require("../pool")
const router = express.Router()

// 获取元素
router.post("/getElement", (req, res) => {
    const sql = "SELECT id,type,name,img_url as imgUrl,is_show as isShow FROM element"
    pool.query(sql, (err, result) => {
        if (err) throw err
        res.send({ code: 200, data: result })
    })
})

// 合成元素
router.post("/compoundElement", (req, res) => {
    new Promise(resolve => {
        const length = Object.keys(req.body).length
        if (!req.body | length <= 0) res.send({ code: 400, msg: "参数错误" });
        const { first, second } = req.body
        const sql = "SELECT composition FROM compound WHERE (first_element = ? OR first_element = ?) AND (second_element = ? OR second_element = ?)"
        const params = [first, second, first, second]
        pool.query(sql, params, (error, result) => {
            if (error) throw error
            // 没有合成公式
            if (result.length === 0) {
                res.send({ code: 201, msg: "无法合成新元素" })
            }
            // 有合成公式，判断是否已经存显示
            else
                resolve({ data: result[0] })
        })
        // 判断元素是否已经显示
    }).then(value => {
        return new Promise(resolve => {
            const { composition } = value.data
            const sql = "SELECT is_show FROM element WHERE name = ?"
            pool.query(sql, [composition], (err, result) => {
                if (err) throw err
                if (result[0].is_show === 1)
                    res.send({ code: 202, msg: "此元素已经存在" })
                else
                    resolve({ ...value })
            })
        })
        // 显示新元素
    }).then(value => {
        return new Promise(resolve => {
            const { composition } = value.data
            // 显示
            const sql = "UPDATE element SET is_show = 1 WHERE name = ?"
            pool.query(sql, [composition], (err, result) => {
                if (err) throw err
                if (result.affectedRows > 0)
                    resolve({ ...value })
                else
                    res.send({ code: 201, msg: "有新元素，但是创建失败了" })
            })
        })
        // 查询新元素的图片
    }).then(value => {
        const { composition } = value.data
        const sql = "SELECT img_url as imgUrl FROM element WHERE name = ?"
        pool.query(sql, [composition], (err, result) => {
            if (err) throw err
            res.send({ code: 200, msg: `创造了新元素${composition}`, data: result[0] })
        })
    })
})

// 重置游戏
router.post("/reset", (req, res) => {
    const sql = "UPDATE element SET is_show = 0 WHERE name NOT IN (?,?,?,?,?,?,?)"
    const params = ["气", "泥土", "火", "水", "木轮", "颜料", "布袋"]
    pool.query(sql, params, (err, result) => {
        if (err) throw err
        if (result.affectedRows > 0)
            res.send({ code: 200, msg: "重置游戏" })
        else {
            res.send({ code: 201, msg: "重置失败" })
        }
    })
})

module.exports = router