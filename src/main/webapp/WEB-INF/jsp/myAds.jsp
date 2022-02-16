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
<%@ include file="Blocks/header.jsp"%>
<div class="text-center">
    <h2>Мои объявления</h2>
    <div class="row mb-2">
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
                                <form method="post">
                                    <p><input type="hidden" name="id" value="${ad.id}"></p>
                                    <button type="submit" class="btn btn-primary">Редактировать</button>
                                </form>
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
                                <form method="post">
                                    <p><input type="hidden" name="id" value="${ad.id}"></p>
                                    <button type="submit" class="btn btn-success">Редактировать</button>
                                </form>
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

    <script type=»text/javascript» src=»jquery-1.3.2.js»></script>
    <script type=»text/javascript»>
    </script>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>