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
    let myChart = '';
    //初始数据
    const data = [
      {name: '城关区公安局', 2011: 2, 2012: 3},
      {name: '七里河区公安局', 2011: 2, 2012: 3},
      {name: '西固区公安局', 2011: 2, 2012: 3},
      {name: '安宁区公安局', 2011: 2, 2012: 3},
      {name: '红古区公安局', 2011: 2, 2012: 3},
      {name: '永登县公安局', 2011: 2, 2012: 3},
      {name: '皋兰县公安局', 2011: 2, 2012: 3},
      {name: '榆中县公安局', 2011: 2, 2012: 3},
      {name: '新区公安局', 2011: 2, 2012: 3},
    ];
    onMounted(() => {
      // 持续计时器更新数据
      setInterval(() => {
        const newData = [
          {name: '城关区公安局', 2011: Math.random() * 10, 2012: Math.random() * 10},
          {name: '七里河区公安局', 2011: 2, 2012: Math.random() * 10},
          {name: '西固区公安局', 2011: Math.random() * 10, 2012: Math.random() * 10},
          {name: '安宁区公安局', 2011: 2, 2012: Math.random() * 10},
          {name: '红古区公安局', 2011: 2, 2012: 3},
          {name: '永登县公安局', 2011: Math.random() * 10, 2012: 3},
          {name: '皋兰县公安局', 2011: 2, 2012: 3},
          {name: '榆中县公安局', 2011: 2, 2012: Math.random() * 10},
          {name: '新区公安局', 2011: 2, 2012: 3},
        ];
        x(newData);
      }, 2000);
    });
    // 绘制图表
    const x = (data) => {
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
          data: data.map(i => i.name),
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
            data: data.map(i => i[2011]),
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
            data: data.map(i => i[2012]),
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
    };
    // 渲染初始数据
    onMounted(() => {
      myChart = echarts.init(document.getElementById('mycharts2'));
      x(data);
    });
  }
};
</script>

<style lang="scss" scoped>
</style>
