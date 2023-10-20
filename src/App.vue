<template>
  <div id="app">
    <div style="display: flex; justify-content: space-between; align-items: center">
      <el-input placeholder="输入链接" v-model="url" style="margin-right: 5px"/>
      <el-button @click="handleQrCode" type="primary">生成二维码</el-button>
    </div>
    <div>
      <p style="font-family: 'Rza', Sans-serif; font-size: 24px">Hello World!</p>
    </div>
    <div>
      <el-image v-if="img" :src="img"></el-image>
      <el-empty v-else description="空"></el-empty>
    </div>
  </div>
</template>

<script>

export default {
  name: "App",
  components: {},
  data() {
    return {
      url: "",
      img: ""
    };
  },
  methods: {
    handleQrCode() {
      this.$http.post("https://springboot-qrcode-q3lbvrl2ea-uc.a.run.app/qr/create", {url: this.url})
          .then((res) => {
            this.img = res.data.img;
          })
    }
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
