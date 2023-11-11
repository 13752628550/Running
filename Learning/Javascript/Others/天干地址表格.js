console.log("天干地支表格");
const tian_gan = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
const di_zhi = ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]
let countT = 0
let countD = 0
let countS = 0
let strTianDi = ""
console.log(countT, countD);
do {
    strTianDi = tian_gan[countT] + di_zhi[countD] + " "
    if (countT >= 9) {
        strTianDi += "</br >"
        countT = -1
    }
    if (countD >= 11) {
        countD = -1
    }
    document.write(strTianDi)
    countT++
    countD++
    countS++
} while (countS < 98)