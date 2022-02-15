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
    <title>Tell something about yourself</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
<%@ include file="Blocks/header.jsp"%>
<div>
    <h1> Расскажите о себе</h1>
    <form method="post">
        <input type="text" name="email" value="${userInformation.email}" placeholder="Email"><br>
        <p><input type="text" name="name" value="${userInformation.name}" placeholder="Name">
            <input type="text" name="surname" value="${userInformation.surname}" placeholder="Surename"></p>
        <p>Возраст: <input type="number" value="${userInformation.age}" name="age"></p><br>
        <p><input type="text" name="gender" value="${userInformation.gender}" placeholder="Введите пол"></p>

        <button type="submit">Добавить</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>