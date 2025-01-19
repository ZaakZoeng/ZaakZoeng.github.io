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
    观影情况
    <div class="my-container">
      <h2>{{ page.title }}</h2>
      {% include my-container.html %}
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
