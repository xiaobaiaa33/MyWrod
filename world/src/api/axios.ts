import axios from 'axios'

// axios.defaults.withCredentials = true

// 拦截
axios.interceptors.response.use((response: any) => {
    const res = response.data
    // if (res.code === 201){
    //     console.log("请求错误")
    // }else {
    //     console.log(res)
    // }
    return res
})

export default axios