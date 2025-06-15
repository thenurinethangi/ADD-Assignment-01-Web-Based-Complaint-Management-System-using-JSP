package org.example.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;
import org.example.model.User;
import org.example.repo.SignUpRepo;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/signup/*")
public class SignUpServlet extends HttpServlet {

    private SignUpRepo signUpRepo = new SignUpRepo();

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
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        boolean isExist = signUpRepo.isExist(email,connection);
        if(!isExist){
            boolean isSave = signUpRepo.save(user,connection);

            if(isSave){
                RequestDispatcher dispatcher = req.getRequestDispatcher("/view/SignInPage.jsp");
                dispatcher.forward(req, resp);
            }
            else{
                System.out.println("an error ocure while adding a new user, please try again later");
            }
        }
        else{
            System.out.println("email already exist");
        }
    }
}
