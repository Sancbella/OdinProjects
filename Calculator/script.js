//Create a new function operate that takes an operator and 2 numbers and then calls one of the above functions on the numbers.
const buttons = document.querySelectorAll("button")
var arrObj = (button, btnType) => {
    return{
    value: button.value,
    type: btnType
}

}
var arrObjFiltered = (num) => {
    return{
    value: num
}}
calculate = [];
filteredCalc = [];
runTheMath = (calculate) => {
    //we need to take each element and have it add itself up.
    calcString = JSON.stringify(calculate);
    console.log(calcString);
    
    //If there are 2 numbers in a row then it needs to connect them ex: 8,6 = 86

for (let i = 0; i < calculate.length; i++) {
    if (calculate.type[i] == calculate.type[i+1] && calculate.type[i == num]){
        num1 = calculate[i].value
        num2 = calculate[i+1].value
        num1.merge(num2)
        filteredCalc.push(arrObjFiltered(num1))
        console.log('numbers have been merged ' + filteredCalc);
            
    }
    
}

    //I think this is doable by concat[n] if [n+1] = num?
    //While also at the same time
}
clearTheCalculation = (calculate) => {
    //clears the array
    for (let i = 0; i < calculate.length + 1; i++) {
        calculate.pop();   
    }
    console.log(calculate);
    
}

//Assigns button functionality
buttons.forEach(button => {
    if (button.className != 'functional'){
    
    button.addEventListener('click', () => {
        btnType = (button.value >= 0) ? 'num' : 'operator';
        console.log(btnType);
        calculate.push(arrObj(button, btnType))
        console.log('Button ' + btnType + button.value + ' was pushed');
        console.log(calculate);
    })
        
    }else if(button.className = 'functional'){
        button.addEventListener('click', () => {
            if (button.value == 'enter'){runTheMath(calculate)}
            else if (button.value == 'clear'){clearTheCalculation(calculate)}
        })
    }
});

//Todos
//TOP PRIORITY IS LEARNING WHAT THE HELL IS AND HOW TO USE SPREAD FUNCTIONALITY
//Everytime a button is pressed the entire formula is displayed 
//The other stuff above