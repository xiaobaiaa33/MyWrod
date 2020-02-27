import axios from 'axios';

let url:string = "http://127.0.0.1:5000"
axios.defaults.baseURL = url

export default {
    // 进化世界
    getElement:url + "/game/getElement",//获取所有元素
    compoundElement:url + "/game/compoundElement",//获取合成元素
    reset: url + "/game/reset",//重置游戏

    // 卡片
    getCards:url + "/creativity/getCards",//获取所有卡片
    addCard:url + "/creativity/addCard",//添加卡片
    delCard:url + "/creativity/delCard",//删除卡片
}