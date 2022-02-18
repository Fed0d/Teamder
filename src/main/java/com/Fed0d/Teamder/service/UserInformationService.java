package com.Fed0d.Teamder.service;

import com.Fed0d.Teamder.entity.Avatar;
import com.Fed0d.Teamder.entity.User;
import com.Fed0d.Teamder.entity.UserInformation;
import com.Fed0d.Teamder.repository.UserInformationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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

    public UserInformation findUserInformationById(Long id) {
        Optional<UserInformation> userFromDb = userInformationRepository.findById(id);
        return userFromDb.orElse(new UserInformation());
    }

    public List<UserInformation> allUserInformations() {
        Iterator<UserInformation> it = userInformationRepository.findAll().iterator();
        List<UserInformation> userInformations = new ArrayList<>();
        it.forEachRemaining(userInformations::add);
        return userInformations;
    }

    public void saveUserInformation(UserInformation user, MultipartFile file) throws IOException {
        Avatar image;
        if (file.getSize() != 0) {
            image = toImageEntity(file);
            image.setPreviewImage(true);
            user.addAvatarToUser(image);
        }
        UserInformation userInformationFromDb = userInformationRepository.save(user);
        userInformationFromDb.setPreviewAvatarId(userInformationFromDb.getAvatars().get(0).getId());
        userInformationRepository.save(user);
    }

    private Avatar toImageEntity(MultipartFile file) throws IOException {
        Avatar image = new Avatar();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void saveUserInformation(UserInformation user){
        userInformationRepository.save(user);
    }
}
