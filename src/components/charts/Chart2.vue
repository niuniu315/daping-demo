<template>
  <div class="bordered 破获排名">
    <h2>案件破获排名</h2>
    <div id="mycharts2" class="chart"></div>
    <div class="legend">
      <span class="first"> </span>破案排名1
      <span class="second"> </span>破案排名2
    </div>
  </div>
</template>

<script lang="ts">
import {inject, onMounted} from 'vue';
import {createEchartsOptions} from '../shared/create-echarts-options';
import {baseEchartOptions} from '../shared/base-echart-options';
import {px} from '../shared/px';

export default {
  name: 'Chart2',
  setup() {
    const echarts = inject('echarts');
    onMounted(() => {
      const myChart = echarts.init(document.getElementById('mycharts2'));
      // 绘制图表
      myChart.setOption(createEchartsOptions({
        ...baseEchartOptions,
        grid: {
          x: px(100),
          y: px(40),
          x2: px(40),
          y2: px(40),
        },
        xAxis: {
          type: 'value',
          boundaryGap: [0, 0.01],
          splitLine: {show: false},
          axisLabel: {show: false}
        },
        yAxis: {
          axisTick: {show: false},
          type: 'category',
          data: ['城关区公安局', '七里河区公安局', '西固区公安局', '安宁区公安局', '红古区公安局',
            '永登县公安局', '皋兰县公安局', '榆中县公安局', '新区公安局'],
          axisLabel: {
            formatter(val) {
              return val.replace('公安局', '\n公安局');
            }
          }
        },
        series: [
          {
            name: '2011年',
            type: 'bar',
            data: [1, 2, 3, 4, 5, 6, 7, 8, 9],
            itemStyle: {
              normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                  offset: 0,
                  color: '#2034f9'
                }, {
                  offset: 1,
                  color: '#04a1ff'
                }]),
              }
            }
          },
          {
            name: '2012年',
            type: 'bar',
            data: [2, 3, 4, 5, 6, 7, 8, 9, 10],
            itemStyle: {
              normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                  offset: 0,
                  color: '#b92ae8'
                }, {
                  offset: 1,
                  color: '#6773e7'
                }]),
              }
            }
          }
        ]
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
