package com.example.demo.BookStore;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AvailablityRequestRepo extends JpaRepository<BookAvailablityRequest, Integer>{

    @Query("SELECT b FROM BookAvailablityRequest b WHERE b.notified = false AND b.bookName = :bookName")
    List<BookAvailablityRequest> findByBookNameAndNotifiedFalse(String bookName);

    @Modifying
    @Query("UPDATE BookAvailablityRequest b SET b.notified = true WHERE b.bookName = :bookName AND b.notified = false")
    int markAsNotified(@Param("bookName") String bookName);

    
}
