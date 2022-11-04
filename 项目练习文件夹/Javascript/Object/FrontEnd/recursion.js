function pow(x,n){
    if(n==1){
        return x
    } else{
        return x * pow(x,n-1)
    }
}

console.time("recursion")
console.log(pow(2,6)) 
console.timeEnd("recursion")













function pow1(x,n){
    let result = 1;
    for(let i =0 ;i<n;i++){
        result *=x;
    }
    return result;
}





















































console.time("iterate")
console.log(pow1(2,6)) 
console.timeEnd("iterate")
