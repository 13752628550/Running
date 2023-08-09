// for of 语句
let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
let sum = 0
for (element of arr) {
    console.log(element)
    sum += element

}
console.log(sum)

// for in 语句
let obj = { x: 1, y: 2, z: 3 }
let o
for (o in obj) {
    console.log(o + ":" + obj[o])
}









// throw 
function fun(x) {
    if (x < 0) {
        throw "Parameter is not a number!"
    }
}
try {
    fun(-1)
} catch (e) {
    console.error(e)
}






















































































