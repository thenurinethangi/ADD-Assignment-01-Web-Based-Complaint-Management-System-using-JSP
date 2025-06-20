package org.example.model;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Complaint {

    private String id;
    private String title;
    private String description;
    private String submittedDate;
    private String priorityLevel;
    private String status;
    private String updatedDate;
    private String adminNote;

    public Complaint(String id, String title, String description, String submittedDate, String priorityLevel) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.submittedDate = submittedDate;
        this.priorityLevel = priorityLevel;
    }

    public Complaint(String id,String status,String adminNote) {
        this.id = id;
        this.status = status;
        this.adminNote = adminNote;
    }
}
