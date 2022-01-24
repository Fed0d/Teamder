package com.Fed0d.Teamder.repository;

import com.Fed0d.Teamder.entity.Game;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GameRepository extends CrudRepository<Game, Long> {
    List<Game> findByGameName(String gameName);

}
