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
import java.util.*;

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
        model.put("games",gamesService.allGames());
        model.put("goals",goalsService.allGoals());
        Iterable<Ad> ads=adRepository.findAll();
        model.put("filterAge",null);
        model.put("filterGender",null);
        model.put("filterGame",null);
        model.put("filterGoal",null);
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

  @PostMapping("news")
    public String filter( @RequestParam Optional<Integer> age,
                          @RequestParam Optional<String> gender, @RequestParam Optional<String> game,
                          @RequestParam Optional<String> goal, Map<String, Object> model) {
      Iterable<Ad> ads=adRepository.findAll();
      ArrayList<Ad> result=new ArrayList<>();
      Iterator<Ad> it=ads.iterator();
        while(it.hasNext()){
            Ad ad=it.next();
            if((age.isPresent()&&(age.get()< ad.getLowAgeLvl()||age.get()> ad.getHighAgeLvl()))||
                (!gender.get().equals("")&&(!gender.get().equals(ad.getGender())))||
                  (game.isPresent()&&(!game.get().equals(ad.getGame().getGameName())))||
                    (goal.isPresent()&&(!goal.get().equals(ad.getGoal().getGoalName()))))
                continue;
            result.add(ad);

        }
        model.put("games",gamesService.allGames());
        model.put("goals",goalsService.allGoals());
        model.put("ads", result);
        model.put("filterAge",age.isPresent()?age.get():null);
        model.put("filterGender",gender.get());
        model.put("filterGame",game.isPresent()?game.get():"empty");
        model.put("filterGoal",goal.isPresent()?goal.get():"empty");
        return "news";
    }
}
