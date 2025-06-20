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
import org.example.model.Complaint;
import org.example.model.dao.ComplaintDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/api/v1/complaint/*")
public class ComplaintServlet extends HttpServlet {

    private ComplaintDAO complaintDAO = new ComplaintDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pathInfo = req.getPathInfo();

        if (pathInfo!=null) {
            String[] ar = pathInfo.split("/");
            String path = ar[1];

            if(path.equalsIgnoreCase("edit")){

                String id = req.getParameter("id");
                String title = req.getParameter("title");
                String description = req.getParameter("description");
                String date = req.getParameter("date");
                String priorityLevel = req.getParameter("priority");

                Complaint complaint = new Complaint(id,title,description,date,priorityLevel);

                BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
                Connection connection = null;
                try {
                    connection = basicDataSource.getConnection();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                boolean isUpdate = false;
                try {
                    isUpdate = complaintDAO.update(complaint,connection);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                if(isUpdate){
                    req.setAttribute("search","");
                    req.setAttribute("id","");
                    req.setAttribute("title","");
                    req.setAttribute("description","");
                    req.setAttribute("date","");
                    req.setAttribute("priority","default");
                    req.setAttribute("status","");

                    req.setAttribute("alert","Successfully Updated The Complaint ID: "+id);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/view/EditComplaintPage.jsp");
                    dispatcher.forward(req,resp);
                }
                else{

                }
            }
            else if(path.equalsIgnoreCase("delete")){

                String id = req.getParameter("id");

                BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
                Connection connection = null;
                try {
                    connection = basicDataSource.getConnection();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                boolean isDeleted = false;
                try {
                    isDeleted = complaintDAO.delete(id,connection);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                if(isDeleted){

                    List<Complaint> complaints = new ArrayList<>();
                    try {
                        complaints = complaintDAO.getAll(connection);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                    for(Complaint x : complaints){
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
                    httpSession.setAttribute("complaintsList",complaints);
                    resp.sendRedirect(req.getContextPath()+ "/view/ViewComplaintPage.jsp");
                }
                else{
                    //
                }
            }
        }

        else {
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            String date = req.getParameter("date");
            String priorityLevel = req.getParameter("priority");
            String status = req.getParameter("status");

            BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
            Connection connection = null;
            try {
                connection = basicDataSource.getConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            String id = "";
            try {
                id = complaintDAO.generateNewId(connection);
            } catch (SQLException e) {
                req.setAttribute("alert", "Something Went Wrong please Try Again Later");
                dispatcher(req, resp);
                throw new RuntimeException(e);
            }

            Complaint complaint = new Complaint(id, title, description, date, priorityLevel, status, null, null);
            boolean isSave = false;
            try {
                isSave = complaintDAO.save(complaint, connection);
            } catch (SQLException e) {
                req.setAttribute("alert", "Something Went Wrong please Try Again Later");
                dispatcher(req, resp);
                throw new RuntimeException(e);
            }

            if (isSave) {

                String newId = null;
                try {
                    newId = complaintDAO.generateNewId(connection);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                HttpSession session = req.getSession();
                session.setAttribute("newId",newId);

                req.setAttribute("alert", "Successfully Submitted A New Complaint");
                dispatcher(req, resp);
            } else {
                req.setAttribute("alert", "Failed To Submit A New Complaint");
                dispatcher(req, resp);
            }
        }
    }


    public void dispatcher(HttpServletRequest req,HttpServletResponse resp){
        try {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/AddComplaintPage.jsp");
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
        Connection connection = null;
        try {
            connection = basicDataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String id = req.getParameter("search");
        if(id!=null){
            Complaint complaint = null;
            try {
                complaint = complaintDAO.findById(id,connection);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            if(complaint!=null){

                if(complaint.getStatus().equalsIgnoreCase("Resolved")){
                    req.setAttribute("alert","This Complaint Has Already Been Resolved And Cannot be Edited!");
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/view/EditComplaintPage.jsp");
                    dispatcher.forward(req,resp);
                }
                else {
                    req.setAttribute("search", complaint.getId());
                    req.setAttribute("id", complaint.getId());
                    req.setAttribute("title", complaint.getTitle());
                    req.setAttribute("description", complaint.getDescription());
                    req.setAttribute("date", complaint.getSubmittedDate());
                    req.setAttribute("priority", complaint.getPriorityLevel());
                    req.setAttribute("status", complaint.getStatus());

                    RequestDispatcher dispatcher = req.getRequestDispatcher("/view/EditComplaintPage.jsp");
                    dispatcher.forward(req, resp);
                }
            }
            else{
                req.setAttribute("alert","This Complaint ID Does Not Exist!");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/view/EditComplaintPage.jsp");
                dispatcher.forward(req,resp);
            }
        }
        else {
            //
        }
    }
}
