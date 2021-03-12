//轮播.
var index = 0;
var imgs = document.querySelectorAll(".side");
setInterval(function() {
    if (index == 4) {
        index = 0;
    }
    for (var j = 0; j < imgs.length; j++) {
        imgs[j].style.opacity = "0";
    }
    imgs[index].style.opacity = "1";
    index++;
}, 2000)
