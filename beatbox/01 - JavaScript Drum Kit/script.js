
var playSound = (e) => {
    const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`)
    let key = document.querySelector(`.key[data-key="${e.keyCode}"]`)    
    if (!key) return;
    key.classList.add('playing');
    if (!audio) return;
    audio.currentTime = 0
    audio.play();
}

var remTrans = function (e){
    if (e.propertyName !== 'transform') return
    console.log(e.propertyName);
    this.classList.remove('playing');
} 

//
window.addEventListener('keydown' ,(e) =>{ 

playSound(e) 

});

//listens for all end transitions in key class
const keys = document.querySelectorAll('.key');
keys.forEach(key => key.addEventListener('transitionend',remTrans));
