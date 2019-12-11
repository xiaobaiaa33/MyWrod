<template>
    <div id="login">
        <div class="box">
            <h1>Login</h1>
            <el-form ref="form" :model="form" label-width="50px">
                <el-form-item label="账号">
                    <el-input v-model="form.user"></el-input>
                </el-form-item>
                <el-form-item label="密码">
                    <el-input v-model="form.passWord" show-password></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="handleLogin">登录</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script lang="ts">
interface Form {
    user:String,
    passWord:String
}
import { Component, Vue } from 'vue-property-decorator';

@Component({
    
})

export default class Login extends Vue {
    form:Form = {
        user:"admin",
        passWord:"123456"
    }
    handleLogin(){
        let login = this.form.user === "admin" && this.form.passWord === "123456";
        if (login){
            this.$router.push("/home");
            this.$message({
                message: '登录成功',
                type: 'success'
            });
        }else {
            this.$message.error('用户名或密码错误，请重新输入');
        }
    }
}
</script>

<style lang="scss" scoped>
#login {
    height: 100vh;
    background: URL("../../assets/images/loginbg.jpg") no-repeat;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    .box {
        width: 20%;
        background: rgba($color: #000, $alpha: 0.4);
        padding:20px 30px;
        h1 {
            color:#ccc;
        }
    }
    .el-form {
        /deep/ .el-form-item {
            padding-top: 20px;
            &:last-child {
                .el-form-item__content {
                    margin:0 !important;
                }
            }
            .el-form-item__label {
                width: 50px !important;
                color:#ccc !important;
            }
        }
    }
}
</style>