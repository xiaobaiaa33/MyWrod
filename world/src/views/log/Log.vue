<template>
	<div id="log">
		<p>这是日志</p>
		<el-timeline :reverse="reverse">
			<el-timeline-item
				v-for="(activity, index) in activities"
				:key="index"
				:timestamp="activity.timestamp"
			>{{activity.content}}</el-timeline-item>
		</el-timeline>
		<el-backtop target=".el-timeline"></el-backtop>
	</div>
</template>

<script lang="ts">
	import { Component, Vue } from "vue-property-decorator";
	interface LogContent {
		content: string;
		timestamp: string;
	}

	@Component
	export default class Log extends Vue {
		reverse: boolean;
		activities: LogContent[];

		constructor() {
			super();
			this.reverse = false;
			this.activities = [
				{
					content: "新增全局守卫",
					timestamp: "2020-02-24"
				},
				{
					content: "新增日志模块",
					timestamp: "2019-12-09"
				},
				{
					content: "新增进化世界",
					timestamp: "2019-12-26"
				},
				{
					content: "完善数据库",
					timestamp: "2019-12-16"
				},
				{
					content: "添加服务器代码，前后端分离",
					timestamp: "2019-12-11"
				},
				{
					content: "新增登录页",
					timestamp: "2019-12-09"
				},
				{
					content: "完成布局和路由",
					timestamp: "2019-11-13"
				},
				{
					content: "搭建项目",
					timestamp: "2019-11-12"
				}
			];
		}
	}
</script>

<style lang="scss" scoped>
	#log {
		// 时间轴
		.el-timeline {
			text-align: left;
		}
	}
</style>
