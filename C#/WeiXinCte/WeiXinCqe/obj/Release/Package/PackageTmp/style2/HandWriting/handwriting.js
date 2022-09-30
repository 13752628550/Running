function Handwriting(id) {
    this.canvas = document.getElementById(id);
    this.ctx = this.canvas.getContext("2d");
    this.ctx.fillStyle = "rgba(0,0,0,0.25)";
    this.canvas.addEventListener("touchstart", this.downEvent.bind(this), false);
    this.canvas.addEventListener("touchmove", this.moveEvent.bind(this), false);
    this.canvas.addEventListener("touchend", this.upEvent.bind(this), false);
    this.canvas.addEventListener("contextmenu", function (e) { e.preventDefault() }, false);
    //this.canvas.onmousedown = this.downEvent.bind(this);
    //this.canvas.onmousemove = this.moveEvent.bind(this);
    //this.canvas.onmouseup = this.upEvent.bind(this);
    //this.canvas.onmouseout = this.upEvent.bind(this);
    this.moveFlag = false;
    this.upof = {};
    this.radius = 0;
    this.has = [];
    this.startOf = null;
    this.lineMax = 30;
    this.lineMin = 3;
    this.linePressure = 1;
    this.smoothness = 80;
    this.history = [];
}

Handwriting.prototype.clear = function () {
    this.history = [];
    this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
}

Handwriting.prototype.historyBack = function () {
    this.history.pop();
    this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
    for (var i = 0; i < this.history.length; i++) {
        var h = this.history[i];
        for (var j = 0; j < h.length; j += 3) {
            this.ctx.beginPath();
            this.ctx.arc(h[j], h[j + 1], h[j + 2], 0, 2 * Math.PI, true);
            this.ctx.fill();
        }
    }
}

Handwriting.prototype.downEvent = function (e) {
    this.moveFlag = true;
    this.has = [];
    this.history.push([]);
    this.upof = this.getXY(e);
    this.startOf = this.upof;
}

Handwriting.prototype.moveEvent = function (e) {
    if (!this.moveFlag)
        return;
    e.preventDefault();
    var of = this.getXY(e);
    var up = this.upof;
    var ur = this.radius;
    this.has.unshift({ time: new Date().getTime(), dis: this.distance(up, of) });
    var dis = 0;
    var time = 0;
    for (var n = 0; n < this.has.length - 1; n++) {
        dis += this.has[n].dis;
        time += this.has[n].time - this.has[n + 1].time;
        if (dis > this.smoothness)
            break;
    }
    var or = Math.min(time / dis * this.linePressure + this.lineMin, this.lineMax) / 2;
    this.radius = or;
    this.upof = of;
    if (dis < 7)
        return;
    if (this.startOf) {
        up = this.startOf;
        ur = or;
        this.startOf = null;
    }
    var len = Math.ceil(this.distance(up, of) / 2);
    for (var i = 0; i < len; i++) {
        var x = up.x + (of.x - up.x) / len * i;
        var y = up.y + (of.y - up.y) / len * i;
        var r = ur + (or - ur) / len * i;
        this.ctx.beginPath();
        this.ctx.arc(x, y, r, 0, 2 * Math.PI, true);
        this.ctx.fill();
        this.history[this.history.length - 1].push(x, y, r);
    }
}

Handwriting.prototype.upEvent = function (e) {
    this.moveFlag = false;
}

Handwriting.prototype.getXY = function (e) {
    var x = e.touches[0].clientX;
    var y = e.touches[0].clientY;
    //var x = e.clientX;
    //var y = e.clientY;
    return {
        x: x - this.canvas.offsetLeft + (document.body.scrollLeft || document.documentElement.scrollLeft),
        y: y - this.canvas.offsetTop + (document.body.scrollTop || document.documentElement.scrollTop)
    }
}

Handwriting.prototype.distance = function (a, b) {
    var x = b.x - a.x, y = b.y - a.y;
    return Math.sqrt(x * x + y * y);
}