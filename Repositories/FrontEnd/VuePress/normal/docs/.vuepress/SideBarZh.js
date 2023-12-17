const getAllMarkdownFiles = require('./getAllMarkdownFiles');
const SideBarZh = {
    '/zh/Office/Excel/': getAllMarkdownFiles('./docs/zh/Office/Excel/'),   //['', 'four', 'three',],
    '/zh/Office/PPT/': getAllMarkdownFiles('./docs/zh/Office/PPT/'),
    '/zh/Office/Word/': getAllMarkdownFiles('./docs/zh/Office/Word/'),
    '/zh/Guide/': getAllMarkdownFiles('./docs/zh/Guide/'),
    '/zh/Notification/': getAllMarkdownFiles('./docs/zh/Notification/'),
    '/zh/Mails/': getAllMarkdownFiles('./docs/zh/Mails/'),
    '/zh/Windows/': getAllMarkdownFiles('./docs/zh/Windows/'),
    // fallback
    // '/': [
    //     '',        /* / */
    // ]
}

module.exports = SideBarZh