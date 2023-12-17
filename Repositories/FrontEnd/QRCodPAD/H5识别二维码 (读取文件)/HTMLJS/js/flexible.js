;function resetFontSize() {
  var designWidth = 750 
  var width = window.innerWidth
  var currentFontSize = width / (designWidth / 100)
  document.documentElement.style.fontSize = currentFontSize + 'px'
}
window.onresize = function() {
  resetFontSize()
};
resetFontSize()