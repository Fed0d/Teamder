package com.Fed0d.Teamder.repository;


import com.Fed0d.Teamder.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
