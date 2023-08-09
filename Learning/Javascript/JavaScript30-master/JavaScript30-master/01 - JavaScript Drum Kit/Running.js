// 当按键被按下触发
function playSound(e) {
    // 取得元素信息节点
    const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`);
    const key = document.querySelector(`div[data-key="${e.keyCode}"]`);
    console.log(e.keyCode);
    // 播放音频、添加样式
    if (!audio) return;
    key.classList.add("playing");
    audio.currentTime = 0;
    audio.play();
}

// 松开按键执行清除
function removePlaying(e) {
    const key = document.querySelector(`div[data-key="${e.keyCode}"]`);
    if (!key) return;
    key.classList.remove("playing");
}







// 样式执行成功后取消
function removeTransition(e) {
    if (e.propertyName !== 'transform') return;
    e.target.classList.remove('playing')
}

















































// 为批量元素创建事件
const keys = Array.from(document.querySelectorAll('.key'));
keys.forEach(key => key.addEventListener("transitionend", removeTransition));
// 创建按键监听事件
window.addEventListener("keydown", playSound);
window.addEventListener("keyup", removePlaying);


