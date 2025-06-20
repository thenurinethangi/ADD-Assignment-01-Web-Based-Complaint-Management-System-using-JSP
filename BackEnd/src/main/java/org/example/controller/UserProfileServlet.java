package org.example.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.apache.commons.dbcp2.BasicDataSource;
import org.example.model.UserProfile;
import org.example.model.dao.UserProfileDAO;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@MultipartConfig
@WebServlet("/api/v1/userprofile/*")
public class UserProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String fName = req.getParameter("firstName").trim();
        String sName = req.getParameter("lastName").trim();
        String fullName = req.getParameter("fullName").trim();
        String phoneNo = req.getParameter("phone").trim();
        if(phoneNo.isEmpty()){
            phoneNo = null;
        }
        Part image = req.getPart("profilePicture");

        String path;

        if (image != null && image.getSize() > 0) {

            String fileName = image.getSubmittedFileName();
            System.out.println("file name: "+fileName);

            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            System.out.println("extension: "+fileExtension);
            String sanitizedFullName = fullName.trim()
                    .replaceAll("\\s+", "_")
                    .replaceAll("[^a-zA-Z0-9_\\-]", "");

            String uniqueFileName = System.currentTimeMillis() + "_" + sanitizedFullName + fileExtension;
            System.out.println("unique fle name: "+uniqueFileName);

            String uploadDir = getServletContext().getRealPath("/assets/image");
            System.out.println("dir path: "+uploadDir);
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            String fullPath = uploadDir + File.separator + uniqueFileName;
            System.out.println("full path: " + fullPath);

            try {
                image.write(fullPath);
                System.out.println("Image saved successfully!");
            } catch (IOException e) {
                System.err.println("Failed to save image: " + e.getMessage());
                throw new RuntimeException("Image upload failed", e);
            }

            path = uniqueFileName;
            System.out.println("database save path: "+path);

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

            UserProfile userProfile = new UserProfile(fName,sName,fullName,phoneNo,id,path);
            System.out.println(userProfile);
            boolean isUpdate = false;
            try {
                isUpdate = new UserProfileDAO().updateUserProfile(userProfile,connection);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            System.out.println("is update: "+isUpdate);

            if(id!=0){
                UserProfile userProfile1 = null;
                try {
                    userProfile1 = new UserProfileDAO().getUserDetailsByUserId(id,connection);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                HttpSession session = req.getSession();

                if(userProfile1!=null){
                    session.setAttribute("firstName",userProfile1.getFirstName());
                    session.setAttribute("lastName",userProfile1.getLastName());
                    session.setAttribute("fullName",userProfile1.getFullName());
                    session.setAttribute("phoneNo",userProfile1.getPhoneNo());
                    session.setAttribute("image",userProfile1.getImagePath());
                }

                if(String.valueOf(session.getAttribute("role")).equalsIgnoreCase("employee")){
                    resp.sendRedirect(req.getContextPath() + "/view/UserProfilePage.jsp");
                }
                else{
                    resp.sendRedirect(req.getContextPath() + "/view/UserProfileAdminPage.jsp");
                }
            }

        }
        else{

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

            UserProfile userProfile = new UserProfile(fName,sName,fullName,phoneNo,id,null);
            boolean isUpdate = false;
            try {
                isUpdate = new UserProfileDAO().updateUserProfileWithoutImage(userProfile,connection);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            System.out.println("is update: "+isUpdate);

            if(id!=0){
                UserProfile userProfile1 = null;
                try {
                    userProfile1 = new UserProfileDAO().getUserDetailsByUserId(id,connection);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                HttpSession session = req.getSession();

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
                if(String.valueOf(session.getAttribute("role")).equalsIgnoreCase("employee")){
                    resp.sendRedirect(req.getContextPath() + "/view/UserProfilePage.jsp");
                }
                else{
                    resp.sendRedirect(req.getContextPath() + "/view/UserProfileAdminPage.jsp");
                }
            }
        }
    }
}
