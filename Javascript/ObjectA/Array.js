// 构造函数
const arr = new Array
// 字面量
var arr1 = [1, 2, 3, 4, 5, 6, 7]
arr[arr.length] = 1
console.log(arr)
console.log(arr1)
console.log(arr1[5])
arr1.pop()

// 显示数组长度
console.log(arr.length)
// 修改数组长度
arr.length = 89
console.log(arr.length)


// 添加元素 push
arr.push(89)
console.log(arr)
// 添加元素 unshift
arr.unshift(89)
console.log(arr)

// 删除元素 pop
let result = arr.pop()
console.log(arr)
// 删除元素 shift
let result1 = arr.shift()
console.log(result + " " + result1)
arr[0] = 1
arr[1] = 2
arr[2] = 3
arr[3] = 4
arr[4] = 5
arr[5] = 6
arr[6] = 7
console.log(arr)
// 删除元素 splice
arr.splice(0, 1, 7)
console.log(arr)

// 提取元素 slice 
let result2 = arr.slice(3, 5)
console.log(result2)
// 提取元素 concat
let result3 = arr1.concat(arr)
console.log(result3)
arr.copyWithin(0, 5, 7)
console.log(arr)

// 排序元素 reverse
arr.reverse()
console.log(arr)
arr.reverse()

// 排序元素 sort
arr.sort(function (a, b) { return a - b })
console.log(arr)

// 排序元素 fill
arr.fill(7, 0, 1)
console.log(arr)

// 转变元素 join
let result4 = arr.join(",")
console.log(result4)

// 转变元素 Array.from
console.log(Array.from('hello'))

// 转变元素 Array.of
console.log(arr.concat(Array.of(8, 9)))

// 查找元素 find
let result5 = arr.find(n => n > 6)
console.log(result5)

// 查找元素 findIndex
arr.splice(0, 3, 1, 2, 3)
let result6 = arr.findIndex(n => n > 5)
console.log(result6)

// 查找元素 
console.log(arr[5])
let result7 = arr.includes(7, 5)
console.log(result7)

// 遍历数组 for
for (let index = 0; index < arr.length; index++) {
    console.log(arr[index])
}

// 遍历数组 forEach
arr.forEach((value, index, arrobj) => {
    console.log(value)
    console.log(index)
    console.log(arrobj)
})



console.log(arr.keys().next)


console.log(arr.values())

console.log(arr.entries())


// 遍历数组 reduce
let result8 = arr.reduce(function (previousValue, currentValue) {
    return previousValue + currentValue
})
console.log(result8)

// 扩展运算符 ...
let fun = function () {
    for (let index = 0; index < arguments.length; index++) {
        console.log(arguments[index]);
    }
}



fun(...arr)
console.log




































































