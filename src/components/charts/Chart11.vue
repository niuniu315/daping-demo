<template>
  <div class="年龄段-图1">
    <div class="chart">
      <div id="mycharts11" class="chart"/>
    </div>
    <div class="legend">
      <span class="chart-11-1"/>刑事
      <span class="chart-11-2"/>民事
      <span class="chart-11-3"/>经济
      <span class="chart-11-4"/>其他
    </div>
  </div>
</template>

<script lang="ts">
import {inject, onMounted} from 'vue';
import {createEchartsOptions} from '../shared/create-echarts-options';
import {px} from '../shared/px';

export default {
  name: 'Chart11',
  setup() {
    const echarts = inject('echarts');
    onMounted(() => {
      const myChart = echarts.init(document.getElementById('mycharts11'));
      // 绘制图表
      myChart.setOption(createEchartsOptions({
        xAxis: {show: false},
        yAxis: {show: false},
        legend: {show: false},
        series: [
          {
            startAngle: -20,
            type: 'pie',
            radius: ['25%', '90%'],
            avoidLabelOverlap: false,
            label: {
              show: true, position: 'outside', textStyle: {color: 'white', fontSize: px(20)},
              distanceToLabelLine: 0,
              formatter(options) {
                return options.value * 100 + '%';
              }
            },
            labelLine: {show: true, length: 0},
            roseType: 'area',
            itemStyle: {
              shadowBlur: px(200),
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            },
            data: [
              {value: 0.36, name: '刑事案件'},
              {value: 0.20, name: '民事案件'},
              {value: 0.18, name: '经济案件'},
              {value: 0.24, name: '其他案件'},
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
.chart-11-1 {
  background: rgb(238, 102, 102)
}

.chart-11-2 {
  background: rgb(234, 137, 27)
}

.chart-11-3 {
  background: rgb(145, 204, 117)
}

.chart-11-4 {
  background: rgb(155, 123, 255)
}
</style>
