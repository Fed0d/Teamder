package com.Fed0d.Teamder.service;

import com.Fed0d.Teamder.entity.Game;
import com.Fed0d.Teamder.entity.Goal;
import com.Fed0d.Teamder.repository.GoalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service
public class GoalService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    GoalRepository goalRepository;

    public Iterable<Goal> allGoals() {
        Iterable<Goal> goals = goalRepository.findAll();
        return goals;
    }

    public Goal findGoalByGoalName(String goalName) throws UsernameNotFoundException {
        List<Goal> goal = goalRepository.findByGoalName(goalName);

        if (goal == null) {
            throw new UsernameNotFoundException("Goal not found");
        }

        return goal.get(0);
    }

    /*public boolean saveGame(User user) {
        Game gameFromDB = gameRepository.findByGameName(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRoles(Collections.singleton(new Role(1L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return true;
    }

    public boolean deleteUser(Long userId) {
        if (userRepository.findById(userId).isPresent()) {
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }

    public List<User> usergtList(Long idMin) {
        return em.createQuery("SELECT u FROM User u WHERE u.id > :paramId", User.class)
                .setParameter("paramId", idMin).getResultList();
    }
    */
}
