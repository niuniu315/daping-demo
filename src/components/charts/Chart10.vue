<template>
  <div id="mycharts10" class="chart"/>
</template>

<script lang="ts">
import {inject, onMounted} from 'vue';
import {createEchartsOptions} from '../shared/create-echarts-options';

export default {
  name: 'Chart10',
  setup() {
    const echarts = inject('echarts');
    onMounted(() => {
      const myChart = echarts.init(document.getElementById('mycharts10'));
      // 绘制图表
      myChart.setOption(createEchartsOptions({
        xAxis: {
          data: ['入室抢劫', '当街偷盗', '团伙诈骗', '刑事案件', '民事案件'],
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
          data: [40, 22, 20, 18, 32],
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
            offset: 0,
            color: '#0A97FB'
          }, {
            offset: 1,
            color: '#1E34FA'
          }]),
        }]
      }));
    });
  }
};
</script>

<style lang="scss" scoped>

</style>
