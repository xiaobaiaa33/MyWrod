<template>
  <div id="evolution">
    <div class="reset">
      <el-button type="primary" @click="handleClickReset">重置</el-button>
    </div>
    <el-tabs :tab-position="tabPosition" style="height: 200px;">
      <el-tab-pane v-for="(value,Index) in category" :key="Index" :label="value">
        <el-button
          draggable="true"
          type="primary"
          round
          @dragstart.native="handleDragstart($event)"
          v-for="(item,index) in data"
          :key="index"
          :style="{display:`${item.type === value && item.isShow === 1 ? 'inline-block' : 'none'}`}"
          :data-img="item.imgUrl"
        >{{item.name}}</el-button>
      </el-tab-pane>
    </el-tabs>
    <div class="compound">
      <img
        class="magic"
        src="@/assets/images/magic.jpg"
        alt="元素1"
        data-name="firstElement"
        @dragover="handleDragover"
        @drop="handleDrop"
      />
      <img class="symbol" src="@/assets/images/plus.png" alt="加号" />
      <img
        class="magic"
        src="@/assets/images/magic.jpg"
        alt="元素2"
        data-name="secondElement"
        @dragover="handleDragover"
        @drop="handleDrop"
      />
      <img class="symbol" src="@/assets/images/equal.png" alt="等于" />
      <img
        class="magic"
        src="@/assets/images/compoundMagic.jpg"
        alt="合成元素"
        @click="handleClickCompound"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import { createComponent, ref } from "@vue/composition-api";
interface Item {
  readonly id: number;
  type: string;
  name: string;
  imgUrl: string;
  isShow: number;
}

@Component({})
export default class Evolution extends Vue {
  // 变量类型
  tabPosition: string; //tab的位置
  data: Item[]; //元素数据
  category: string[]; //类别
  elementList: string[]; //待合成元素列表

  constructor(props: any) {
    super(props);
    // 定义变量值
    this.tabPosition = "top";
    this.data = [];
    this.category = [
      "基本元素",
      "植物",
      "海洋生物",
      "爬行动物或两栖动物",
      "昆虫",
      "鸟类",
      "哺乳动物",
      "其他物种"
    ];
    this.elementList = ["", ""];
  }

  created(): void {
    this.getData();
  }
  // 获取元素
  getData(): void {
    this.$axios
      .post(this.$url.getElement)
      .then(res => {
        const arr: Item[] = res.data;
        this.data = arr;
      })
      .catch(err =>  this.$message.error(err.msg)
    );
  }
  // 重置按钮
  handleClickReset(): void {
    this.$axios
      .post(this.$url.reset)
      .then(res => {
          const { code,msg } = res.data
          if (code === 200){

          }
          this.$message.success(msg)
          this.getData()
      })
      .catch(err => this.$message.error(err.msg)
    );
  }
  // 开始拖动元素
  handleDragstart(e: any): void {
    const img: string = e.target.dataset.img;
    const name: string = e.target.firstElementChild.innerText;
    e.dataTransfer.setData("imgUrl", img);
    e.dataTransfer.setData("name", name);
  }
  // 悬浮在目标上
  handleDragover(e: any): void {
    e.preventDefault();
    // const img:string = e.dataTransfer.getData("imgUrl")
    // e.target.src = img
  }
  // 在目标上放手
  handleDrop(e: any): void {
    e.preventDefault();
    const img: string = e.dataTransfer.getData("imgUrl");
    const name: string = e.dataTransfer.getData("name");
    if (e.target.dataset.name === "firstElement") this.elementList[0] = name;
    else this.elementList[1] = name;
    e.target.src = img;
  }
  // 合成
  handleClickCompound(): void {
    if (this.elementList[0] === "" || this.elementList[1] === "") {
      this.$message.error("需要两个元素来合成");
      return;
    }
    interface Params {
      first: string;
      second: string;
    }
    let params: Params = {
      first: this.elementList[0],
      second: this.elementList[1]
    };
    this.$axios
      .post(this.$url.compoundElement, params)
      .then((res: any) => {
        if (res.code === 200) {
          this.getData();
          this.$message.success(res.msg);
        } else this.$message.error(res.msg);
      })
      .catch((err: any) => {
        this.$message.error(err.msg);
      });
  }
}
</script>

<style lang="scss" scoped>
#evolution {
  .reset {
    text-align: left;
  }
  .compound {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    .symbol {
      width: 100px;
      padding: 0 20px;
    }
    .magic {
      width: 300px;
      height: 300px;
      &:last-child {
        cursor: pointer;
      }
    }
  }
}
</style>