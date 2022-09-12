<template>
  <div class="layout">
    <div class="home">
      <header></header>
      <main>
        <section class="section1">
          <div class="bordered 管辖统计">
            <h2>案发派出所管辖统计</h2>
            <div id="mycharts" class="chart"></div>
          </div>
        </section>
        <section class="bordered section2"></section>
        <section class="bordered section3"></section>
        <section class="bordered section4"></section>
        <section class="bordered section5"></section>
      </main>
    </div>
  </div>
</template>

<script lang="ts">
import {inject, onMounted} from 'vue';
import {ref} from 'vue';
import '../assets/home.scss';

const px = (n) => n / 2420 * (window as any).pageWidth;
export default {
  name: 'Home',
  setup() {
    const trafficData = ref({});
    const echarts = inject('echarts');
    onMounted(() => {
      const myChart = echarts.init(document.getElementById('mycharts'));
      // 绘制图表
      myChart.setOption({
        textStyle: {
          fontSize: px(12),
          color: '#79839E'
        },
        title: {show: false},
        legend: {show: false},
        xAxis: {
          data: ['兰州新区', '兰州新区', '兰州新区', '兰州新区', '兰州新区', '兰州新区', '兰州新区', '兰州新区', '兰州新区'],
          axisTick: {show: false},
          axisLine: {
            lineStyle: {color: '#083B70'}
          },
          axisLabel: {
            fontSize: px(12),
            formatter(val) {
              if (val.length > 2) {
                const array = val.split('');
                array.splice(2, 0, '\n');
                return array.join('');
              } else {
                return val;
              }
            }
          },
        },
        grid: {
          x: px(40),
          y: px(40),
          x2: px(40),
          y2: px(40),
        },
        yAxis: {
          splitLine: {show: false},
          axisLine: {
            show: true,
            lineStyle: {color: '#083B70'}
          },
          axisLabel: {
            fontSize: px(12)
          }
        },
        series: [{
          type: 'bar',
          data: [10, 20, 36, 41, 15, 26, 37, 18, 29]
        }]
      });
      window.onresize = function () {
        myChart.resize();
      };
    });
    return {};
  }
};
</script>

<style lang="scss" scoped>

</style>
