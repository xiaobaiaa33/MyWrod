<template>
    <div>
        <p class="login">这是登录页</p>
        <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="账号">
                <el-input v-model="form.user"></el-input>
            </el-form-item>
            <el-form-item label="密码">
                <el-input v-model="form.passWord"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="handleLogin">登录</el-button>
            </el-form-item>
        </el-form>
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
        console.log(1);
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
    
</style>