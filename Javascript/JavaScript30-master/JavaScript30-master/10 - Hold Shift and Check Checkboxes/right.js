const labels = ["This is an inbox layout.",
    "Check one item",
    "Hold down your Shift key",
    "Check a lower item",
    "Everything in between should also be set to checked",
    "Try to do it without any libraries",
    "Just regular JavaScript",
    "Good Luck!",
    "Don't forget to tweet your result!"];

const html = labels.map(label => {
    return `
        <div class=item>
            <input type = "checkbox">
            <p>${label}</p>
        </div>
    `
}).join("");
console.log(html);
const inboxHtml = document.querySelector(".inbox");
inboxHtml.innerHTML = html;
const checkboxes = document.querySelectorAll(".inbox input[type='checkbox']");
let lastChecked = "";

function handleCheck(e) {
    let inBetween = false;
    if (e.shiftKey && this.checked) {
        checkboxes.forEach(checkbox => {
            console.log(checkbox);
            if (checkbox === this || checkbox === lastChecked) {
                inBetween = !inBetween;
            }
            if (inBetween) {
                checkbox.checked = true;
            }
        });

    }
    lastChecked = this;















































}

checkboxes.forEach(checkbox => { checkbox.addEventListener("click", handleCheck) });