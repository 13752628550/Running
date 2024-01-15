import axios from "~/axios"
// 图片分类查询
export function getImageClassList(page) {
    return axios.get("/admin/image_class/" + page)
}
// 图片分类数据创建
export function createImageClass(data) {
    return axios.post("/admin/image_class", data)
}
// 图片分类数据更新
export function updateImageClass(id, data) {
    return axios.post("/admin/image_class/" + id, data)
}
// 图片分类数据删除
export function deleteImageClass(id) {
    return axios.post(`/admin/image_class/${id}/delete`)
}