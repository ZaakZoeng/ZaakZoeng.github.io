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
    <div class="row row-cols-2">
      <div>My movies</div>
      <div id="chart-container" style="width: 100%; height: 500px;"></div>
    </div>
  </div>
  <div class="grid"></div>

  <!-- Movies -->
  <h2 class="category">Movies</h2>
  <div class="container">
    <div class="row row-cols-2">
      <div>My movies</div>
      <div id="chart-container" style="width: 100%; height: 500px;"></div>
  </div>
  <div class="grid"></div>

  <!-- Travels -->
  <h2 class="category">Travels</h2>
  <div class="container">
    <div class="row row-cols-2">
      <div>My movies</div>
      <div id="chart-container" style="width: 100%; height: 500px;"></div>
    </div>
  </div>
  <div class="grid"></div>
</div>

<!-- 引入 ECharts 库 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.0/echarts.min.js"></script>

<script>
  // 基于准备好的dom，初始化echarts实例
  var chart = echarts.init(document.getElementById('chart-container'));

  // 配置图表
  var option = {
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
  chart.setOption(option);
</script>