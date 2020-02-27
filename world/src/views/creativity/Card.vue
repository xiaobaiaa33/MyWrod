<template>
	<div id="card">
		<div class="condition">
			<el-button type="primary">创建卡片</el-button>
			<el-select v-model="sex" style="width:100px">
				<el-option v-for="item in sexOptions" :key="item.value" :label="item.label" :value="item.value"></el-option>
			</el-select>
		</div>
	</div>
</template>

<script lang="ts">
	import { Component, Vue } from "vue-property-decorator";

	interface Option {
		value: string;
		label: string;
	}
	@Component({})
	export default class Card extends Vue {
		sexOptions: Option[];
		sex: string;
		type: string;

		constructor() {
			super();
			this.sexOptions = [
				{
					value: "2",
					label: "全部"
				},
				{
					value: "1",
					label: "男"
				},
				{
					value: "0",
					label: "女"
				}
			];
			this.sex = "2";
			this.type = "0";
		}
	}
</script>

<style lang="scss" scoped>
	#card {
		text-align: left;
        .condition {
            .el-button {
                margin-right: 20px;
            }
        }
	}
</style>