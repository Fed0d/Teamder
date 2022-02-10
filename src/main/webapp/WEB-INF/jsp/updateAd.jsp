<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.List"%>
<%@ page import="com.Fed0d.Teamder.entity.Game"%>
<%@ page import="com.Fed0d.Teamder.entity.Goal"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
</head>

<body>
<div>
    <h1> Мы поможем вам найти с кем поиграть!!! Опишите его...</h1>
    <form method="put">
        <p><input type="hidden" name="id" value="${ad.id}" ></p>
        <input type="text" name="tag" value="${ad.tag}" placeholder="Название">
        <p>Возраст: от </p><input type="number" value="${ad.lowAgeLvl}" name="lowAgeLvl" >
        <p>до</p> <input type="number" value="${ad.highAgeLvl}" name="highAgeLvl" ></p>
        <input type="text" name="gender" value="${ad.gender}" placeholder="Введите пол" >
        <input type="text" name="elo" value="${ad.elo}" placeholder="введите рейтинг">


        <p>
            <select size="5" name="game">
                <option disabled>Выберите игру</option>
                <c:forEach items="${games}" var="game">
                    <option  value=${game.gameName}>${game.gameName}</option>
                </c:forEach>
            </select>
        </p>

        <br>
        <p>
            <select size="5" name="goal">
                <option disabled>Выберите цель игры</option>
                <c:forEach items="${goals}" var="goal">
                    <option value=${goal.goalName}>${goal.goalName}</option>
                </c:forEach>
            </select>
        </p>
        <input type="text" name="text" value="${ad.text}" placeholder="Текст" >
        <button type="submit">Добавить</button>
    </form>
</div>

</body>
</html>