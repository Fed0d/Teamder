<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.Fed0d.Teamder.entity.Dialog"%>
<%@ page import="com.Fed0d.Teamder.entity.Message"%>

<!DOCTYPE html>
<head>
    <title>${interlocutor.username}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .prokrutka {
            height: 400px; /* высота нашего блока */
            width: 600px; /* ширина нашего блока */
            background: #fff; /* цвет фона, белый */
            border: 1px solid #C1C1C1; /* размер и цвет границы блока */
            overflow-y: scroll; /* прокрутка по вертикали */
        }
    </style>

</head>
<body>
<%@ include file="Blocks/header.jsp"%>
<div id="wrapper" style="padding-left: 30%">
    <div class="prokrutka" id="chatbox" style="padding-top: 1%">
        <c:forEach items="${dialog.message}" var="message">
            <p>${message.text}</p>
        </c:forEach>
    </div>
    <div style="margin-bottom: 15px">
    <form method="post" style="padding-top: 10px; height: 150px;">
        <input type="hidden" name="id" value="${dialog.id}">
        <%@ include file="Blocks/emojiMenu.jsp"%>
        <input  type="text" name="text" placeholder="Текст" id="messageInput" style=" display:inline-block; width: 450px; height: 100px;" autofocus>
        <button type="submit" class="btn btn-success" style="height: 70px;width: 100px; padding-left: 10px;display:inline-block; ">Отправить</button>
    </form>
    </div>
</div>

<script type="text/javascript">
    var block = document.getElementById("chatbox");
    block.scrollTop = block.scrollHeight;

    function addEmoji(title) {
        messageInput.value += " " + title + " ";
//Тут же можно добавить закрытие контейнера
        messageInput.focus();
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<small class="d-block text-right mt-3" style="padding-left: 20px">
    <a href="/dialogs"><button type="button" class="btn btn-secondary">Назад</button></a>
</small>
</body>
</html>
