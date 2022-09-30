const panels = document.querySelectorAll(".panel");

panels.forEach(panel => (panel.addEventListener("click", toggleOpen)));
panels.forEach(panel => { panel.addEventListener("transitionend", toggleActive) });

function toggleOpen() {
    console.log(this.classList);
    this.classList.toggle("open");
}

function toggleActive(e) {
    console.log(e.propertyName)
    if (e.propertyName.includes("flex")) {
        this.classList.toggle("open-active");
    }

}