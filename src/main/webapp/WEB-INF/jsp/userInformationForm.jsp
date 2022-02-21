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
    <h1 style="padding-left: 20px;" class=" mb-3"> Расскажите о себе</h1>
    <form class="needs-validation" method="post" style="padding-left: 20px;">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="email">Email</label>
                <input type="text" name="email" value="${userInformation.email}" placeholder="Email" class="form-control" id="email" >
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 mb-3">
                <label for="name">Имя</label>
                <input class="form-control" id="name" type="text" name="name" value="${userInformation.name}" placeholder="Name">
            </div>
            <div class="col-md-3 mb-3">
                <label for="surname">Фамилия</label>
                <input class="form-control"  id="surname" type="text" name="surname" value="${userInformation.surname}" placeholder="Surname">
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 mb-3">
                <label for="age">Возраст</label>
                <input class="form-control" id="age" type="number" value="${userInformation.age}" name="age">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="Gender">Гендер</label>
                <input type="text" name="gender" value="${userInformation.gender}" class="form-control" id="Gender" placeholder="Введите пол" >
            </div>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">@</span>
            <input type="text" name="vk" value="${vkName}" class="form-control" placeholder="VK" aria-describedby="basic-addon1">
        </div>
        <div class="input-group mb-3">
            <input type="text" name="discordName" class="form-control" value="${discordName}" placeholder="Nickname" aria-label="Nickname">
            <span class="input-group-text">@</span>
            <input type="text" name="discordTag" class="form-control" value="${discordTag}" placeholder="Tag" aria-label="Tag">
        </div>
        <div class="col-md-3 mb-3">
            <label for="steam">Стим</label>
            <input class="form-control" id="steam" type="text" name="steam" value="${userInformation.steam}" placeholder="Ссылка на вашу страницу стим">
        </div>
        <button class="btn btn-primary btn-lg btn-block" type="submit">Добавить</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>