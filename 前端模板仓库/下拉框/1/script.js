let dropdown = document.querySelector('.dropdown');
dropdown.onclick = function () {
    dropdown.classList.toggle('active');
}
function show(a) {
    document.querySelector('.text01').value = a
}
const keys = Array.from(document.querySelectorAll('.menuitem'));
keys.forEach((key) => {
    console.log(key.innerHTML);
    key.addEventListener('mouseover', () => {
        document.querySelector('.text01').value = key.innerHTML;
    })
})