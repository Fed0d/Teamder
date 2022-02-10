package com.Fed0d.Teamder.entity;

import javax.persistence.*;

@Entity
@Table(name = "t_goals")
public class Goal {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String goalName;

    public Goal() {
    }

    public Goal(Long id, String goalName) {
        this.id = id;
        this.goalName = goalName;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getGoalName() {
        return goalName;
    }

    public void setGoalName(String goalName) {
        this.goalName = goalName;
    }
}
