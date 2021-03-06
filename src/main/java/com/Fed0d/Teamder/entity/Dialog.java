package com.Fed0d.Teamder.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;

@Entity
@Table(name = "t_dialogs")
public class Dialog {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user1_id")
    private User user1;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user2_id")
    private User user2;
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "message_id")
    private List<Message> message = new ArrayList<>();

    public Dialog() {
    }

    public Dialog(Long id, User user1, User user2, List<Message> message) {
        this.id = id;
        this.user1 = user1;
        this.user2 = user2;
        this.message = message;
    }

    public Dialog(User user1, User user2) {
        this.user1 = user1;
        this.user2 = user2;

    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }
    public void sortMessage(){
        message.sort(new Comparator<Message>() {
            @Override
            public int compare(Message o1, Message o2) {
                if(o1.getDate().isAfter(o2.getDate())){
                    return -1;
                }
                return 1;
            }
        });
    }

    public void setUser2(User user2) {
        this.user2 = user2;
    }
    public Message getlastMessage(){

        return message.get(message.size()-1);
    }
    public Long getId() {
        return id;
    }

    public User getUser1() {
        return user1;
    }

    public User getUser2() {
        return user2;
    }

    public List<Message> getMessage() {
        Collections.sort(message,new Comparator<Message>() {

            @Override
            public int compare(Message o1, Message o2) {
                return o1.getDate().compareTo(o2.getDate());}
        });
        return message;
    }

    public void setMessage(List<Message> message) {
        this.message = message;
    }
    public void addMessage(Message message) {
        this.message.add( message);
    }
}
