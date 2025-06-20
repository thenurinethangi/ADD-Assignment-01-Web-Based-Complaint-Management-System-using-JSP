//set model values
document.querySelectorAll('.btn-edit').forEach(button => {
    button.addEventListener('click', function() {

        let buttonBox = button.parentNode;
        let children = buttonBox.children;

        let id = children[0].value;
        let status = children[1].value;
        let note = children[2].value;

        $('#complaint-identity').text('#' + id);
        $('#hidden-id').val(id);
        $('#statusPreview').text(status);
        if(note!=='-'){
            $('#adminNotes').val(note);
        }
        else{
            $('#adminNotes').val('');
        }

        let options = $('#statusSelect').children();
        for (let i = 0; i < options.length; i++) {
            if(options[i].value===status){
                options[i].selected = true;
            }
        }

    });
});


//confirm before complete
document.querySelectorAll('.complete-form').forEach(form => {
    form.addEventListener('submit', function (event) {

        event.preventDefault();

        Swal.fire({
            title: 'Confirm first!',
            text: "Are you sure you want to mark this complaint as resolved?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes!',
            cancelButtonText: 'No, cancel!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                setTimeout(() => {
                    form.submit();
                }, 100);
            }
        });
    });
});


//confirm before delete
document.querySelectorAll('.delete-form').forEach(form => {
    form.addEventListener('submit', function (event) {

        event.preventDefault();

        Swal.fire({
            title: 'Confirm first!',
            text: "Are you sure you want to delete this complaint?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                setTimeout(() => {
                    form.submit();
                }, 100);
            }
        });
    });
});












