//Create a new function operate that takes an operator and 2 numbers and then calls one of the above functions on the numbers.
const numberKeys = document.querySelectorAll(".number-key")
const functKeys = document.querySelectorAll(".function-key")
const screen = document.querySelector("body > div > div.display > p")
const compute = document.querySelector(".compute-key")
var currentNum= ''
var storedNum = ''
var operatorType = ''
var calculatedNum = ''


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
        if (calculatedNum !== null){
            console.log('statment is true');
            
            calculatedNum = calculatedNum + currentNum}
        else{calculatedNum = currentNum + storedNum}
        screen.innerHTML == ''
        return screen.innerHTML = calculatedNum
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
       if (currentNum == "0") {
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
//TOP PRIORITY IS LEARNING WHAT THE HELL IS AND HOW TO USE SPREAD FUNCTIONALITY
//Everytime a button is pressed the entire formula is displayed 
//The other stuff above