<template>
    <div id="head">
        <el-menu
            :default-active="$route.path"
            router
            class="el-menu-demo"
            mode="horizontal"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b">
            <el-menu-item index="/home">首页</el-menu-item>
            <el-submenu 
            index="2" 
            popper-class="game"
            show-timeout=100
            hide-timeout=100>
                <template slot="title">游戏</template>
                <el-menu-item index="/home/game/evolution">进化世界</el-menu-item>
                <el-menu-item index="/home/game/engorge">贪吃</el-menu-item>
            </el-submenu>
        </el-menu>
    </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

@Component({

})
export default class Header extends Vue {
    
}
</script>

<style lang="scss" scoped>
    .game /deep/ .el-menu .el-submenu,.el-menu--popup {
        min-width: auto ;
        text-align: center;
        width: 88px;
    }
</style>