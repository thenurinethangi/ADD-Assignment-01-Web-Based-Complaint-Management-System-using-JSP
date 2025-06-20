<%--
  Created by IntelliJ IDEA.
  User: PCWORLD
  Date: 6/18/2025
  Time: 12:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>EMS-Admin Complaints</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/admin-complaint-page-style.css">
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
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/dashboardadmin" class="nav-item">
                    <span class="nav-icon">🏠</span>
                    Dashboard
                </a>
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/complaintsadmin" class="nav-item active">
                    <span class="nav-icon">📝</span>
                    Complaints
                </a>
                <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/userprofileadmin" class="nav-item">
                    <span class="nav-icon">👤</span>
                    Profile
                </a>
            </div>

            <div class="user-profile">
                <div class="user-info">
                    <div class="user-avatar">${sessionScope.firstLatter}</div>
                    <div>
                        <div style="font-weight: 600; color: white;">${sessionScope.name}</div>
                        <div style="font-size: 0.8rem; opacity: 0.8; color: white;">${sessionScope.role}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col" id="dashboard-side">
            <div id="complain-id-box">
                <h2>Complaints</h2>
            </div>
            <div id="table-container">
                <table class="modern-table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Priority</th>
                        <th>Status</th>
                        <th>Updated</th>
                        <th>Admin Note</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="x" items="${sessionScope.complaintsList}">

                        <tr>
                            <td><span class="complaint-id">${x.id}</span></td>
                            <td><span class="title-text">${x.title}</span></td>
                            <td><span class="description-text">${x.description}</span></td>
                            <td><span class="date-text">${x.submittedDate}</span></td>
                            <td><span class="priority-badge ${x.priorityLevel == 'Urgent' ? 'priority-high' : (x.priorityLevel == 'High' ? 'priority-high' : (x.priorityLevel == 'Medium' ? 'priority-medium' : (x.priorityLevel == 'Low' ? 'priority-low' : '')))}">${x.priorityLevel}</span></td>
                            <td><span class="status-badge ${x.status == 'Pending' ? 'status-Pending' : (x.status == 'In Progress' ? 'status-in-progress' : (x.status == 'Resolved' ? 'status-resolved' : (x.status == 'Open' ? 'status-open' : '')))}">${x.status}</span></td>
                            <td><span class="date-text">${x.updatedDate}</span></td>
                            <td><span class="adminNote-text">${x.adminNote}</span></td>
                            <td>
                                <div class="action-buttons">
                                    <div>
                                        <input type="text" class="selected-item-id" value="${x.id}" style="display: none">
                                        <input type="text" class="selected-item-status" value="${x.status}" style="display: none">
                                        <input type="text" class="selected-item-note" value="${x.adminNote}" style="display: none">
                                        <button class="action-btn btn-edit" type="button" data-bs-toggle="modal" data-bs-target="#complaintModal" ${x.status== 'Resolved' ? 'disabled' : ''}>
                                            <i class="fa-solid fa-file-pen"></i>
                                        </button>
                                    </div>
                                    <form action="http://localhost:8080/BackEnd_Web_exploded/api/v1/admincomplaint/complete" method="post" class="complete-form">
                                        <input type="text" id="selected-item-complete" name="id" value="${x.id}" style="display: none">
                                        <button class="action-btn btn-complete" type="submit" ${x.status== 'Resolved' ? 'disabled' : ''}>
                                            <i class="fa-solid fa-circle-check"></i>
                                        </button>
                                    </form>
                                    <form action="http://localhost:8080/BackEnd_Web_exploded/api/v1/admincomplaint/delete" method="post" class="delete-form">
                                        <input type="text" id="selected-item-delete" name="id" value="${x.id}" style="display: none">
                                        <button class="action-btn btn-delete" type="submit">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="complaintModal" tabindex="-1" aria-labelledby="complaintModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="complaintModalLabel">
                        <i class="fas fa-clipboard-list"></i>
                        Update Complaint
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Complaint ID Section -->
                    <div class="complaint-id-section">
                        <div class="complaint-id-label">Complaint ID</div>
                        <div class="complaint-identity" id="complaint-identity">#</div>
                    </div>

                    <form id="complaintForm" action="http://localhost:8080/BackEnd_Web_exploded/api/v1/admincomplaint/update" method="post">
                        <!-- Status Selection -->
                        <div class="mb-4">
                            <label for="statusSelect" class="form-label">
                                <i class="fas fa-flag"></i>
                                Change Status
                            </label>
                            <input type="text" id="hidden-id" name="id" style="display: none">
                            <select class="form-select" id="statusSelect" name="status">
                                <option value="Pending" class="role-options">Pending</option>
                                <option value="In Progress" class="role-options">In Progress</option>
                                <option value="Open" class="role-options">Open</option>
                            </select>
                            <div class="mt-2">
                                <small class="text-muted">Current status:</small>
                                <span id="statusPreview" class="status-preview status-open"></span>
                            </div>
                        </div>

                        <!-- Admin Notes -->
                        <div class="mb-4">
                            <label for="adminNotes" class="form-label">
                                <i class="fas fa-sticky-note"></i>
                                Admin Notes
                            </label>
                            <textarea class="form-control" id="adminNotes" rows="4" placeholder="Add your administrative notes here..." name="adminNote"></textarea>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-custom btn-cancel" data-bs-dismiss="modal">
                                <i class="fas fa-times"></i>
                                Cancel
                            </button>
                            <button type="submit" class="btn btn-custom btn-save">
                                <i class="fas fa-save"></i>
                                Save Changes
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${pageContext.request.contextPath}/lib/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin-complaint-page-script.js"></script>
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
        else if(msg==='This Complaint Has Already Been Resolved And Cannot be Edited!'){
            Swal.fire({
                icon: 'warning',
                title: 'Warning!',
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
        if (!userName || userName==='' || role!=='Admin') {
            window.location.href = '${pageContext.request.contextPath}/view/SignInPage.jsp';
        }else {
            //
        }
    });
</script>
</body>
</html>
