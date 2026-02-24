# Complaint Management System (JSP, Jakarta EE)

## Product Overview

Complaint Management System (CMS) is a real-world web application for streamlining how internal teams capture, track, and resolve complaints.  
It is designed for municipal IT and similar organizations that need to replace email- and spreadsheet-based workflows with a central, structured platform.

Employees and administrators work entirely through a synchronous, form-based web interface (no AJAX), using JSP views backed by Jakarta EE servlets and a MySQL database.

## Key Features

- **Role-based authentication**
  - Employee and Admin roles
  - Session-based login and logout
- **Complaint lifecycle management**
  - Employees:
    - Submit new complaints
    - View a personal list of submitted complaints
    - Edit or delete complaints that are not yet resolved
  - Admins:
    - View all complaints in the system
    - Update status (`Pending`, `In Progress`, `Resolved`) and add admin notes
    - Delete any complaint
- **Dashboards and views**
  - Employee dashboard with personal complaint overview
  - Admin dashboard with system-wide metrics and complaint list
  - Detailed complaint views with status and history fields (submitted date, updated date, admin note)
- **Data access and persistence**
  - DAO-based data access layer (`ComplaintDAO`, `SignInDAO`, `SignUpDAO`, `UserProfileDAO`)
  - MySQL persistence with prepared statements and connection pooling
- **Validation and UX**
  - Client-side validation using JavaScript for forms
  - Server-side validation and meaningful feedback via JSP

## Architecture & Stack

- **Architecture**
  - Model-View-Controller (MVC)
  - **View**: JSP pages under `BackEnd/web/view`
  - **Controller**: Jakarta Servlets in `BackEnd/src/main/java/org/example/controller`
  - **Model**: JavaBeans and DAO classes in `BackEnd/src/main/java/org/example/model`
  - HTTP session management for authentication and role-based access

- **Tech Stack**
  - **Language**: Java (Maven project, Java 8 target)
  - **Frontend**: JSP, HTML5, CSS3, JavaScript (for validation only)
  - **Backend**: Jakarta Servlet API 6.x
  - **Database**: MySQL (JDBC via `mysql-connector-j`)
  - **Connection Pooling**: Apache Commons DBCP2
  - **Template & Utilities**: JSTL (`jakarta.servlet.jsp.jstl`)
  - **Security**: `jbcrypt` for password hashing (used in authentication layer)
  - **Build Tool**: Maven (`BackEnd/pom.xml`)
  - **Application Server**: Apache Tomcat (Jakarta-compatible; e.g., Tomcat 10+)

### Interaction Model & Constraints

- All backend interactions are performed via **HTML forms** using HTTP **GET** and **POST**.
- **No AJAX / fetch / XMLHttpRequest** or other asynchronous mechanisms are used.
- **Read-only operations** (e.g., listing complaints, loading details) use **HTTP GET**.
- **State-changing operations** (create, update, delete) use **HTTP POST**.
- JSP is used strictly for the **View layer**, with Servlets acting as Controllers and DAOs/POJOs as the Model.

## Application Modules

- **Authentication**
  - User registration and login (SignUp / SignIn)
  - Session-based authentication and role checks in controller layer

- **Complaint Management**
  - `ComplaintServlet` handles:
    - `POST /api/v1/complaint` to create a new complaint
    - `POST /api/v1/complaint/edit` to update non-resolved complaints
    - `POST /api/v1/complaint/delete` to delete complaints
    - `GET /api/v1/complaint?search={id}` to load complaint details for editing
  - `ComplaintDAO` encapsulates all SQL operations, including:
    - ID generation (`C-000001`, `C-000002`, …)
    - CRUD operations on `complaint` table
    - Status and admin note updates
    - Basic metrics (total complaints, today’s complaints, counts by status)

- **User Profile**
  - Employee profile and admin profile pages
  - Profile update flows implemented via JSP forms and Servlets

## Project Structure

```text
BackEnd/
├── pom.xml
├── src/main/java/org/example/
│   ├── controller/          # Servlets (SignIn, SignUp, Complaint, AdminComplaint, UserProfile, etc.)
│   ├── model/
│   │   ├── dao/             # DAO classes (ComplaintDAO, SignInDAO, SignUpDAO, UserProfileDAO)
│   │   └── *.java           # Entity / JavaBean classes (Complaint, User, UserProfile, ...)
│   └── util/                # Utility classes (e.g., context initializers, data source helpers)
└── web/
    ├── assets/
    │   ├── image/
    │   ├── js/              # Page-specific validation and behavior
    │   └── style/           # Page-specific CSS
    ├── view/                # JSP views
    │   ├── LandingPage.jsp
    │   ├── SignInPage.jsp
    │   ├── SignUpPage.jsp
    │   ├── EmployeeDashboard.jsp
    │   ├── AdminDashboard.jsp
    │   ├── AddComplaintPage.jsp
    │   ├── EditComplaintPage.jsp
    │   ├── ViewComplaintPage.jsp
    │   ├── UserProfilePage.jsp
    │   └── UserProfileAdminPage.jsp
    └── WEB-INF/
        └── web.xml          # Servlet configuration (Jakarta EE web app descriptor)
```

## Getting Started

### Prerequisites

- JDK 8 or higher
- Maven 3.x
- MySQL server
- Apache Tomcat 10+ (Jakarta EE compatible)
- IDE such as IntelliJ IDEA or Eclipse (optional but recommended)

### 1. Clone

```bash
git clone https://github.com/<your-username>/complaint-management-system.git
cd complaint-management-system/BackEnd
```

### 2. Configure the database

1. Create a MySQL database (for example `cms_db`).
2. Create the required tables. The `complaint` table at minimum contains:
   - `id` (PK, e.g. `C-000001`)
   - `title`
   - `description`
   - `submittedDate` (e.g. `DATE` or `VARCHAR`)
   - `priorityLevel` (`LOW`, `MEDIUM`, `HIGH`, etc.)
   - `status` (`Pending`, `In Progress`, `Resolved`)
   - `updatedDate` (nullable)
   - `adminNote` (nullable)
3. Create supporting tables for users and profiles (as used by `User`, `UserProfile`, and related DAOs).

Configure the connection pooling to point at your database (for example, via a `BasicDataSource` created in a context listener and stored as `ServletContext` attribute `dataSource`).

### 3. Build the project

From the `BackEnd` directory:

```bash
mvn clean package
```

This will compile the project and produce a deployable artifact (WAR) depending on your Maven configuration.

### 4. Deploy to Tomcat

1. Copy the generated WAR or configure the `BackEnd` module as an exploded deployment in your IDE.
2. Ensure Tomcat is using a Jakarta EE–compatible version (e.g. Tomcat 10+).
3. Start Tomcat and access the application at:

```text
http://localhost:8080/<context-path>/
```

The landing page (`LandingPage.jsp`) will guide you to sign in or sign up.

## What This Project Demonstrates (For Recruiters)

This project is intended to showcase **practical, production-aligned skills** for building and operating a real-world complaint management platform:

- **Server-side Java web development** with JSP and Jakarta Servlets
- **Clean MVC separation** with JSP (view), Servlets (controller), and DAOs/POJOs (model)
- **Relational data modelling** and SQL via JDBC and prepared statements
- **Connection pooling** with Apache Commons DBCP2
- **Session-based authentication** and role-based authorization
- **Synchronous HTTP workflows** using only HTML forms (GET/POST), without AJAX
- **Form validation and error handling** on both client and server
- **Build and deployment pipeline** using Maven and Apache Tomcat

If you are reviewing this repository as a hiring manager or technical interviewer, the `BackEnd/src/main/java/org/example/controller` and `BackEnd/src/main/java/org/example/model/dao` packages, along with the JSP views in `BackEnd/web/view`, provide the best starting point to understand design decisions and coding style.

