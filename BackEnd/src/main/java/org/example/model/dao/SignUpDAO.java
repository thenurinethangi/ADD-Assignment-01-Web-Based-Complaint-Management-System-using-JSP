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

        connection.setAutoCommit(false);

        try {
            PreparedStatement pst = connection.prepareStatement("insert into user (email,password,role) values (?,?,?)");
            pst.setString(1, user.getEmail());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getRole());
            int result = pst.executeUpdate();

            if (result > 0) {

                PreparedStatement pst1 = connection.prepareStatement("SELECT id FROM user ORDER BY id DESC LIMIT 1");
                ResultSet result1 = pst1.executeQuery();

                if (result1.next()) {
                    int id = result1.getInt(1);

                    PreparedStatement pst2 = connection.prepareStatement("insert into userprofile (userId) values (?)");
                    pst2.setInt(1, id);
                    int result2 = pst2.executeUpdate();

                    if (result2 > 0) {
                        connection.commit();
                        return true;
                    } else {
                        connection.rollback();
                        return false;
                    }
                } else {
                    connection.rollback();
                    return false;
                }
            }
            connection.rollback();
            return false;
        }
        finally {
            connection.setAutoCommit(true);
        }
    }
}
