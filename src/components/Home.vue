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
          <div class="bordered 年龄段">
            <h2>犯罪人员年龄段分布</h2>
            <div class="charts">
              <Chart7/>
              <Chart8/>
              <Chart9/>
            </div>
          </div>
        </section>
        <section class="section5">
          <div class="bordered row1 案发类型">
            <h2>案发类型统计</h2>
            <div class="charts">
              <Chart10/>
              <Chart11/>
            </div>
          </div>
          <div class="bordered row2 案发街道">
            <h2>案发街道统计</h2>
            <div class="charts">
              <Chart12/>
              <Chart13/>
            </div>
          </div>
          <div class="bordered row3 作案手段">
            <h2>作案手段分析</h2>
            <Chart14/>
          </div>
        </section>
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
import Chart7 from './charts/Chart7.vue';
import Chart8 from './charts/Chart8.vue';
import Chart9 from './charts/Chart9.vue';
import Chart10 from './charts/Chart10.vue';
import Chart11 from './charts/Chart11.vue';
import Chart12 from './charts/Chart12.vue';
import Chart13 from './charts/Chart13.vue';
import Chart14 from './charts/Chart14.vue';

export default {
  name: 'Home',
  components: {
    Chart14,
    Chart13,
    Chart12, Chart11, Chart10, Chart9, Chart8, Chart7, Chart6, Chart5, Chart4, Chart3, Chart2, Chart1
  },
  setup() {
    const year = new Date().getFullYear();
    return {year};
  }
};
</script>

<style lang="scss" scoped>

</style>
