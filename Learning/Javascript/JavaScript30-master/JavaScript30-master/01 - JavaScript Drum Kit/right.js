window.addEventListener("keydown", playSound);
window.addEventListener("keyup", removePlaying);
function playSound(keydow) {
    console.log(keydow);
    const audio = document.querySelector(`audio[data-key="${keydow.keyCode}"]`);
    const key = document.querySelector(`div[data-key="${keydow.keyCode}"]`)
    console.log(audio, key);
    if (!audio) return;
    key.classList.add("playing");
    audio.currentTime = 0;
    audio.play()
}

function removePlaying(e) {
    const key = document.querySelector(`div[data-key="${e.keyCode}"]`);
    if (!key) return;
    key.classList.remove("playing");
}