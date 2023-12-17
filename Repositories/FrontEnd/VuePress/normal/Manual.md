## 快速开始

1. **创建并进入一个新目录**

   ```bash
   mkdir vuepress-starter && cd vuepress-starter
   ```

2. **使用你喜欢的包管理器进行初始化**

   ```bash
   yarn init # npm init
   ```

3. **将 VuePress 安装为本地依赖**

   我们已经不再推荐全局安装 VuePress

   ```bash
   yarn add -D vuepress # npm install -D vuepress
   ```

4. **创建你的第一篇文档**

   ```bash
   mkdir docs && echo '# Hello VuePress' > docs/README.md
   ```

5. **在 `package.json` 中添加一些** [scripts(opens new window)](https://classic.yarnpkg.com/zh-Hans/docs/package-json#toc-scripts)

   这一步骤是可选的，但我们推荐你完成它。在下文中，我们会默认这些 scripts 已经被添加。

   ```json
   {
     "scripts": {
       "docs:dev": "vuepress dev docs",
       "docs:build": "vuepress build docs"
     }
   }
   ```

6. **在本地启动服务器**

   ```bash
   yarn docs:dev # npm run docs:dev
   ```

   VuePress 会在 [http://localhost:8080 (opens new window)](http://localhost:8080/) 启动热服务器

   

## 目录结构

### 结构

```bash
.
├── docs
│   ├── .vuepress (可选的)               # 用于存放全局的配置、组件、静态资源等
│   │   ├── components (可选的)          # 目录中	Vue 组件自动注册为全局组件
│   │   ├── theme (可选的)               # 用于存放本地主题
│   │   │   └── Layout.vue
│   │   ├── public (可选的)              # 静态资源目录
│   │   ├── styles (可选的)              # 用于存放样式相关的文件
│   │   │   ├── index.styl              # 全局样式文件,会生成CSS 文件,高默认优先级
│   │   │   └── palette.styl            # 默认颜色常量
│   │   ├── templates (可选的, 谨慎配置)  # 存储 HTML 模板文件
│   │   │   ├── dev.html                # 用于开发环境 HTML 模板文件 
│   │   │   └── ssr.html                # 构建时基于 Vue SSR 的 HTML 模板文件
│   │   ├── config.js (可选的)           # 配置文件入口文件, 也可以是 YML 或 toml
│   │   └── enhanceApp.js (可选的)       # 客户端应用增强
│   │ 
│   ├── README.md
│   ├── guide
│   │   └── README.md
│   └── config.md
│ 
└── package.json
```



### 路由

此处我们把 `docs` 目录作 `targetDir`

对于上述的目录结构，默认页面路由地址如下：

| 文件的相对路径     | 页面路由地址   |
| ------------------ | -------------- |
| `/README.md`       | `/`            |
| `/guide/README.md` | `/guide/`      |
| `/config.md`       | `/config.html` |





## 首页

### 基本配置

**位置：**<font color = orange> `docs/README.md` </font>

**配置：** 你可以将相应内容设置为 <font color = orange>`null`</font> 来禁用标题和副标题

```yaml
---
home: true
heroImage: /hero.png
heroText: Hero 标题
tagline: Hero 副标题
actionText: 快速上手 →
actionLink: /zh/guide/
features:
- title: 简洁至上
  details: 以 Markdown 为中心的项目结构，以最少的配置帮助你专注于写作。
- title: Vue驱动
  details: 享受 Vue + webpack 的开发体验，在 Markdown 中使用 Vue 组件，同时可以使用 Vue 来开发自定义主题。
- title: 高性能
  details: VuePress 为每个页面预渲染生成静态的 HTML，同时在页面被加载的时候，将作为 SPA 运行。
footer: MIT Licensed | Copyright © 2018-present Evan You
---
```



## 导航栏

### Logo

* 配置文件：<font color = orange>`.vuepress/config.js`</font>

* 图片存储：<font color = orange>`public/assets/img/`</font> 

 ```javascript
// .vuepress/config.js
 module.exports = {
     themeConfig: {
           logo: '/assets/img/logo.png',
     }
 }
 ```



### 链接

* 配置文件：<font color = orange>`.vuepress/config.js`</font>
* 配置方法：<font color = orange>`themeConfig.nav`</font>

```javascript
//  .vuepress/config.js  基础方法 
module.exports = {
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/' },
      { text: 'External', link: 'https://google.com' },
    ]
  }
}

```

```javascript
// .vuepress/config.js     target、rel
module.exports = {
  themeConfig: {
    nav: [
      { text: 'External', link: 'https://google.com', target:'_self', rel:'' },
      { text: 'Guide', link: '/guide/', target:'_blank' }
    ]
  }
}
```

```javascript
// .vuepress/config.js       items 
module.exports = {
  themeConfig: {
    nav: [
      {
        text: 'Languages',
        ariaLabel: 'Language Menu',
        items: [
          { text: 'Chinese', link: '/language/chinese/' },
          { text: 'Japanese', link: '/language/japanese/' }
        ]
      }
    ]
  }
}
```

```javascript
// .vuepress/config.js       items 
module.exports = {
  themeConfig: {
    nav: [
      {
        text: 'Languages',
        items: [
          { text: 'Group1', items: [/*  */] },
          { text: 'Group2', items: [/*  */] }
        ]
      }
    ]
  }
}
```



### 禁用导航栏

* 配置文件：<font color = orange>`.vuepress/config.js`</font>
* 配置方法：<font color = orange>`themeConfig.navbar`</font>

```javascript
// .vuepress/config.js
module.exports = {
  themeConfig: {
    navbar: false
  }
}
```

```javascript
// md 文件行首
---
navbar: false
---
```



## 侧边栏

* 配置文件：<font color = orange>`.vuepress/config.js`</font>

* 配置方法：<font color = orange>`themeConfig.sidebar`</font>



###  基本配置

* 配置文件：<font color = orange>`.vuepress/config.js`</font>

* 配置方法：<font color = orange>`sidebar：[]`</font>


````javascript
// .vuepress/config.js
module.exports = {
  themeConfig: {
    sidebar: [
      '/',
      '/page-a',
      ['/page-b', 'Explicit link text']
    ]
  }
}
````



### 侧边栏分组

* 配置文件：<font color = orange>`.vuepress/config.js`</font>

* 配置方法：<font color = orange>`sidebar：[{},{},{}]`</font>

```javascript
sidebar: {
            '/foo/': [{
                title: 'foo',   // 必要的
                path: '/foo/',    // 可选的, 标题的跳转链接，应为绝对路径且必须存在
                collapsable: false, // 可选的, 默认值是 true
                sidebarDepth: 1,    // 可选的, 默认值是 1
                children: [
                    'one',
                    'two'
                ]
            }
}
```



### 多个侧边栏

* 配置文件：<font color = orange>`.vuepress/config.js`</font>

* 配置方法：<font color = orange>`sidebar：{[],[],[]}`</font>

```javascript
// 首先把页面组织好
.
├─ README.md
├─ contact.md
├─ about.md
├─ foo/
│  ├─ README.md
│  ├─ one.md
│  └─ two.md
└─ bar/
   ├─ README.md
   ├─ three.md
   └─ four.md
```

接着遵循规则进行配置

```javascript
// .vuepress/config.js
module.exports = {
  themeConfig: {
    sidebar: {
      '/foo/': [
        '',     /* /foo/ */
        'one',  /* /foo/one.html */
        'two'   /* /foo/two.html */
      ],

      '/bar/': [
        '',      /* /bar/ */
        'three', /* /bar/three.html */
        'four'   /* /bar/four.html */
      ],

      // fallback
      '/': [
        '',        /* / */
        'contact', /* /contact.html */
        'about'    /* /about.html */
      ]
    }
  }
}
```



### 自动生成侧栏

* 配置文件：<font color = orange>`.vuepress/config.js`</font>

* 配置方法：<font color = orange>`sidebar: auto`</font>

```javascript
// md 文档头
---
sidebar: auto
---
```

```javascript
// .vuepress/config.js
module.exports = {
  themeConfig: {
    sidebar: 'auto'
  }
}
```



### 禁用侧边栏

* 配置文件：<font color = orange>`.vuepress/config.js`</font>
* 配置方法：<font color = orange>`themeConfig.navbar`</font>

```javascript
// md 文件行首
---
sidebar: false
---
```



