// DOM
// childNodes
let childnodes = document.body.childNodes
for (let i = 0; i < childnodes.length; i++) {
    console.log(childnodes[i].innerHTML);
}

// children
let children = document.body.children
for (let i = 0; i < children.length; i++) {
    console.log(children[i].innerHTML);
}

// firstChild
let firstchild = document.body.firstChild
console.log(firstchild.innerHTML);




// firstElementChild
let firstelementchild = document.body.firstElementChild
console.log(firstelementchild.innerHTML);

// lastChild
let lastchild = document.body.lastChild
console.log(lastchild);

// lastElementChild
let lastelementchild = document.body.lastElementChild
console.log(lastelementchild);

// parentNode
console.log(document.body.parentNode === document.documentElement);


// parentElement
let parentelement = document.body
console.log(parentelement.parentElement.nodeName);








// previousSibling
var previoussibling = document.getElementById("lio").previousSibling
console.log(previoussibling.nodeValue)




// previousElementSibling
var previouselementsibling = document.getElementById("lio").previousElementSibling
console.log(previouselementsibling)

// nextSibling
var nextsibling = document.getElementById("lio").nextSibling
console.log(nextsibling.nodeName)



// nextElementSibling
var nextelementsibling = document.getElementById("lio").nextElementSibling
console.log(nextelementsibling.nodeName)

// console.log(window["lio"].innerHTML)

// querySelectorAll
let queryselectorall = document.querySelectorAll("ul>li:last-child")
console.log(queryselectorall);




console.log(document.body.className)










