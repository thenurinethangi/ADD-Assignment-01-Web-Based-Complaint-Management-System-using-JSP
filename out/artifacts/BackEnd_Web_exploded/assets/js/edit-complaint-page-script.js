//search bar
let searchBarForm = $('#search-bar-form')[0];
searchBarForm.addEventListener('submit',function (event) {

    let inputText = $('#search_bar')[0].value;

    if(inputText===''){
        return;
    }

    let idRegex = /^[cC]-\d{6}$/;
    let idValidation = idRegex.test(inputText);

    if(!idValidation){
        event.preventDefault();
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Not A Valid ID!'
        });
    }
});


//update form
let updateForm = $('#text-field-container')[0];
updateForm.addEventListener('submit',function (event){

    let id = $('#id-input')[0].value;
    if(id===''){
        event.preventDefault();
        return;
    }

    let title = $('#title-input')[0].value.trim();
    let description = $('#description-input')[0].value.trim();
    let date = $('#date-input')[0].value;
    let priority = $('#priority-input')[0].value;

    if(title==='' || description==='' || priority==='default' || date===''){
        event.preventDefault();
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'All Fields Required!'
        });
        return;
    }

    let titleRegex =  /^.{10,500}$/;
    let descRegex = /^.{10,500}$/;

    let titleValidation = titleRegex.test(title);
    let descriptionValidation = descRegex.test(descRegex);

    console.log(titleValidation)
    console.log(descriptionValidation)

    if(!titleValidation || !descriptionValidation){
        event.preventDefault();
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Invalid Input!'
        });
    }

});


//cancel btn
let cancelBtn = $('#cancel-btn');
cancelBtn.on('click',()=>{

    $('#search_bar')[0].value = '';
    $('#id-input')[0].value = '';
    $('#title-input')[0].value = '';
    $('#description-input')[0].value = '';
    $('#date-input')[0].value = '';
    $('#priority-input')[0].value = 'default';
    $('#status-input')[0].value = '';

});







