<%--
  Created by IntelliJ IDEA.
  User: PCWORLD
  Date: 6/13/2025
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EMS-Landing</title>
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
    <link rel="stylesheet" href="../assets/style/landing-page-style.css">

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
        }

        .floating-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .shape {
            position: absolute;
            opacity: 0.1;
            animation: float 6s ease-in-out infinite;
        }

        .shape:nth-child(1) {
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            top: 20%;
            right: 10%;
            animation-delay: 2s;
        }

        .shape:nth-child(3) {
            bottom: 20%;
            left: 15%;
            animation-delay: 4s;
        }

        .shape:nth-child(4) {
            bottom: 10%;
            right: 20%;
            animation-delay: 1s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .navbar {
            animation: slideDown 0.8s ease-out;
            transition: all 0.3s ease;
        }

        .navbar:hover {
            box-shadow: 0 4px 12px rgba(0,123,255,0.15);
        }

        @keyframes slideDown {
            from { transform: translateY(-100%); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        #hero-section{
            background-color: #FFFFFF;
            width: 100%;
            height: fit-content;
            position: relative;
            padding-top: 1.5em;
            padding-bottom: 7em;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            animation: fadeInUp 1s ease-out;
        }

        @keyframes fadeInUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        #hero-section-content{
            width: 87%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            /*transform: translateY(-12px);*/
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

        #title-box{
            display: flex;
            justify-content: flex-start;
            align-items: center;
            gap: 3px;
            margin-bottom: 5px;
            transform: translateX(-6px);
            animation: slideInLeft 1s ease-out 0.2s both;
        }

        #title-box img {
            transition: transform 0.3s ease;
        }

        #title-box:hover img {
            transform: rotate(10deg) scale(1.1);
        }

        #short-description{
            font-weight: 600;
            margin-bottom: 12px;
            animation: slideInLeft 1.4s ease-out 0.4s both;
        }

        #long-description{
            width: 75%;
            color: rgba(0, 0, 0, 0.8);
            font-size: 15px;
            margin-bottom: 23px;
            animation: slideInLeft 1.6s ease-out 0.5s both;
        }

        #hero-section-text-box>div{
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
            gap: 10px;
            padding-left: 10px;
        }

        #hero-section-image-box{
            animation: slideInRight 1.2s ease-out 0.6s both;
        }

        @keyframes slideInRight {
            from { transform: translateX(50px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        #hero-section-image-box img {
            border-radius: 10px;
        }

        .nav-bar-container{
            padding-right: 35px;
            padding-left: 60px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
        }

        #nav-links{
            display: flex;
            justify-content: flex-start;
            align-items: center;
            gap: 15px;
        }

        #nav-links>a{
            text-decoration: none;
            font-size: 15px;
            color: black;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
            padding: 8px 0;
        }

        #nav-links>a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #007BFF;
            transition: width 0.3s ease;
        }

        #nav-links>a:hover::after {
            width: 100%;
        }

        #nav-links>a:hover {
            color: #007BFF;
            transform: translateY(-2px);
        }

        #nav-links>a:first-child{
        }

        .btn{
            width: 120px;
            background-color: #007BFF;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s ease;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,123,255,0.4);
        }

        .btn-box{
            display: flex;
            justify-content: flex-start;
            align-items: center;
            gap: 10px;
            animation: slideInLeft 1.8s ease-out 0.7s both;
            margin-top: 2px;
        }

        #learn-more-btn{
            border: 1.5px solid #007BFF;
            background-color: #FFFFFF;
            color: #007BFF;
        }

        #about-section{
            padding-top: 1.2em;
            padding-bottom: 5em;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            animation: fadeInUp 1s ease-out;
            animation-delay: 0.8s;
            animation-fill-mode: both;
        }

        #about-section-content-container{
            width: 87%;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 100px;
        }

        #text-side{
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
            gap: 17px;
            animation: slideInLeft 1.2s ease-out 1s both;
        }

        #image-side{
            animation: slideInRight 1.2s ease-out 1s both;
        }

        #image-side img {
            transition: transform 0.3s ease, filter 0.3s ease;
            border-radius: 10px;
        }

        #image-side:hover img {
            transform: scale(1.05);
            filter: brightness(1.1);
        }

        video{
            border-radius: 5px;
        }

        p{
            color: rgba(0, 0, 0, 0.8);
        }

        #qs-title{
            font-weight: 700;
            position: relative;
        }

        @keyframes expandWidth {
            from { width: 0; }
            to { width: 50px; }
        }

        footer{
            background-color: #007BFF;
            height: 200px;
            display: flex;
            justify-content: center;
            align-items: flex-end;
            animation: slideInUp 1s ease-out;
            animation-delay: 1.5s;
            animation-fill-mode: both;
            position: relative;
            overflow: hidden;
        }

        footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
            animation: shimmer 3s infinite;
        }

        @keyframes shimmer {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        @keyframes slideInUp {
            from { transform: translateY(100%); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .pulse-animation {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .glow-effect {
            animation: glow 2s ease-in-out infinite alternate;
        }

        @keyframes glow {
            from { box-shadow: 0 0 5px #007BFF; }
            to { box-shadow: 0 0 20px #007BFF, 0 0 30px #007BFF; }
        }

    </style>

</head>
<body>

<div class="floating-shapes">
    <svg class="shape" width="60" height="60" viewBox="0 0 60 60">
        <circle cx="30" cy="30" r="25" fill="#007BFF"></circle>
    </svg>
    <svg class="shape" width="80" height="80" viewBox="0 0 80 80">
        <rect x="10" y="10" width="60" height="60" rx="10" fill="#0056b3"></rect>
    </svg>
    <svg class="shape" width="70" height="70" viewBox="0 0 70 70">
        <polygon points="35,5 60,55 10,55" fill="#007BFF"></polygon>
    </svg>
    <svg class="shape" width="90" height="90" viewBox="0 0 90 90">
        <ellipse cx="45" cy="45" rx="35" ry="20" fill="#0056b3"></ellipse>
    </svg>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid nav-bar-container">
        <img src="../assets/image/solutions%20(1).png" alt="web page icon" class="pulse-animation">

        <div id="nav-links">
            <a href="SignUpPage.jsp">Sign Up</a>
            <a href="SignInPage.jsp">Sign In</a>
        </div>
    </div>
</nav>

<section id="hero-section">
    <div id="hero-section-content">
        <div id="hero-section-text-box">
            <div>
                <div id="title-box">
                    <img src="../assets/image/solutions%20(1).png" alt="web page icon">
                    <h3 id="web-app-title">ResolveIT</h3>
                </div>
                <h1 id="short-description">Track. Manage. Resolve.</h1>
                <p id="long-description">ResolveIT is a smart and user-friendly Complaint Management System built for municipal employees and administrators. It makes it easy to submit complaints, monitor progress, and take action — all in one place.Whether you're an employee reporting.</p>
                <div class="btn-box">
                    <a href="SignUpPage.jsp"><button type="button" class="btn btn-primary" id="get-start-btn">Get Started</button></a>
                    <a href="#about-section-content-container"><button type="button" class="btn btn-primary" id="learn-more-btn">Learn More</button></a>
                </div>
            </div>
        </div>
        <div id="hero-section-image-box">
            <svg width="550" height="450" viewBox="0 0 550 450" xmlns="http://www.w3.org/2000/svg">
                <defs>
                    <linearGradient id="primaryGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" style="stop-color:#007BFF;stop-opacity:1"></stop>
                        <stop offset="100%" style="stop-color:#0056b3;stop-opacity:1"></stop>
                    </linearGradient>
                    <linearGradient id="secondaryGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" style="stop-color:#40a9ff;stop-opacity:1"></stop>
                        <stop offset="100%" style="stop-color:#007BFF;stop-opacity:1"></stop>
                    </linearGradient>
                    <filter id="glow" x="-50%" y="-50%" width="200%" height="200%">
                        <feGaussianBlur stdDeviation="3" result="coloredBlur"></feGaussianBlur>
                        <feMerge>
                            <feMergeNode in="coloredBlur"></feMergeNode>
                            <feMergeNode in="SourceGraphic"></feMergeNode>
                        </feMerge>
                    </filter>
                    <filter id="shadow" x="-50%" y="-50%" width="200%" height="200%">
                        <feDropShadow dx="0" dy="8" flood-color="#007BFF" flood-opacity="0.3" stdDeviation="4"></feDropShadow>
                    </filter>
                </defs>

                <!-- Background circles -->
                <circle cx="275" cy="225" r="180" fill="url(#primaryGrad)" opacity="0.05">
                    <animateTransform attributeName="transform" type="rotate" values="0 275 225;360 275 225" dur="20s" repeatCount="indefinite"></animateTransform>
                </circle>
                <circle cx="275" cy="225" r="120" fill="url(#secondaryGrad)" opacity="0.08">
                    <animateTransform attributeName="transform" type="rotate" values="360 275 225;0 275 225" dur="15s" repeatCount="indefinite"></animateTransform>
                </circle>

                <!-- Main dashboard interface -->
                <rect x="150" y="100" width="250" height="160" rx="15" fill="white" filter="url(#shadow)" opacity="0.95"></rect>

                <!-- Header bar -->
                <rect x="165" y="115" width="220" height="30" rx="8" fill="url(#primaryGrad)"></rect>
                <circle cx="180" cy="130" r="3" fill="white" opacity="0.8"></circle>
                <circle cx="190" cy="130" r="3" fill="white" opacity="0.8"></circle>
                <circle cx="200" cy="130" r="3" fill="white" opacity="0.8"></circle>

                <!-- Content rows -->
                <rect x="165" y="155" width="180" height="8" rx="4" fill="#e3f2fd"></rect>
                <rect x="165" y="170" width="140" height="8" rx="4" fill="#e3f2fd"></rect>
                <rect x="165" y="185" width="160" height="8" rx="4" fill="#e3f2fd"></rect>
                <rect x="165" y="200" width="120" height="8" rx="4" fill="#e3f2fd"></rect>

                <!-- Status indicators -->
                <circle cx="365" cy="159" r="6" fill="#4CAF50"></circle>
                <circle cx="365" cy="174" r="6" fill="#FF9800"></circle>
                <circle cx="365" cy="189" r="6" fill="#f44336"></circle>

                <!-- Floating action button -->
                <circle cx="370" cy="240" r="25" fill="url(#primaryGrad)" filter="url(#glow)">
                    <animate attributeName="r" values="25;28;25" dur="2s" repeatCount="indefinite"></animate>
                </circle>
                <path d="M365 240 L375 240 M370 235 L370 245" stroke="white" stroke-width="3" stroke-linecap="round"></path>

                <!-- Floating elements -->
                <g opacity="0.7">
                    <circle cx="100" cy="150" r="20" fill="url(#secondaryGrad)">
                        <animate attributeName="cy" values="150;130;150" dur="4s" repeatCount="indefinite"></animate>
                    </circle>
                    <path d="M95 150 L100 155 L105 145" stroke="white" stroke-width="2" fill="none" stroke-linecap="round"></path>
                </g>

                <g opacity="0.6">
                    <circle cx="450" cy="300" r="18" fill="url(#secondaryGrad)">
                        <animate attributeName="cy" values="300;285;300" dur="3.5s" repeatCount="indefinite"></animate>
                    </circle>
                    <rect x="445" y="295" width="10" height="10" rx="2" fill="white"></rect>
                </g>

                <!-- Connection lines -->
                <path d="M275 260 Q350 280 370 240" stroke="url(#primaryGrad)" stroke-width="2" fill="none" opacity="0.6" stroke-dasharray="5,5">
                    <animate attributeName="stroke-dashoffset" values="0;10" dur="1.5s" repeatCount="indefinite"></animate>
                </path>

                <!-- Data visualization -->
                <g transform="translate(50, 320)">
                    <rect x="0" y="0" width="120" height="80" rx="10" fill="white" filter="url(#shadow)" opacity="0.9"></rect>
                    <rect x="15" y="15" width="90" height="8" rx="4" fill="url(#primaryGrad)" opacity="0.8"></rect>
                    <text x="15" y="35" font-family="Inter" font-size="10" fill="#666">Analytics</text>

                    <!-- Mini chart bars -->
                    <rect x="15" y="45" width="8" height="20" rx="2" fill="url(#primaryGrad)"></rect>
                    <rect x="28" y="50" width="8" height="15" rx="2" fill="url(#secondaryGrad)"></rect>
                    <rect x="41" y="40" width="8" height="25" rx="2" fill="url(#primaryGrad)"></rect>
                    <rect x="54" y="48" width="8" height="17" rx="2" fill="url(#secondaryGrad)"></rect>
                    <rect x="67" y="45" width="8" height="20" rx="2" fill="url(#primaryGrad)"></rect>
                </g>

                <!-- Notification bell -->
                <g transform="translate(420, 80)">
                    <circle cx="15" cy="15" r="15" fill="url(#secondaryGrad)" opacity="0.8"></circle>
                    <path d="M10 12 Q15 8 20 12 Q20 16 15 20 Q10 16 10 12" fill="white"></path>
                    <circle cx="20" cy="8" r="4" fill="#ff4757">
                        <animate attributeName="r" values="4;6;4" dur="1s" repeatCount="indefinite"></animate>
                    </circle>
                </g>

                <!-- Progress indicators -->
                <g transform="translate(480, 200)">
                    <circle cx="0" cy="0" r="25" fill="none" stroke="#e3f2fd" stroke-width="4"></circle>
                    <circle cx="0" cy="0" r="25" fill="none" stroke="url(#primaryGrad)" stroke-width="4"
                            stroke-dasharray="157" stroke-dashoffset="39" stroke-linecap="round">
                        <animate attributeName="stroke-dashoffset" values="157;39;157" dur="3s" repeatCount="indefinite"></animate>
                    </circle>
                    <text x="0" y="5" text-anchor="middle" font-family="Inter" font-size="12" font-weight="600" fill="#007BFF">75%</text>
                </g>
            </svg>
            <!--      <img src="../../../web/assets/image/7338023.jpg" alt="landing page hero section image" width="530px">-->
        </div>
    </div>
</section>

<section id="about-section">
    <div id="about-section-content-container">
        <div id="image-side">
            <svg width="550" height="450" viewBox="0 0 550 450" xmlns="http://www.w3.org/2000/svg">
                <defs>
                    <linearGradient id="primaryGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" style="stop-color:#007BFF;stop-opacity:1"></stop>
                        <stop offset="100%" style="stop-color:#0056b3;stop-opacity:1"></stop>
                    </linearGradient>
                    <linearGradient id="secondaryGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" style="stop-color:#40a9ff;stop-opacity:1"></stop>
                        <stop offset="100%" style="stop-color:#007BFF;stop-opacity:1"></stop>
                    </linearGradient>
                    <linearGradient id="warningGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" style="stop-color:#FF9800;stop-opacity:1"></stop>
                        <stop offset="100%" style="stop-color:#F57C00;stop-opacity:1"></stop>
                    </linearGradient>
                    <filter id="glow" x="-50%" y="-50%" width="200%" height="200%">
                        <feGaussianBlur stdDeviation="3" result="coloredBlur"></feGaussianBlur>
                        <feMerge>
                            <feMergeNode in="coloredBlur"></feMergeNode>
                            <feMergeNode in="SourceGraphic"></feMergeNode>
                        </feMerge>
                    </filter>
                    <filter id="shadow" x="-50%" y="-50%" width="200%" height="200%">
                        <feDropShadow dx="0" dy="8" flood-color="#007BFF" flood-opacity="0.3" stdDeviation="4"></feDropShadow>
                    </filter>
                </defs>

                <!-- Background pattern -->
                <circle cx="100" cy="100" r="150" fill="url(#primaryGrad)" opacity="0.04">
                    <animateTransform attributeName="transform" type="rotate" values="0 100 100;360 100 100" dur="25s" repeatCount="indefinite"></animateTransform>
                </circle>
                <circle cx="450" cy="350" r="120" fill="url(#secondaryGrad)" opacity="0.06">
                    <animateTransform attributeName="transform" type="rotate" values="360 450 350;0 450 350" dur="18s" repeatCount="indefinite"></animateTransform>
                </circle>

                <!-- Main complaint management interface -->
                <rect x="120" y="80" width="310" height="200" rx="18" fill="white" filter="url(#shadow)" opacity="0.95"></rect>

                <!-- Header with complaint icon -->
                <rect x="135" y="95" width="280" height="35" rx="10" fill="url(#primaryGrad)"></rect>
                <g transform="translate(150, 105)">
                    <!-- Complaint/feedback icon -->
                    <circle cx="12" cy="12" r="10" fill="white" opacity="0.9"></circle>
                    <path d="M8 8 L16 8 M8 12 L14 12 M8 16 L12 16" stroke="url(#primaryGrad)" stroke-width="1.5" stroke-linecap="round"></path>
                </g>
                <text x="180" y="118" font-family="Inter" font-size="12" font-weight="600" fill="white">Complaint Management</text>

                <!-- Complaint status cards -->
                <g transform="translate(140, 145)">
                    <!-- New complaints -->
                    <rect x="0" y="0" width="80" height="50" rx="8" fill="#fff3e0" stroke="#FF9800" stroke-width="1"></rect>
                    <circle cx="15" cy="15" r="6" fill="url(#warningGrad)">
                        <animate attributeName="r" values="6;8;6" dur="2s" repeatCount="indefinite"></animate>
                    </circle>
                    <text x="25" y="18" font-family="Inter" font-size="10" font-weight="600" fill="#F57C00">New</text>
                    <text x="10" y="35" font-family="Inter" font-size="16" font-weight="700" fill="#F57C00">12</text>
                    <text x="10" y="45" font-family="Inter" font-size="8" fill="#666">Pending</text>

                    <!-- In progress -->
                    <rect x="95" y="0" width="80" height="50" rx="8" fill="#e3f2fd" stroke="#007BFF" stroke-width="1"></rect>
                    <circle cx="110" cy="15" r="6" fill="url(#primaryGrad)"></circle>
                    <path d="M107 15 L110 18 L115 13" stroke="white" stroke-width="1.5" fill="none" stroke-linecap="round"></path>
                    <text x="120" y="18" font-family="Inter" font-size="10" font-weight="600" fill="#007BFF">Active</text>
                    <text x="105" y="35" font-family="Inter" font-size="16" font-weight="700" fill="#007BFF">8</text>
                    <text x="105" y="45" font-family="Inter" font-size="8" fill="#666">Processing</text>

                    <!-- Resolved -->
                    <rect x="190" y="0" width="80" height="50" rx="8" fill="#e8f5e8" stroke="#4CAF50" stroke-width="1"></rect>
                    <circle cx="205" cy="15" r="6" fill="#4CAF50"></circle>
                    <path d="M202 15 L204 17 L208 13" stroke="white" stroke-width="1.5" fill="none" stroke-linecap="round"></path>
                    <text x="215" y="18" font-family="Inter" font-size="10" font-weight="600" fill="#4CAF50">Solved</text>
                    <text x="200" y="35" font-family="Inter" font-size="16" font-weight="700" fill="#4CAF50">24</text>
                    <text x="200" y="45" font-family="Inter" font-size="8" fill="#666">This week</text>
                </g>

                <!-- Priority indicators -->
                <g transform="translate(140, 210)">
                    <text x="0" y="15" font-family="Inter" font-size="11" font-weight="600" fill="#666">Priority Levels:</text>
                    <circle cx="0" cy="30" r="4" fill="#f44336"></circle>
                    <text x="12" y="34" font-family="Inter" font-size="9" fill="#666">High (3)</text>
                    <circle cx="70" cy="30" r="4" fill="#FF9800"></circle>
                    <text x="82" y="34" font-family="Inter" font-size="9" fill="#666">Medium (5)</text>
                    <circle cx="160" cy="30" r="4" fill="#4CAF50"></circle>
                    <text x="172" y="34" font-family="Inter" font-size="9" fill="#666">Low (4)</text>
                </g>

                <!-- Floating complaint tickets -->
                <g transform="translate(80, 300)" opacity="0.8">
                    <rect x="0" y="0" width="90" height="60" rx="8" fill="white" filter="url(#shadow)">
                        <animate attributeName="y" values="0;-5;0" dur="3s" repeatCount="indefinite"></animate>
                    </rect>
                    <rect x="10" y="10" width="70" height="4" rx="2" fill="url(#warningGrad)"></rect>
                    <text x="10" y="25" font-family="Inter" font-size="8" fill="#666">Ticket #1247</text>
                    <text x="10" y="35" font-family="Inter" font-size="7" fill="#999">Service Issue</text>
                    <circle cx="70" cy="45" r="3" fill="#FF9800"></circle>
                </g>

                <g transform="translate(380, 320)" opacity="0.7">
                    <rect x="0" y="0" width="90" height="60" rx="8" fill="white" filter="url(#shadow)">
                        <animate attributeName="y" values="0;-8;0" dur="4s" repeatCount="indefinite"></animate>
                    </rect>
                    <rect x="10" y="10" width="70" height="4" rx="2" fill="url(#primaryGrad)"></rect>
                    <text x="10" y="25" font-family="Inter" font-size="8" fill="#666">Ticket #1251</text>
                    <text x="10" y="35" font-family="Inter" font-size="7" fill="#999">Billing Query</text>
                    <circle cx="70" cy="45" r="3" fill="#007BFF"></circle>
                </g>

                <!-- Customer feedback icon -->
                <g transform="translate(50, 150)">
                    <circle cx="20" cy="20" r="20" fill="url(#secondaryGrad)" opacity="0.9">
                        <animate attributeName="r" values="20;23;20" dur="3s" repeatCount="indefinite"></animate>
                    </circle>
                    <!-- Speech bubble -->
                    <path d="M15 12 Q15 8 20 8 Q25 8 25 12 Q25 16 20 16 L18 18 L16 16 Q15 16 15 12" fill="white"></path>
                    <circle cx="18" cy="12" r="1" fill="url(#secondaryGrad)"></circle>
                    <circle cx="20" cy="12" r="1" fill="url(#secondaryGrad)"></circle>
                    <circle cx="22" cy="12" r="1" fill="url(#secondaryGrad)"></circle>
                </g>

                <!-- Resolution time tracker -->
                <g transform="translate(480, 150)">
                    <circle cx="0" cy="0" r="30" fill="none" stroke="#e3f2fd" stroke-width="5"></circle>
                    <circle cx="0" cy="0" r="30" fill="none" stroke="url(#primaryGrad)" stroke-width="5"
                            stroke-dasharray="188" stroke-dashoffset="47" stroke-linecap="round">
                        <animate attributeName="stroke-dashoffset" values="188;47;188" dur="4s" repeatCount="indefinite"></animate>
                    </circle>
                    <text x="0" y="-5" text-anchor="middle" font-family="Inter" font-size="10" font-weight="600" fill="#007BFF">Avg</text>
                    <text x="0" y="8" text-anchor="middle" font-family="Inter" font-size="12" font-weight="700" fill="#007BFF">2.3d</text>
                </g>

                <!-- Alert notification -->
                <g transform="translate(450, 50)">
                    <circle cx="15" cy="15" r="18" fill="url(#warningGrad)" opacity="0.9" filter="url(#glow)">
                        <animate attributeName="opacity" values="0.9;0.6;0.9" dur="2s" repeatCount="indefinite"></animate>
                    </circle>
                    <path d="M15 8 L15 18 M15 22 L15 24" stroke="white" stroke-width="2" stroke-linecap="round"></path>
                    <circle cx="22" cy="5" r="5" fill="#f44336">
                        <animate attributeName="r" values="5;7;5" dur="1.5s" repeatCount="indefinite"></animate>
                    </circle>
                    <text x="22" y="8" text-anchor="middle" font-family="Inter" font-size="8" font-weight="700" fill="white">!</text>
                </g>

                <!-- Connection flow lines -->
                <path d="M275 280 Q350 300 380 320" stroke="url(#primaryGrad)" stroke-width="2" fill="none" opacity="0.5" stroke-dasharray="8,4">
                    <animate attributeName="stroke-dashoffset" values="0;12" dur="2s" repeatCount="indefinite"></animate>
                </path>

                <path d="M150 280 Q100 250 80 200" stroke="url(#secondaryGrad)" stroke-width="2" fill="none" opacity="0.4" stroke-dasharray="6,3">
                    <animate attributeName="stroke-dashoffset" values="0;9" dur="1.8s" repeatCount="indefinite"></animate>
                </path>

                <!-- Statistics panel -->
                <g transform="translate(30, 380)">
                    <rect x="0" y="0" width="140" height="50" rx="12" fill="white" filter="url(#shadow)" opacity="0.9"></rect>
                    <text x="10" y="15" font-family="Inter" font-size="9" font-weight="600" fill="#666">Response Time</text>

                    <!-- Mini bar chart -->
                    <rect x="10" y="25" width="6" height="15" rx="1" fill="url(#primaryGrad)"></rect>
                    <rect x="20" y="22" width="6" height="18" rx="1" fill="url(#secondaryGrad)"></rect>
                    <rect x="30" y="20" width="6" height="20" rx="1" fill="url(#primaryGrad)"></rect>
                    <rect x="40" y="25" width="6" height="15" rx="1" fill="url(#warningGrad)"></rect>
                    <rect x="50" y="18" width="6" height="22" rx="1" fill="url(#primaryGrad)"></rect>

                    <text x="70" y="30" font-family="Inter" font-size="14" font-weight="700" fill="#007BFF">92%</text>
                    <text x="70" y="40" font-family="Inter" font-size="7" fill="#666">Satisfaction</text>
                </g>
            </svg>
<%--            <img src="../assets/image/5124556.jpg" width="500px">--%>
        </div>
        <div id="text-side">
            <h3 id="qs-title">What Is ResolveIT ?</h3>
            <p>ResolveIT is a smart and user-friendly Complaint Management System built for municipal employees and administrators. It makes it easy to submit complaints, monitor progress, and take action — all in one place.
                Whether you're an employee reporting a problem or an admin managing multiple issues across departments, ResolveIT ensures that nothing falls through the cracks.
                It helps streamline the complaint lifecycle from submission to resolution.</p>
            <p>ResolveIT is a smart and user-friendly Complaint Management System built for municipal employees and administrators. It makes it easy to submit complaints, monitor progress, and take action — all in one place.
                Whether you're an employee reporting a problem or an admin managing multiple issues across departments, ResolveIT ensures that nothing falls through the cracks.</p>
            <div class="btn-box">
                <a href="SignUpPage.jsp"><button type="button" class="btn btn-primary">Sign Up</button></a>
                <a href="SignInPage.jsp"><button type="button" class="btn btn-primary">Sign In</button></a>
            </div>
        </div>
    </div>
</section>

<footer>
    <p style="color: white">@2025 Thenuri Nethangi All Right Reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../lib/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="../assets/js/landing-page-script.js"></script>
</body>
</html>
