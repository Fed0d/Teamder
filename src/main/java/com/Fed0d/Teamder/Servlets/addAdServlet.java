package com.Fed0d.Teamder.Servlets;

import com.Fed0d.Teamder.entity.Game;
import com.Fed0d.Teamder.entity.Goal;
import com.Fed0d.Teamder.service.GamesService;
import com.Fed0d.Teamder.service.GoalService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
/*
@WebServlet(name="addAdServ",
            urlPatterns={"/addAdServ"})
public class addAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Game> games= new GamesService().allGames();
        req.setAttribute("games", games);
        List<Goal> goals=new GoalService().allGoals();
        req.setAttribute("goals", goals);
        getServletContext().getRequestDispatcher("/addAd.jsp").forward(req,resp);
    }
}*/
