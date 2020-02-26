<template>
    <div id="video">
        <el-button type="primary">上传视频</el-button>
        <div class="content">
            <el-card class="box-card">
                <div slot="header" class="clearfix">
                    <span>卡片名称</span>
                </div>
                <div v-for="o in 4" :key="o" class="text item">
                    {{'列表内容 ' + o }}
                </div>
            </el-card>
            <div>
                video
            </div>
        </div>
    </div>
</template>

<script>
import { Component, Vue } from 'vue-property-decorator';

@Component({

})
export default class Video extends Vue {
    
}
</script>

<style lang="scss" scoped>
#video {
    text-align: left;
    .content {
        display: flex;
        margin-top: 20px;
        .el-card {
            width:200px;
        }
    }
}
</style>