<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Fed0d.Teamder.entity.Game" %>
<%@ page import="com.Fed0d.Teamder.entity.Goal" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="Blocks/header.jsp"%>
<div>
    <h2 style="padding-left: 20px;" class=" mb-3"> Мы поможем вам найти с кем поиграть!!! Опишите его...</h2>
    <form class="needs-validation" method="post" style="padding-left: 20px;">

        <p><input type="hidden" name="id" value="${ad.id}"></p>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="Name">Тэг</label>
                <input type="text" name="tag" class="form-control" id="Name" placeholder="" value="${ad.tag}" required="">
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 mb-3">
                <label for="lowAgeLvl">Возраст: от</label>
                <input class="form-control" id="lowagelvl" type="number" value="${ad.lowAgeLvl}" name="lowAgeLvl"required="">
            </div>
            <div class="col-md-3 mb-3">
                <label for="highAgeLvl">до</label>
                <input class="form-control" type="number" id="highAgeLvl" value="${ad.highAgeLvl}" name="highAgeLvl" required="">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="Gender">Гендер</label>
                <input type="text" name="gender" value="${ad.gender}" class="form-control" id="Gender" placeholder="" required="">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="Elo">Эло</label>
                <input type="text" name="elo" value="${ad.elo}" class="form-control" id="Elo" placeholder="" required="">
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 mb-3">
                <label for="game">Игра</label>
                <select class="custom-select d-block w-100" id="game"  name="game" required="">
                    <option disabled>Выберите игру</option>
                    <c:forEach items="${games}" var="game">
                        <option value="${game.gameName}">${game.gameName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-5 mb-3">
                <label for="goal">Цель игры</label>
                <select class="custom-select d-block w-100" id="goal"  name="goal" required="">
                    <option disabled>Выберите цель игры</option>
                    <c:forEach items="${goals}" var="goal">
                        <option value="${goal.goalName}">${goal.goalName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="Text">Текст</label>
                <input type="text" name="text" value="${ad.text}" class="form-control" id="Text" placeholder="" required="">
            </div>
        </div>

        <button class="btn btn-primary btn-lg btn-block" type="submit">Добавить</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
