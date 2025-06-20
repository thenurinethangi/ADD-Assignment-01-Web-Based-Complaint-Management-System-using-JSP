<%--
  Created by IntelliJ IDEA.
  User: PCWORLD
  Date: 6/18/2025
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page session="true" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  long imgTimestamp = System.currentTimeMillis();
%>
<html>
<head>
  <title>EMS-User Profile</title>
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/user-profile-page-style.css?v=<%=timestamp%>">
  <style>
  </style>
</head>
<body>

<main class="container-fluid main-container">
  <div class="row" id="main-row">
    <!-- Sidebar -->
    <div class="sidebar" id="navigation-side">
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
        <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/editComplaint" class="nav-item">
          <span class="nav-icon">✏️</span>
          Edit Complaints
        </a>
        <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/viewComplaint" class="nav-item">
          <span class="nav-icon">🔍</span>
          View Complaints
        </a>
        <a href="http://localhost:8080/BackEnd_Web_exploded/api/v1/page/userprofile" class="nav-item active">
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

    <!-- Main Content -->
    <div id="profile-side">
      <div class="profile-container">
        <div class="profile-header">
          <h1>User Profile</h1>
          <p>Manage your account information and preferences</p>
        </div>

        <div class="profile-card">
          <form id="profile-form" action="http://localhost:8080/BackEnd_Web_exploded/api/v1/userprofile" method="post" enctype="multipart/form-data">
            <!-- Profile Picture Section -->
            <div class="card-section">
              <h3 class="section-title">
                <i class="fas fa-image"></i>
                Profile Picture
              </h3>
              <div class="profile-picture-section">
                <div class="profile-picture-container">
                  <div class="profile-picture" id="profile-picture-display">
                    <img src="${pageContext.request.contextPath}/assets/image/${sessionScope.image}" id="profile-pic">
                  </div>
                  <div class="upload-overlay" onclick="document.getElementById('profile-picture-input').click()">
                    <i class="fas fa-camera"></i>
                  </div>
                  <input type="file" id="profile-picture-input" name="profilePicture" accept="image/*">
                </div>
                <div class="upload-info">
                  <button type="button" class="upload-btn" onclick="document.getElementById('profile-picture-input').click()">
                    <i class="fas fa-upload"></i>
                    Change Picture
                  </button>
                  <div class="upload-hint">JPG, PNG or GIF. Max size 2MB.</div>
                </div>
              </div>
            </div>

            <!-- Personal Information -->
            <div class="card-section">
              <h3 class="section-title">
                <i class="fas fa-user"></i>
                Personal Information
              </h3>
              <div class="form-grid">
                <div class="form-group">
                  <label for="firstName" class="form-label">First Name</label>
                  <input type="text" class="form-control" id="firstName" name="firstName" value="${sessionScope.firstName}" required>
                </div>
                <div class="form-group">
                  <label for="lastName" class="form-label">Last Name</label>
                  <input type="text" class="form-control" id="lastName" name="lastName" value="${sessionScope.lastName}" required>
                </div>
                <div class="form-group">
                  <label for="fullName" class="form-label">Full Name</label>
                  <input type="text" class="form-control" id="fullName" name="fullName" value="${sessionScope.fullName}" required>
                </div>
                <div class="form-group">
                  <label for="phone" class="form-label">Phone Number</label>
                  <input type="tel" class="form-control" id="phone" name="phone" value="${sessionScope.phoneNo}">
                </div>
              </div>
            </div>

            <!-- Account Information -->
            <div class="card-section">
              <h3 class="section-title">
                <i class="fas fa-envelope"></i>
                Account Information
              </h3>
              <div class="form-grid">
                <div class="form-group">
                  <label for="email" class="form-label">Email Address</label>
                  <input type="email" class="form-control" id="email" name="email" value="${sessionScope.email}" required>
                </div>
                <div class="form-group">
                  <label for="role" class="form-label">Role</label>
                  <input type="text" class="form-control" id="role" name="role" value="${sessionScope.role}" readonly>
                </div>
                <div class="form-group">
                  <label for="department" class="form-label">Department</label>
                  <input type="text" class="form-control" id="department" name="department" value="IT Department">
                </div>
                <div class="form-group">
                  <label for="employeeId" class="form-label">Employee ID</label>
                  <input type="text" class="form-control" id="employeeId" name="employeeId" value="EMP-2024-001" readonly>
                </div>
              </div>

              <div class="action-buttons">
                <button type="button" class="btn btn-outline-secondary">
                  <i class="fas fa-times"></i>
                  Cancel
                </button>
                <button type="submit" class="btn btn-primary">
                  <i class="fas fa-save"></i>
                  Save Changes
                </button>
              </div>
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
<script src="${pageContext.request.contextPath}/assets/js/user-profile-page-script.js"></script>
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
<script>
  document.getElementById("profile-picture-input").addEventListener("change", function (e) {
    const file = e.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function (e) {
        const preview = document.getElementById("profile-pic");
        preview.src = e.target.result;
        preview.style.display = "block";
        preview.style.width = '100%'
        preview.style.height = '100%'

      };
      reader.readAsDataURL(file);
    }
  });
</script>
</body>
</html>