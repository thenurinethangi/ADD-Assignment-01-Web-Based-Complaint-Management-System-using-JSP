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
    <link rel="icon" type="ico" href="../assets/image/negative-comment.ico">
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
    <link rel="stylesheet" href="../assets/style/sign-in-page-style.css">

    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", "Roboto", "Helvetica Neue", Arial, sans-serif;
            overflow-x: hidden;
            position: relative;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #FFFFFF;
        }

        section{
            width: 100%;
            height: 100vh;
            /*border: 1px solid crimson;*/
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #content-container{
            width: 100%;
            height: 100%;
            /*border: 1px solid blueviolet;*/
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #input-fields-side{
            width: 50%;
            padding-inline: 90px;
            z-index: 10;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        #images-side{
            width: 50%;
            height: 100%;
            background: linear-gradient(135deg, #007BFF 0%, #0056b3 100%);
            z-index: 1;
            overflow-x: hidden;
            position: relative;
        }

        #images-side::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1" fill="%23ffffff" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
            z-index: 1;
        }

        #long-width-area{
            width: 300%;
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            align-items: center;
            overflow-x: hidden;
            animation-name: slide;
            animation-duration: 15s;
            animation-timing-function: ease-in-out;
            animation-iteration-count: infinite;
            animation-direction: alternate;
            z-index: 2;
            position: relative;
        }

        .box{
            width: 33.3%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 40px;
            color: white;
            padding-top: 1.5em;
            transition: transform 0.3s ease;
        }

        .box:hover {
            transform: translateY(-10px);
        }

        .box img {
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            filter: drop-shadow(0 10px 20px rgba(0, 0, 0, 0.2));
        }

        .box:hover img {
            transform: scale(1.05) rotate(2deg);
            filter: drop-shadow(0 20px 40px rgba(0, 0, 0, 0.3));
        }

        .p1{
            font-weight: 600;
            margin: 0;
            padding: 0;
            animation: fadeInUp 0.8s ease-out;
        }

        .p2{
            font-weight: 300;
            font-size: 14px;
            margin: 0;
            padding: 0;
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        @keyframes fadeInUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .desc{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 5px;
        }

        @keyframes slide {

            0%{
                margin-left: -0%;
            }

            20%{
                margin-left: -0%;
            }

            45%{
                margin-left: -100%;
            }

            65%{
                margin-left: -100%;
            }

            85%{
                margin-left: -200%;
            }

            100%{
                margin-left: -200%;
            }
        }

        .input-fields{
            position: relative;
            padding-bottom: 1.2px;
            animation: fadeInUp 1.2s ease-out 0.3s both;
        }

        .input-fields>i{
            color: rgba(0, 0, 0, 0.75);
            position: absolute;
            transform: translate(12px,12px);
            font-size: 15px;
        }

        .input-fields>input{
            padding-left: 37px;
        }

        #signInBtn{
            width: 100%;
            background-color: #007BFF;
            border: 1px solid #007BFF;
            color: white;
            font-size: 14.5px;
            font-weight: 500;
            height: 35px;
            border-radius: 5px;
            margin-top: 1.8em;
            animation: fadeInUp 1.2s ease-out 0.3s both;
        }

        #title-box{
            display: flex;
            justify-content: flex-start;
            align-items: center;
            gap: 3px;
            margin-bottom: 3px;
            transform: translateX(-6px);
            animation: slideInLeft 1s ease-out 0.2s both;
        }

        #title-box img {
            transition: transform 0.3s ease;
        }

        #title-box:hover img {
            transform: rotate(10deg) scale(1.1);
        }

        #web-app-title{
            color: #007BFF;
            transform: translateY(5px);
            font-weight: 700;
            animation: slideInLeft 1.2s ease-out 0.3s both;
        }

        @keyframes slideInLeft {
            from { transform: translateX(-50px) translateY(5px); opacity: 0; }
            to { transform: translateX(0) translateY(5px); opacity: 1; }
        }

        #sign-up-phrase{
            text-align: center;
            color: rgba(128, 128, 128, 0.85);
            font-size: 15px;
            padding-top: 1.1em;
            animation: fadeInUp 1.2s ease-out 0.3s both;
        }

        #sign-up-phrase>span{
            color: rgba(0, 123, 255, 0.85);
            font-weight: 500;
        }

        #sign-up-phrase>span>a{
            text-decoration: none;
        }

        .sign-in-page-text{
            margin-top: 1.5em;
            padding-bottom: 1em;
            animation: slideInLeft 1.2s ease-out 0.3s both;
        }

        .sign-in-page-text>h4{
            font-weight: 700;
            color: rgba(0, 0, 0, 0.92);
        }

        .sign-in-page-text>p{
            font-size: 14px;
            color: dimgray;
            transform: translateY(-3px);
        }

        .floating-icons {
            position: absolute;
            font-size: 20px;
            color: rgba(255, 255, 255, 0.1);
            animation: floatIcon 4s ease-in-out infinite;
        }

        .floating-icons:nth-child(1) {
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-icons:nth-child(2) {
            top: 20%;
            right: 15%;
            animation-delay: 1s;
        }

        .floating-icons:nth-child(3) {
            bottom: 30%;
            left: 20%;
            animation-delay: 2s;
        }

        .floating-icons:nth-child(4) {
            bottom: 10%;
            right: 10%;
            animation-delay: 3s;
        }

        @keyframes floatIcon {
            0%, 100% { transform: translateY(0px) rotate(0deg); opacity: 0.1; }
            50% { transform: translateY(-15px) rotate(180deg); opacity: 0.3; }
        }

    </style>
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
            <form>
                <div class="mb-3 input-fields">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="email" class="form-control" id="email-input" placeholder="Email">
                </div>
                <div class="mb-3 input-fields">
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" class="form-control" id="password-input" placeholder="Password">
                </div>
                <div class="mb-3">
                    <button id="signInBtn" type="submit">Sign In</button>
                </div>
            </form>
            <div class="mb-3">
                <p id="sign-up-phrase">Don't have an account?&nbsp;<span><a href="SignUpPage.jsp">Sign Up</a></span></p>
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
<script src="../lib/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="../assets/js/signin-page-script.js"></script>
</body>
</html>
