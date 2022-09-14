<template>
  <div id="mycharts13" class="chart"/>
</template>

<script lang="ts">
import {inject, onMounted} from 'vue';
import {createEchartsOptions} from '../shared/create-echarts-options';

export default {
  name: 'Chart13',
  setup() {
    const echarts = inject('echarts');
    const data = [
      {value: 0.08, name: '东岗路'},
      {value: 0.06, name: '段家滩'},
      {value: 0.11, name: '雁北'},
      {value: 0.09, name: '五泉山'},
      {value: 0.12, name: '中山路'},
      {value: 0.06, name: '庆阳路'},
      {value: 0.08, name: '武都路'},
      {value: 0.08, name: '酒泉路'},
      {value: 0.08, name: '天水路'},
    ];
    onMounted(() => {
      const myChart = echarts.init(document.getElementById('mycharts13'));
      // 绘制图表
      myChart.setOption(createEchartsOptions({
        xAxis: {
          data: data.map(i => i.name),
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
          },
          axisLabel: {
            formatter(value) {
              return (value * 100).toFixed(0) + '%';
            }
          }
        },
        series: [{
          type: 'bar',
          data: data.map(i => i.value),
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
