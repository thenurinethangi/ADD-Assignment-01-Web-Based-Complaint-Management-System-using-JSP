package org.example.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;
import org.example.model.User;
import org.example.model.dao.SignUpDAO;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/signup/*")
public class SignUpServlet extends HttpServlet {

    private SignUpDAO signUpDAO = new SignUpDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        String hashPassword = BCrypt.hashpw(password,BCrypt.gensalt());
        User user = new User(email,hashPassword,role);

        ServletContext servletContext = req.getServletContext();
        BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");
        Connection connection = null;
        try {
            connection = basicDataSource.getConnection();
        } catch (SQLException e) {
            req.setAttribute("errorMsg", "An Error Occur While Sign Up!, Please Try Again Later.");
            dispatcher(req,resp);
            throw new RuntimeException(e);
        }

        boolean isExist = true;
        try {
            isExist = signUpDAO.isExist(email, connection);
        } catch (Exception e) {
            req.setAttribute("errorMsg", "An Error Occur While Sign Up!, Please Try Again Later.");
            dispatcher(req,resp);
            throw new RuntimeException(e);
        }

        if(!isExist){
            boolean isSave = false;
            try {
                isSave = signUpDAO.save(user, connection);
            } catch (Exception e) {
                req.setAttribute("errorMsg", "An Error Occur While Sign Up!, Please Try Again Later.");
                dispatcher(req,resp);
                throw new RuntimeException(e);
            }

            if(isSave){
                resp.sendRedirect(req.getContextPath() + "/view/SignInPage.jsp");
            }
            else{
                req.setAttribute("errorMsg", "Failed to sign up. please try again later!");
                dispatcher(req,resp);
            }
        }
        else{
            req.setAttribute("errorMsg", "Email already exists. please Sign In!");
            dispatcher(req,resp);
        }
    }

    public void dispatcher(HttpServletRequest req,HttpServletResponse resp){

        try {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/SignUpPage.jsp");
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
