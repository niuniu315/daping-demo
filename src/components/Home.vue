<template>
  <div class="layout">
    <div class="home">
      <header></header>
      <main>
        <section class="section1"></section>
        <section class="section2"></section>
        <section class="section3"></section>
        <section class="section4"></section>
        <section class="section5"></section>
      </main>
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
.layout{
  display: flex;
  flex-direction: column;
  flex: 1;
}
.home {
  flex: 1;
  height: 100%;
  display: flex;
  flex-direction: column;

  header {
    height: px(99);
    background: url("../assets/header.png");
    background-size: cover;
  }

  main {
    flex: 1;
    display: grid;
    grid-template:
      "box1 box2 box4 box5" 755fr
      "box3 box3 box4 box5" 363fr / 366fr 361fr 811fr 747fr;
    grid-column-gap: px(28);
    grid-row-gap: px(28);

    > .section1 {
      grid-area: box1;
      background: pink;
    }

    > .section2 {
      grid-area: box2;
      background: lightgray;
    }

    > .section3 {
      grid-area: box3;
      background: lightblue;
    }

    > .section4 {
      grid-area: box4;
      background: lightcyan;
    }

    > .section5 {
      grid-area: box5;
      background: lightyellow;
    }
  }
}
</style>
