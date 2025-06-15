document.addEventListener('DOMContentLoaded', function() {
    const inputs = document.querySelectorAll('input, select');

    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'translateX(5px)';
        });

        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'translateX(0)';
        });
    });

    const signUpBtn = document.getElementById('signUpBtn');
    signUpBtn.addEventListener('mouseenter', function() {
        this.innerHTML = '<i class="fas fa-rocket"></i> Sign Up';
    });

    signUpBtn.addEventListener('mouseleave', function() {
        this.innerHTML = 'Sign Up';
    });
});


document.getElementById("sign-up-form").addEventListener("submit", function (e) {

    let email = $('#email-input')[0].value.trim();
    let password = $('#password-input')[0].value.trim();
    let role = $('#role-input')[0].value;

    if(email==='' || password==='' || role==='' || role==='default'){
        e.preventDefault();
        Swal.fire({
            title: 'Error!',
            text: 'All fields are required',
            icon: 'error',
            confirmButtonText: 'Ok'
        });
        return;
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const passwordRegex = /^[a-zA-Z0-9_@]{7,}$/;

    let emailValidation = emailRegex.test(email);
    let passwordValidation = passwordRegex.test(password);

    if(!emailValidation || !passwordValidation){
        e.preventDefault();
        Swal.fire({
            title: 'Error!',
            text: 'Invalid Input',
            icon: 'error',
            confirmButtonText: 'Ok'
        });
    }
});
















