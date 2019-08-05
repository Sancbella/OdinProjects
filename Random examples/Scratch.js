function min (x,y) {
    return (x<y) ? x : y;
    }
    

console.log(min(2, 5));
console.log(min(3, -1));
console.log(min(1, 1));

min(2, 5) == 2
min(3, -1) == -1
min(1, 1) == 1


function checkAge (age) {
return (age >= 18) ? 'nice' : 'wrong'
}
console.log(checkAge(18));
console.log(checkAge(21));
console.log(checkAge(1));

function checkBday (daytil){
if (daytil > 0) {
    return `Only ${daytil} more days`
} 
return 'Happy birthday!'
}

console.log(checkBday(199999));
console.log(checkBday(0));

console.log('New round');

// Write a function called add7 that takes one number and returns that number + 7.
// Write a function called multiply that takes 2 numbers and returns their product.
// Write a function called capitalize that takes a string and returns that string with only the first letter capitalized. Make sure that it can take strings that are lowercase, UPPERCASE or BoTh.
// Write a function called lastLetter that takes a string and returns the very last letter of that string:
// lastLetter("abcd") should return "d"

function add7 (x) {
    var number = x + 7
    return number + ` || I added ${x} + 7`
}

console.log(add7(1));

function multiply (x,y) {
    var number = x * y;
    return number + `|| I multiplied ${x} * ${y}`;
}

console.log(multiply(8,9));

function capitalize (text) {
    return text.substring(0, 1).toUpperCase() + text.substring(1) +` || There I capitalized ${text}!`
}
console.log(capitalize('chris'));

function lastLetter (text) {
    return `the last letter of ${text} is ${text.slice(-1)};`
}
console.log(lastLetter('Donaudampfschiffahrtselektrizitätenhauptbetriebswerkbauunterbeamtengesellschaft'));
