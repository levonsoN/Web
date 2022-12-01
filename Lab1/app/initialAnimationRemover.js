let initiallyAnimated = [...document.getElementsByClassName("initial-animation")]

initiallyAnimated.forEach(e => 
        e.addEventListener("animationend", 
        () => e.classList.remove("initial-animation")));