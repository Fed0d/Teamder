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
    <title>Tell something about yourself</title>
</head>

<body>
<div>
    <h1> Расскажите о себе</h1>
    <form method="post">
        <input type="text" name="email" value ="${userInformation.email}" placeholder="Email"><br>
       <p> <input type="text" name="name" value ="${userInformation.name}" placeholder="Name">
           <input type="text" name="surname" value ="${userInformation.surname}" placeholder="Surename"></p>
        <p>Возраст: <input type="number" value ="${userInformation.age}" name="age" ></p><br>
        <p><input type="text" name="gender" value ="${userInformation.gender}" placeholder="Введите пол" ></p>

        <button type="submit">Добавить</button>
    </form>
</div>

</body>
</html>