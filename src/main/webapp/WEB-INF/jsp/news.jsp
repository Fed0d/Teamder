<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.Fed0d.Teamder.entity.Game" %>
<%@ page import="com.Fed0d.Teamder.entity.Goal" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Новости</title>

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
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        Фильтры</button>
    <!-- Modal -->
    <div class="modal fade text-center" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="align-content: center">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Фильтры</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body form-floating" style="clear:both; text-align:right;" >
                    <form method="post" >
                        <div class="col-md-3 mb-3" style="clear:both; text-align:left;" >
                            <label for="filterAge">Возраст</label>
                            <input class="form-control" id="filterAge" type="number" value="${filterAge}" name="age"optional ="">
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3" style="clear:both; text-align:left;">
                                <label for="Gender">Гендер</label>
                                <input type="text" name="gender" value="${filterGender}" class="form-control" id="Gender" placeholder="Введите пол" optional ="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5 mb-3" style="clear:both; text-align:left;">
                                <label for="game">Игра</label>
                                <select class="custom-select d-block w-100" id="game"  name="game" optional ="">
                                    <option disabled>Выберите игру</option>
                                    <c:forEach items="${games}" var="game">
                                        <c:if test="${filterGame==game.gameName}">
                                            <option selected="selected" value=${game.gameName}>${game.gameName}</option>
                                        </c:if>
                                        <option value=${game.gameName}>${game.gameName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-5 mb-3" style="clear:both; text-align:left;">
                                <label for="goal">Цель игры</label>
                                <select class="custom-select d-block w-100" id="goal"  name="goal" optional ="">
                                    <option disabled>Выберите цель игры</option>
                                    <c:forEach items="${goals}" var="goal">
                                        <c:if test="${filterGoal==goal.goalName}">
                                            <option selected="selected" value=${goal.goalName}>${goal.goalName}</option>
                                        </c:if>
                                        <option value=${goal.goalName}>${goal.goalName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Применить фильтры</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

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