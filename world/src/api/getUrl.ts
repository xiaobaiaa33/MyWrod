import axios from 'axios';

let url:string = "http://127.0.0.1:5000"
axios.defaults.baseURL = url

export default {
    getElement:url + "/game/getElement",
    compoundElement:url + "/game/compoundElement",
    reset: url + "/game/reset",
}