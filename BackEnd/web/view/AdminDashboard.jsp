<%--
  Created by IntelliJ IDEA.
  User: PCWORLD
  Date: 6/16/2025
  Time: 7:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>EMS-Admin-Dashboard</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/employee-dashboard-page-style.css">
</head>
<body>

<div class="dashboard-container">

    <!-- EMPLOYEE VIEW SIDEBAR -->
    <nav class="sidebar employee-view">
        <div class="sidebar-header">
            <div id="title-box">
                <img src="${pageContext.request.contextPath}/assets/image/solutions%20(2).png" alt="web page icon">
                <h5 id="web-app-title">ResolveIT</h5>
            </div>
        </div>

        <div class="nav-menu">
            <a href="http://localhost:8080/BackEnd_Web_exploded/employee/dashboard" class="nav-item active">
                <span class="nav-icon">🏠</span>
                Dashboard
            </a>
            <a href="http://localhost:8080/BackEnd_Web_exploded/employee/dashboard" class="nav-item">
                <span class="nav-icon">📝</span>
                Complaints
            </a>
            <a href="http://localhost:8080/BackEnd_Web_exploded/employee/dashboard" class="nav-item">
                <span class="nav-icon">🧑‍💼</span>
                Users
            </a>
            <a href="http://localhost:8080/BackEnd_Web_exploded/employee/profile" class="nav-item">
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
    </nav>

    <!-- EMPLOYEE VIEW MAIN CONTENT -->
    <main class="main-content employee-view" style="background-color: #FFFFFF">
        <div class="header">
            <div>
                <h1>Administrative Dashboard</h1>
                <div class="breadcrumb">Home / Dashboard</div>
            </div>
        </div>

        <!-- Employee Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-header">
                    <span class="stat-title">All Complaints</span>
                    <div class="stat-icon" style="background: #007BFF">📝</div>
                </div>
                <div class="stat-value">${sessionScope.allComplaints}</div>
                <div class="stat-change">+2 this month</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <span class="stat-title">Today Complaints</span>
                    <div class="stat-icon" style="background: rgba(25,33,46,0.49)">📅</div>
                </div>
                <div class="stat-value">${sessionScope.todayComplaints}</div>
                <div class="stat-change">+1 today</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <span class="stat-title">Pending</span>
                    <div class="stat-icon" style="background: #ffc107">⏳</div>
                </div>
                <div class="stat-value">${sessionScope.pendingComplaints}</div>
                <div class="stat-change">Awaiting review</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <span class="stat-title">In Progress</span>
                    <div class="stat-icon" style="background: #17a2b8">🔄</div>
                </div>
                <div class="stat-value">${sessionScope.inProgressComplaints}</div>
                <div class="stat-change">Being resolved</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <span class="stat-title">Resolved</span>
                    <div class="stat-icon" style="background: #28a745">✅</div>
                </div>
                <div class="stat-value">${sessionScope.resolvedComplaints}</div>
                <div class="stat-change">Completed</div>
            </div>
        </div>

        <!-- Charts Section -->
        <div class="charts-grid">
            <div class="chart-card">
                <div class="chart-header">
                    <h3 class="chart-title">My Complaint Trends</h3>
                    <p class="chart-subtitle">Monthly overview of your submitted complaints</p>
                </div>
                <div class="chart-placeholder">
                    📊 Your personal complaint history chart
                </div>
            </div>

            <div class="chart-card">
                <div class="chart-header">
                    <h3 class="chart-title">Status Distribution</h3>
                    <p class="chart-subtitle">Your complaint status breakdown</p>
                </div>
                <div class="donut-chart">
                    <div class="donut-placeholder"></div>
                    <p style="color: #6c757d; font-size: 0.9rem;">Pending, In Progress, Resolved</p>
                </div>
            </div>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${pageContext.request.contextPath}/lib/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
