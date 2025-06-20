package org.example.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.dbcp2.BasicDataSource;
import org.example.model.User;
import org.example.model.UserProfile;
import org.example.model.dao.ComplaintDAO;
import org.example.model.dao.SignInDAO;
import org.example.model.dao.UserProfileDAO;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/signin/*")
public class SignInServlet extends HttpServlet {

    private SignInDAO signInDAO = new SignInDAO();
    private ComplaintDAO complaintDAO = new ComplaintDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        ServletContext servletContext = req.getServletContext();
        BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");
        Connection connection = null;
        try {
            connection = basicDataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        User user = null;
        try {
            user = signInDAO.getUserByEmail(email,connection);
        } catch (SQLException e) {
            req.setAttribute("errorMsg","Something Went Wrong, Please Try Again Later!");
            dispatcher(req,resp);
            throw new RuntimeException(e);
        }

        if(user!=null){
            boolean isCorrect = BCrypt.checkpw(password,user.getPassword());
            if(isCorrect){
                HttpSession session = req.getSession();
                session.setAttribute("email",user.getEmail());

                int allComplaintsCount = complaintDAO.getAllComplaintsCount(connection);
                int todayComplaintsCount = complaintDAO.getTodayComplaintsCount(connection);
                int pendingComplaintsCount = complaintDAO.getPendingComplaintsCount(connection);
                int inProgressComplaintsCount = complaintDAO.getInProgressComplaintsCount(connection);
                int resolvedComplaintsCount = complaintDAO.getResolvedComplaintsCount(connection);

                session.setAttribute("allComplaints",allComplaintsCount);
                session.setAttribute("todayComplaints",todayComplaintsCount);
                session.setAttribute("pendingComplaints",pendingComplaintsCount);
                session.setAttribute("inProgressComplaints",inProgressComplaintsCount);
                session.setAttribute("resolvedComplaints",resolvedComplaintsCount);

                session.setAttribute("name",user.getEmail().split("@")[0]);
                session.setAttribute("role",capitalizeFirstLetter(user.getRole()));
                session.setAttribute("firstLatter",user.getEmail().substring(0,1).toUpperCase());

                UserProfileDAO userProfileDAO = new UserProfileDAO();
                int id = 0;
                try {
                    id = userProfileDAO.getUserIdByEmail(user.getEmail(),connection);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                if(id!=0){
                    UserProfile userProfile = null;
                    try {
                        userProfile = userProfileDAO.getUserDetailsByUserId(id,connection);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                    if(userProfile!=null){
                        if(userProfile.getFirstName()==null || userProfile.getFirstName().trim().isEmpty()){
                            session.setAttribute("firstName","");
                        }
                        else{
                            session.setAttribute("firstName",userProfile.getFirstName());
                        }
                        if(userProfile.getLastName()==null || userProfile.getLastName().trim().isEmpty()){
                            session.setAttribute("lastName","");
                        }
                        else{
                            session.setAttribute("lastName",userProfile.getLastName());
                        }
                        if(userProfile.getLastName()==null || userProfile.getLastName().trim().isEmpty()){
                            session.setAttribute("lastName","");
                        }
                        else{
                            session.setAttribute("lastName",userProfile.getLastName());
                        }
                        session.setAttribute("fullName",userProfile.getFullName());
                        session.setAttribute("phoneNo",userProfile.getPhoneNo());
                        if(userProfile.getImagePath()==null || userProfile.getImagePath().trim().isEmpty()){
                            session.setAttribute("image","deafult-user-image-01.png");
                        }
                        else{
                            session.setAttribute("image",userProfile.getImagePath());
                        }
                    }
                    else{
                        session.removeAttribute("firstName");
                        session.removeAttribute("lastName");
                        session.removeAttribute("fullName");
                        session.removeAttribute("phoneNo");
                        session.removeAttribute("image");
                    }
                }
                else{

                }

                if(user.getRole().equalsIgnoreCase("employee")){
                    resp.sendRedirect(req.getContextPath()+"/view/EmployeeDashboard.jsp");
                }
                else{
                    resp.sendRedirect(req.getContextPath()+"/view/AdminDashboard.jsp");
                }
            }
            else{
                req.setAttribute("errorMsg","Password Incorrect!");
                dispatcher(req,resp);
            }
        }
        else{
            req.setAttribute("errorMsg","User Does Not Exits, Please Sign Up!");
            dispatcher(req,resp);
        }
    }

    public void dispatcher(HttpServletRequest req,HttpServletResponse resp){
        try {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/SignInPage.jsp");
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String capitalizeFirstLetter(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }
        return input.substring(0, 1).toUpperCase() + input.substring(1).toLowerCase();
    }

}

















