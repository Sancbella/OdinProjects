Here are some use cases (abilities your project needs to have):

Your calculator is going to contain functions for all of the basic math operators you typically find on simple calculators, so start by creating functions for the following items and testing them in your browser’s console.
add
subtract
multiply
divide


1] Create a new function operate that takes an operator and 2 numbers and then calls one of the above functions on the numbers.
2] Create a basic HTML calculator with buttons for each digit, each of the above functions and an “Equals” key.
Do not worry about wiring up the JS just yet.
3] There should also be a display for the calculator, go ahead and fill it with some dummy numbers so you can get it looking right.
4] Add a “clear” button.
5] Create the functions that populate the display when you click the number buttons… you should be storing the ‘display value’ in a variable somewhere for use in the next step.
6] Make the calculator work! You’ll need to store the first number that is input into the calculator when a user presses an operator, and also save which operation has been chosen and then operate() on them when the user presses the “=” key.
7] You should already have the code that can populate the display, so once operate() has been called, update the display with the ‘solution’ to the operation.


This is the hardest part of the project. You need to figure out how to store all the values and call the operate function with them. Don’t feel bad if it takes you a while to figure out the logic.


//Gotchas: watch out for and fix these bugs if they show up in your code:
Users should be able to string together several operations and get the right answer: 12 + 7 - 5 * 3 etc.

done 8] You should round answers with long decimals so that they don’t overflow the screen.
done 9] Pressing = before entering all of the numbers or an operator could cause problems!
done 10] Pressing “clear” should wipe out any existing data.. make sure the user is really starting fresh after pressing “clear”

done 11] Display a snarky error message if the user tries to divide by 0… don’t let it crash your calculator!

Done! EXTRA CREDIT: Users can get floating point numbers if they do the math required to get one, but they can’t type them in yet. Add a . button and let users input decimals! Make sure you don’t let them type more than one though: 12.3.56.5. It is hard to do math on these numbers. (disable the decimal button if there’s already one in the display)

EXTRA CREDIT: Make it look nice! This can be a good portfolio project… but not if it’s UGLY. At least make the operations a different color from the keypad buttons.
EXTRA CREDIT: Add a “backspace” button, so the user can undo if they click the wrong number.
EXTRA CREDIT: Add keyboard support!


if (storedNum == null){currentNum = storedNum}
  else if (storedNum !== null && calculatedNum == null){
        calculatedNum = currentNum + storedNum }
         else {calculatedNum = currentNum + calculatedNum}
          screen.innerHTML == ''
        operatorType = undefined;
        return runningTotal.innerHTML = calculatedNum

Problem, if switch operator after the second one, then it doesn't calculate correctly, first push '/' then '+', it only adds.
