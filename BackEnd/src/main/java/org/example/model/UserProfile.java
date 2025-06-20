package org.example.model;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class UserProfile {

    private int id;
    private String firstName;
    private String lastName;
    private String fullName;
    private String phoneNo;
    private int userId;
    private String imagePath;

    public UserProfile(int id, String firstName, String lastName, String fullName, String phoneNo, int userId) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = fullName;
        this.phoneNo = phoneNo;
        this.userId = userId;
    }

    public UserProfile(String firstName, String lastName, String fullName, String phoneNo, int userId,String imagePath) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = fullName;
        this.phoneNo = phoneNo;
        this.userId = userId;
        this.imagePath = imagePath;
    }
}
