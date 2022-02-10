<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Новости</title>
</head>
<body>
<div>
    <h1>${userName}</h1>
    <div>
        <p>${userInformation.name} ${userInformation.surname}</p>
        <p>Возраст: ${userInformation.age}</p>
        <p>Пол: ${userInformation.gender}</p><br>
    </div>

    <a href="/">Главная</a>
</div>
</body>
</html>