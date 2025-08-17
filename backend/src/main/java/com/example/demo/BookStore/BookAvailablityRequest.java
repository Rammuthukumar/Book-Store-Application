package com.example.demo.BookStore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class BookAvailablityRequest {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String userName;
    private String userEmail;
    private String bookName;
    private boolean notified;
}
