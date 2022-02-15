<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.Fed0d.Teamder.entity.Dialog"%>
<%@ page import="com.Fed0d.Teamder.entity.Message"%>

<!DOCTYPE html>
<head>
    <title>${interlocutor.username}</title>
</head>

<div id="wrapper">
    <div id="menu">
        <a id="exit" href="/dialogs">К моим чатам</a>

    </div>

    <div id="chatbox">
    <c:forEach items="${dialog.message}" var="message">
        <p>${message.text}</p>
    </c:forEach>
    </div>

    <form method="post">
        <input type="hidden" name="id" value="${dialog.id}">
        <input type="text" name="text" placeholder="Текст">
        <button type="submit">Отправить</button>
    </form>
</div>

</body>
</html>