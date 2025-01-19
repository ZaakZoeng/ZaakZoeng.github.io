---
layout: page
title: Activities
permalink: /activities/
description: The digital center of Ze Zhang's activities.
nav: true
nav_order: 3
# display_categories: [sports, movies, travels]
horizontal: false
---

<!-- pages/projects.md -->
<div class="projects">
  <!-- Sports -->
  <h2 class="category">Sports</h2>
  <div class="container">
    <div id="echart-sports" style="width: 100%; height: 500px;"></div>
  </div>
  <div class="grid"></div>

  <!-- Movies -->
  <h2 class="category">Movies</h2>
  <div class="container">
    <div id="echart-movies" style="width: 100%; height: 500px;"></div>
  </div>
  <div class="grid"></div>

  <!-- Travels -->
  <h2 class="category">Travels</h2>
  <div class="container">
    <div id="echart-travels" style="width: 100%; height: 500px;"></div>
  </div>
  <div class="grid"></div>
</div>

<!-- 引入 ECharts 库 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.0/echarts.min.js"></script>

<script>
  var chartMovies = echarts.init(document.getElementById('echart-sports'));

  var dataMap = {};
  function dataFormatter(obj) {
    var pList = ['Jan.', 'Feb.', 'Mar.', 'Apr.', 'May.', 'Jun.', 'Jul.', 'Aug.', 'Sep.', 'Oct.', 'Nov.', 'Dec.'];
    var temp;
    for (var year = 2023; year <= 2025; year++) {
      var max = 0;
      var sum = 0;
      temp = obj[year];
      for (var i = 0, l = temp.length; i < l; i++) {
        max = Math.max(max, temp[i]);
        sum += temp[i];
        obj[year][i] = {
          name: pList[i],
          value: temp[i]
        };
      }
      obj[year + 'max'] = Math.floor(max / 100) * 100;
      obj[year + 'sum'] = sum;
    }
    return obj;
  }
  dataMap.dataBasketball = dataFormatter({
      2025: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      2024: [4, 1, 5, 6, 7, 5, 6, 1, 5, 3, 8, 3],
      2023: [0, 3, 2, 7, 7, 0, 6, 3, 3, 2, 5, 3]
  });
  dataMap.dataSwimming = dataFormatter({
      2025: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      2024: [0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1],
      2023: [0, 4, 5, 5, 4, 0, 0, 0, 2, 3, 1, 2]
  });
  dataMap.dataFit = dataFormatter({
      2025: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      2024: [0, 2, 9, 0, 6, 1, 9, 6, 7, 6, 10, 9],
      2023: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  });
  dataMap.dataBadminton = dataFormatter({
      2025: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      2024: [6, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0],
      2023: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  });

  var optionSports = {
    baseOption: {
      timeline: {
        axisType: 'category',
        // realtime: false,
        // loop: false,
        autoPlay: true,
        // currentIndex: 2,
        playInterval: 1000,
        // controlStyle: {
        //     position: 'left'
        // },
        data: [
          '2023-01-01',
          {
            value: '2024-01-01',
            tooltip: {
              formatter: function (params) {
                return 'Fit 💪 and Badminton 🏸 added in 2024';
              }
            },
            symbol: 'diamond',
            symbolSize: 18
          },
          '2025-01-01'
        ],
        label: {
          formatter: function (s) {
            return new Date(s).getFullYear();
          }
        }
      },
      title: {
        subtext: 'Data from Ze Zhang'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'cross',
          crossStyle: {
            color: '#999'
          }
        }
      },
      toolbox: {
        right: '0',
        bottom: '0',
        feature: {
          dataView: { show: true, readOnly: false },
          magicType: { show: true, type: ['line', 'bar'] },
          restore: { show: true },
          saveAsImage: { show: true }
        }
      },
      legend: {
        left: 'right',
        data: ['Basketball 🏀', 'Swimming 🏊', 'Fit 💪', 'Badminton 🏸'],
      },
      calculable: true,
      grid: {
        top: 120,
        bottom: 80,
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow',
            label: {
              show: true,
              formatter: function (params) {
                return params.value.replace('\n', '');
              }
            }
          }
        }
      },
      xAxis: [
        {
          type: 'category',
          axisLabel: { interval: 0 },
          data: ['Jan.', 'Feb.', 'Mar.', 'Apr.', 'May.', 'Jun.', 'Jul.', 'Aug.', 'Sep.', 'Oct.', 'Nov.', 'Dec.'],
          splitLine: { show: false }
        }
      ],
      yAxis: [
        {
          type: 'value',
          name: 'Counts'
        }
      ],
      color: ['#ec7d3d', '#5470cd', '#ffc83d', '#8fafc4'],
      series: [
        { name: 'Basketball 🏀', type: 'bar', label: { show: true } },
        { name: 'Swimming 🏊', type: 'bar', label: { show: true } },
        { name: 'Fit 💪', type: 'bar' , label: { show: true } },
        { name: 'Badminton 🏸', type: 'bar', label: { show: true } },
        {
          name: 'Sports totaling proportion',
          type: 'pie',
          center: ['75%', '25%'],
          radius: '28%',
          z: 100
        }
      ]
    },
    options: [
      {
        title: { text: "Ze Zhang's Sports in 2023" },
        series: [
          { data: dataMap.dataBasketball['2023'] },
          { data: dataMap.dataSwimming['2023'] },
          { data: dataMap.dataFit['2023'] },
          { data: dataMap.dataBadminton['2023'] },
          {
            data: [
              { name: 'Basketball 🏀', value: dataMap.dataBasketball['2023sum'] },
              { name: 'Swimming 🏊', value: dataMap.dataSwimming['2023sum'] },
              { name: 'Fit 💪', value: dataMap.dataFit['2023sum'] },
              { name: 'Badminton 🏸', value: dataMap.dataBadminton['2023sum'] }
            ]
          }
        ]
      },
      {
        title: { text: "Ze Zhang's Sports in 2024" },
        series: [
          { data: dataMap.dataBasketball['2024'] },
          { data: dataMap.dataSwimming['2024'] },
          { data: dataMap.dataFit['2024'] },
          { data: dataMap.dataBadminton['2024'] },
          {
            data: [
              { name: 'Basketball 🏀', value: dataMap.dataBasketball['2024sum'] },
              { name: 'Swimming 🏊', value: dataMap.dataSwimming['2024sum'] },
              { name: 'Fit 💪', value: dataMap.dataFit['2024sum'] },
              { name: 'Badminton 🏸', value: dataMap.dataBadminton['2024sum'] }
            ]
          }
        ]
      },
      {
        title: { text: "Ze Zhang's Sports in 2025" },
        series: [
          { data: dataMap.dataBasketball['2025'] },
          { data: dataMap.dataSwimming['2025'] },
          { data: dataMap.dataFit['2025'] },
          { data: dataMap.dataBadminton['2025'] },
          {
            data: [
              { name: 'Basketball 🏀', value: dataMap.dataBasketball['2025sum'] },
              { name: 'Swimming 🏊', value: dataMap.dataSwimming['2025sum'] },
              { name: 'Fit 💪', value: dataMap.dataFit['2025sum'] },
              { name: 'Badminton 🏸', value: dataMap.dataBadminton['2025sum'] }
            ]
          }
        ]
      }
    ]
  };

  chartSports.setOption(optionSports);
</script>
<!-- Movies -->
<script>
  // 基于准备好的dom，初始化echarts实例
  var chartMovies = echarts.init(document.getElementById('echart-movies'));

  // 配置图表
  var optionMovies = {
    title: {
      text: '小泽2024年度的每月观影次数情况统计图',
      left: 'center',
    },
    toolbox: {
      feature: {
        dataView: { show: true, readOnly: false },
        magicType: { show: true, type: ['line', 'bar'] },
        restore: { show: true },
        saveAsImage: { show: true }
      }
    },
    xAxis: {
      type: 'category',
      data: ['Jan.', 'Feb.', 'Mar.', 'Apr.', 'May.', 'Jun.', 'Jul.', 'Aug.', 'Sep.', 'Oct.', 'Nov.', 'Dec.']
    },
    yAxis: {
      type: 'value'
    },
    series: [
      {
        data: [0, 1, 0, 0, 2, 1, 0, 2, 2, 2, 1, 2],
        type: 'line',
        symbol: 'triangle',
        label: {
          show: true
        },
        symbolSize: 20,
        lineStyle: {
          color: '#5470C6',
          width: 4,
          type: 'dashed'
        },
        itemStyle: {
          borderWidth: 3,
          borderColor: '#EE6666',
          color: 'yellow'
        }
      }
    ]
  };

  // 使用指定的配置项和数据显示图表
  chartMovies.setOption(optionMovies);
</script>