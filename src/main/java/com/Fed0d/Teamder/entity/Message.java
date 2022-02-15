package com.Fed0d.Teamder.entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "t_messages")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String text;
    private boolean isRead;
    private LocalDate date;


    public Message() {
    }

    public Message(String text, boolean isRead, LocalDate date) {
        this.text = text;
        this.isRead = isRead;
        this.date = date;
    }

    public Message(Long id, String text, boolean isRead, LocalDate date, Dialog dialog) {
        this.id = id;
        this.text = text;
        this.isRead = isRead;
        this.date = date;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }


    public Long getId() {
        return id;
    }

    public LocalDate getDate() {
        return date;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean read) {
        isRead = read;
    }
}

