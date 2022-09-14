<template>
  <div class="年龄段-图2">
    <div class="chart">
      <div id="mycharts8" class="chart"></div>
      <div class="text">年龄段</div>
    </div>
    <div class="legend">
      <span class="l1"/>10-20
      <span class="l2"/>20-30
      <span class="l3"/>30-40
      <span class="l4"/>40-50
      <span class="l5"/>50-60
    </div>
  </div>
</template>

<script lang="ts">
import {inject, onMounted} from 'vue';
import {createEchartsOptions} from '../shared/create-echarts-options';
import {px} from '../shared/px';

export default {
  name: 'Chart8',
  setup() {
    const echarts = inject('echarts');
    onMounted(() => {
      const myChart = echarts.init(document.getElementById('mycharts8'));
      // 绘制图表
      myChart.setOption(createEchartsOptions({
        xAxis: {show: false},
        yAxis: {show: false},
        legend: {show: false},
        series: [
          {
            name: '访问来源',
            type: 'pie',
            radius: ['75%', '90%'],
            avoidLabelOverlap: false,
            label: {
              show: true, position: 'inside', textStyle: {color: 'white', fontSize: px(20)},
              formatter(options) {
                return (options.value * 100).toFixed(0) + '%';
              }
            },
            labelLine: {show: false},
            itemStyle: {
              borderColor: '#0F113A',
              borderWidth: px(4)
            },
            data: [
              {value: 0.07, name: '10-20'},
              {value: 0.10, name: '20-30'},
              {value: 0.23, name: '30-40'},
              {value: 0.28, name: '40-50'},
              {value: 0.32, name: '50-60'},
            ]
          }
        ]
      }));
    });
  }
};
</script>

<style lang="scss" scoped>
.l1{background: rgb(145,204,117)}
.l2{background: rgb(255,220,96)}
.l3{background: rgb(238,102,102)}
.l4{ background: rgb(115,192,222)}
.l5{ background: rgb(84,112,198)}
</style>
