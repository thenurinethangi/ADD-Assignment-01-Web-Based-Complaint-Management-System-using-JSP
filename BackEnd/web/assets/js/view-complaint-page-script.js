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

//
// let deleteForm = $('.action-buttons')[0];
// deleteForm.addEventListener('submit',function (event) {
//
//     Swal.fire({
//         title: 'Are you sure?',
//         text: "You won't be able to undo this!",
//         icon: 'warning',
//         showCancelButton: true,
//         confirmButtonText: 'Yes, delete it!',
//         cancelButtonText: 'No, cancel!',
//         reverseButtons: true
//     }).then(async (result) => {
//         await wait(1 * 60 * 1000);
//         if (result.isConfirmed) {
//             Swal.fire(
//                 'Deleted!',
//                 'Your item has been deleted.',
//                 'success'
//             );
//         } else if (result.dismiss === Swal.DismissReason.cancel) {
//             event.preventDefault();
//         }
//     });
// });
//
// function wait(ms) {
//     return new Promise(resolve => setTimeout(resolve, ms));
// }
