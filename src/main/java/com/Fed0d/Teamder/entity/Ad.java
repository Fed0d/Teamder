package com.Fed0d.Teamder.entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "t_ad")
public class Ad{
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;


    private String tag;
    private Integer lowAgeLvl;
    private Integer highAgeLvl;
    private String gender;
    private String text;
    private String elo;
    private boolean isActive;
    private LocalDate date;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="game_id")
    private Game game;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="goal_id")
    private Goal goal;

    public Ad() {
    }

    public Ad(Long id, String tag, Integer lowAgeLvl, Integer highAgeLvl, String gender, String text, String elo, LocalDate date, User author, Game game, Goal goal) {
        this.id = id;
        this.tag = tag;
        this.lowAgeLvl = lowAgeLvl;
        this.highAgeLvl = highAgeLvl;
        this.gender = gender;
        this.text = text;
        this.elo = elo;
        this.date = date;
        this.isActive = true;
        this.author = author;
        this.game = game;
        this.goal = goal;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Integer getLowAgeLvl() {
        return lowAgeLvl;
    }

    public void setLowAgeLvl(Integer lowAgeLvl) {
        this.lowAgeLvl = lowAgeLvl;
    }

    public Integer getHighAgeLvl() {
        return highAgeLvl;
    }

    public void setHighAgeLvl(Integer highAgeLvl) {
        this.highAgeLvl = highAgeLvl;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getElo() {
        return elo;
    }

    public void setElo(String elo) {
        this.elo = elo;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public Goal getGoal() {
        return goal;
    }

    public void setGoal(Goal goal) {
        this.goal = goal;
    }
}
