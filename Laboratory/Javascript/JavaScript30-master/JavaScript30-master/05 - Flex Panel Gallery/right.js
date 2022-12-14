const panels = document.querySelectorAll(".panel");
panels.forEach(panel => panel.addEventListener("click", toggleOpen));
function toggleOpen() {
    console.log(this.classList)
    this.classList.toggle("open")
    this.classList.toggle("open-active")
}