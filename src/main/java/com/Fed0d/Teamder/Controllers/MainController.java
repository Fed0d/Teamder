package com.Fed0d.Teamder.Controllers;

import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("title", "Главная страница");
        return "home";
    }
    @GetMapping("/statements")
    public String statements(Model model){
        model.addAttribute("title", "Заявки");
        return "statements";
    }

    @GetMapping("/about")
    public String about(Model model){
        model.addAttribute("title", "О нас");
        return "about";
    }

    @GetMapping("/login")
    public String login(Model model){
        model.addAttribute("title", "Авторизация");
        return "login";
    }
}