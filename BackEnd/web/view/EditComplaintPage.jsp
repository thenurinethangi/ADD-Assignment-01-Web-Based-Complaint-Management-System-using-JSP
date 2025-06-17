<%--
  Created by IntelliJ IDEA.
  User: PCWORLD
  Date: 6/17/2025
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page session="true" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>EMS-Edit Complaint</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="ico" href="${pageContext.request.contextPath}/assets/image/negative-comment.ico">
    <meta name="author" content="Thenuri Nethangi">
    <meta name="keywords" content="html, css, javascript, pos web, complain management system, web development, software engineering, computer science">
    <meta name="description" content="This website is a Complain Management system Web Application designed to manage complains efficiently.">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anton+SC&family=Cinzel+Decorative:wght@400;700;900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Merriweather+Sans:ital,wght@0,300..800;1,300..800&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Raleway:ital,wght@0,100..900;1,100..900&family=Red+Hat+Display:ital,wght@0,300..900;1,300..900&family=Roboto:ital,wght@1,800&family=Rubik:ital@0;1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/edit-complaint-page-style.css">
    <style>
        #edit-btn{
            width: 100px;
        }

        #cancel-btn{
            width: 100px;
            background-color: #90A4AE;
            border-color: #90A4AE;
        }

        #text-area-field{
            width: 99%;
        }

        #edit-btn{
            width: 100px;
            background: linear-gradient(135deg, #007BFF, rgba(0, 86, 179, 0.8));
            border: none;
            border-radius: 8px;
            padding: 9px 18px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
            position: relative;
            overflow: hidden;
        }

        #edit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s ease;
        }

        #edit-btn:hover::before {
            left: 100%;
        }

        #edit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 123, 255, 0.4);
        }

        #edit-btn:active {
            transform: translateY(-1px);
        }

        #cancel-btn{
            width: 100px;
            background: linear-gradient(135deg, #90A4AE, #78909C);
            border: none;
            border-radius: 8px;
            padding: 9px 18px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(144, 164, 174, 0.3);
            position: relative;
            overflow: hidden;
            margin-left: 7px;
        }

        #cancel-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s ease;
        }

        #cancel-btn:hover::before {
            left: 100%;
        }

        #cancel-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(144, 164, 174, 0.4);
        }

        #cancel-btn:active {
            transform: translateY(-1px);
        }
    </style>
</head>
<body>

<main class="container-fluid main-container">
    <div class="row" id="main-row">
        <div class="col-3 col-lg-2" id="navigation-side">
            <div class="sidebar-header">
                <div id="title-box">
                    <img src="${pageContext.request.contextPath}/assets/image/solutions%20(2).png" alt="web page icon">
                    <h5 id="web-app-title">ResolveIT</h5>
                </div>
            </div>

            <div class="nav-menu">
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/dashboard" class="nav-item">
                    <span class="nav-icon">🏠</span>
                    Dashboard
                </a>
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/addComplaint" class="nav-item">
                    <span class="nav-icon">📝</span>
                    Submit Complaint
                </a>
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/editComplaint" class="nav-item active">
                    <span class="nav-icon">✏️</span>
                    Edit Complaints
                </a>
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/viewComplaint" class="nav-item">
                    <span class="nav-icon">🔍</span>
                    View Complaints
                </a>
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/profile" class="nav-item">
                    <span class="nav-icon">👤</span>
                    Profile
                </a>
            </div>

            <div class="user-profile">
                <div class="user-info">
                    <div class="user-avatar">${sessionScope.firstLatter}</div>
                    <div>
                        <div style="font-weight: 600;">${sessionScope.name}</div>
                        <div style="font-size: 0.8rem; opacity: 0.8;">${sessionScope.role}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col" id="dashboard-side">
            <div id="complain-id-box">
                <form id="search-bar-form" action="http://localhost:8080/BackEnd_Web_exploded/api/v1/complaint" method="get">
                    <input type="text" class="form-control" id="search_bar" placeholder="C-000001" name="search" value="${search}">
                    <button type="submit" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <form id="text-field-container" action="http://localhost:8080/BackEnd_Web_exploded/api/v1/complaint/edit" method="post">
                <div id="top-fields">
                    <div class="mb-3" style="display: none">
                        <input type="text" class="form-control" id="id-input" name="id" value="${id}">
                    </div>
                    <div class="mb-3">
                        <label for="title-input" class="form-label">Complaint Title</label>
                        <input type="text" class="form-control" id="title-input" name="title" value="${title}">
                    </div>
                    <div class="mb-3">
                        <label for="date-input" class="form-label">Submitted Date</label>
                        <input type="date" class="form-control" id="date-input" name="date" value="${date}">
                    </div>
                </div>
                <div class="mb-3" id="text-area-field">
                    <label for="description-input" class="form-label">Description</label>
                    <textarea class="form-control" id="description-input" rows="3" name="description">${description}</textarea>
                </div>
                <div id="bottom-fields">
                    <div class="mb-3">
                        <label for="priority-input" class="form-label">Priority Level</label>
                        <select class="form-select" aria-label="Default select example" id="priority-input" name="priority">
                                <option value="default" class="role-options"
                                ${priority == 'default' ? 'selected' : ''}>Priority Level</option>
                                <option value="Urgent" class="role-options"
                                ${priority == 'Urgent' ? 'selected' : ''}>Urgent</option>
                                <option value="High" class="role-options"
                                ${priority == 'High' ? 'selected' : ''}>High</option>
                                <option value="Medium" class="role-options"
                                ${priority == 'Medium' ? 'selected' : ''}>Medium</option>
                                <option value="Low" class="role-options"
                                ${priority == 'Low' ? 'selected' : ''}>Low</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="status-input" class="form-label">Status</label>
                        <input type="email" class="form-control" id="status-input" readonly name="status" value="${status}">
                    </div>
                </div>
                <div id="button-box">
                    <button type="submit" class="btn btn-primary" id="edit-btn">Edit</button>
                    <button type="button" class="btn btn-primary" id="cancel-btn">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${pageContext.request.contextPath}/lib/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/assets/js/edit-complaint-page-script.js"></script>
<%--<%@ taglib uri="jakarta.tags.core" prefix="c" %>--%>
<c:if test="${not empty alert}">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        let msg = '${alert}';

        if(msg.startsWith("Successfully")){
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: '${alert}'
            });
        }
        else{
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '${alert}'
            });
        }
    </script>
</c:if>

<script>
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

        let title = $('#title-input')[0].value;
        let description = $('#description-input')[0].value;
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

        let titleRegex = /^(?=.*[A-Za-z])[A-Za-z0-9\s,.'-]{3,100}$/;
        let descRegex = /^(?=.*[A-Za-z])[A-Za-z0-9\s,.'"()\-:;!?]{10,1000}$/;

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
</script>
</body>
</html>
