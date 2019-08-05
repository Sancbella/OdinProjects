// your javascript file
const container = document.querySelector('#container');

const content = document.createElement('div');
content.classList.add('content');
content.textContent = 'This is the glorious text-content!';

container.appendChild(content);

// a <p> with red text that says “Hey I’m red!”
// an <h3> with blue text that says “I’m a blue h3!”
// a <div> with a black border and pink background color with the following elements inside of it:
// another <h1> that says “I’m in a div”
// a <p> that says “ME TOO!”
// Hint for this one: after creating the div with createElement, append the <h1> and <p> to it before adding it to the container.

const redP = document.createElement('p');
redP.style.color = 'red';
redP.textContent = "Hey I'm red!";
container.appendChild(redP);

const blueH = document.createElement('h3');
blueH.style.cssText = 'color: blue;';
blueH.textContent = "I'm a blue h3!";
container.appendChild(blueH);

const pinkBlackDiv = document.createElement('div');
pinkBlackDiv.style.cssText = 'background: pink; border:black; border-style: dotted;';
const divH = document.createElement('h1')
divH.textContent = "I'm in a div";
const divP = document.createElement('p');
divP.textContent = "ME TOO!";
pinkBlackDiv.appendChild(divH)
pinkBlackDiv.appendChild(divP)
container.appendChild(pinkBlackDiv)
