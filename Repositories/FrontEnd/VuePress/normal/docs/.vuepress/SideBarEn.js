const getAllMarkdownFiles = require('./getAllMarkdownFiles');
const SideBarEn = {
    '/en/Office/Excel/': getAllMarkdownFiles('./docs/en/Office/Excel/'),   //['', 'four', 'three',],
    '/en/Office/PPT/': getAllMarkdownFiles('./docs/en/Office/PPT/'),
    '/en/Office/Word/': getAllMarkdownFiles('./docs/en/Office/Word/'),
    '/en/Guide/': getAllMarkdownFiles('./docs/en/Guide/'),
    '/en/Notification/': getAllMarkdownFiles('./docs/en/Notification/'),
    '/en/Mails/': getAllMarkdownFiles('./docs/en/Mails/'),
    '/en/Windows/': getAllMarkdownFiles('./docs/en/Windows/'),
    // fallback
    // '/': [
    //     '',        /* / */
    // ]
}

module.exports = SideBarEn