// 字面量定义对象
const student = {
    name: "小明",
    age: "79",
    gender: "男",
    sayhello: function () {
        alert("hello");
    },
}
console.log(student);

// 构造函数定义对象
const running = new Object({ name: "1", age: "89", gender: "男" });
console.log(running);

// 函数批量定义对象
function newobj(name, age, gender) {
    var obj = new Object();
    obj.name = name;
    obj.age = age;
    obj.gender = gender
    return obj
};

const obj1 = newobj("1", "89", "男")
console.log(obj1)



// (ES6新增简写方式)
// 变量定义属性 
const foo = "bar";
const zoo = { foo };
console.log(zoo);

// 变量定义方法 
let change = function () {
    return "tianjin"
}
const obj2 = { change }
console.log(obj2.change())

// 返回对象数据 
const fun1 = function (x, y) {
    return { x, y }           //return{x:x,y:y}
}
console.log(fun1(9, 9))

// 方法省略关键字
const obj3 = {
    method() {
        return "chinaren"
    }
}
console.log(obj3.method())

// 属性名表达式
student.age = "89"
let abc = "abcdefg"
student[abc] = "123456789"
student["f" + "gh"] = "123456789"

delete (student.name)

for (let n in running) {
    console.log(n)
    console.log(running[n])
}
console.log("name" in running)

var xingming = "name"
running[xingming] = "tianjin"
console.log(running)















