package com.Fed0d.Teamder.entity;

import javax.persistence.*;

@Entity
@Table(name = "t_games")
public class Game {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String gameName;

    public Game() {
    }

    public Game(Long id, String gameName) {
        this.id = id;
        this.gameName = gameName;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }
}
