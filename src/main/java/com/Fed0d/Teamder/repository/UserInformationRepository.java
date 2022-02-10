package com.Fed0d.Teamder.repository;

import com.Fed0d.Teamder.entity.Game;
import com.Fed0d.Teamder.entity.User;
import com.Fed0d.Teamder.entity.UserInformation;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserInformationRepository extends CrudRepository<UserInformation, Long> {
    UserInformation findByEmail(String email);

}
