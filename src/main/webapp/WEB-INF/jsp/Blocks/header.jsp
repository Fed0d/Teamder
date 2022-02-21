<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-2 border-bottom">
    <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
            <use xlink:href="#bootstrap"></use>
        </svg>
    </a>
    <sec:authorize access="!isAuthenticated()">
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/" class="nav-link px-2 link-secondary">Главная</a></li>
            <li><a href="/news" class="nav-link px-2 link-dark">Объявления</a></li>
            <li><a href="/about" class="nav-link px-2 link-dark">О нас</a></li>
        </ul>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0" style="padding-left: 10%">
            <li><a href="/" class="nav-link px-2 link-secondary">Главная</a></li>
            <li><a href="/news" class="nav-link px-2 link-dark">Объявления</a></li>
            <li><a href="/about" class="nav-link px-2 link-dark">О нас</a></li>
        </ul>
    </sec:authorize>
    <sec:authorize access="!isAuthenticated()">
        <div class="col-md-3 text-end" style="padding-right: 1%">
            <a href="/login">
                <button type="button" class="btn btn-outline-primary me-2">Войти</button>
            </a>
            <a href="/registration">
                <button type="button" class="btn btn-primary">Зарегистрироваться</button>
            </a>
        </div>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <div class="col-md-3 text-end" style="padding-right: 1%">
        </div>
        <div class="dropdown text-end">
            <a href="/userInformationForm" class="d-block link-dark text-decoration-none dropdown-toggle me-2"
               style="font-weight: bold" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                    ${pageContext.request.userPrincipal.name}
                        <img src="/avatars/${pageContext.request.userPrincipal.getPrincipal().userInformation.previewAvatarId}" alt="mdo" width="32" height="32" class="rounded-circle">
            </a>
            <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                <li><a class="dropdown-item" href="/userInformationForm">О себе</a></li>
                <li><a class="dropdown-item" href="/myAds">Мои объявления</a></li>
                <li><a class="dropdown-item" href="/dialogs">Мои чаты</a></li>
                <sec:authorize access="hasRole('ADMIN')">
                    <li><a class="dropdown-item" href="/admin">Управление пользователями</a></li>
                </sec:authorize>
                <li>
                    <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="/logout">Выйти</a></li>
            </ul>
        </div>
    </sec:authorize>
</header>
