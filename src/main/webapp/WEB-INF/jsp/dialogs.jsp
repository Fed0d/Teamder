<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.Fed0d.Teamder.Servlets.WrapOfDialog"%>
<%@ page import="com.Fed0d.Teamder.entity.User"%>
<%@ page import="com.Fed0d.Teamder.entity.Message"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Диалоги</title>
</head>
<body>
<div>
    <h2>Чаты</h2>
    <dl id=»ticker»>
        <c:forEach items="${wrapOfDialogs}" var="wrapOfDialog">
            <a href="/chat?id=${wrapOfDialog.interlocutor.id}">
            <div title="dialog">
                <h4>${wrapOfDialog.interlocutor.username}</h4>
                <p>${wrapOfDialog.lastMessage.text}</p>
                <p>Дата:${wrapOfDialog.lastMessage.date}</p>
            </div>
            </a>
        </c:forEach>
    </dl>
    <script type=»text/javascript» src=»jquery-1.3.2.js»></script>
    <script type=»text/javascript»>

    </script>
    <a href="/">Назад</a>
</div>
</body>
</html>