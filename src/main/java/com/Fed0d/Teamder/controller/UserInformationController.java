package com.Fed0d.Teamder.controller;

import com.Fed0d.Teamder.entity.*;
import com.Fed0d.Teamder.repository.AdRepository;
import com.Fed0d.Teamder.service.GamesService;
import com.Fed0d.Teamder.service.GoalService;
import com.Fed0d.Teamder.service.UserInformationService;
import com.Fed0d.Teamder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.*;

@Controller
public class UserInformationController {
    @Autowired
    private UserService userService;
    @Autowired
    private GamesService gamesService;
    @Autowired
    private GoalService goalsService;
    @Autowired
    private UserInformationService userInformationService;
    @Autowired
    private AdRepository adRepository;


    @GetMapping("/userInformation")
    public String userInf(@RequestParam Long id, Model model){
        model.addAttribute("userName",userService.findUserById(id).getUsername());
        model.addAttribute("userId",id);
        UserInformation inf=userService.findUserById(id).getUserInformation();
        model.addAttribute("userInformation",inf);
        return "userInformation";
    }
    @GetMapping("/userInformationForm")
    public String userInfGetForm(Model model){
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserInformation userInformation=userService.findUserById(user.getId()).getUserInformation();

        model.addAttribute("userInformation", userInformation);
        return "userInformationForm";
    }
    @GetMapping("/myAds")
    public String news(Map<String,Object> model){
        Iterable<Ad> ads=adRepository.findAll();
        ArrayList<Ad> result=new ArrayList<>();
        Iterator<Ad> it=ads.iterator();
        while(it.hasNext()){
            Ad ad=it.next();
            long a=ad.getAuthor().getId();
            long b=((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
            if(a==b){
            result.add(ad);}

        }
        model.put("ads",result);
        return "myAds";
    }
    @PostMapping("userInformationForm")
    public String userInfSetForm(@RequestParam String email, @RequestParam String name,
                                 @RequestParam String surname, @RequestParam Integer age,
                                 @RequestParam String gender, Map<String, Object> model) {
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserInformation userInformation=userService.findUserById(user.getId()).getUserInformation();
        userInformation.setAge(age);
        userInformation.setEmail(email);
        userInformation.setName(name);
        userInformation.setSurname(surname);
        userInformation.setGender(gender);
        userInformationService.updateUserInformation(userInformation);

        return "redirect:/";
    }

}
