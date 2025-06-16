package org.example.model.dao;

import org.example.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignUpDAO {

    public boolean isExist(String email, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("select * from user where email=?");
        pst.setString(1,email);
        ResultSet resultSet = pst.executeQuery();

        if(resultSet.next()){
            return true;
        }
        return false;
    }

    public boolean save(User user, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("insert into user (email,password,role) values (?,?,?)");
        pst.setString(1,user.getEmail());
        pst.setString(2,user.getPassword());
        pst.setString(3,user.getRole());
        int result = pst.executeUpdate();

        if(result>0){
            return true;
        }
        return false;
    }
}
