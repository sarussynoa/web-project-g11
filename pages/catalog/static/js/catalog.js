
let txt = "בחר את הקטגוריה הרצויה" ;
let i = 0;
let speed = 100;
function Choose() {
    if ( i < 22) {
        document.getElementById("choose").innerHTML += txt.substring(i,i+1);
        i=i+1;
        setTimeout(Choose, speed);
    }
}