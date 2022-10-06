let btn = document.getElementById("btn");
btn.onclick = () => {
    alert("Hello");


}
function handler1(event) {
    event.stopPropagation();
    event.cancelBubble = true
    alert("Thanks!");
}

function handler2() {
    alert("Thanks again!");
}

function handler3(event) {
    if (event.altKey && event.shiftKey) {
        console.log("altKey + shiftKey pressd!");
    }
}
btn.addEventListener("click", handler1);
btn.addEventListener("click", handler2);



let btn1 = document.querySelector("#btn1");
console.log(btn1.form);





let input = document.querySelector("#input");
input.onkeydown = function (event) {
    console.log("key:" + event.key + "code:" + event.code);
}










let form = document.forms.my;
let elem = form.elements.one;
console.log(document.forms[0]);
console.log(form.one);
console.log("elem:" + elem.value);














console.log("123456789");
console.log("123456789");
console.log("123456789");
console.log("123456789");
console.log("123456789");
console.log("123456789");
console.log("123456789");










btn.addEventListener("hello", function (event) {
    console.log(event.target.tagName + "helloR");
})
let hello = new Event("hello", { bubbles: true });
btn.dispatchEvent(hello);
btn.addEventListener("click", handler3);