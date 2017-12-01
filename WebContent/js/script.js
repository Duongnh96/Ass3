function swap(file){
    document.logo.src=file;
}

function previewImage(){
    var oFreader =new FileReader();
    oFreader.readAsDataURL(document.getElementById("upload").files[0]);

    oFreader.onload=function(e){
         document.getElementById("preview").src= e.target.result;
    }
}
function setCookies() {
        if (window.document.cookies.checkboxx.checked) {
            var d = new Date();
            d.setFullYear(d.getFullYear()+1);
            var who = window.document.cookies.username.value;
            document.cookie="username="+who+";"+"expies=" + d.toGMTString();
            alert(document.cookie);
        }else{
            deleteCookie();
        }
        return true;
}
function readCookie() {
    if (document.cookie) {
    var theCookie = document.cookie;
    var pos = theCookie.indexOf("username=");
    if (pos != -1) {
    var cookie_array = theCookie.split("=");
    var value = cookie_array[1];
    window.document.cookieForm.username.value=value;
    window.document.cookieForm.persist.checked=true;
}
}
}
function deleteCookie() {
        if (document.cookie) {
        var expDate = new Date();
        expDate.setFullYear(expDate.getFullYear() - 1);
        document.cookie = "username=" + "" + ";" + "expires=" + expDate.toGMTString();
}
}