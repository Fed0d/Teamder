package com.Fed0d.Teamder.Servlets;

import com.Fed0d.Teamder.entity.Message;
import com.Fed0d.Teamder.entity.User;

public class WrapOfDialog{
    private Long id;
    private User interlocutor;
    private Message lastMessage;
    public WrapOfDialog(Long id, User interlocutor, Message lastMessage) {
        this.id = id;
        this.interlocutor = interlocutor;
        this.lastMessage = lastMessage;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getInterlocutor() {
        return interlocutor;
    }

    public void setInterlocutor(User interlocutor) {
        this.interlocutor = interlocutor;
    }

    public Message getLastMessage() {
        return lastMessage;
    }

    public void setLastMessage(Message lastMessage) {
        this.lastMessage = lastMessage;
    }

    public WrapOfDialog() {
    }
}