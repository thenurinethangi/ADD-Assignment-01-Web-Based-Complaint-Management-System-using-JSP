package org.example.model.dao;

import org.example.model.User;
import org.example.model.UserProfile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserProfileDAO {

    public int getUserIdByEmail(String email, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("select * from user where email=?");
        pst.setString(1,email);
        ResultSet result = pst.executeQuery();

        if(result.next()){
            return result.getInt(1);
        }
        return 0;
    }

    public UserProfile getUserDetailsByUserId(int id, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("select * from userProfile where userId = ?");
        pst.setInt(1,id);
        ResultSet result = pst.executeQuery();

        if(result.next()){
            return new UserProfile(result.getInt(1),result.getString(2),result.getString(3),result.getString(4),result.getString(5),result.getInt(6),result.getString(7));
        }
        return null;
    }

    public User getUserByEmail(String email, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("select * from user where email=?");
        pst.setString(1,email);
        ResultSet result = pst.executeQuery();

        if(result.next()){
            return new User(result.getString(2),result.getString(3),result.getString(4));
        }
        return null;
    }

    public boolean updateUserProfile(UserProfile userProfile,Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("update userProfile set firstName=?,lastName=?,fullName=?,phoneNo=?,imagePath=? where userId=?");
        pst.setString(1,userProfile.getFirstName());
        pst.setString(2,userProfile.getLastName());
        pst.setString(3,userProfile.getFullName());
        pst.setString(4,userProfile.getPhoneNo());
        pst.setString(5,userProfile.getImagePath());
        pst.setInt(6,userProfile.getUserId());
        int result = pst.executeUpdate();

        if(result>0){
            return true;
        }

        return false;
    }

    public boolean updateUserProfileWithoutImage(UserProfile userProfile,Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("update userProfile set firstName=?,lastName=?,fullName=?,phoneNo=? where userId=?");
        pst.setString(1,userProfile.getFirstName());
        pst.setString(2,userProfile.getLastName());
        pst.setString(3,userProfile.getFullName());
        pst.setString(4,userProfile.getPhoneNo());
        pst.setInt(5,userProfile.getUserId());
        int result = pst.executeUpdate();

        if(result>0){
            return true;
        }

        return false;
    }
}














