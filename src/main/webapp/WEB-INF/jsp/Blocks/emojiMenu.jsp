<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.vdurmont.emoji.Emoji" %>
<div style="display: inline-block; ">
    <div class="btn-group dropup">
        <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="width: 40px; height: 70px;">
        </button>

        <ul class="dropdown-menu">
            <div style="height: 300px;
            width: 400px;
            background: #fff;
            border: 1px solid #C1C1C1;
            overflow-y: scroll;">

            <c:forEach items="${emojis}" var="emoji">
                    <button type="button" onclick="addEmoji('${emoji}');" class="btn btn-link" style = " box-shadow: none;
                            text-decoration: none;
                            height: 25px;
                            width: 25px !important;
                            padding-left: 3px;">  ${emoji}</button>

            </c:forEach>
            </div>
        </ul>
    </div>
</div>