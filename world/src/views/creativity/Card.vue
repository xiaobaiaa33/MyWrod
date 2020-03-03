<template>
	<div id="card">
		<!-- 筛选条件 -->
		<div class="condition">
			<el-button type="primary" @click="dialogVisible = true;dialogTitle='新建卡片'">创建卡片</el-button>
			<el-select v-model="sex" style="width:100px" @change="getCard(Number(sex),Number(use))">
				<el-option v-for="item in sexOptions" :key="item.value" :label="item.label" :value="item.value"></el-option>
			</el-select>
			<el-select v-model="use" style="width:100px" @change="getCard(Number(sex),Number(use))">
				<el-option v-for="item in useOptions" :key="item.value" :label="item.label" :value="item.value"></el-option>
			</el-select>
			<!--弹窗 -->
			<el-dialog
				:title="dialogTitle"
				:visible.sync="dialogVisible"
				width="500px"
				:show-close="false"
				:close-on-click-modal="false"
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
					<el-button @click="dialogVisible = false;clear()">取 消</el-button>
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
					<el-button type="text" :class="[item.employ ? 'hide' : 'show']" @click="handleSetCard(item)">修改</el-button>
					<el-button
						style="color:#67c23a"
						:class="[item.employ ? 'hide' : 'show']"
						type="text"
						@click="handleUseCard(item)"
					>使用</el-button>
				</div>
				<div>{{item.value}}</div>
				<el-tag :class="[item.employ ? 'show' : 'hide']" type="info">已使用</el-tag>
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
		id?: number;
		title: string;
		value: string;
		sex: string;
		employ: number;
		options: Option[];
	}
	@Component({})
	export default class Card extends Vue {
		sexOptions: Option[]; //性别筛选下拉框
		useOptions: Option[]; //使用情况筛选下拉框
		sex: string; //性别类型 0全部 1男 2女
		use: string; //使用情况 0未使用 1已使用
		data: Data[]; //卡片数据
		dialogVisible: Boolean; //弹窗是显示
		input: Input; //弹窗内容
		dialogTitle: string; //弹窗标题

		constructor() {
			super();
			this.sexOptions = [
				{
					value: "0",
					label: "全部"
				},
				{
					value: "1",
					label: "男"
				},
				{
					value: "2",
					label: "女"
				},
				{
					value: "3",
					label: "中立"
				}
			];
			this.useOptions = [
				{
					value: "0",
					label: "未使用"
				},
				{
					value: "1",
					label: "已使用"
				}
			];
			this.sex = "0";
			this.use = "0";
			this.data = [];
			this.dialogVisible = false;
			this.input = {
				title: "",
				value: "",
				sex: "0",
				employ: 0,
				options: [
					{
						value: "0",
						label: "全部"
					},
					{
						value: "1",
						label: "男"
					},
					{
						value: "2",
						label: "女"
					},
					{
						value: "3",
						label: "中立"
					}
				]
			};
			this.dialogTitle = "";
		}

		created(): void {
			this.getCard();
		}
		// 获取所有卡片
		getCard(sex: number = 0, use: number = 0): void {
			this.$axios
				.post(this.$url.getCards, { sex, employ: use })
				.then((res: any) => {
					this.data = res.data;
				})
				.catch(() => {
					this.$message.error("获取卡片失败");
				});
		}
		// 获取卡片颜色
		getCardColor(sex: number): string {
			switch (sex) {
				case 1:
					return "background:#409eff1a";
				case 2:
					return "background:#f56c6c1a";
				default:
					return "background:#fff";
			}
		}
		// 弹窗完成按钮
		handleClickCardOk(): void {
			if (!this.input.title) {
				this.$message.error("请填写卡片名称");
				return;
			}
			if (!this.input.value) {
				this.$message.error("请填写卡片作用");
				return;
			}
			const is: boolean = this.dialogTitle === "新建卡片";
			const router: string = is ? this.$url.addCard : this.$url.setCard;
			const params = {
				id: this.input.id,
				title: this.input.title,
				value: this.input.value,
				sex: this.input.sex
			};
			if (is) delete params.id;
			this.$axios
				.post(router, params)
				.then((res: any) => {
					this.$message.success(res.msg);
					if (this.dialogTitle === "新建卡片") this.clear();
				})
				.catch((err: any) => {
					this.$message.error(`${err.msg}`);
				});
			this.dialogVisible = false;
			this.getCard();
		}
		// 修改卡片
		handleSetCard(item: Input): void {
			const { id, title, value, sex } = item;
			this.dialogVisible = true;
			this.dialogTitle = "修改卡片";
			this.input.title = title;
			this.input.value = value;
			this.input.sex = String(sex);
			this.input.id = id;
		}
		// 删除卡片
		handleDelCard(id: number): void {
			this.$axios
				.post(this.$url.delCard, { id })
				.then((res: any) => {
					this.$message.success(res.msg);
					this.getCard();
				})
				.catch(() => {
					this.$message.error("删除卡片失败");
				});
		}
		// 使用卡片
		handleUseCard(item: Input): void {
			const { id, employ } = item;
			const params = { id, employ };
			this.$axios
				.post(this.$url.useCard, params)
				.then((res: any) => {
					this.$message.success(res.msg);
					this.getCard();
				})
				.catch(() => {
					this.$message.error("使用失败");
				});
		}
		// 清除数据
		clear(): void {
			this.input.title = "";
			this.input.value = "";
			this.input.sex = "0";
		}
	}
</script>

<style lang="scss" scoped>
	#card {
		text-align: left;
		.condition {
			.el-select {
				margin-left: 20px;
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
			.el-tag {
				float: right;
				margin-bottom: 10px;
			}
		}
		// 是否显示按钮
		.Show {
			display: block;
		}
		.hide {
			display: none;
		}
	}
</style>