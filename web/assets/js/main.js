const loginBtn = document.querySelector("#login");
const registerBtn = document.querySelector("#register");
const loginForm = document.querySelector(".login-form");
const registerForm = document.querySelector(".register-form");


loginBtn.addEventListener('click', () => {
    loginBtn.style.backgroundColor =  "#512222";
    registerBtn.style.backgroundColor = "rgba(255, 255, 255, 0.3)"

    loginForm.style.left = "50%";
    registerForm.style.left = "-50%";

    loginForm.style.opacity = 1;
    registerForm.style.opacity = 0;

})



registerBtn.addEventListener('click', () => {
    loginBtn.style.backgroundColor =  "rgba(255, 255, 255, 0.3)"
    registerBtn.style.backgroundColor =  "#512222"; 

    loginForm.style.left = "150%";
    registerForm.style.left = "50%";

    loginForm.style.opacity = 0;
    registerForm.style.opacity = 1;

})

const logInputField = document.getElementById("logPassword");
const logInputicon = document.getElementById("log-pass-icon");


const regInputField = document.getElementById("regPassword");
const regInputicon = document.getElementById("reg-pass-icon");


function myLogPassword(){

    if(logInputField.type === "password"){
        logInputField.type = "text";

        logInputicon.name = "eye-off-outline";
        logInputicon.style.cursor = "pointer"; 
    }

    else{logInputField.type = "password";

        logInputicon.name = "eye-outline";
        logInputicon.style.cursor = "pointer"; }
}


function myRegPassword(){

    if(regInputField.type === "password"){
        regInputField.type = "text";

        regInputicon.name = "eye-off-outline";
        regInputicon.style.cursor = "pointer"; 
    }

    else{regInputField.type = "password";

        regInputicon.name = "eye-outline";
        regInputicon.style.cursor = "pointer"; }
}



function changeIcon(value){
    if(value.length > 0){
        logInputicon.name = "eye-outline"
        regInputicon.name = "eye-outline"
    } else{        
        logInputicon.name = "lock-closed-outline"
        regInputicon.name = "lock-closed-outline"
    }
}



