<template>
  <div class="layout">
    <div class="home">
      <header></header>
      <main>
        <section class="section1">
          <Chart1/>
          <Chart2/>
        </section>
        <section class="section2">
          <Chart3/>
          <Chart4/>
        </section>
        <section class="bordered section3">
          <Chart5/>
        </section>
        <section class="section4">
          <Chart6/>
        </section>
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
import Chart3 from './charts/Chart3.vue';
import Chart4 from './charts/Chart4.vue';
import Chart5 from './charts/Chart5.vue';
import Chart6 from './charts/Chart6.vue';

export default {
  name: 'Home',
  components: {Chart6, Chart5, Chart4, Chart3, Chart2, Chart1},
  setup() {
    const year = new Date().getFullYear();
    return {year};
  }
};
</script>

<style lang="scss" scoped>

</style>
