package com.Fed0d.Teamder.controller;

import com.Fed0d.Teamder.entity.Ad;
import com.Fed0d.Teamder.entity.Game;
import com.Fed0d.Teamder.entity.Goal;
import com.Fed0d.Teamder.entity.User;
import com.Fed0d.Teamder.repository.AdRepository;
import com.Fed0d.Teamder.service.GamesService;
import com.Fed0d.Teamder.service.GoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class NewsController {
    @Autowired
    private AdRepository adRepository;
    @Autowired
    private GamesService gamesService;
    @Autowired
    private GoalService goalsService;



    @GetMapping("/news")
    public String news(Map<String,Object> model){
        Iterable<Ad> ads=adRepository.findAll();
        model.put("ads",ads);
        return "news";
    }
    @GetMapping("/addAd")
    public String addAd(Model model){
        model.addAttribute("games",gamesService.allGames());
        model.addAttribute("goals",goalsService.allGoals());
        return "addAd";
    }
    @PostMapping("addAd")
    public String addAd(@RequestParam String tag, @RequestParam Integer lowAgeLvl,
                      @RequestParam Integer highAgeLvl, @RequestParam String gender,
                      @RequestParam String text, @RequestParam String elo,
                      @RequestParam String game,
                      @RequestParam String goal, Map<String, Object> model) {
        Date date=new Date();
        User author=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Ad ad = new Ad(tag, lowAgeLvl, highAgeLvl, gender, text, elo,date,author, gamesService.findGameByGamName(game), goalsService.findGoalByGoalName(goal));

        adRepository.save(ad);

        return "news";
    }

  /*  @PostMapping("filter")
    public String filter(@RequestParam String filter, Map<String, Object> model) {
        Iterable<Message> messages;

        if (filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else {
            messages = messageRepo.findAll();
        }

        model.put("messages", messages);

        return "main";
    }*/
}
