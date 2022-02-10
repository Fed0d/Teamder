<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Моя страница</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
<div>
    <sec:authorize access="isAuthenticated()">
        <h4><a href="/userInformationForm"> О себе</a></h4>
        <h4><a href="/myAds">Мои объявления</a></h4>
        <h4><a href="/empty">Мои чаты</a></h4>
        <h4><a href="/logout">Выйти</a></h4>
    </sec:authorize>
    <sec:authorize access="!isAuthenticated()">
        <h1>Страничка только для авторизованных пользователей.</h1>
    </sec:authorize>
    <h4><a href="/">Назад</a></h4>

</div>
</body>
</html>