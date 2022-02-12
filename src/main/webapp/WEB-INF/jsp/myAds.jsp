<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.Fed0d.Teamder.entity.Game" %>
<%@ page import="com.Fed0d.Teamder.entity.Goal" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Мои объявления</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div>
    <a href="/addAd">Создать объявление</a>
    <h2>Мои объявления</h2>
    <dl id=»ticker»>
        <c:forEach items="${ads}" var="ad">
            <div>
                <h3>${ad.tag}</h3>
                <p>Возраст от ${ad.lowAgeLvl} до ${ad.highAgeLvl}</p>
                <p> Гендер:${ad.gender}</p>
                <p> Ожидаемое эло:${ad.elo}</p>
                <p>Игра:${ad.game.gameName}</p>
                <p>Цель игры:${ad.goal.goalName}</p>
                <p>${ad.text}</p>
                <p> Соискатель:</p><a href="/userInformation?id=${ad.author.id}">${ad.author.username}</a></p>
                <p>Дата:${ad.date}</p>
                <form method="post">
                    <p><input type="hidden" name="id" value="${ad.id}"></p>
                    <button type="submit">Редактировать</button>
                </form>
            </div>
        </c:forEach>
    </dl>
    <script type=»text/javascript» src=»jquery-1.3.2.js»></script>
    <script type=»text/javascript»>

    </script>
    <a href="/userInformationMenu">Назад</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>