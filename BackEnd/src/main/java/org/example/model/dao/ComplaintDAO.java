package org.example.model.dao;

import org.example.model.Complaint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDAO {

    public int getAllComplaintsCount(Connection connection) {

        try{
            PreparedStatement pst = connection.prepareStatement("select * from complaint");
            ResultSet result = pst.executeQuery();

            int count = 0;
            while (result.next()){
                count++;
            }
            return count;

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int getTodayComplaintsCount(Connection connection) {

        try{
            PreparedStatement pst = connection.prepareStatement("select * from complaint where submittedDate=?");
            pst.setString(1, String.valueOf(LocalDate.now()));
            ResultSet result = pst.executeQuery();

            int count = 0;
            while (result.next()){
                count++;
            }
            return count;

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int getPendingComplaintsCount(Connection connection) {

        try{
            PreparedStatement pst = connection.prepareStatement("select * from complaint where status='Pending'");
            ResultSet result = pst.executeQuery();

            int count = 0;
            while (result.next()){
                count++;
            }
            return count;

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int getInProgressComplaintsCount(Connection connection) {

        try{
            PreparedStatement pst = connection.prepareStatement("select * from complaint where status='In Progress'");
            ResultSet result = pst.executeQuery();

            int count = 0;
            while (result.next()){
                count++;
            }
            return count;

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int getResolvedComplaintsCount(Connection connection) {

        try{
            PreparedStatement pst = connection.prepareStatement("select * from complaint where status='Resolved'");
            ResultSet result = pst.executeQuery();

            int count = 0;
            while (result.next()){
                count++;
            }
            return count;

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public String generateNewId(Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("select * from complaint order by  id desc limit 1");
        ResultSet result = pst.executeQuery();

        if(result.next()){
            String lastId = result.getString(1);
            String noPart = lastId.substring(2);
            int no = Integer.parseInt(noPart);
            no++;
            String newId = String.format("C-%06d",no);
            return newId;
        }

        return "C-000001";
    }

    public boolean save(Complaint complaint, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("insert into complaint (id,title,description,submittedDate,priorityLevel,status) values(?,?,?,?,?,?)");
        pst.setString(1,complaint.getId());
        pst.setString(2,complaint.getTitle());
        pst.setString(3,complaint.getDescription());
        pst.setString(4,complaint.getSubmittedDate());
        pst.setString(5,complaint.getPriorityLevel());
        pst.setString(6,complaint.getStatus());
        int result = pst.executeUpdate();

        if(result>0){
            return true;
        }
        return false;
    }

    public Complaint findById(String id, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("select * from complaint where id = ?");
        pst.setString(1,id);
        ResultSet result = pst.executeQuery();

        Complaint complaint = null;
        if(result.next()){
            complaint = new Complaint(result.getString(1),result.getString(2),result.getString(3),result.getString(4),result.getString(5),result.getString(6),result.getString(7),result.getString(8));
        }
        return complaint;
    }

    public boolean update(Complaint complaint, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("update complaint set title=?,description=?,submittedDate=?,priorityLevel=? where id=?");
        pst.setString(1,complaint.getTitle());
        pst.setString(2,complaint.getDescription());
        pst.setString(3,complaint.getSubmittedDate());
        pst.setString(4,complaint.getPriorityLevel());
        pst.setString(5,complaint.getId());
        int result = pst.executeUpdate();

        if(result>0){
         return true;
        }
        return false;
    }

    public List<Complaint> getAll(Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("select * from complaint");
        ResultSet result = pst.executeQuery();

        List<Complaint> complaintList = new ArrayList<>();
        while (result.next()){
            complaintList.add(new Complaint(result.getString(1),result.getString(2),result.getString(3),result.getString(4),result.getString(5),result.getString(6),result.getString(7),result.getString(8)));
        }
        return complaintList;
    }

    public boolean delete(String id, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("delete from complaint where id = ?");
        pst.setString(1,id);
        int result = pst.executeUpdate();

        if(result>0){
            return true;
        }
        return false;
    }

    public boolean CompleteComplaint(String id, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("update complaint set status='Resolved' where id=?");
        pst.setString(1,id);
        int result = pst.executeUpdate();

        if(result>0){
            return true;
        }
        return false;
    }


    public boolean updateFewData(Complaint complaint, Connection connection) throws SQLException {

        PreparedStatement pst = connection.prepareStatement("update complaint set status=?,updatedDate=?,adminNote=? where id=?");
        pst.setString(1,complaint.getStatus());
        pst.setString(2, String.valueOf(LocalDate.now()));
        pst.setString(3,complaint.getAdminNote());
        pst.setString(4,complaint.getId());
        int result = pst.executeUpdate();

        if(result>0){
            return true;
        }
        return false;
    }
}
