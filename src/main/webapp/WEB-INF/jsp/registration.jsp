<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Регистрация</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="text-center">
<%@ include file="Blocks/header.jsp" %>
<form:form method="POST" modelAttribute="userForm">
    <p class="h3 fw-normal mb-3 mx-auto" style="padding-top: 5%">Регистрация</p>
    <div class="form-floating w-25 mb-2 mx-auto">
        <form:input type="text" path="username" class="form-control" placeholder="Username"
                    id="floatingInput"></form:input>
        <label for="floatingInput">Логин</label>
        <form:errors path="username"></form:errors>
            ${usernameError}
    </div>
    <div class="form-floating w-25 mb-2 mx-auto">
        <form:input type="password" path="password" class="form-control" id="floatingPassword"
                    placeholder="Password"></form:input>
        <label for="floatingPassword">Пароль</label>
    </div>
    <div class="form-floating w-25 mb-2 mx-auto">
        <form:input type="password" path="passwordConfirm" class="form-control" id="repeatPassword"
                    placeholder="Confirm your password"></form:input>
        <label for="repeatPassword">Повторите пароль</label>
        <form:errors path="password"></form:errors>
            ${passwordError}
    </div>
    <button class="w-25 btn btn-lg btn-primary" type="submit">Зарегистрироваться</button>
    <p class="mt-3 mb-2 text-muted">© 2021-2022</p>
</form:form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
