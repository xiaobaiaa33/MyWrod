<template>
	<div id="card">
		<!-- 筛选条件 -->
		<div class="condition">
			<el-button type="primary" @click="handleClickNewCard">创建卡片</el-button>
			<el-select v-model="sex" style="width:100px" @change="handleChangeSex">
				<el-option v-for="item in sexOptions" :key="item.value" :label="item.label" :value="item.value"></el-option>
			</el-select>
			<!-- 弹窗 -->
			<el-dialog
				title="新建卡片"
				:visible.sync="dialogVisible"
				width="500px"
				@click="dialogVisible = false"
			>
				<div>
					<p>
						卡片名称：
						<el-input v-model="input.title" placeholder="卡片名" />
					</p>
					<p>
						卡片作用：
						<el-input v-model="input.value" placeholder="作用" />
					</p>
					<p>
						卡片使用：
						<el-select v-model="input.sex">
							<el-option
								v-for="item in input.options"
								:key="item.value"
								:label="item.label"
								:value="item.value"
							></el-option>
						</el-select>
					</p>
				</div>
				<span slot="footer" class="dialog-footer">
					<el-button @click="dialogVisible = false">取 消</el-button>
					<el-button type="primary" @click="handleClickCardOk">确 定</el-button>
				</span>
			</el-dialog>
		</div>
		<!-- 卡片组 -->
		<div class="cards">
			<el-card
				class="box-card"
				v-for="(item,index) in data"
				:key="index"
				shadow="hover"
				:style="getCardColor(item.sex)"
			>
				<div slot="header" class="clearfix">
					<span>{{item.title}}</span>
					<el-button style="color:#f56c6c" type="text" @click="handleDelCard(item.id)">删除</el-button>
					<el-button type="text">修改</el-button>
					<el-button style="color:#67c23a" type="text">使用</el-button>
				</div>
				<div>{{item.value}}</div>
			</el-card>
		</div>
	</div>
</template>

<script lang="ts">
	import { Component, Vue } from "vue-property-decorator";

	interface Option {
		value: string;
		label: string;
	}
	interface Data {
		title: string;
		value: string;
	}
	interface Input {
		title: string;
		value: string;
		sex: string;
		options: Option[];
	}
	@Component({})
	export default class Card extends Vue {
		sexOptions: Option[];
		sex: string;
		type: string;
		data: Data[];
		dialogVisible: Boolean;
		input: Input;

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
			this.data = [];
			this.dialogVisible = false;
			this.input = {
				title: "",
				value: "",
				sex: "2",
				options: [
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
				]
			};
		}

		created(): void {
			this.getCard();
		}
		// 获取所有卡片
		getCard(): void {
			this.$axios
				.post(this.$url.getCards)
				.then((res: any) => {
					this.data = res.data;
				})
				.catch(() => {
					this.$message.error("获取卡片失败");
				});
		}
		// 筛选切换性别
		handleChangeSex(): void {
			console.log(this.sex);
		}
		// 创建卡片
		handleClickNewCard(): void {
			this.dialogVisible = true;
		}
		// 获取卡片颜色
		getCardColor(sex: number): string {
			switch (sex) {
				case 2:
					return "background:#fff";
				case 1:
					return "background:#409eff1a";
				default:
					return "background:#f56c6c1a";
			}
		}
		// 创建卡片完成
		handleClickCardOk(): void {
			if (!this.input.title) {
				this.$message.error("请填写卡片名称");
				return;
			}
			if (!this.input.value) {
				this.$message.error("请填写卡片作用");
				return;
			}
			const params = {
				title: this.input.title,
				value: this.input.value,
				sex: this.input.sex
			};
			this.$axios
				.post(this.$url.addCard, params)
				.then((res: any) => {
					this.$message.success(res.msg);
					this.input.title = "";
					this.input.value = "";
					this.input.sex = "2";
				})
				.catch(() => {
					this.$message.error("创建卡片失败")
				});
			this.dialogVisible = false;
			this.getCard();
		}
		// 修改卡片
		handleSetCard(): void {
			console.log("修改卡片");
		}
		// 删除卡片
		handleDelCard(id: number): void {
			console.log(id);
			this.$axios
				.post(this.$url.delCard,{id})
				.then((res: any) => {
					this.$message.success(res.msg)
                    this.getCard();
				})
				.catch(() => {
					this.$message.error("删除卡片失败")
				});
			console.log("删除卡片");
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
			.el-dialog {
				.el-input {
					margin-bottom: 10px;
					width: 300px;
				}
				.el-select {
					width: 100px;
				}
			}
		}
		.cards {
			display: flex;
			flex-wrap: wrap;
			justify-content: flex-start;
			margin-top: 20px;
			.el-card {
				width: 15%;
				margin: 0 20px 20px 0;
				.clearfix {
					.el-button {
						float: right;
						padding: 2px 4px;
						margin: 0;
					}
				}
			}
		}
	}
</style>