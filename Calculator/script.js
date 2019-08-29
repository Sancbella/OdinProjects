//Create a new function operate that takes an operator and 2 numbers and then calls one of the above functions on the numbers.
const numberKeys = document.querySelectorAll(".number-key")
const functKeys = document.querySelectorAll(".function-key")
const screen = document.querySelector("body > div > div.display > p")
const compute = document.querySelector(".compute-key")
const clear = document.querySelector(".clear-key")
const runningTotal = document.querySelector("body > div > div.display > p.running-total")
var newVal= undefined
var prevVal = undefined
var operatorType = undefined
var resultVal = undefined
var decimalClicked = false

//end var setups
//start functions
//Assigns numbered button functionality
numberKeys.forEach(button => {
   button.addEventListener('click', () => {
       if (newVal == undefined) {
           newVal = ''
           screen.innerHTML = '</br>'
        }
        if (button.value == '.'){
            if(decimalClicked != true){
            newVal += button.value
            decimalClicked = true
            screen.innerHTML = newVal} 
        } else { 
        newVal += button.value
        screen.innerHTML = newVal}
        });
});
//assgins operator keys functionality
functKeys.forEach(button => {
    button.addEventListener('click', () => {
        if (!resultVal){
            prevVal = newVal; 
        } else {
           prevVal = resultVal
        }
        prevVal = parseFloat(prevVal)
        newVal = parseFloat(newVal)
        operatorType = button.value
        newVal = undefined
        screen.innerHTML = '</br>'
        
        decimalClicked = false
    })
})
compute.addEventListener('click', () => {
        if(newVal && prevVal){
        prevVal = parseFloat(prevVal)
        newVal = parseFloat(newVal)
        screen.innerHTML = '</br>'
        decimalClicked = false
        if(newVal == 0 && operatorType == '/'){
            screen.innerHTML = 'Lol no son, go push clear'
            } else {
        switch (operatorType) {
            case "+":
            resultVal = prevVal + newVal
            break;
            case "-":
            resultVal = prevVal + newVal
            break;
            case "/":
            resultVal = prevVal / newVal
            break;
            case "*":
            resultVal = prevVal * newVal
            break;
            default:
            resultVal = resultVal
            break;
        }

        operatorType = undefined
        prevVal = newVal
        newVal = ''
        screen.innerHTML = Number(resultVal.toFixed(3))
    }}  
}   )
clear.addEventListener('click', () => {
    newVal= undefined
    prevVal = undefined
    operatorType = undefined
    resultVal = undefined
    decimalClicked = false
    screen.innerHTML = 'Push to buttons to calculate'
})

//Todos
//take the new '+' that works and convert it to the other operations
//stylize
//good to go