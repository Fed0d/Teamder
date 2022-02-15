<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Авторизация</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="text-center">
<%@ include file="Blocks/header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>
<!--<div>
    <input name="username" type="text" placeholder="Username"
           autofocus="true"/>
    <input name="password" type="password" placeholder="Password"/>
    <button type="submit">Log In</button>
    <h4><a href="/registration">Зарегистрироваться</a></h4>
</div>-->
<form method="POST" action="/login">
    <p class="h3 fw-normal mb-3 mx-auto" style="padding-top: 5%">Вход в систему</p>
    <div class="form-floating w-25 mb-2 mx-auto">
        <input name="username" type="text" class="form-control" id="floatingInput" placeholder="Username">
        <label for="floatingInput">Логин</label>
    </div>
    <div class="form-floating w-25 mb-2 mx-auto">
        <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password">
        <label for="floatingPassword">Пароль</label>
    </div>
    <div class="checkbox mb-3">
    <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
    <label class="form-check-label" for="flexCheckDefault">
        Запомнить меня
    </label>
     </div>
<button class="w-25 btn btn-lg btn-primary" type="submit">Войти</button>
<p class="mt-3 mb-2 text-muted">© 2021-2022</p>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
