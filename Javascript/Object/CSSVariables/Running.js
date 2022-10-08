const inputs = document.querySelectorAll("input");
console.log(inputs);
inputs.forEach(input => input.addEventListener("change", handleUpdate))
// spacing.addEventListener('change', handleUpdate)
function handleUpdate() {
    // console.log(this.dataset);
    // console.log(this.name);
    // console.log(this.value);
    const suffix = this.dataset.sizing || '';
    document.documentElement.style.setProperty(`--${this.name}`, this.value + suffix);
}


