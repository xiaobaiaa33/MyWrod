<template>
    <div id="layout">
        <el-container>
            <el-header>
                <Header></Header>
            </el-header>
            <el-main>
                <router-view></router-view>
            </el-main>
            <el-footer height="40px">
                <Footer></Footer>
            </el-footer>
        </el-container>
    </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Header from './Header.vue';
import Footer from './Footer.vue';

@Component({
    components:{
        Header,
        Footer
    }
})
export default class Layout extends Vue {
    
}
</script>

<style lang="scss" scoped>
    .el-header,.el-footer {
        background: #545c64;
    }
    .el-footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        font-size: 20px;
        padding: 8px 20px;
        color:#ddd;
    }
</style>