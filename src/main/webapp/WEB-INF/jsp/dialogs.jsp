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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="Blocks/header.jsp"%>
<div>
    <div class="my-3 p-3 bg-white rounded box-shadow">
        <h2 class="border-bottom border-gray pb-2 mb-0">Чаты</h2>
        <c:forEach items="${wrapOfDialogs}" var="wrapOfDialog">
        <a href="/chat?id=${wrapOfDialog.interlocutor.id}" style="text-decoration: none;">
        <div class="media text-muted pt-3">
             <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <strong class="d-block text-gray-dark" style="font-size: large">${wrapOfDialog.interlocutor.username}</strong>
                     ${wrapOfDialog.lastMessage.text} <p align="right">${wrapOfDialog.lastMessage.date}</p>
            </p>
        </div>
        </a>
        </c:forEach>
        <small class="d-block text-right mt-3">
            <a href="/"><button type="button" class="btn btn-secondary">Назад</button></a>
        </small>
    </div>

</div>
</body>
</html>