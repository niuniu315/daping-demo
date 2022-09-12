<template>
  <div class="bordered 管辖统计">
    <h2>案件破获排名</h2>
    <div id="mycharts2" class="chart"></div>
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
          boundaryGap: [0, 0.01]
        },
        yAxis: {
          type: 'category',
          data: ['巴西', '印尼', '美国', '印度', '中国', '世界人口(万)']
        },
        series: [
          {
            name: '2011年',
            type: 'bar',
            data: [18203, 23489, 29034, 104970, 131744, 630230]
          },
          {
            name: '2012年',
            type: 'bar',
            data: [19325, 23438, 31000, 121594, 134141, 681807]
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
.bordered {
  border: 1px solid red;
}
</style>
