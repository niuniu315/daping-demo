<template>
  <div class="年龄段-图1">
    <div class="chart">
      <div id="mycharts7" class="chart"></div>
      <div class="text">性别</div>
    </div>
    <div class="legend">
      <span class="male" />男
      <span class="female"/>女
    </div>
  </div>
</template>

<script lang="ts">
import {inject, onMounted} from 'vue';
import {createEchartsOptions} from '../shared/create-echarts-options';
import {px} from '../shared/px';

export default {
  name: 'Chart7',
  setup() {
    const echarts = inject('echarts');
    onMounted(() => {
      const myChart = echarts.init(document.getElementById('mycharts7'));
      // 绘制图表
      myChart.setOption(createEchartsOptions({
        color: ['#8D70F8', '#33A4FA'],
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
                return options.value * 100 + '%';
              }
            },
            labelLine: {show: false},
            itemStyle: {
              borderColor: '#0F113A',
              borderWidth: px(4)
            },
            data: [
              {value: 0.2, name: '女'},
              {value: 0.8, name: '男'},
            ]
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
