const fs = require('fs');
const path = require('path');
// 获取指定文件夹下所有 Markdown 文件的工具函数
function getAllMarkdownFiles(folderPath) {
    // 用于存储文件名的数组
    const markdownFileNames = ['']; // 添加空字符串到数组的第一位
    try {
        const absoluteFolderPath = path.resolve(folderPath);
        // 检查文件夹是否存在
        if (!fs.existsSync(absoluteFolderPath)) {
            throw new Error(`Folder does not exist: ${absoluteFolderPath}`);
        }
        // 读取目录下的所有文件
        const files = fs.readdirSync(absoluteFolderPath);
        // 遍历文件
        files.forEach(file => {
            // 如果是文件、是 Markdown 文件、不是子文件夹，且文件名不是 README.md，则将文件名添加到数组中
            if (checkFileType(file) && file !== 'README.md') {
                const fileNameWithoutExtension = path.basename(file, path.extname(file));
                markdownFileNames.push(fileNameWithoutExtension);
            }
        });
    } catch (error) {
        console.error(`Error reading folder: ${error.message}`);
    }
    // 返回收集到的文件名数组
    console.log(markdownFileNames);
    return markdownFileNames;
}
// 检查文件类型是否为 Markdown 文件
function checkFileType(filePath) {
    // 使用 path.extname 获取文件扩展名，并转换为小写进行比较
    return path.extname(filePath).toLowerCase() === '.md';
}
// 导出函数，使其可以在其他文件中使用
module.exports = getAllMarkdownFiles;
getAllMarkdownFiles('H:\\Design\\Running\\Repositories\\FrontEnd\\VuePress\\normal\\docs\\zh\\Office\\Excel\\')