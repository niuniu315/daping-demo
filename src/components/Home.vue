<template>
  <div>
    <div class="home">
      <header></header>
    </div>
  </div>
</template>

<script lang="ts">
export default {
  name: 'Home'
};
</script>

<style lang="scss" scoped>
@import "src/assets/helper.scss";
.home{
  header{
    height: px(99);
    background: url("../assets/header.png");
    background-size: cover;
  }
}
</style>
