package com.Fed0d.Teamder.Controllers;

import com.Fed0d.Teamder.model.Role;
import com.Fed0d.Teamder.model.User;
import com.Fed0d.Teamder.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }
    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model){
        Optional<User> userDb=userRepository.findByEmail(user.getEmail());
        if(userDb!=null){
            model.put("message","User already exist.");
            return "registration";
        }
        user.setStatus(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepository.save(user);
        return "redirect:/login";
    }

}
