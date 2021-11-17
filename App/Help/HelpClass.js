var dropAnswers = document.querySelectorAll(".icon-bigDownArrow");
dropAnswers.forEach((el) => {
    el.addEventListener("click", (e) => {
        e.target.classList.toggle("rotate-180");
        var parent = e.target.parentNode;
        parent.querySelector(".Answer").classList.toggle("hide");
    });
});