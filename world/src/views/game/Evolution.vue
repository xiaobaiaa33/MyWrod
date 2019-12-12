<template>
    <div id="evolution">
        <el-tabs :tab-position="tabPosition" style="height: 200px;">
            <el-tab-pane label="自然元素">
                <el-button type="primary" round draggable="true" data-img="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576143805360&di=65db1737bfac3d7e05590d11a6a65628&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F01%2F19%2F91%2F84570bf4c1066fe.jpg" @dragstart.native="handleDragstart($event)">火</el-button>
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
            <img class="magic"  src = "@/assets/images/magic.jpg"  alt = "元素1" @dragover="handleDragover" @drop="handleDrop">
            <img class="symbol" src = "@/assets/images/plus.png" alt="加号">
            <img class="magic" src = "@/assets/images/magic.jpg"  alt = "元素2">
            <img class="symbol" src = "@/assets/images/equal.png" alt="等于">
            <img class="magic" src = "@/assets/images/compoundMagic.jpg"  alt = "合成元素">
        </div>
    </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

@Component({

})
export default class Evolution extends Vue {
    tabPosition:string = "top"

    // 开始拖动元素
    handleDragstart(e:any):void{
        let img:string = e.target.dataset.img
        console.log("拖动开始")
        console.log(e.dataTransfer.setData("imgUrl",img))
    }
    // 悬浮在目标上
    handleDragover(e:any){
        e.preventDefault();
        console.log(e)
        console.log("悬停")
    }
    // 在目标上放手
    handleDrop(e:any){
        e.preventDefault();
        let img:string = e.dataTransfer.getData("imgUrl")
        e.target.src = img
        console.log(e)
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