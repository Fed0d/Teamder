package com.Fed0d.Teamder.Servlets;

import com.Fed0d.Teamder.entity.Message;
import com.Fed0d.Teamder.entity.User;

public class WrapOfDialog{
    private Long id;
    private User interlocutor;
    private Message lastMessage;
    boolean isYours;

    public WrapOfDialog(Long id, User interlocutor, Message lastMessage, boolean isYours) {
        this.id = id;
        this.interlocutor = interlocutor;
        this.lastMessage = lastMessage;
        this.isYours = isYours;
    }

    public boolean getIsYours() {
        return isYours;
    }

    public void setYours(boolean yours) {
        isYours = yours;
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