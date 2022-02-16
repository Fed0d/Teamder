<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>О нас</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="Blocks/header.jsp"%>
<div th:insert="Blocks/header :: header"></div>
<div class="container mt-5">
    <h1>Список великих работников:</h1>
    <ul>
        <li>Самородов Дмитрий - мастер</li>
        <li>Моликов Илья - подмастерье</li>
        <li>Розенберг Артур - просто хороший парень</li>
    </ul>
</div>
<div th:insert="Blocks/footer :: footer"></div>
</body>
</html>