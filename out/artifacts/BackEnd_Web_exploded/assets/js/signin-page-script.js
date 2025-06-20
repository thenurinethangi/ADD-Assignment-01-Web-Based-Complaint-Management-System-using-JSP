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

    const signInBtn = document.getElementById('signInBtn');
    signInBtn.addEventListener('mouseenter', function() {
        this.innerHTML = '<i class="fas fa-rocket"></i> Sign Up';
    });

    signInBtn.addEventListener('mouseleave', function() {
        this.innerHTML = 'Sign Up';
    });
});


//form submit
document.getElementById("sign-in-form").addEventListener("submit", function (e) {

    console.log("fuck")
    let email = $('#email-input')[0].value.trim();
    let password = $('#password-input')[0].value.trim();

    if(email==='' || password===''){
        e.preventDefault();
        Swal.fire({
            title: 'Error!',
            text: 'Require All Data!',
            icon: 'error',
            confirmButtonText: 'Ok'
        });
        return;
    }
    // clean();
});

function clean() {

    $('#email-input')[0].value = '';
    $('#password-input')[0].value = '';
}














