<%--
  Created by IntelliJ IDEA.
  User: PCWORLD
  Date: 6/15/2025
  Time: 10:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EMS-Sign In</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/sign-in-page-style.css">
</head>
<body>

<section>
    <div class="floating-icons"><i class="fas fa-cog"></i></div>
    <div class="floating-icons"><i class="fas fa-chart-line"></i></div>
    <div class="floating-icons"><i class="fas fa-users"></i></div>
    <div class="floating-icons"><i class="fas fa-bell"></i></div>

    <div id="content-container">
        <div id="input-fields-side">
            <div class="mb-3" id="title-box">
                <img src="${pageContext.request.contextPath}/assets/image/solutions%20(1).png" alt="web page icon">
                <h5 id="web-app-title">ResolveIT</h5>
            </div>
            <div class="mb-3 sign-in-page-text">
                <h4>Log In To Your Account</h4>
                <p>Sign in now and easily manage complains with ResolveIT</p>
            </div>
            <form id="sign-in-form" action="http://localhost:8080/BackEnd_Web_exploded/signin" method="post">
                <div class="mb-3 input-fields">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="email" class="form-control" id="email-input" placeholder="Email" name="email">
                </div>
                <div class="mb-3 input-fields">
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" class="form-control" id="password-input" placeholder="Password" name="password">
                </div>
                <div class="mb-3">
                    <button id="signInBtn" type="submit">Sign In</button>
                </div>
            </form>
            <div class="mb-3">
                <p id="sign-up-phrase">Don't have an account?&nbsp;<span><a href="${pageContext.request.contextPath}/view/SignUpPage.jsp" style="text-decoration: none">Sign Up</a></span></p>
            </div>

        </div>
        <div id="images-side">
            <div id="long-width-area">
                <div class="box">
                    <!--                    <img src="../../../web/assets/image/4153553-Photoroom.png" alt="hey" width="400px">-->
                    <svg width="400" height="300" viewBox="0 0 400 300" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="50" y="80" width="300" height="140" rx="20" fill="rgba(255,255,255,0.2)" stroke="rgba(255,255,255,0.3)" stroke-width="2"></rect>
                        <circle cx="120" cy="130" r="15" fill="rgba(255,255,255,0.8)"></circle>
                        <rect x="150" y="120" width="180" height="8" rx="4" fill="rgba(255,255,255,0.6)"></rect>
                        <rect x="150" y="140" width="120" height="6" rx="3" fill="rgba(255,255,255,0.4)"></rect>
                        <rect x="280" y="170" width="60" height="25" rx="12" fill="rgba(0,255,100,0.8)"></rect>
                        <path d="M290 180L295 185L305 175" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                    <div class="desc">
                        <p class="p1">Simplify Complaint Handling</p>
                        <p class="p2">Streamline complaint handling with quick, organized tracking and resolution</p>
                    </div>
                </div>
                <div class="box">
                    <svg width="400" height="300" viewBox="0 0 400 300" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="80" y="60" width="240" height="180" rx="15" fill="rgba(255,255,255,0.2)" stroke="rgba(255,255,255,0.3)" stroke-width="2"></rect>
                        <circle cx="200" cy="120" r="25" fill="rgba(255,255,255,0.8)"></circle>
                        <path d="M190 120L198 128L215 108" stroke="#007BFF" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"></path>
                        <rect x="120" y="160" width="160" height="8" rx="4" fill="rgba(255,255,255,0.6)"></rect>
                        <rect x="120" y="180" width="100" height="6" rx="3" fill="rgba(255,255,255,0.4)"></rect>
                        <rect x="120" y="200" width="140" height="6" rx="3" fill="rgba(255,255,255,0.4)"></rect>
                    </svg>
                    <!--                    <img src="../../../web/assets/image/istockphoto-1295246214-612x612-Photoroom.png" alt="hey" width="400px">-->
                    <div class="desc">
                        <p class="p1">Track Complaints</p>
                        <p class="p2">Track, respond, and resolve issues efficiently from one platform</p>
                    </div>
                </div>
                <div class="box">
                    <svg width="400" height="300" viewBox="0 0 400 300" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="60" y="70" width="280" height="160" rx="20" fill="rgba(255,255,255,0.2)" stroke="rgba(255,255,255,0.3)" stroke-width="2"></rect>
                        <circle cx="200" cy="130" r="30" fill="rgba(0,255,100,0.8)"></circle>
                        <path d="M185 130L195 140L220 115" stroke="white" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"></path>
                        <rect x="100" y="180" width="80" height="8" rx="4" fill="rgba(255,255,255,0.6)"></rect>
                        <rect x="100" y="200" width="60" height="6" rx="3" fill="rgba(255,255,255,0.4)"></rect>
                        <rect x="220" y="180" width="80" height="8" rx="4" fill="rgba(255,255,255,0.6)"></rect>
                        <rect x="220" y="200" width="60" height="6" rx="3" fill="rgba(255,255,255,0.4)"></rect>
                    </svg>
                    <!--                    <img src="../../../web/assets/image/7338023-Photoroom.png" alt="hey" width="400px">-->
                    <div class="desc">
                        <p class="p1">Mark as Resolved</p>
                        <p class="p2">Easily close resolved complaints and keep your records up to date</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${pageContext.request.contextPath}/lib/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/assets/js/signin-page-script.js"></script>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:if test="${not empty errorMsg}">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '${errorMsg}'
        });
    </script>
</c:if>
</body>
</html>
