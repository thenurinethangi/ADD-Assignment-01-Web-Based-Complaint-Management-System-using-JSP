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














