class User {
    //定义构造函数
    constructor(name) {
        this.name = name;
    }
    sayHi() {
        console.log(this.name);
        console.log(89);
    }
    //定义 getter
    get name() {
        return this._name;
    }
    //定义 setter
    set name(value) {
        if (value.length < 4) {
            alert("value length number");
            return;
        }
        this._name = value;
    }
}



console.log(typeof User)
console.log(User === User.prototype.constructor)
console.log(User.prototype.sayHi)
let user = new User("john")

// 类继承
// 定义父类
class Animal {
    _planet = "Earth";
    constructor(name) {
        this.speed = 0;
        this.name = name;
    }
    run(speed) {
        this.speed = speed;
        alert(`${this.name} runs with speed ${this.speed}`);
    }

    stop() {
        this.speed = 0;
        alert(`${this.name} stands still ${this.speed}`);
    }
}


// 定义子类
class Rabbit extends Animal {
    // constructor(aname, earLength) {
    //     super(aname);
    //     this.name = aname;
    //     this.earlength = earlength;
    // }
    // run(speed, startval) {
    //     this.speed = speed;
    //     this.startval = startval;
    // }
    hide() {
        alert(`${this.name} hides!`);
    }
    static staticMethod() {
        alert(this === Rabbit);
    }
    static property = "fghfghfgh";




}



// 静态方法
class Article {
    constructor(title, date) {
        this.title = title;
        this.date = date;
    }
    static createTodays() {
        // 记住 this = Article
        return new this("today's digest", new Date());
    }
}

// 内部接口
class CoffeeMachine {
    constructor(power) {
        this._power = power;
    }
    // 定义受保护 waterAmount 大于0
    _waterAmount = 0;
    set waterAmount(value) {
        if (value < 0) {
            value = 0;
        }
        this._waterAmount = value;
    }

    get waterAmount() {
        return this._waterAmount;
    }

    // 定义受保护 只读的power
    get power() {
        return this._power;
    }


    // 定义私有的
    #waterLimit = 200;
    waterlitmit = 300;
    #fixWaterAmount(value) {
        if (value < 0) return 0;
        if (value > this.#waterLimit) return this.#waterLimit;
    }

    setWaterAmount(value) {
        this.#waterLimit = this.#fixWaterAmount(value);
    }


}

class JiuYang extends CoffeeMachine {

}

























