// 分别暴露
export var module1 = "Module"
export let module2 = "ModuleO"
export function modfun3() {
    console.log(module1)
    return "module3"
}



// 统一暴露
let fgh = "fgh"
function fun() {

    console.log("export {fgh,fun,obj}")
}
let obj = [6, 7, 8]





export { fgh, fun, obj }






// 默认暴露
export default {
    add: function (a, b) {
        return a + b
    }
}

