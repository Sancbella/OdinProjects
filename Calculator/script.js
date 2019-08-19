//Create a new function operate that takes an operator and 2 numbers and then calls one of the above functions on the numbers.
const numberKeys = document.querySelectorAll(".number-key")
const functKeys = document.querySelectorAll(".function-key")
const screen = document.querySelector("body > div > div.display > p")
const compute = document.querySelector(".compute-key")
const runningTotal = document.querySelector("body > div > div.display > p.running-total")
var currentNum= undefined
var storedNum = undefined
var operatorType = undefined
var calculatedNum = undefined


var arrObjFiltered = (num) => {
    return{
    value: num
}}
calculate = [];
filteredCalc = [];
runTheMath = () => {
    currentNum = Number(currentNum)
    storedNum = Number(storedNum)
    console.log(`Performing ${operatorType} function`);
switch (operatorType) {
    case "+":
        console.log('+ is registered');
        //When + is pushed twice in a row it needs to auto add
        //if there is a stored number.. storednum + current num = calculatednum 
        //calculated number is the running calculation, not just storage...
        //1st push sets original saved number
        if (storedNum == null){currentNum = storedNum}
        //2nd push w/o equals adds current and stored number
        else if (storedNum !== null && calculatedNum == null){
        calculatedNum = currentNum + storedNum }
        //3rd push w/o equals adds current and adds to calculated
        else {calculatedNum = currentNum + calculatedNum}
        
        //return
        screen.innerHTML == ''
        return runningTotal.innerHTML = calculatedNum
    break;
    case "-":
        console.log('- is registered');
        calculatedNum = currentNum - storedNum
        storedNum = calculatedNum
        currentNum = calculatedNum
        return screen.innerHTML = calculatedNum
    break;
    case "/":
        console.log('/ is registered');
        calculatedNum =  storedNum / currentNum
        storedNum = calculatedNum
        currentNum = calculatedNum
        return screen.innerHTML = calculatedNum
    break;
    case "*":
        console.log('* is registered');
        calculatedNum = currentNum * storedNum
        storedNum = calculatedNum
        currentNum = calculatedNum
        return screen.innerHTML = calculatedNum
        
    break;
    case "clear":
        console.log('clear is registered');
        storedNum = ''
        calculatedNum = ''
        currentNum = '0'
        screen.innerHTML = currentNum
    break;
    
}
}
//Assigns numbered button functionality
numberKeys.forEach(button => {
   button.addEventListener('click', () => {
       if (currentNum == undefined) {
           currentNum = ''
           screen.innerHTML = '</br>'
        }
        currentNum += button.value
        screen.innerHTML = currentNum
        });
});
//assgins operator keys functionality
functKeys.forEach(button => {
    button.addEventListener('click', () => {
        storedNum = Number(storedNum)
        currentNum = Number(currentNum)
        if (storedNum >= 0 && currentNum >= 0) {runTheMath()}
        storedNum = currentNum
        currentNum = ''
        operatorType = button.value
        screen.innerHTML = '</br>'
        
    })
})
compute.addEventListener('click', () => {
    runTheMath()
})


//Todos
//take the new '+' that works and convert it to the other operations
//stylize
//good to go