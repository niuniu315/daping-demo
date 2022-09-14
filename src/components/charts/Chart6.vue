<template>
  <div class="bordered 籍贯">
    <h2>全市犯罪人员籍贯分布地</h2>
    <div class="wrapper">
      <div id="mycharts6" class="chart"/>
      <div class="legend bordered">
        <span class="icon gansu"/>甘肃籍
        <span class="icon sichuan"/>四川籍
        <span class="icon qinghai"/>青海籍
      </div>
      <div class="notes">此地图仅显示了中国的部分区域</div>
    </div>
  </div>
</template>

<script lang="ts">
import china from '../../geo/china.json';
import {inject, onMounted} from 'vue';
import {createEchartsOptions} from '../shared/create-echarts-options';

export default {
  name: 'Chart6',
  setup() {
    const echarts = inject('echarts');
    // @ts-ignore
    echarts.registerMap('CN', china);
    onMounted(() => {
      // @ts-ignore
      const myChart = echarts.init(document.getElementById('mycharts6'));
      // 绘制图表
      myChart.setOption(createEchartsOptions({
        xAxis: {show: false},
        yAxis: {show: false},
        series: [
          {
            type: 'map',
            mapType: 'CN', // 自定义扩展图表类型
            data: [
              {name: '甘肃省', value: 1},
            ],
            label: {show: false, color: 'white'},
            itemStyle: {
              areaColor: '#010D3D',
              borderColor: '#01A7F7',
              emphasis: {
                label: {color: 'white'},
                areaColor: '#5470C6',
              },
            }
          },
          {
            type: 'map',
            mapType: 'CN', // 自定义扩展图表类型
            data: [
              {name: '四川省', value: 100},
            ],
            itemStyle: {
              areaColor: '#010D3D',
              borderColor: 'yellow',
              emphasis: {
                label: {color: 'white'},
                areaColor: '#5470C6',
              },
            }
          },
          {
            type: 'map',
            mapType: 'CN', // 自定义扩展图表类型
            data: [
              {name: '青海省', value: 100},
            ],
            itemStyle: {
              areaColor: '#010D3D',
              borderColor: '#01A7F7',
              emphasis: {
                label: {color: 'white'},
                areaColor: '#5470C6',
              },
            }
          },

        ]
      }));
    });
  }
};
</script>

<style lang="scss" scoped>
.wrapper > .legend > .gansu {
  background: rgb(84,112,198);
}
.wrapper > .legend > .sichuan  {
  background: rgb(145,204,117);
}.wrapper > .legend > .qinghai {
   background: rgb(250,200,88);
 }
</style>
