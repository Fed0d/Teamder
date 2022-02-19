package com.Fed0d.Teamder.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "t_userInformation")
public class UserInformation {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String email;
    private String gender;
    private String name;
    private String surname;
    private Integer age;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
    mappedBy = "userInformation")
    private List<Avatar> avatars = new ArrayList<>();
    private Long previewAvatarId;

    public List<Avatar> getAvatars() {
        return avatars;
    }

    public void setAvatars(List<Avatar> avatars) {
        this.avatars = avatars;
    }

    public Long getPreviewAvatarId() {
        return previewAvatarId;
    }

    public void setPreviewAvatarId(Long previewAvatarId) {
        this.previewAvatarId = previewAvatarId;
    }

    public UserInformation() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public void addAvatarToUser(Avatar image) {
        image.setUserInformation(this);
        avatars.add(image);
    }
}
