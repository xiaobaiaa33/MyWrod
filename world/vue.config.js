module.exports = {
    devServer:{
        port:8088,
    },
    css: {
        loaderOptions: {
            scss: {
                // 根据自己样式文件的位置调整
                prependData: `@import "~@/assets/styles/global.scss";`
            }
        }
    }
}