---
layout: page
title: Activities
permalink: /activities/
description: The digital center of Ze Zhang's activities.
nav: true
nav_order: 3
# display_categories: [sports, movies, travels]
html_movies: assets/html/movies.html
horizontal: false
---

<div class="projects">
  <h2 class="category">Interactive Chart Example</h2>
  <div class="container">
    <div class="row">
      <div class="col">
        <!-- 使用 include 标签嵌入图表 -->
        {% include echart-chart.html %}
      </div>
    </div>
  </div>
</div>

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
