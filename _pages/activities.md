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

<div class="projects">
  <h2 class="category">2. 将 ECharts 代码嵌入到现有页面中</h2>
  <div class="container">
    <div class="row">
      <div class="col">
        <!-- ECharts 图表容器 -->
        <div id="chart-container" style="width: 100%; height: 400px;"></div>
      </div>
    </div>
  </div>

  <h2 class="category">4. 使用 Jekyll Include 插件</h2>
  <div class="container">
    <div class="row">
      <div class="col">
        <!-- 使用 include 标签嵌入图表 -->
        {% include echart-chart.html %}
      </div>
    </div>
  </div>

</div>

<!-- 引入 ECharts 库 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.0/echarts.min.js"></script>

<script>
  // 基于准备好的dom，初始化echarts实例
  var chart = echarts.init(document.getElementById('chart-container'));

  // 配置图表
  var option = {
    title: {
      text: 'ECharts 示例'
    },
    tooltip: {},
    xAxis: {
      data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
    },
    yAxis: {},
    series: [{
      name: '访问量',
      type: 'line',
      data: [120, 132, 101, 134, 90, 230, 210]
    }]
  };

  // 使用指定的配置项和数据显示图表
  chart.setOption(option);
</script>


<!-- pages/projects.md -->
<div class="projects">
  <!-- Sports -->
  <h2 class="category">Sports</h2>
  <div class="container">
    <div class="row row-cols-2">
    Sports,sportstowsisgajgkl
    </div>
  </div>
  <div class="grid"></div>

  <!-- Movies -->
  <h2 class="category">Movies</h2>
  <div class="container">
    <div class="row row-cols-2">
    <div class="my-container">
      <h2>{{ page.title }}</h2>
      <!-- 使用 include 标签嵌入图表 -->
      {% include echart-chart.html %}
    </div>
    <!-- guanying -->
    <iframe src="{{ page.html_movies | relative_url }}" width="100%" height="500px" frameborder="0">
      <!-- 如果浏览器不支持 iframe，会显示以下内容 -->
      <p>Your browser does not support iframes.</p>
    </iframe>
    <iframe src="{{page.html_movies}}" width="100%" height="500px" frameborder="0">
      <!-- 如果浏览器不支持 iframe，会显示以下内容 -->
      <p>Your browser does not support iframes.</p>
    </iframe>
  </div>
  <div class="grid"></div>

  <!-- Travels -->
  <h2 class="category">Travels</h2>
  <div class="container">
    <div class="row row-cols-2">
    dgdgdgdgdgddgdgdgdgdgd
    </div>
  </div>
  <div class="grid"></div>
</div>
