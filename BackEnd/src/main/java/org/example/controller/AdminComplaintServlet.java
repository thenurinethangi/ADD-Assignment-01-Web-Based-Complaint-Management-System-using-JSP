package org.example.controller;

import jakarta.servlet.RequestDispatcher;
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

@WebServlet("/api/v1/admincomplaint/*")
public class AdminComplaintServlet extends HttpServlet {

    private ComplaintDAO complaintDAO = new ComplaintDAO();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pathInfo = req.getPathInfo();
        if(pathInfo!=null){

            String[] ar = pathInfo.split("/");
            String path = ar[1];

            if(path.equalsIgnoreCase("complete")){

                BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
                Connection connection = null;
                try {
                    connection = basicDataSource.getConnection();
                } catch (SQLException e) {
                    req.setAttribute("alert","Something Went Wrong Please Try Again Later!");
                    dispatcher(req,resp);
                    throw new RuntimeException(e);
                }

                String id = req.getParameter("id");
                boolean isComplete = false;
                try {
                    isComplete = complaintDAO.CompleteComplaint(id,connection);
                } catch (SQLException e) {
                    req.setAttribute("alert","Something Went Wrong Please Try Again Later!");
                    dispatcher(req,resp);
                    throw new RuntimeException(e);
                }

                if(isComplete){
                    List<Complaint> complaints = new ArrayList<>();
                    try {
                        complaints = complaintDAO.getAll(connection);
                    } catch (SQLException e) {
                        req.setAttribute("alert","Something Went Wrong Please Try Again Later!");
                        dispatcher(req,resp);
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
                    req.setAttribute("alert","Successfully Mark The Complaint As Resolved!");
                    dispatcher(req,resp);
                }
                else{
                    req.setAttribute("alert","Failed To Mark The Complaint As Resolved, Please Try Again Later!");
                    dispatcher(req,resp);
                }

            }
            else if(path.equalsIgnoreCase("delete")){

                BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
                Connection connection = null;
                try {
                    connection = basicDataSource.getConnection();
                } catch (SQLException e) {
                    req.setAttribute("alert","Something Went Wrong Please Try Again Later!");
                    dispatcher(req,resp);
                    throw new RuntimeException(e);
                }

                String id = req.getParameter("id");
                boolean isDelete = false;
                try {
                    isDelete = complaintDAO.delete(id,connection);
                } catch (SQLException e) {
                    req.setAttribute("alert","Something Went Wrong Please Try Again Later!");
                    dispatcher(req,resp);
                    throw new RuntimeException(e);
                }

                if(isDelete){
                    List<Complaint> complaints = new ArrayList<>();
                    try {
                        complaints = complaintDAO.getAll(connection);
                    } catch (SQLException e) {
                        req.setAttribute("alert","Something Went Wrong Please Try Again Later!");
                        dispatcher(req,resp);
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
                    req.setAttribute("alert","Successfully Deleted The Complaint ID: "+id);
                    dispatcher(req,resp);
                }
                else{
                    req.setAttribute("alert","Failed To Deleted The Complaint ID: "+id+", Please Try Again Later!");
                    dispatcher(req,resp);
                }
            }
            else if(path.equalsIgnoreCase("update")){

                BasicDataSource basicDataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
                Connection connection = null;
                try {
                    connection = basicDataSource.getConnection();
                } catch (SQLException e) {
                    req.setAttribute("alert","Something Went Wrong Please Try Again Later!");
                    dispatcher(req,resp);
                    throw new RuntimeException(e);
                }

                String id = req.getParameter("id");
                String status = req.getParameter("status");
                String adminNote = req.getParameter("adminNote");

                Complaint complaint = new Complaint(id,status,adminNote);
                boolean isUpdate = false;
                try {
                    isUpdate = complaintDAO.updateFewData(complaint,connection);
                } catch (SQLException e) {
                    req.setAttribute("alert","Something Went Wrong Please Try Again Later!");
                    dispatcher(req,resp);
                    throw new RuntimeException(e);
                }

                if(isUpdate){
                    List<Complaint> complaints = new ArrayList<>();
                    try {
                        complaints = complaintDAO.getAll(connection);
                    } catch (SQLException e) {
                        req.setAttribute("alert","Something Went Wrong Please Try Again Later!");
                        dispatcher(req,resp);
                        throw new RuntimeException(e);
                    }

                    for(Complaint x : complaints){
                        String updatedDate = x.getUpdatedDate();
                        String note = x.getAdminNote();

                        if(updatedDate==null){
                            x.setUpdatedDate("-");
                        }
                        if(note==null || note.isEmpty()){
                            x.setAdminNote("-");
                        }
                    }

                    HttpSession httpSession = req.getSession();
                    httpSession.setAttribute("complaintsList",complaints);
                    req.setAttribute("alert","Successfully Updated The Complaint ID: "+id);
                    dispatcher(req,resp);
                }
                else{
                    req.setAttribute("alert","Failed To Updated The Complaint ID: "+id+",Please Try Again Later.");
                    dispatcher(req,resp);
                }
            }
        }
    }

    public void dispatcher(HttpServletRequest req,HttpServletResponse resp){

        try {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/AdminComplaintPage.jsp");
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

















