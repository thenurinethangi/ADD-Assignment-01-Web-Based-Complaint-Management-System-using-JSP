package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.dbcp2.BasicDataSource;
import org.example.model.Complaint;
import org.example.model.User;
import org.example.model.UserProfile;
import org.example.model.dao.ComplaintDAO;
import org.example.model.dao.UserProfileDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/api/v1/page/*")
public class PageServlet extends HttpServlet {

    private ComplaintDAO complaintDAO = new ComplaintDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        String path = req.getPathInfo();
        String[] ar = path.split("/");
        String page = ar[1];

        if(page.equals("dashboard")){
           resp.sendRedirect(req.getContextPath()+ "/view/EmployeeDashboard.jsp");
        }
        else if(page.equals("addComplaint")){

            Connection connection = null;
            try {
                BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
                connection = basicDataSource.getConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            String newId = "";
            try {
                newId = complaintDAO.generateNewId(connection);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            session.setAttribute("newId",newId);
            resp.sendRedirect(req.getContextPath()+ "/view/AddComplaintPage.jsp");
        }
        else if(page.equals("editComplaint")){
            session.setAttribute("priority","default");
            resp.sendRedirect(req.getContextPath()+ "/view/EditComplaintPage.jsp");
        }
        else if(page.equals("viewComplaint")){

            Connection connection = null;
            try {
                BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
                connection = basicDataSource.getConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            List<Complaint> complaintList = null;
            try {
                complaintList = complaintDAO.getAll(connection);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            for(Complaint x : complaintList){
                String updatedDate = x.getUpdatedDate();
                String adminNote = x.getAdminNote();

                if(updatedDate==null){
                    x.setUpdatedDate("-");
                }
                if(adminNote==null){
                    x.setAdminNote("-");
                }
            }

            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("complaintsList",complaintList);
            resp.sendRedirect(req.getContextPath()+ "/view/ViewComplaintPage.jsp");
        }
        else if(page.equals("profile")){
            resp.sendRedirect(req.getContextPath()+ "/view/AddComplaintPage.jsp");
        }
        else if(page.equals("dashboardadmin")){
            resp.sendRedirect(req.getContextPath()+ "/view/AdminDashboard.jsp");
        }
        else if(page.equals("complaintsadmin")){

            Connection connection = null;
            try {
                BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
                connection = basicDataSource.getConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            List<Complaint> complaintList = null;
            try {
                complaintList = complaintDAO.getAll(connection);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            for(Complaint x : complaintList){
                String updatedDate = x.getUpdatedDate();
                String adminNote = x.getAdminNote();

                if(updatedDate==null){
                    x.setUpdatedDate("-");
                }
                if(adminNote==null){
                    x.setAdminNote("-");
                }
            }

            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("complaintsList",complaintList);
            resp.sendRedirect(req.getContextPath()+ "/view/AdminComplaintPage.jsp");
        }
        else if(page.equals("userprofile")){

            BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
            Connection connection = null;
            try {
                connection = basicDataSource.getConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            int id = 0;
            try {
                id = new UserProfileDAO().getUserIdByEmail((String) req.getSession().getAttribute("email"),connection);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            if(id!=0){
                UserProfile userProfile1 = null;
                try {
                    userProfile1 = new UserProfileDAO().getUserDetailsByUserId(id,connection);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                if(userProfile1!=null){
                    session.setAttribute("firstName",userProfile1.getFirstName());
                    session.setAttribute("lastName",userProfile1.getLastName());
                    session.setAttribute("fullName",userProfile1.getFullName());
                    session.setAttribute("phoneNo",userProfile1.getPhoneNo());

                    if(userProfile1.getImagePath()==null || userProfile1.getImagePath().trim().isEmpty()){
                        session.setAttribute("image","deafult-user-image-01.png");
                    }
                    else{
                        session.setAttribute("image",userProfile1.getImagePath());
                    }
                }
            }

            resp.sendRedirect(req.getContextPath()+ "/view/UserProfilePage.jsp");
        }
        else if(page.equals("userprofileadmin")){

            BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
            Connection connection = null;
            try {
                connection = basicDataSource.getConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            int id = 0;
            try {
                id = new UserProfileDAO().getUserIdByEmail((String) req.getSession().getAttribute("email"),connection);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            if(id!=0){
                UserProfile userProfile1 = null;
                try {
                    userProfile1 = new UserProfileDAO().getUserDetailsByUserId(id,connection);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                if(userProfile1!=null){
                    session.setAttribute("firstName",userProfile1.getFirstName());
                    session.setAttribute("lastName",userProfile1.getLastName());
                    session.setAttribute("fullName",userProfile1.getFullName());
                    session.setAttribute("phoneNo",userProfile1.getPhoneNo());

                    if(userProfile1.getImagePath()==null || userProfile1.getImagePath().trim().isEmpty()){
                        session.setAttribute("image","deafult-user-image-01.png");
                    }
                    else{
                        session.setAttribute("image",userProfile1.getImagePath());
                    }
                }
            }
            resp.sendRedirect(req.getContextPath()+ "/view/UserProfileAdminPage.jsp");
        }
    }
}
