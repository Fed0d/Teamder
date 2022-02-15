<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.Fed0d.Teamder.entity.Game"%>
<%@ page import="com.Fed0d.Teamder.entity.Goal"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Новости</title>
    <style>
        #zatemnenie {
            background: rgba(102, 102, 102, 0.5);
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            display: none;
        }
        #okno {
            width: 400px;
            height: 550px;
            text-align: center;
            padding: 15px;
            border: 3px solid #0000cc;
            border-radius: 10px;
            color: #0000cc;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            margin: auto;
            background: #fff;
        }
        #zatemnenie:target {display: block;}
        .close {
            display: inline-block;
            border: 1px solid #0000cc;
            color: #0000cc;
            padding: 0 12px;
            margin: 10px;
            text-decoration: none;
            background: #f2f2f2;
            font-size: 14pt;
            cursor:pointer;
        }
        .close:hover {background: #e6e6ff;}
    </style>
</head>
<body>
<%@ include file="Blocks/header.jsp"%>
<div>
    <a href="/addAd">Создать объявление</a>
    <div id="zatemnenie">

        <div id="okno">
            Всплывающее окошко!<br>
            <form method="post">
                <p>Возраст:</p><input type="number" value ="${filterAge}" name="age" >
                <input type="text" name="gender" value ="${filterGender}" placeholder="Введите пол" >
                <p>
                    <select size="5" name="game">
                        <option disabled>Выберите игру</option>
                        <c:forEach items="${games}" var="game">
                            <c:if test="${filterGame}==${game.gameName}">
                                <option selected="selected" value=${game.gameName}>${game.gameName}</option>
                            </c:if>
                            <option  value=${game.gameName}>${game.gameName}</option>
                        </c:forEach>
                    </select>
                </p>

                <br>
                <p>
                    <select size="5" name="goal">
                        <option disabled>Выберите цель игры</option>
                        <c:forEach items="${goals}" var="goal">
                            <c:if test="${filterGoal}==${goal.goalName}">
                                <option selected="selected" value=${goal.goalName}>${goal.goalName}</option>
                            </c:if>
                            <option value=${goal.goalName}>${goal.goalName}</option>
                        </c:forEach>
                    </select>
                </p>
                <button type="submit">Применить фильтры</button>
            </form>
            <a href="#" class="close">Закрыть окно фильтров</a>
        </div>
    </div>

    <p></p>
    <a href="#zatemnenie">Фильтры</a>
    <h2>Объявления</h2>
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
          </div>
          </c:forEach>
        </dl>
        <script type=»text/javascript» src=»jquery-1.3.2.js»></script>
        <script type=»text/javascript»>

        </script>
    <a href="/">Главная</a>
</div>
</body>
</html>