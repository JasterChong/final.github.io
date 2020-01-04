var eye1 = document.getElementById('eye1');
var eye2 = document.getElementById('eye2');
var pwd1 = document.getElementById('signin-pwd');
var pwd2 = document.getElementById('signup-pwd');

function showhide() {
    if (pwd1.type == "password") {
        pwd1.type = "text";
        eye1.className = 'fa fa-eye-slash ml-2';
    }
    else {
        pwd1.type = "password";
        eye1.className = 'fa fa-eye ml-2';
    }

    if (pwd2.type == "password") {
        pwd2.type = "text";
        eye2.className = 'fa fa-eye-slash ml-2';
    }
    else {
        pwd2.type = "password";
        eye2.className = 'fa fa-eye ml-2';
    }
}
