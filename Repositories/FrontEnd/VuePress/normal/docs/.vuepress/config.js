const NavBarZh = require('./NavBarZh');
const SideBarZh = require('./SideBarZh');
const NavBarEn = require('./NavBarEn');
const getAllMarkdownFiles = require('./getAllMarkdownFiles');
const SideBarEn = require('./SideBarEn');
module.exports = {
    cache: false,
    evergreen: true,
    locales: {
        '/': {
            lang: 'zh-CN', // 将会被设置为 <html> 的 lang 属性
            title: 'Mitsumi',
            description: '信息发布平台'
        },
        '/en/': {
            lang: 'en-US',
            title: 'Mitsumi',
            description: 'information publishing platform'
        }
    },
    themeConfig: {
        logo: '/assets/img/hero.png',
        locales: {
            '/': {
                selectText: '选择语言',
                label: '简体中文',
                ariaLabel: 'Languages',
                nav: NavBarZh,
                sidebar: SideBarZh,
            },
            '/en/': {
                selectText: 'Languages',
                label: 'English',
                ariaLabel: 'Languages',
                nav: NavBarEn,
                sidebar: SideBarEn,
            },
            // sidebar: 'auto'
        },







    },

    // plugins: [
    //     // 其他插件...
    //     [
    //         '@vuepress/plugin-debug',
    //         {
    //             // 只在开发模式下启用调试输出
    //             enabled: process.env.NODE_ENV === 'development',
    //         },
    //     ],
    // ],
}

