<template>
    <div id="evolution">
        <el-tabs :tab-position="tabPosition" style="height: 200px;">
            <el-tab-pane label="自然元素">
                <el-button type="primary" round draggable="true" @dragstart="handleDragstart($event)" @drag="handleDrag" @dragend="handleDragend">火</el-button>
                <el-button type="primary" round>水</el-button>
                <el-button type="primary" round>土</el-button>
                <el-button type="primary" round>气</el-button>
            </el-tab-pane>
            <el-tab-pane label="植物">植物</el-tab-pane>
            <el-tab-pane label="海洋生物">海洋生物</el-tab-pane>
            <el-tab-pane label="爬行动物和两栖动物">爬行动物和两栖动物</el-tab-pane>
            <el-tab-pane label="昆虫">昆虫</el-tab-pane>
            <el-tab-pane label="鸟类">鸟类</el-tab-pane>
            <el-tab-pane label="哺乳动物">哺乳动物</el-tab-pane>
            <el-tab-pane label="其他物种">其他物种</el-tab-pane>
        </el-tabs>
        <div class="compound">
            <img class="magic" :src = firstElementSrc  alt = "元素1" @dragover="handleDragover" @drop="handleDrop">
            <img class="symbol" src = "@/assets/images/plus.png" alt="加号">
            <img class="magic" :src = secondElementSrc  alt = "元素2">
            <img class="symbol" src = "@/assets/images/equal.png" alt="等于">
            <img class="magic" :src = compoundElementSrc  alt = "合成元素">
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

@Component({

})
export default class Evolution extends Vue {
    tabPosition:string = "top"
    firstElementSrc:string = require("@/assets/images/magic.jpg")
    secondElementSrc:string = require("@/assets/images/magic.jpg")
    compoundElementSrc:string = require("@/assets/images/compoundMagic.jpg")

    // 创建元素
    createElement(name:string){
        
    }
    // 开始拖动元素
    handleDragstart(e:any):void{
        console.log(e)
        console.log("拖动开始")
    }
    // 拖动中元素
    handleDrag(e:any){
        console.log(e)
        console.log("拖动中")
    }
    // 结束拖动元素
    handleDragend(e:any){
        console.log(e)
        console.log("拖动结束")
    }
    // 悬浮在目标上
    handleDragover(){
        console.log("悬停")
    }
    // 在目标上放手
    handleDrop(){
        console.log("放开")
    }
}
</script>

<style lang="scss" scoped>
#evolution {
    .compound {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
        .symbol {
            width: 100px;
            padding:0 20px;
        }
        .magic {
            width: 300px;
            &:last-child {
                cursor: pointer;
            }
        }
    }
}
</style>