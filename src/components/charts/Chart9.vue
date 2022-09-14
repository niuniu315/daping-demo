<template>
  <div class="年龄段-图3">
    <div id="mycharts9" class="chart"/>
    <h3>犯罪年龄趋势图</h3>
  </div>
</template>

<script lang="ts">
import {inject, onMounted} from 'vue';
import {createEchartsOptions} from '../shared/create-echarts-options';
import {px} from '../shared/px';

export default {
  name: 'Chart9',
  setup() {
    const echarts = inject('echarts');
    onMounted(() => {
      const myChart = echarts.init(document.getElementById('mycharts9'));
      // 绘制图表
      myChart.setOption(createEchartsOptions({
        color: '#F7A110',
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: [0, 18, 28, 38, 48, 58, 68, 78],
          splitLine: {show: true, lineStyle: {color: '#073E78'}},
          axisTick: {show: false},
          axisLine: {show: false},
        },
        yAxis: {
          type: 'value',
          splitLine: {lineStyle: {color: '#073E78'}},
          axisLabel: {
            formatter(val) {
              return val * 100 + '%';
            }
          }
        },
        series: [{
          type: 'line',
          data: [
            0.19, 0.20, 0.26,
            0.35, 0.26, 0.20,
            0.08, 0.06
          ],
          symbol: 'circle',
          symbolSize: px(12),
          lineStyle: {width: px(2)},
          areaStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
              offset: 0,
              color: '#F7A110'
            }, {
              offset: 1,
              color: '#1B1D52'
            }]),
          }
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
