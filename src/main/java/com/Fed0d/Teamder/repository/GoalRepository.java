package com.Fed0d.Teamder.repository;


import com.Fed0d.Teamder.entity.Goal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoalRepository extends CrudRepository<Goal, Long> {
    List<Goal> findByGoalName(String goalName);
}