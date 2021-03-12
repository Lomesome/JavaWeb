function bagChange(){
    var oD = document.getElementById('bag-id')
    console.log(oD);
    console.log(oD.style.display);
    if(oD.style.display=="none"){
        oD.style.display="block";
    }else{
        oD.style.display="none";
    }
}