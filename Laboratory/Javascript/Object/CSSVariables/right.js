const inputs = document.querySelectorAll(".controls input");
console.log(inputs);
inputs.forEach(input => { input.addEventListener("change", handleUpdate) })
function handleUpdate() {
    console.log(`${this.name} = ${this.value}`);
    const suffix = this.dataset.sizing || "";
    console.log(suffix);
    document.documentElement.style.setProperty(`--${this.name}`, this.value + suffix);
}



