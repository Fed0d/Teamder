package com.Fed0d.Teamder.entity;

import org.apache.jasper.tagplugins.jstl.core.Url;

import javax.persistence.*;
import java.net.URL;

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
    private String vk;
    private String steam;
    private String discord;
    public UserInformation() {
    }

    public UserInformation(Long id, String email, String gender, String name, String surname, Integer age, String vk, String steam, String discord) {
        this.id = id;
        this.email = email;
        this.gender = gender;
        this.name = name;
        this.surname = surname;
        this.age = age;
        this.vk = vk;
        this.steam = steam;
        this.discord = discord;
    }

    public UserInformation(Long id, String email, String gender, String name, String surname, Integer age) {
        this.id = id;
        this.email = email;
        this.gender = gender;
        this.name = name;
        this.surname = surname;
        this.age = age;
    }

    public UserInformation(String email, String gender, String name, String surname, Integer age) {
        this.email = email;
        this.gender = gender;
        this.name = name;
        this.surname = surname;
        this.age = age;
    }
    public boolean isDiscPresent(){
        return this.discord!=null&&!discord.isEmpty()&&!discord.equals("#");
    }
    public boolean isVKPresent(){
        return this.vk!=null&&!vk.isEmpty()&&!vk.equals("https://vk.com/");
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

    public String getVk() {
        return vk;
    }

    public void setVk(String vk) {
        this.vk = vk;
    }

    public String getSteam() {
        return steam;
    }

    public void setSteam(String steam) {
        this.steam = steam;
    }

    public String getDiscord() {
        return discord;
    }

    public void setDiscord(String discord) {
        this.discord = discord;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
