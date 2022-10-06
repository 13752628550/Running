//构造函数方式
var fun = new Function("console.log('构造函数代码显示')")
console.log(fun)
fun()

//函数声明方式
function fun1(x) { console.log(x) }
console.log(fun1)
fun1("函数声明方式")


//函数表达式方式
var fun2 = function (y) { console.log(y) }
console.log(fun2)
fun2("函数表达式方式");

//匿名函数方式
(function (x) { console.log(x) })("匿名函数方式")


console.time("running")



//定义箭头函数
const fun3 = (x, y) => { console.log("箭头函数方式" + x + y) }
fun3(8, 9)
//箭头函数简写
const fun4 = x => console.log(x + 1)
fun4(8)


//定义构造函数
function Fun5(x, y) {
    this.x = x
    this.y = y
}

let obj = new Fun5(8, 9)
console.log(obj.x + obj.y);


//函数参数默认
(function (a, b, c = 9) {
    console.log("a=" + a);
    console.log("b=" + b);
    console.log("c=" + c);
})(6, 7, 8)

//rest
var fun6 = function (...arr) {
    for (let index = 0; index < arr.length; index++) {
        console.log(arr[index]);

    }
    console.log()
}
fun6(6, 7, 8)

//arguments
var fun7 = function () {
    console.log(arguments.length)
    for (let index = 0; index < arguments.length; index++) {
        console.log(arguments[index]);

    }

    console.log(arguments.callee)
}


fun7(6, 7, 8)





//参数默认值设置，不写弹出信息 Missing parameter
function throwIfMissing() {
    throw new Error('Missing parameter');
}

function foo(mustBeprovided = throwIfMissing()) {
    // return mustBeprovided
}

foo(6, 7, 8)
console.timeEnd("running")










































