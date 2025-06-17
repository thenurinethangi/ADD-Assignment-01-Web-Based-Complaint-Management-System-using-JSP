package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.dbcp2.BasicDataSource;
import org.example.model.Complaint;
import org.example.model.dao.ComplaintDAO;

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
    }
}
