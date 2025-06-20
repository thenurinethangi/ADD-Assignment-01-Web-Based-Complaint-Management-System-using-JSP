<%--
  Created by IntelliJ IDEA.
  User: PCWORLD
  Date: 6/17/2025
  Time: 12:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>EMS-Add Complaint</title>
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
    <%
        long timestamp = System.currentTimeMillis();
    %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/add-complaint-page-style.css?v=<%=timestamp%>">
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
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/addComplaint" class="nav-item active">
                    <span class="nav-icon">📝</span>
                    Submit Complaint
                </a>
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/editComplaint" class="nav-item">
                    <span class="nav-icon">✏️</span>
                    Edit Complaints
                </a>
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/viewComplaint" class="nav-item">
                    <span class="nav-icon">🔍</span>
                    View Complaints
                </a>
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/userprofile" class="nav-item">
                    <span class="nav-icon">👤</span>
                    Profile
                </a>
            </div>

            <div class="user-profile">
                <div class="user-info">
                    <div class="user-avatar">${sessionScope.firstLatter}</div>
                    <div>
                        <div style="font-weight: 600; color: white">${sessionScope.name}</div>
                        <div style="font-size: 0.8rem; opacity: 0.8; color: white">${sessionScope.role}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col" id="dashboard-side">
            <div id="complain-id-box">
                <h2>#${sessionScope.newId}</h2>
            </div>
            <form id="text-field-container" action="http://localhost:8080/BackEnd_Web_exploded/api/v1/complaint" method="post">
                <div id="top-fields">
                    <div class="mb-3">
                        <label for="title-input" class="form-label">Complaint Title</label>
                        <input type="text" class="form-control" id="title-input" placeholder="Enter complaint title" name="title">
                    </div>
                    <div class="mb-3">
                        <label for="date-input" class="form-label">Submitted Date</label>
                        <input type="date" class="form-control" id="date-input" name="date">
                    </div>
                </div>
                <div class="mb-3" id="text-area-field">
                    <label for="description-input" class="form-label">Description</label>
                    <textarea class="form-control" id="description-input" rows="3" placeholder="Enter short description about complaint" name="description"></textarea>
                </div>
                <div id="bottom-fields">
                    <div class="mb-3">
                        <label for="priority-input" class="form-label">Priority Level</label>
                        <select class="form-select" aria-label="Default select example" id="priority-input" name="priority">
                            <option selected value="default" class="role-options">Priority Level</option>
                            <option value="Urgent" class="role-options">Urgent</option>
                            <option value="High" class="role-options">High</option>
                            <option value="Medium" class="role-options">Medium</option>
                            <option value="Low" class="role-options">Low</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="status-input" class="form-label">Status</label>
                        <input type="email" class="form-control" id="status-input" value="Pending" readonly name="status">
                    </div>
                </div>
                <div id="button-box">
                    <button type="submit" class="btn btn-primary" id="save-btn">Save</button>
                    <button type="button" class="btn btn-primary" id="clear-btn">Clear</button>
                </div>
            </form>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${pageContext.request.contextPath}/lib/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/assets/js/add-complaint-page-script.js"></script>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
    //add form
    let addForm = $('#text-field-container')[0];
    addForm.addEventListener('submit',function (event){

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
</script>
<script>
    $(document).ready(function() {
        window.addEventListener('pageshow', function(event) {
            if (event.persisted) {
                window.location.reload();
            }
        });
    });

    $(document).ready(function() {
        const userName = "${sessionScope.email}";
        const role = "${sessionScope.role}";
        console.log(userName);
        if (!userName || userName==='' || role!=='Employee') {
            window.location.href = '${pageContext.request.contextPath}/view/SignInPage.jsp';
        }else {
            //
        }
    });
</script>
</body>
</html>
