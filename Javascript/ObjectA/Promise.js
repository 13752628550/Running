const btn = document.querySelector('#btn')
function rand(m, n) {
    return Math.ceil(Math.random() * (n - m + 1)) + m - 1;



}

btn.addEventListener('click', () => {
    const p = new Promise((resolve, reject) => {
        setTimeout(() => {
            let n = rand(1, 100);
            if (n <= 30) {
                resolve(n);     // 将 promise 对象状态设置 成功
            } else {
                reject(n);      // 将 promise 对象状态设置 失败
            }
        }, 1000);

    });




    p.then(
        (value) => alert('status:,askd;fjads;jfka;fjk;adlfja;la;faf;a;af;afgh' + value),
        (reason) => alert('status:,a;sdfja;f;af;adjf;af;af;jf;afdkdfkjdf;fkj;ghj' + reason)
    )
    p.catch(reason => console.log(reason));
    p.finally(console.log("finally"));
})


let p1 = new Promise((resolve, reject) => {
    resolve('OK');
})
let p2 = Promise.resolve('success');
let p3 = Promise.resolve('Okokok');
const result = Promise.all([p1, p2, p3]);
console.log(result);
console.log(Promise.race([p1, p2, p3]));

let pro = new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve('OK');
    }, 1000);
});

pro.then(value => {
    console.log((value));
    return 'OKOKOK';
})
    .then(value => {
        console.log(value);
        return "OKOKOKOKOK";
    })
    .then(value => {
        console.log(value);
    });


// async function f() {
//     return console.log("return");




// }
// f().then(value => {
//     console.log(value);
// })
// console.log("normal");
async function bb() {
    return "别bb,专心学习";
}
console.log(bb());
bb().then(value => {
    console.log(value);
})

async function f() {
    let promise = new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve("donerun!");
        }, 1000);
    });
    let result = await promise
    console.log(result);
}
f()
console.log("startO");