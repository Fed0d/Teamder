package com.Fed0d.Teamder.entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "t_messages")
public class Message {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String text;
    private boolean isRead;
    private LocalDate date;
    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "dialog_id")
    private Dialog dialog;

    public Message() {
    }

    public Message(Long id, String text, boolean isRead, LocalDate date, Dialog dialog) {
        this.id = id;
        this.text = text;
        this.isRead = isRead;
        this.date = date;
        this.dialog = dialog;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setDialog(Dialog dialog) {
        this.dialog = dialog;
    }

    public Long getId() {
        return id;
    }

    public Dialog getDialog() {
        return dialog;
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

