package com.Fed0d.Teamder.service;

import com.Fed0d.Teamder.entity.Game;
import com.Fed0d.Teamder.entity.Role;
import com.Fed0d.Teamder.entity.User;
import com.Fed0d.Teamder.repository.GameRepository;
import com.Fed0d.Teamder.repository.RoleRepository;
import com.Fed0d.Teamder.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
public class GamesService{
    @PersistenceContext
    private EntityManager em;
    @Autowired
    private GameRepository gameRepository;

    public Game loadGameByGameName(String gameName) throws UsernameNotFoundException {

        Game game = gameRepository.findByGameName(gameName).get(0);

        if (game == null) {
            throw new UsernameNotFoundException("Game not found");
        }

        return game;
    }

    public Iterable<Game> allGames() {
        Iterable<Game> games=gameRepository.findAll();
        return games;
    }
    public Game findGameByGamName(String gameName) throws UsernameNotFoundException {
        List<Game> game = gameRepository.findByGameName(gameName);

        if (game == null) {
            throw new UsernameNotFoundException("Game not found");
        }

        return game.get(0);
    }
    public boolean saveGame(Game game) {
       // Game gameFromDB = gameRepository.findByGameName(game.getGameName()).get(0);

        //if (gameFromDB != null) {
          //  return false;
        //}

        gameRepository.save(game);
        return true;
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
