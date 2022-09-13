<template>
  <div class="layout">
    <div class="home">
      <header></header>
      <main>
        <section class="section1">
          <Chart1/>
          <Chart2/>
        </section>
        <section class="bordered section2"></section>
        <section class="bordered section3"></section>
        <section class="bordered section4"></section>
        <section class="bordered section5"></section>
      </main>
      <footer>
        &copy; 兰州公安局 2020-{{ year }}
      </footer>
    </div>
  </div>
</template>

<script lang="ts">
import '../assets/home.scss';
import Chart1 from './charts/Chart1.vue';
import Chart2 from './charts/Chart2.vue';

export default {
  name: 'Home',
  components: {Chart2, Chart1},
  setup() {
    const year = new Date().getFullYear();
    return {year};
  }
};
</script>

<style lang="scss" scoped>

</style>
