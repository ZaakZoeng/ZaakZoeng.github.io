---
layout: page
title: Activities
permalink: /activities/
description: The digital center of Ze Zhang's activities.
nav: true
nav_order: 3
# display_categories: [sports, tickets, travels]
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

  <!-- Tickets -->
  <h2 class="category">Tickets</h2>
  <div class="container">
    <div id="echart-tickets" style="width: 100%; height: 500px;"></div>
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

<!-- 引入 百度地图AK -->
<script src="https://api.map.baidu.com/api?v=3.0&ak=Xdp40nHl9e5tLwMiDoqhv8HbB4Z2sErJ"></script>

<!-- Sports -->
<script>
  var chartSports = echarts.init(document.getElementById('echart-sports'));

  var dataSports = {};
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
  dataSports.dataBasketball = dataFormatter({
      2025: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      2024: [4, 1, 5, 6, 7, 5, 6, 1, 5, 3, 8, 3],
      2023: [0, 3, 2, 7, 7, 0, 6, 3, 3, 2, 5, 3]
  });
  dataSports.dataSwimming = dataFormatter({
      2025: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      2024: [0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1],
      2023: [0, 4, 5, 5, 4, 0, 0, 0, 2, 3, 1, 2]
  });
  dataSports.dataFit = dataFormatter({
      2025: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      2024: [0, 2, 9, 0, 6, 1, 9, 6, 7, 6, 10, 9],
      2023: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  });
  dataSports.dataBadminton = dataFormatter({
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
          { data: dataSports.dataBasketball['2023'] },
          { data: dataSports.dataSwimming['2023'] },
          { data: dataSports.dataFit['2023'] },
          { data: dataSports.dataBadminton['2023'] },
          {
            data: [
              { name: 'Basketball 🏀', value: dataSports.dataBasketball['2023sum'] },
              { name: 'Swimming 🏊', value: dataSports.dataSwimming['2023sum'] },
              { name: 'Fit 💪', value: dataSports.dataFit['2023sum'] },
              { name: 'Badminton 🏸', value: dataSports.dataBadminton['2023sum'] }
            ]
          }
        ]
      },
      {
        title: { text: "Ze Zhang's Sports in 2024" },
        series: [
          { data: dataSports.dataBasketball['2024'] },
          { data: dataSports.dataSwimming['2024'] },
          { data: dataSports.dataFit['2024'] },
          { data: dataSports.dataBadminton['2024'] },
          {
            data: [
              { name: 'Basketball 🏀', value: dataSports.dataBasketball['2024sum'] },
              { name: 'Swimming 🏊', value: dataSports.dataSwimming['2024sum'] },
              { name: 'Fit 💪', value: dataSports.dataFit['2024sum'] },
              { name: 'Badminton 🏸', value: dataSports.dataBadminton['2024sum'] }
            ]
          }
        ]
      },
      {
        title: { text: "Ze Zhang's Sports in 2025" },
        series: [
          { data: dataSports.dataBasketball['2025'] },
          { data: dataSports.dataSwimming['2025'] },
          { data: dataSports.dataFit['2025'] },
          { data: dataSports.dataBadminton['2025'] },
          {
            data: [
              { name: 'Basketball 🏀', value: dataSports.dataBasketball['2025sum'] },
              { name: 'Swimming 🏊', value: dataSports.dataSwimming['2025sum'] },
              { name: 'Fit 💪', value: dataSports.dataFit['2025sum'] },
              { name: 'Badminton 🏸', value: dataSports.dataBadminton['2025sum'] }
            ]
          }
        ]
      }
    ]
  };

  chartSports.setOption(optionSports);
</script>

<!-- Tickets -->
<script>
  var chartTickets = echarts.init(document.getElementById('echart-tickets'));

  let dataTickets = [
    { name: "流浪地球2", type: "电影票", date: "2023-01-24", location: "邢台宁晋县", members: ["宇航", "雨晴", "雨泽", "储祎"] },
    { name: "绝望主夫", type: "电影票", date: "2022-12-31", location: "深圳", members: ["媛媛"] },
    { name: "宠爱", type: "电影票", date: "2019-12-31", location: "南昌", members: ["媛媛"] },
    { name: "温暖的抱抱", type: "电影票", date: "2021-01-01", location: "深圳", members: ["媛媛"] },
    { name: "送你一朵小红花", type: "电影票", date: "2021-01-02", location: "深圳", members: ["媛媛"] },
    { name: "变形金刚5：最后的骑士", type: "电影票", date: "2017-06-23", location: "衡水枣强", members: ["高中同学"] },
    { name: "战狼2", type: "电影票", date: "2017-08-06", location: "淄博", members: ["宇航", "雨晴"] },
    { name: "羞羞的铁拳", type: "电影票", date: "2017-10-02", location: "南昌", members: ["宇航", "牛泽岩", "吴昱昆"] },
    { name: "至暗时刻", type: "电影票", date: "2017-12-05", location: "南昌", members: ["吴昱昆"] },
    { name: "解忧杂货店", type: "电影票", date: "2017-12-31", location: "南昌", members: ["孙朝歌", "方志"] },
    { name: "捉妖记2", type: "电影票", date: "2018-02-19", location: "邢台宁晋县", members: ["微姐", "姐夫", "杨宇哥", "大嫂", "宇航"] },
    { name: "一出好戏", type: "电影票", date: "2018-08-12", location: "邢台宁晋县", members: ["宇航", "雨晴"] },
    { name: "绿皮书", type: "电影票", date: "2019-03-16", location: "南昌", members: ["吴昱昆"] },
    { name: "1/2的魔法", type: "电影票", date: "2020-08-30", location: "邢台宁晋县", members: ["雨泽"] },
    { name: "起跑线", type: "电影票", date: "2018-04-15", location: "南昌", members: ["媛媛"] },
    { name: "超时空同居", type: "电影票", date: "2018-06-08", location: "南昌", members: ["媛媛"] },
    { name: "侏罗纪世界2", type: "电影票", date: "2018-06-16", location: "南昌", members: ["媛媛"] },
    { name: "邪不压正", type: "电影票", date: "2018-07-15", location: "南昌", members: ["媛媛", "泽培", "张涵"] },
    { name: "摩天营救", type: "电影票", date: "2018-07-20", location: "南昌", members: ["媛媛"] },
    { name: "反贪风暴3", type: "电影票", date: "2018-09-23", location: "南昌", members: ["媛媛"] },
    { name: "无双", type: "电影票", date: "2018-10-06", location: "南昌", members: ["媛媛"] },
    { name: "功夫联盟", type: "电影票", date: "2018-10-26", location: "南昌", members: ["媛媛"] },
    { name: "毒液：致命守护者", type: "电影票", date: "2018-11-10", location: "南昌", members: ["媛媛"] },
    { name: "神奇动物：格林德沃之罪", type: "电影票", date: "2018-11-17", location: "南昌", members: ["媛媛"] },
    { name: "印度暴徒", type: "电影票", date: "2019-01-01", location: "南昌", members: ["媛媛"] },
    { name: "阿丽塔：战斗天使", type: "电影票", date: "2019-03-02", location: "南昌", members: ["媛媛"] },
    { name: "反贪风暴4", type: "电影票", date: "2019-04-05", location: "南昌", members: ["媛媛"] },
    { name: "雷霆沙赞！", type: "电影票", date: "2019-04-06", location: "南昌", members: ["媛媛"] },
    { name: "复仇者联盟4：终局之战", type: "电影票", date: "2019-04-27", location: "南昌", members: ["媛媛", "沈然等同学"] },
    { name: "大侦探皮卡丘", type: "电影票", date: "2019-05-18", location: "南昌", members: ["媛媛"] },
    { name: "蜘蛛侠：英雄远征", type: "电影票", date: "2019-06-28", location: "南昌", members: ["媛媛"] },
    { name: "哪吒之魔童降世", type: "电影票", date: "2019-07-28", location: "南昌", members: [] },
    { name: "铤而走险", type: "电影票", date: "2019-09-01", location: "南昌", members: ["媛媛"] },
    { name: "我和我的祖国", type: "电影票", date: "2019-10-02", location: "南昌", members: ["媛媛"] },
    { name: "中国机长", type: "电影票", date: "2019-10-07", location: "南昌", members: ["媛媛"] },
    { name: "少年的你", type: "电影票", date: "2019-10-29", location: "南昌", members: ["媛媛"] },
    { name: "受益人", type: "电影票", date: "2019-11-10", location: "南昌", members: ["媛媛"] },
    { name: "大约在冬季", type: "电影票", date: "2019-11-23", location: "南昌", members: ["媛媛"] },
    { name: "冰雪奇缘", type: "电影票", date: "2019-11-30", location: "南昌", members: ["媛媛"] },
    { name: "勇敢者游戏2：再战巅峰", type: "电影票", date: "2019-12-15", location: "南昌", members: ["媛媛"] },
    { name: "叶问4：完结篇", type: "电影票", date: "2020-01-04", location: "南昌", members: ["媛媛"] },
    { name: "误杀", type: "电影票", date: "2020-01-05", location: "南昌", members: ["媛媛"] },
    { name: "我和我的家乡", type: "电影票", date: "2020-10-11", location: "南昌", members: ["媛媛"] },
    { name: "金刚川", type: "电影票", date: "2020-10-31", location: "南昌", members: ["媛媛"] },
    { name: "疯狂原始人2", type: "电影票", date: "2020-11-29", location: "南昌", members: ["媛媛"] },
    { name: "日不落酒店", type: "电影票", date: "2021-03-21", location: "南昌", members: ["媛媛"] },
    { name: "我的姐姐", type: "电影票", date: "2021-04-02", location: "南昌", members: ["媛媛"] },
    { name: "从家返校", type: "电影票", date: "2021-04-04", location: "南昌", members: ["媛媛", "宇航"] },
    { name: "名侦探柯南：绯色的子弹", type: "电影票", date: "2021-04-17", location: "南昌", members: ["媛媛"] },
    { name: "悬崖之上", type: "电影票", date: "2021-05-16", location: "南昌", members: ["媛媛"] },
    { name: "速度与激情9", type: "电影票", date: "2021-05-22", location: "南昌", members: ["媛媛"] },
    { name: "扫黑·决战", type: "电影票", date: "2021-05-23", location: "南昌", members: ["媛媛"] },
    { name: "人之怒", type: "电影票", date: "2021-06-04", location: "南昌", members: ["媛媛"] },
    { name: "黑白魔女库伊拉", type: "电影票", date: "2021-06-12", location: "南昌", members: ["媛媛"] },
    { name: "1921", type: "电影票", date: "2021-07-01", location: "南昌", members: ["媛媛", "师妹等人"] },
    { name: "比得兔2：逃跑计划", type: "电影票", date: "2021-07-03", location: "武汉", members: ["媛媛"] },
    { name: "蚁人2：黄蜂女现身", type: "电影票", date: "2018-09-01", location: "南昌", members: ["媛媛"] },
    { name: "蚁人2：黄蜂女现身", type: "电影票", date: "2018-08-25", location: "邢台宁晋县", members: [] },
    { name: "神探大战", type: "电影票", date: "2022-08-04", location: "深圳", members: ["媛媛"] },
    { name: "扫黑行动", type: "电影票", date: "2022-11-20", location: "杭州", members: ["自己"] },
    { name: "夺冠（中国女排）", type: "电影票", date: "2020-09-30", location: "南昌", members: ["媛媛"] },
    { name: "扬名立万", type: "电影票", date: "2021-12-05", location: "杭州", members: ["远哥"] },
    { name: "独行月球", type: "电影票", date: "2022-07-30", location: "深圳", members: ["媛媛"] },
    { name: "你好，李焕英", type: "电影票", date: "2021-02-06", location: "邢台宁晋县", members: ["雨泽", "孙贺等朋友"] },
    { name: "失控玩家", type: "电影票", date: "2021-09-05", location: "杭州", members: ["6110寝室室友"] },
    { name: "我和我的父辈", type: "电影票", date: "2021-09-30", location: "深圳", members: ["媛媛"] },
    { name: "长津湖", type: "电影票", date: "2021-10-03", location: "深圳", members: ["媛媛"] },
    { name: "我和我的父辈", type: "电影票", date: "2021-10-24", location: "杭州", members: ["支部活动"] },
    { name: "神秘海域", type: "电影票", date: "2022-06-02", location: "杭州", members: ["媛媛"] },
    { name: "新神榜·杨戬", type: "电影票", date: "2022-08-22", location: "邢台宁晋县", members: ["雨泽"] },
    { name: "万里归途", type: "电影票", date: "2022-10-01", location: "深圳", members: ["媛媛"] },
    { name: "还是觉得你最好", type: "电影票", date: "2022-10-03", location: "深圳", members: ["媛媛"] },
    { name: "阿凡达·水之道", type: "电影票", date: "2022-12-16", location: "杭州", members: ["蔡哥", "春露"] },
    { name: "满江红", type: "电影票", date: "2023-02-04", location: "深圳", members: ["媛媛"] },
    { name: "风再起时", type: "电影票", date: "2023-02-04", location: "深圳", members: ["媛媛"] },
    { name: "我们所不能表达的---理想后花园2022巡演 杭州站", type: "LiveHouse", date: "2022-12-05", location: "杭州MAO Livehouse", members: ["伊凝"] },
    { name: "笑果脱口秀", type: "脱口秀", date: "2023-03-11", location: "杭州运河大剧院 歌剧院", members: ["自己"] },
    { name: "毒舌律师", type: "电影票", date: "2023-02-26", location: "杭州", members: ["蔡哥"] },
    { name: "断网", type: "电影票", date: "2023-03-03", location: "杭州", members: ["春露"] },
    { name: "保你平安", type: "电影票", date: "2023-03-25", location: "深圳", members: ["媛媛"] },
    { name: "龙与地下城：侠盗荣耀", type: "电影票", date: "2023-04-11", location: "杭州", members: ["奇彬", "晓贝", "焦焦", "小钟"] },
    { name: "灌篮高手", type: "电影票", date: "2023-04-21", location: "杭州", members: ["奇彬", "晓贝", "焦焦", "小钟"] },
    { name: "人生路不熟", type: "电影票", date: "2023-04-29", location: "深圳", members: ["媛媛"] },
    { name: "天星小轮", type: "旅游景点门票", date: "2023-05-02", location: "香港", members: ["媛媛"] },
    { name: "速度与激情10", type: "电影票", date: "2023-05-17", location: "杭州", members: ["扬哥", "春露"] },
    { name: "蜘蛛侠：纵横宇宙", type: "电影票", date: "2023-06-02", location: "杭州", members: ["奇彬", "焦焦", "小钟"] },
    { name: "长安三万里", type: "电影票", date: "2023-07-08", location: "杭州", members: ["扬哥", "春露", "扬哥师弟"] },
    { name: "碟中谍7：致命清算（上）", type: "电影票", date: "2023-07-14", location: "杭州", members: ["奇彬", "晓贝", "小钟"] },
    { name: "超能一家人", type: "电影票", date: "2023-07-21", location: "杭州", members: ["扬哥", "春露"] },
    { name: "芭比 Barbie", type: "电影票", date: "2023-07-31", location: "杭州", members: ["奇彬", "承尚", "小钟", "晓贝", "黄康", "书宁"] },
    { name: "巨齿鲨2", type: "电影票", date: "2023-08-08", location: "廊坊", members: ["泽培"] },
    { name: "学爸", type: "电影票", date: "2023-08-20", location: "深圳", members: ["媛媛"] },
    { name: "孤注一掷", type: "电影票", date: "2023-08-24", location: "深圳", members: ["媛媛"] },
    { name: "暗杀风暴", type: "电影票", date: "2023-08-25", location: "深圳", members: ["媛媛"] },
    { name: "奥本海默", type: "电影票", date: "2023-08-30", location: "杭州", members: ["chenlab", "linlab"] },
    { name: "泰山", type: "旅游景点门票", date: "2023-09-25", location: "山东泰安", members: ["承尚", "焦焦", "嘉琛", "王博", "中明"] },
    { name: "鲁迅故里", type: "旅游景点门票", date: "2023-10-02", location: "浙江绍兴", members: ["伊凝", "楠总"] },
    { name: "亚运会篮球赛", type: "旅游景点门票", date: "2023-10-02", location: "浙大紫金港校区", members: ["伊凝"] },
    { name: "坚如磐石", type: "电影票", date: "2023-10-03", location: "杭州", members: ["自己"] },
    { name: "河边的错误", type: "电影票", date: "2023-10-21", location: "深圳", members: ["媛媛"] },
    { name: "志愿军：雄兵出击", type: "电影票", date: "2023-10-27", location: "杭州", members: ["华大党支部"] },
    { name: "涉过愤怒的海", type: "电影票", date: "2023-11-25", location: "杭州", members: ["媛媛"] },
    { name: "三大队", type: "电影票", date: "2023-12-16", location: "深圳", members: ["媛媛"] },
    { name: "天屿山观景台", type: "旅游景点门票", date: "2024-01-28", location: "千岛湖", members: ["方方", "志伟"] },
    { name: "第二十条", type: "电影票", date: "2024-02-18", location: "深圳", members: ["媛媛"] },
    { name: "澳门一人游", type: "旅游景点门票", date: "2024-02-19", location: "澳门", members: ["自己"] },
    { name: "九龙城寨之围城", type: "电影票", date: "2024-05-02", location: "深圳", members: ["媛媛"] },
    { name: "末路狂发钱", type: "电影票", date: "2024-05-04", location: "深圳", members: ["媛媛"] },
    { name: "走走停停", type: "电影票", date: "2024-06-10", location: "深圳", members: ["媛媛"] },
    { name: "抓娃娃", type: "电影票", date: "2024-08-10", location: "北京", members: ["伊凝", "雨泽"] },
    { name: "圆明园", type: "旅游景点门票", date: "2024-08-12", location: "北京", members: ["雨泽"] },
    { name: "颐和园", type: "旅游景点门票", date: "2024-08-12", location: "北京", members: ["雨泽"] },
    { name: "长隆海洋王国", type: "旅游景点门票", date: "2024-08-16", location: "珠海", members: ["蔡哥", "雨泽"] },
    { name: "白蛇·浮生", type: "电影票", date: "2024-08-18", location: "杭州", members: ["雨泽"] },
    { name: "一雪前耻", type: "电影票", date: "2024-09-15", location: "深圳", members: ["媛媛"] },
    { name: "大场面", type: "电影票", date: "2024-09-16", location: "深圳", members: ["媛媛"] },
    { name: "南昌大学杭州校友会", type: "旅游景点门票", date: "2024-10-19", location: "杭州之江饭店", members: ["旺哥", "远哥", "威哥"] },
    { name: "毒液·最后一舞", type: "电影票", date: "2024-10-26", location: "深圳", members: ["媛媛"] },
    { name: "志愿军·生死存亡", type: "电影票", date: "2024-10-31", location: "杭州", members: ["华大党支部"] },
    { name: "好东西", type: "电影票", date: "2024-11-30", location: "杭州", members: ["媛媛"] },
    { name: "误杀3", type: "电影票", date: "2024-12-28", location: "深圳", members: ["媛媛"] },
    { name: "破·地狱", type: "电影票", date: "2024-12-29", location: "深圳", members: ["媛媛"] }
  ];

  // 统计函数
  function statisticTickets(data) {
    // 1. 按日期排序
    data.sort((a, b) => new Date(a.date) - new Date(b.date));

    // 2. 创建一个对象，用于存储每个月的次数
    const monthCountMapMovies = {}; // 电影票的统计
    const monthCountMapOthers = {}; // 其他票据的统计
    const monthDetails = {}; // 每个月的票据名称和地点

    // 3. 遍历数据，统计每个月的次数
    data.forEach(item => {
      // 提取日期中的年份和月份（格式：YYYY-MM）
      const yearMonth = item.date.slice(0, 7); // 提取年份和月份

      // 根据 type 统计次数
      if (item.type === "电影票") {
        if (!monthCountMapMovies[yearMonth]) {
          monthCountMapMovies[yearMonth] = 0;
        }
        monthCountMapMovies[yearMonth]++;
      } else {
        if (!monthCountMapOthers[yearMonth]) {
          monthCountMapOthers[yearMonth] = 0;
        }
        monthCountMapOthers[yearMonth]++;
      }
      
      // 记录每个月的票据名称和地点
      if (!monthDetails[yearMonth]) {
        monthDetails[yearMonth] = [];
      }
      monthDetails[yearMonth].push({
        name: item.name,
        location: item.location
      });
    });

    // 4. 生成完整的年份-月份列表（从最早到最晚）
    const allMonths = [];
    const startDate = new Date(data[0].date); // 最早的日期
    const endDate = new Date(data[data.length - 1].date); // 最晚的日期

    let currentDate = new Date(startDate);
    while (currentDate <= endDate) {
      const yearMonth = currentDate.toISOString().slice(0, 7); // 格式化为 YYYY-MM
      allMonths.push(yearMonth);
      currentDate.setMonth(currentDate.getMonth() + 1); // 增加一个月
    }

    // 5. 生成结果数组
    const month = allMonths; // 年份-月份列表
    const movies = allMonths.map(month => monthCountMapMovies[month] || 0); // 电影票的每月次数
    const others = allMonths.map(month => monthCountMapOthers[month] || 0); // 其他票据的每月次数
    const details = allMonths.map(month => monthDetails[month] || []); // 每个月的票据名称和地点
    
    return {
      month,
      movies,
      others,
      details
    };
  }

  // 调用函数并获取结果
  const { month, movies, others, details } = statisticTickets(dataTickets);

  var optionTickets = {
    title: {
      text: "Ze Zhang's Monthly Tickets",
      left: 'center',
    },
    tooltip: {
      trigger: 'axis',
      formatter: function (params) {
        const month = params[0].name; // 当前月份
        const moviesCount = params[0].value; // 电影票数量
        const othersCount = params[1].value; // 其他票据数量
        const details = params[0].data.details; // 当前月份的票据详情

        let tooltipText = `${month}<br>`;
        tooltipText += `电影票: ${moviesCount} 次<br>`;
        tooltipText += `其他票据: ${othersCount} 次<br>`;
        tooltipText += `<br>`;

        details.forEach(item => {
          tooltipText += `《${item.name}》 (📍${item.location})<br>`;
        });

        return tooltipText;
      }
    },
    legend: {
      top: 50,
      data: ['🎦 Movies', '🎫 Others']
    },
    grid: {
      // left: '3%',
      // right: '4%',
      // bottom: '3%',
      // containLabel: true,
      top: 100,
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
    toolbox: {
      right: '0',
      feature: {
        dataView: { show: true, readOnly: false },
        magicType: { show: true, type: ['line', 'bar'] },
        restore: { show: true },
        saveAsImage: { show: true }
      }
    },
    xAxis: {
      type: 'category',
      data: month
    },
    yAxis: [
      {
        type: 'value',
        name: 'Counts'
      }
    ],
    dataZoom: [
      {
        type: 'inside', // 内部缩放
        start: 85, // 默认从 80% 开始
        end: 100 // 默认到 100% 结束
      },
      {
        type: 'slider', // 滑动条
        start: 85, // 默认从 80% 开始
        end: 100 // 默认到 100% 结束
      }
    ],
    series: [
      {
        name: '🎦 Movies',
        type: 'line',
        step: 'start',
        data: movies.map((value, index) => ({
          value,
          details: details[index] // 将 details 绑定到每个数据点
        }))
      },
      {
        name: '🎫 Others',
        type: 'line',
        step: 'end',
        data: others.map((value, index) => ({
          value,
          details: details[index] // 将 details 绑定到每个数据点
        }))
      }
    ]
  };

  chartTickets.setOption(optionTickets);
</script>

<!-- Travels -->
<script>
  var chartTravels = echarts.init(document.getElementById('echart-travels'));

  var dataTravels = [
    { name: '邢台宁晋县', value: 31 },
    { name: '石家庄', value: 24 },
    { name: '衡水', value: 2 },
    { name: '淄博', value: 3 },
    { name: '辛集', value: 2 },
    { name: '南昌', value: 54 },
    { name: '长沙', value: 2 },
    { name: '天津', value: 1 },
    { name: '武汉', value: 3 },
    { name: '深圳', value: 63 },
    { name: '杭州', value: 63 },
    { name: '余姚', value: 2 },
    { name: '香港', value: 7 },
    { name: '广州', value: 2 },
    { name: '上海', value: 2 },
    { name: '舟山', value: 1 },
    { name: '北京', value: 12 },
    { name: '廊坊', value: 3 },
    { name: '诸暨', value: 2 },
    { name: '绍兴', value: 4 },
    { name: '南京', value: 1 },
    { name: '泰安', value: 3 },
    { name: '青岛', value: 4 },
    { name: '千岛湖', value: 3 },
    { name: '海口', value: 5 },
    { name: '文昌', value: 1 },
    { name: '琼海博鳌', value: 2 },
    { name: '澳门', value: 4 },
    { name: '珠海', value: 2 },
    { name: '丰城', value: 2 }
  ];
  var geoCoordMap = {
    邢台宁晋县: [114.48, 37.05],
    石家庄: [114.48, 38.03],
    衡水: [115.72, 37.52],
    淄博: [118.05, 36.81],
    辛集: [115.22, 37.94],
    南昌: [115.89, 28.68],
    长沙: [112.93, 28.23],
    天津: [117.20, 39.12],
    武汉: [114.30, 30.59],
    深圳: [114.07, 22.62],
    杭州: [120.19, 30.26],
    余姚: [121.56, 29.86],
    香港: [114.17, 22.32],
    广州: [113.23, 23.16],
    上海: [121.48, 31.22],
    舟山: [122.20, 29.98],
    北京: [116.46, 39.92],
    廊坊: [116.70, 39.53],
    诸暨: [120.23, 29.71],
    绍兴: [120.58, 30.01],
    南京: [118.78, 32.04],
    泰安: [117.13, 36.18],
    青岛: [120.33, 36.07],
    千岛湖: [119.04, 29.61],
    海口: [110.20, 20.04],
    文昌: [110.80, 19.54],
    琼海博鳌: [110.58, 19.16],
    澳门: [113.54, 22.19],
    珠海: [113.57, 22.27],
    丰城: [115.78, 28.19],
  };
  var convertData = function (data) {
    var res = [];
    for (var i = 0; i < data.length; i++) {
      var geoCoord = geoCoordMap[data[i].name];
      if (geoCoord) {
        res.push({
          name: data[i].name,
          value: geoCoord.concat(data[i].value)
        });
      }
    }
    return res;
  };
  // function renderItem(params, api) {
  //   var coords = [
  //     [116.46, 39.92],  // 北京
  //     [120.33, 36.07],  // 青岛
  //     [122.20, 29.98],  // 舟山
  //     [114.17, 22.32],  // 香港
  //     [110.58, 19.16],  // 琼海博鳌
  //     [110.20, 20.04],  // 海口
  //     // [113.23, 23.16],  // 广州
  //     [114.48, 38.03],  // 石家庄
  //   ];
  //   var points = [];
  //   for (var i = 0; i < coords.length; i++) {
  //     points.push(api.coord(coords[i]));
  //   }
  //   var color = api.visual('color');
  //   return {
  //     type: 'polygon',
  //     shape: {
  //       points: echarts.graphic.clipPointsByRect(points, {
  //         x: params.coordSys.x,
  //         y: params.coordSys.y,
  //         width: params.coordSys.width,
  //         height: params.coordSys.height
  //       })
  //     },
  //     style: api.style({
  //       fill: color,
  //       stroke: echarts.color.lift(color)
  //     })
  //   };
  // };

  var optionTravels = {
      toolbox: {
      feature: {
        dataView: { show: true, readOnly: false },
        magicType: { show: true, type: ['line', 'bar'] },
        restore: { show: true },
        saveAsImage: { show: true }
      }
    },
    backgroundColor: 'transparent',
    title: {
      text: "Ze Zhang's Travel Footprint",
      // subtext: 'data from PM25.in',
      // sublink: 'http://www.pm25.in',
      left: 'center',
      textStyle: {
        color: '#fff'
      }
    },
    tooltip: {
      trigger: 'item'
    },
    bmap: {
      center: [104.114129, 32.550339],
      zoom: 5,
      roam: true,
      mapStyle: {
        styleJson: [
          {
            featureType: 'water',
            elementType: 'all',
            stylers: {
              color: '#044161'
            }
          },
          {
            featureType: 'land',
            elementType: 'all',
            stylers: {
              color: '#004981'
            }
          },
          {
            featureType: 'boundary',
            elementType: 'geometry',
            stylers: {
              color: '#064f85'
            }
          },
          {
            featureType: 'railway',
            elementType: 'all',
            stylers: {
              visibility: 'off'
            }
          },
          {
            featureType: 'highway',
            elementType: 'geometry',
            stylers: {
              color: '#004981'
            }
          },
          {
            featureType: 'highway',
            elementType: 'geometry.fill',
            stylers: {
              color: '#005b96',
              lightness: 1
            }
          },
          {
            featureType: 'highway',
            elementType: 'labels',
            stylers: {
              visibility: 'off'
            }
          },
          {
            featureType: 'arterial',
            elementType: 'geometry',
            stylers: {
              color: '#004981'
            }
          },
          {
            featureType: 'arterial',
            elementType: 'geometry.fill',
            stylers: {
              color: '#00508b'
            }
          },
          {
            featureType: 'poi',
            elementType: 'all',
            stylers: {
              visibility: 'off'
            }
          },
          {
            featureType: 'green',
            elementType: 'all',
            stylers: {
              color: '#056197',
              visibility: 'off'
            }
          },
          {
            featureType: 'subway',
            elementType: 'all',
            stylers: {
              visibility: 'off'
            }
          },
          {
            featureType: 'manmade',
            elementType: 'all',
            stylers: {
              visibility: 'off'
            }
          },
          {
            featureType: 'local',
            elementType: 'all',
            stylers: {
              visibility: 'off'
            }
          },
          {
            featureType: 'arterial',
            elementType: 'labels',
            stylers: {
              visibility: 'off'
            }
          },
          {
            featureType: 'boundary',
            elementType: 'geometry.fill',
            stylers: {
              color: '#029fd4'
            }
          },
          {
            featureType: 'building',
            elementType: 'all',
            stylers: {
              color: '#1a5787'
            }
          },
          {
            featureType: 'label',
            elementType: 'all',
            stylers: {
              visibility: 'off'
            }
          }
        ]
      }
    },
    series: [
      {
        // name: 'pm2.5',
        type: 'scatter',
        coordinateSystem: 'bmap',
        data: convertData(dataTravels),
        encode: {
          value: 2
        },
        symbolSize: function (val) {
          // return val[2] / 2;
          return 8
        },
        label: {
          formatter: '{b}',
          position: 'right'
        },
        itemStyle: {
          color: '#ddb926'
        },
        emphasis: {
          label: {
            show: true
          }
        }
      },
      {
        // name: 'Top 5',
        name: 'Times',
        type: 'effectScatter',
        coordinateSystem: 'bmap',
        data: convertData(
          dataTravels
            .sort(function (a, b) {
              return b.value - a.value;
            })
            // .slice(0, 6)
        ),
        encode: {
          value: 2
        },
        symbolSize: function (val) {
          return val[2] / 3;
        },
        showEffectOn: 'emphasis',
        rippleEffect: {
          brushType: 'stroke'
        },
        hoverAnimation: true,
        label: {
          formatter: '{b}',
          position: 'right',
          show: true
        },
        itemStyle: {
          color: '#f4e925',
          shadowBlur: 10,
          shadowColor: '#333'
        },
        zlevel: 1
      // },
      // {
      //   type: 'custom',
      //   coordinateSystem: 'bmap',
      //   renderItem: renderItem,
      //   itemStyle: {
      //     opacity: 0.5
      //   },
      //   animation: false,
      //   silent: true,
      //   data: [0],
      //   z: -10
      }
    ]
  };

  chartTravels.setOption(optionTravels);
</script>