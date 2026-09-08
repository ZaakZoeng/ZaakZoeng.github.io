---
layout: about
title: About
permalink: /
subtitle: Shenzhen, China (zhangze@szu.edu.cn)

profile:
  align: right
  image: prof_pic.jpg
  image_circular: false # crops the image to make it circular
  more_info: >
    <p></p>

news: true  # includes a list of news items
latest_posts: false  # includes a list of the newest posts
selected_papers: true # includes a list of papers marked as "selected={true}"
social: true  # includes social icons at the bottom of the page
---
I'm Ze Zhang (张泽). I am currently a postdoctoral fellow at the [University of Science and Technology of China (USTC)](https://www.ustc.edu.cn/) and a full-time researcher at [Shenzhen University South China Hospital](https://sch.szu.edu.cn/) working under the supervision of my postdoctoral advisor, Prof. [Song Wu (吴松)](https://scholar.google.com/citations?hl=en&user=InyuW5wAAAAJ). I received my Ph.D. in `Bioinformatics` from the [University of Chinese Academy of Sciences (UCAS)](https://www.ucas.ac.cn/) in July 2026. I began my graduate studies at [UCAS HIAS](http://hias.ucas.ac.cn/) in 2021 under the supervision of Prof. [Xiaoping Liu (刘小平)](https://scholar.google.com/citations?user=_yiMcX8AAAAJ&hl=zh-CN). In 2023, I transitioned from the master's track to the joint doctoral training program between UCAS HIAS and [BGI Hangzhou Research](https://research.genomics.cn/), under the joint supervision of Prof. [Luonan Chen (陈洛南)](https://scholar.google.com/citations?user=Uoqv8rkAAAAJ&hl=zh-CN&oi=ao) and Prof. [Xun Xu (徐讯)](https://scholar.google.com/citations?user=xb2Vc8MAAAAJ&hl=zh-CN&oi=ao). Before that, I received my B.Eng. in `Information Security` from [Nanchang University](http://www.ncu.edu.cn/).


### Education and Research Experience

<div class="education-timeline">
  <article class="education-card">
    <div class="education-logos" aria-label="University of Science and Technology of China and Shenzhen University">
      <span class="education-logo">
        <img src="{{ '/assets/img/about_preview/logo_USTC.png' | relative_url }}" alt="USTC logo" loading="lazy" decoding="async">
      </span>
      <span class="education-logo">
        <img src="{{ '/assets/img/about_preview/logo_SZU.png' | relative_url }}" alt="SZU logo" loading="lazy" decoding="async">
      </span>
    </div>
    <div class="education-content">
      <span class="education-period">2026.09~Present</span>
      <p><a href="https://www.ustc.edu.cn/">University of Science and Technology of China (USTC)</a>, Electronic Science and Technology, Postdoctoral Fellow, Supervisor: Prof. <a href="https://scholar.google.com/citations?hl=en&amp;user=InyuW5wAAAAJ">Song Wu (吴松)</a></p>
    </div>
  </article>

  <article class="education-card">
    <div class="education-logos" aria-label="University of Chinese Academy of Sciences and BGI">
      <span class="education-logo">
        <img src="{{ '/assets/img/about_preview/logo_UCAS.png' | relative_url }}" alt="UCAS logo" loading="lazy" decoding="async">
      </span>
      <span class="education-logo education-logo--wide">
        <img src="{{ '/assets/img/about_preview/logo_BGI.png' | relative_url }}" alt="BGI logo" loading="lazy" decoding="async">
      </span>
    </div>
    <div class="education-content">
      <span class="education-period">2021.09~2026.07</span>
      <p><a href="https://www.ucas.ac.cn/">University of Chinese Academy of Sciences (UCAS)</a>, Bioinformatics, Ph.D., Supervisors: Prof. <a href="https://scholar.google.com/citations?user=Uoqv8rkAAAAJ&amp;hl=zh-CN&amp;oi=ao">Luonan Chen (陈洛南)</a> and Prof. <a href="https://scholar.google.com/citations?user=xb2Vc8MAAAAJ&amp;hl=zh-CN&amp;oi=ao">Xun Xu (徐讯)</a></p>
    </div>
  </article>

  <article class="education-card">
    <div class="education-logos" aria-label="Nanchang University">
      <span class="education-logo">
        <img src="{{ '/assets/img/about_preview/logo_NCU.png' | relative_url }}" alt="NCU logo" loading="lazy" decoding="async">
      </span>
    </div>
    <div class="education-content">
      <span class="education-period">2017.09~2021.07</span>
      <p><a href="http://www.ncu.edu.cn/">Nanchang University</a>, Information Security, B.Eng.</p>
    </div>
  </article>
</div>


### Research Interests

My research lies at the intersection of bioinformatics, complex systems, and medical artificial intelligence. I focus on AI agents, AI virtual cells (AIVC), cross-species comparative multi-omics, dynamic network modeling, early warning of critical transitions, bioinformatics databases, and intelligent analysis platforms. My work aims to develop interpretable computational methods that integrate genomic, single-cell and spatial omics, and clinical data to characterize biological state transitions and support biomedical research and precision medicine.

- Comparative Multi-omics Analysis: Combined Analysis of Bulk, Single-cell, Spatial, Proteomics, Metabolomics, etc.
- Cross-species Comparative Studies: Cross-species Cell State Characterization and Multi-omics Integration
- Dynamic Critical Early Warning: Personalized Network Modeling and Disease Critical Early Warning
- AI Virtual Cell (AIVC): Perturbation Response Prediction and Cell State Transition Modeling
- Bioinformatics AI Agent: Multimodal, World Model, 3D Vision, 3D Perception


### Information and Links

<style>
  .education-timeline {
    position: relative;
    display: grid;
    gap: 0.9rem;
    margin: 1.25rem 0 2rem;
    padding-left: 1.2rem;
  }

  .education-timeline::before {
    position: absolute;
    inset: 0.75rem auto 0.75rem 0.18rem;
    width: 2px;
    content: "";
    background: linear-gradient(180deg, var(--global-theme-color), var(--global-divider-color));
  }

  .education-card {
    position: relative;
    display: grid;
    grid-template-columns: 128px minmax(0, 1fr);
    gap: 1.15rem;
    align-items: center;
    min-width: 0;
    padding: 1.05rem 1.15rem;
    border: 1px solid var(--global-divider-color);
    border-radius: 12px;
    background: var(--global-card-bg-color);
    box-shadow: 0 6px 20px rgba(30, 35, 50, 0.05);
    transition: transform 180ms ease, border-color 180ms ease, box-shadow 180ms ease;
  }

  .education-card::before {
    position: absolute;
    top: 50%;
    left: -1.48rem;
    width: 0.65rem;
    height: 0.65rem;
    border: 2px solid var(--global-card-bg-color);
    border-radius: 50%;
    content: "";
    background: var(--global-theme-color);
    box-shadow: 0 0 0 1px var(--global-theme-color);
    transform: translateY(-50%);
  }

  .education-card:hover {
    transform: translateX(3px);
    border-color: var(--global-theme-color);
    box-shadow: 0 10px 26px rgba(30, 35, 50, 0.09);
  }

  .education-logos {
    display: flex;
    flex-wrap: wrap;
    gap: 0.55rem;
    align-items: center;
    justify-content: center;
  }

  .education-logo {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 54px;
    height: 54px;
    padding: 0.3rem;
    border: 1px solid rgba(0, 0, 0, 0.08);
    border-radius: 10px;
    background: #fff;
  }

  .education-logo--wide {
    width: 62px;
  }

  .education-logo img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: contain;
  }

  .education-content {
    min-width: 0;
  }

  .education-period {
    display: inline-block;
    margin-bottom: 0.45rem;
    padding: 0.22rem 0.55rem;
    border-radius: 999px;
    background: rgba(112, 84, 165, 0.1);
    color: var(--global-theme-color);
    font-size: 0.76rem;
    font-weight: 650;
    letter-spacing: 0.02em;
  }

  .education-content p {
    margin: 0;
    font-size: 0.9rem;
    line-height: 1.65;
  }

  .education-content a {
    font-weight: 550;
  }

  .about-info-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
    margin: 2rem 0 1rem;
  }

  .about-info-card {
    position: relative;
    overflow: hidden;
    min-width: 0;
    padding: 1.2rem 1.25rem;
    border: 1px solid var(--global-divider-color);
    border-radius: 12px;
    background: var(--global-card-bg-color);
    box-shadow: 0 6px 20px rgba(30, 35, 50, 0.05);
    transition: transform 180ms ease, border-color 180ms ease, box-shadow 180ms ease;
  }

  .about-info-card::before {
    position: absolute;
    inset: 0 0 auto;
    height: 3px;
    content: "";
    background: var(--global-theme-color);
  }

  .about-info-card:hover {
    transform: translateY(-2px);
    border-color: var(--global-theme-color);
    box-shadow: 0 10px 26px rgba(30, 35, 50, 0.09);
  }

  .about-info-card h3 {
    margin: 0 0 0.85rem;
    color: var(--global-theme-color);
    font-size: 1.05rem;
    font-weight: 650;
  }

  .about-info-card ul {
    padding-left: 1.15rem;
    margin: 0;
  }

  .about-info-card li {
    margin: 0.35rem 0;
    line-height: 1.55;
  }

  .about-info-card a {
    overflow-wrap: anywhere;
  }

  html[data-theme="dark"] .about-info-card {
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.16);
  }

  html[data-theme="dark"] .education-card {
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.16);
  }

  @media (max-width: 640px) {
    .education-timeline {
      padding-left: 0;
    }

    .education-timeline::before,
    .education-card::before {
      display: none;
    }

    .education-card {
      grid-template-columns: 1fr;
      gap: 0.8rem;
      align-items: start;
      padding: 1rem;
    }

    .education-card:hover {
      transform: translateY(-2px);
    }

    .education-logos {
      justify-content: flex-start;
    }

    .about-info-grid {
      grid-template-columns: 1fr;
      gap: 0.8rem;
      margin-top: 1.5rem;
    }

    .about-info-card {
      padding: 1.05rem 1.1rem;
    }
  }

  @media (prefers-reduced-motion: reduce) {
    .education-card,
    .about-info-card {
      transition: none;
    }
  }
</style>

<div class="about-info-grid">
  <section class="about-info-card">
    <h3>Skills</h3>
    <ul>
      <li>Data Mining, Software Design</li>
      <li>PyTorch, Vue, Django, Express, Element Plus</li>
      <li>Python, TypeScript, R</li>
    </ul>
  </section>

  <section class="about-info-card">
    <h3>Hobbies</h3>
    <ul>
      <li>Blogging</li>
      <li>Basketball, Swimming, Tennis</li>
      <li>Nunchaku</li>
    </ul>
  </section>

  <section class="about-info-card">
    <h3>Email</h3>
    <ul>
      <li><a href="mailto:zhangze@szu.edu.cn">zhangze@szu.edu.cn</a></li>
      <li><a href="mailto:zaakzoeng@gmail.com">zaakzoeng@gmail.com</a></li>
    </ul>
  </section>

  <section class="about-info-card">
    <h3>Community &amp; Collaborators</h3>
    <ul>
      <li><a href="https://2bf.biometa.top">2BF-Club</a></li>
      <li><a href="https://dongwonka.github.io/">Dong Wang (汪栋)</a></li>
    </ul>
  </section>
</div>
