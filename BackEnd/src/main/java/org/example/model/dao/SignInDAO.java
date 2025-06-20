package org.example.model.dao;

import org.example.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignInDAO {

    public User getUserByEmail(String email, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("select * from user where email = ?");
        pst.setString(1,email);
        ResultSet result = pst.executeQuery();

        if(result.next()){
            return new User(result.getString(2),result.getString(3),result.getString(4));
        }
        return null;
    }
}
