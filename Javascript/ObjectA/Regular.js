// 创建正则表达式
let reg = new RegExp("[ijk]", "i")



// 创建正则字面量
let reg1 = /[abc]/i

// 测试正则表达式
console.log(reg1.test("abcdefgh"))




// 表达式 [a|b|c]
let reg2 = /a|b|c/i
console.log(reg2.test("abcdefgh"))

// 表达式 [^abc]
let reg3 = /^abc/i
console.log(reg3.test("abcdefgh"))




// 表达式 [a-z]
let reg4 = /[a-z]/
console.log(reg4.test("abcdefgh"))

// 表达式 [A-Z]
let reg5 = /[A-Z]/
console.log(reg5.test("abcdefgH"))


// 表达式 [A-z]
let reg6 = /[A-z]/i
console.log(reg6.test("abcdefgh"))

// 表达式 [0-9]
let reg7 = /[0-9]/i
console.log(reg7.test("abcdefgh9"))

// 表达式 a{n}
let reg8 = /a{3}/i
console.log(reg8.test("aaabcdefgh9"))

// 表达式 a{x,y}
let reg9 = /ab{3,5}c/i
console.log(reg9.test("abbbcdefgh9"))

// 表达式 a{x,}
let reg89 = /ab{3,}c/i
console.log(reg89.test("abbbbbbcdefgh9"))

// 表达式 a+
let reg899 = /a(b)+c/i
console.log(reg89.test("abbbbbbcdefgh9"))

// 表达式 a*
reg9 = /ab*c/i
console.log(reg9.test("abcdefgh9"))



// 表达式 a?
reg9 = /ab?c/i
console.log(reg9.test("abcdefgh9"))

// 表达式 ^a
reg9 = /^abc/i
console.log(reg9.test("abcdefgh9"))

// 表达式 a$
reg9 = /ab[A-z]9$/i
console.log(reg9.test("abcdefgabh9"))

// 元字符 \.
reg9 = /\./i
console.log(reg9.test("abcde.fgabh9"))

// 元字符 \\
reg9 = /\\/i
console.log(reg9.test("\\abcdefgabh9"))

// 元字符 \w
reg9 = /\w/i
console.log(reg9.test("abcdefgabh9"))

// 元字符 \W
reg9 = /\W/i
console.log(reg9.test("abcdefgabh9&"))

// 元字符 \d
reg9 = /\d/i
console.log(reg9.test("abcdefgabh9&"))

// 元字符 \D
reg9 = /\D/i
console.log(reg9.test("abcdefgabh9&"))

// 元字符 \s
reg9 = /\s/i
console.log(reg9.test(" abcdefgabh9&"))

// 元字符 \S
reg9 = /\S/i
console.log(reg9.test("abcdefgabh9&"))

// 元字符 \b
reg9 = /abcdefg\b/i
console.log(reg9.test(" abcdefg abh9&"))

// 元字符 \B
reg9 = /\B/i
console.log(reg9.test(" abcdefgabh9&"))












// 正则方法 split()
var str = "1a2b3c4d5e6f7h8j9i"
var result = str.split(/\d/)
console.log("split:" + result)

// 正则方法 search()
result = str.search(/6/i)
console.log("search:" + result)

// 正则方法 match()
result = str.match(/[A-z/]/ig)
console.log("match:" + result)

























































