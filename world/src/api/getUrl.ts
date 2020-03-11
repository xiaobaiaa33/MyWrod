import axios from 'axios';

let URL:string = "http://127.0.0.1:5000"
axios.defaults.baseURL = URL
axios.defaults.withCredentials = true

export default {
    // 进化世界
    getElement:URL + "/game/getElement",//获取所有元素
    compoundElement:URL + "/game/compoundElement",//获取合成元素
    reset: URL + "/game/reset",//重置游戏

    // 卡片
    getCards:URL + "/creativity/getCards",//获取所有卡片
    addCard:URL + "/creativity/addCard",//添加卡片
    delCard:URL + "/creativity/delCard",//删除卡片
    setCard:URL + "/creativity/setCard",//修改卡片
    useCard:URL + "/creativity/useCard",//使用卡片

    // 点餐
}