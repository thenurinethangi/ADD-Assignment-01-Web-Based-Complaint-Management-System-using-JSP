// Add click handlers for action buttons
document.addEventListener('DOMContentLoaded', function() {
    // View button handlers
    document.querySelectorAll('.btn-view').forEach(button => {
        button.addEventListener('click', function() {
            const row = this.closest('tr');
            const id = row.querySelector('.complaint-id').textContent;
            console.log('View complaint:', id);
            // Add your view logic here
        });
    });

    // Delete button handlers
    document.querySelectorAll('.btn-delete').forEach(button => {
        button.addEventListener('click', function() {
            const row = this.closest('tr');
            const id = row.querySelector('.complaint-id').textContent;

            Swal.fire({
                title: 'Are you sure?',
                text: `Do you want to delete complaint ${id}?`,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Add your delete logic here
                    console.log('Delete complaint:', id);

                    Swal.fire(
                        'Deleted!',
                        'The complaint has been deleted.',
                        'success'
                    );
                }
            });
        });
    });
});



document.querySelectorAll('.action-buttons').forEach(form => {
    form.addEventListener('submit', function (event) {

        event.preventDefault();

        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to undo this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    icon: 'success',
                    title: 'Deleted!',
                    text: 'Your item has been deleted.',
                    showConfirmButton: false,
                    timer: 1500
                });
                setTimeout(() => {
                    form.submit();
                }, 1500);
            }
        });
    });
});
