<template>
  <div class="bordered 管辖统计">
    <h2>案发派出所管辖统计</h2>
    <div id="mycharts" class="chart"></div>
  </div>
</template>

<script lang="js">
import {inject, onMounted} from 'vue';
import {createEchartsOptions} from '../shared/create-echarts-options';

export default {
  name: 'Chart1',
  setup() {
    const echarts = inject('echarts');
    onMounted(() => {
      const myChart = echarts.init(document.getElementById('mycharts'));
      // 绘制图表
      myChart.setOption(createEchartsOptions({
        xAxis: {
          data: ['兰州新区', '兰州新区', '兰州新区', '兰州新区', '兰州新区', '兰州新区', '兰州新区', '兰州新区', '兰州新区'],
          axisTick: {show: false},
          axisLine: {
            lineStyle: {color: '#083B70'}
          },
          axisLabel: {
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
        yAxis: {
          splitLine: {show: false},
          axisLine: {
            show: true,
            lineStyle: {color: '#083B70'}
          }
        },
        series: [{
          type: 'bar',
          data: [10, 20, 36, 41, 15, 26, 37, 18, 29]
        }]
      }));
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
