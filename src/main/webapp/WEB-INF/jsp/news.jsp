<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.Fed0d.Teamder.entity.Game" %>
<%@ page import="com.Fed0d.Teamder.entity.Goal" %>

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

        #zatemnenie:target {
            display: block;
        }

        .close {
            display: inline-block;
            border: 1px solid #0000cc;
            color: #0000cc;
            padding: 0 12px;
            margin: 10px;
            text-decoration: none;
            background: #f2f2f2;
            font-size: 14pt;
            cursor: pointer;
        }

        .close:hover {
            background: #e6e6ff;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="Blocks/header.jsp" %>
<div class="text-center">
    <p class="h1">Объявления</p>
    <sec:authorize access="isAuthenticated()">
        <a href="/addAd"><button type="button" class="btn btn-primary">Создать объявление</button></a>
    </sec:authorize>
    <div id="zatemnenie">

        <div id="okno">
            Всплывающее окошко!<br>
            <form method="post">
                <p>Возраст:</p ><input type="number" value="${filterAge}" name="age">
                <input type="text" name="gender" value="${filterGender}" placeholder="Введите пол">
                <p>
                    <select size="5" name="game">
                        <option disabled>Выберите игру</option>
                        <c:forEach items="${games}" var="game">
                            <c:if test="${filterGame}==${game.gameName}">
                                <option selected="selected" value=${game.gameName}>${game.gameName}</option>
                            </c:if>
                            <option value=${game.gameName}>${game.gameName}</option>
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
    <a href="#zatemnenie">
        <button type="button" class="btn btn-secondary">Фильтры</button>
    </a>
    <div class="row mb-2 mt-2">
        <c:forEach items="${ads}" var="ad" varStatus="counter">
            <c:choose>
                <c:when test="${counter.count % 2 == 0}">
                    <div class="col-md-6">
                        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                            <div class="col p-4 d-flex flex-column position-static">
                                <strong class="d-inline-block mb-2 text-primary">${ad.goal.goalName}</strong>
                                <h3 class="mb-0">${ad.tag}</h3>
                                <div class="mb-1 text-muted">${ad.date}</div>
                                <p class="mb-auto" ><small>Пол: ${ad.gender}</small></p>
                                <p class="mb-auto"><small>Ожидаемое эло: ${ad.elo}</small></p>
                                <p class="card-text mb-auto">${ad.text}</p>
                                <a href="/userInformation?id=${ad.author.id}"
                                   class="stretched-link">${ad.author.username}</a>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <button type="button" class="btn btn-secondary">Редактировать</button>
                                </sec:authorize>

                            </div>
                            <div class="col-auto d-none d-lg-block">
                                <svg class="bd-placeholder-img" width="200" height="250"
                                     xmlns="http://www.w3.org/2000/svg"
                                     role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice"
                                     focusable="false"><title>Placeholder</title>
                                    <rect width="100%" height="100%" fill="#55595c"></rect>
                                    <text x="25%" y="50%" fill="#eceeef" dy=".3em">${ad.game.gameName}</text>
                                </svg>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:when test="${counter.count % 2 != 0}">
                    <div class="col-md-6">
                        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                            <div class="col p-4 d-flex flex-column position-static">
                                <strong class="d-inline-block mb-2 text-success">${ad.goal.goalName}</strong>
                                <h3 class="mb-0">${ad.tag}</h3>
                                <div class="mb-1 text-muted">${ad.date}</div>
                                <p class="mb-auto" ><small>Пол: ${ad.gender}</small></p>
                                <p class="mb-auto"><small>Ожидаемое эло: ${ad.elo}</small></p>
                                <p class="mb-auto">${ad.text}</p>
                                <a href="/userInformation?id=${ad.author.id}"
                                   class="stretched-link">${ad.author.username}</a>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <button type="button" class="btn btn-secondary">Редактировать</button>
                                </sec:authorize>
                            </div>
                            <div class="col-auto d-none d-lg-block">
                                <svg class="bd-placeholder-img" width="200" height="250"
                                     xmlns="http://www.w3.org/2000/svg"
                                     role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice"
                                     focusable="false"><title>Placeholder</title>
                                    <rect width="100%" height="100%" fill="#55595c"></rect>
                                    <text x="25%" y="50%" fill="#eceeef" dy=".3em">${ad.game.gameName}</text>
                                </svg>
                            </div>
                        </div>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>
    </div>
</div>
<script type=»text/javascript» src=»jquery-1.3.2.js»></script>
<script type=»text/javascript»></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</div>
</body>
</html>