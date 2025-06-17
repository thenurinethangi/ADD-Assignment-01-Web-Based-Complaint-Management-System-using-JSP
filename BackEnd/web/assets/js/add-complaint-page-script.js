let clearBtn = $('#clear-btn');
clearBtn.on('click',()=>{

    $('#title-input')[0].value = '';
    $('#date-input')[0].value = '';
    $('#description-input')[0].value = '';
    $('#priority-input')[0].value = 'default';
});

//add form
let addForm = $('#text-field-container')[0];
addForm.addEventListener('submit',function (event){

    let title = $('#title-input')[0].value;
    let description = $('#description-input')[0].value;
    let date = $('#date-input')[0].value;
    let priority = $('#priority-input')[0].value;

    console.log(title)
    console.log(description)
    console.log(date)
    console.log(priority)

    if(title==='' || description==='' || priority==='default' || date===''){
        event.preventDefault();
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'All Fields Required!'
        });
        return;
    }

    let titleRegex = /^[A-Za-z][A-Za-z0-9\s,.-]{2,99}$/;
    let descRegex = /^.{10,1000}$/;

    let titleValidation = titleRegex.test(title);
    let descriptionValidation = descRegex.test(descRegex);

    if(!titleValidation || !descriptionValidation){
        event.preventDefault();
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Invalid Input!'
        });
    }
});