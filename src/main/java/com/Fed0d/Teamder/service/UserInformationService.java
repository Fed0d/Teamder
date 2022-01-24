/*package com.Fed0d.Teamder.service;

import com.Fed0d.Teamder.entity.UserInformation;
import com.Fed0d.Teamder.repository.UserInformationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Optional;
@Service
public class UserInformationService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    UserInformationRepository userInformationRepository;


    public UserInformation loadUserInformationByEmail(String email) throws UsernameNotFoundException {
        UserInformation userInformation = userInformationRepository.findByEmail(email);

        if (userInformation == null) {
            throw new UsernameNotFoundException("UserInformation not found");
        }

        return userInformation;
    }

   /* public UserInformation findUserById(Long id) {
        Optional<UserInformation> userFromDb = userInformationRepository.findById(id);
        return userFromDb.orElse(new UserInformation());
    }

    public List<UserInformation> allUsers() {
        return userInformationRepository.findAll();
    }

    public boolean saveUser(UserInformation user) {
        UserInformation userFromDB = userInformationRepository.findByEmail(user.getEmail());

        if (userFromDB != null) {
            return false;
        }

        userInformationRepository.save(user);
        return true;
    }
*/

/*

}
*/