# 🛠️ Web-Based Complaint Management System using JSP

## 📌 Project Overview

This is a Complaint Management System (CMS) developed for IJSE GDSE using JSP and Jakarta EE. It allows employees to submit complaints and admins to manage them, with full CRUD functionality, user profile management, and role-based access.

## 👤 User Roles
- **Employee**: Submit, view, edit, delete (if unresolved)
- **Admin**: View all complaints, update status, delete any

## ⚙️ Technologies Used
- **Frontend**: JSP, HTML, CSS, JavaScript (for validation only)
- **Backend**: Jakarta EE (Servlets), Apache Commons DBCP
- **Database**: MySQL
- **Server**: Apache Tomcat
- **Architecture**: MVC

## ⚙️ Setup Instructions
1. Clone the repo:
   ```
   git clone https://github.com/thenurinethangi/ADD-Assignment-01-Web-Based-Complaint-Management-System-using-JSP.git
   ```
2. Import into IntelliJ/Eclipse.
3. Create MySQL DB and run init SQL (if available).
4. Configure DB connection in `util/DBCPDataSource.java`.
5. Deploy to Tomcat and run.

## 🗂️ Project Structure
```
BackEnd/
├── src/main/java/org/example/
│   ├── controller/   # Servlets
│   ├── model/        # JavaBeans & DAOs
│   └── util/         # DBCP connection
├── web/
│   ├── assets/
│   │   ├── image/
│   │   ├── js/
│   │   └── style/
│   ├── view/
│   │   ├── AddComplaintPage.jsp
│   │   ├── AdminDashboard.jsp
│   │   ├── EditComplaintPage.jsp
│   │   ├── EmployeeDashboard.jsp
│   │   ├── LandingPage.jsp
│   │   ├── SignInPage.jsp
│   │   ├── SignUpPage.jsp
│   │   ├── UserProfilePage.jsp
│   │   ├── UserProfileAdminPage.jsp
│   │   └── ViewComplaintPage.jsp
│   └── WEB-INF/
```

## 📜 Commit History Summary
- Initial setup and structure
- Authentication module (SignUp, SignIn)
- Complaint CRUD (Employee & Admin)
- Admin status & remarks update
- User profile and dashboard pages
- UI/UX styling + validation scripts

## 📅 Assignment Info
- Title: Web-Based Complaint Management System using JSP
- Released: 11 June 2025
- Deadline: 17 June 2025


