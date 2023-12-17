const { getChildren } = require("vuepress-sidebar-atuo");
const fs = require('fs');
const path = require('path');
module.exports = {
    // theme: 'vdoing',
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
                nav: [
                    { text: '指南', link: '/zh/01.Guide' },
                    { text: '通知', link: '/zh/02.Notification' },
                    { text: '邮件', link: '/zh/03.Mails' },
                    {
                        text: '办公软件',
                        link: '/zh/Office/',
                        items: [
                            {
                                text: 'Excel',
                                link: '/zh/Office/Excel/'
                            },
                            {
                                text: 'PowerPoint',
                                link: '/zh/office/ppt/'
                            },
                            {
                                text: 'Winword',
                                link: '/zh/Office/Word/'
                            },
                        ]
                    },
                    { text: '系统', link: '/zh/05.Windows/' },
                ],

                sidebar: {
                    // '/zh/office/ppt/faq/': ['678'],
                    // '/zh/Office/Excel/': {
                    //     title: 'Office/Excel',
                    //     collapsable: true,
                    //     children: getChildren('./docs/zh/Office/Excel/')
                    // },
                    // '/zh/Office/ppt/': getSidebar('/zh/Office/ppt/', 'Office/PPT'),
                    // '/zh/Office/Word/': getSidebar('/zh/Office/Word/', 'Office/Word'),
                }
            },
            '/en/': {
                selectText: 'Languages',
                label: 'English',
                ariaLabel: 'Languages',
                nav: [
                    { text: 'Guide', link: '/en/Guide' },
                    { text: 'Notification', link: '/zh/Notification' },
                    { text: 'GWS', link: '/en/Mails' },
                    {
                        text: 'Office',
                        items: [
                            {
                                text: 'Excel',
                                link: '/en/04.Office/Excel/'
                            },
                            {
                                text: 'PowerPoint',
                                link: '/pages/340ab6'
                            },
                            {
                                text: 'Winword',
                                link: '/en/04.Office/Word/'
                            },
                        ]
                    },
                    {
                        text: 'Windows', link: '/en/05.Windows/'
                    },

                ],


            },




            // sidebar: {
            //     '/foo/': [{
            //         title: 'foo',
            //         path: '/foo/',
            //         collapsable: true,
            //         sidebarDepth: 1,
            //         children: [
            //             'one',
            //             'two'
            //         ]
            //     }

            //     ],
            //     '/bar/': [{
            //         title: 'bar',
            //         path: '/bar/',
            //         collapsable: true,
            //         sidebarDepth: 1,
            //         children: [
            //             'three',
            //             'four',
            //         ]
            //     }],
            //     // fallback
            //     '/': [
            //         '',
            //         "about",
            //         'about1',
            //         'contact'
            //     ],
            // }

        },






        footer: { createYear: 2023, copyrightInfo: 'Mitsumi' }
    },

}
// function getSidebar(dir, title) {
//     const files = [];
//     return [
//         {
//             title,
//             collapsable: false,
//             children: getChildren(dir, files),
//         },
//     ];
// }

// function getChildren(dir, files) {
//     // 读取文件夹下的所有文件
//     const filesInDir = fs.readdirSync(path.join(__dirname, '..', dir));
//     // 过滤出以 .md 结尾的文件并进行排序
//     const sortedFiles = filesInDir.filter(file => file.toLowerCase().endsWith('.md')).sort();
//     // 将当前文件夹的文件添加到全局 files 数组中
//     files.push(...sortedFiles);
//     return sortedFiles;
// }
// function getSidebar(dir, title) {
//     return [
//         {
//             title,
//             collapsable: false,
//             children: getChildren(dir),
//         },
//         // {  }
//     ];
// }

// function getChildren(dir) {
//     let files = []
//     files = fs.readdirSync(path.join(__dirname, '..', dir))
//     return files.filter(file => file.endsWith('.md'));
// }


