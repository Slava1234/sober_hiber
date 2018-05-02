<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

    <title>${cv.fio}</title>
</head>
<body>
<div class="container">
    <div class="col-md-8 col-md-offset-2">
        <h2>ФИО </h2>
        <h3>${cv.fio}</h3>
        <hr>
        <h4>EMAIL</h4>
        <p>${cv.email}</p>
        <hr>
        <h4>ТЕЛЕФОН</h4>
        <p>${cv.phone}</p>
        <hr>
        <h4>Зарплата</h4>
        <p>${cv.sellary}</p>
        <hr>
        <h>Дата рождения</h>
        <p>${cv.birthdate}</p>
        <hr>
        <h4>Опыт работы</h4>
        <p>${cv.experiance_years}</p>
        <hr>
        <h4>Места работы</h4>
        <p>${cv.experiance_places}</p>
        <hr>
        <h4>Навыки</h4>
        <p>${cv.skills}</p>
        <hr>
        <h4>Общие данные</h4>
        <p>${cv.about}</p>
        <hr>
        <h4>Комментарий</h4>
        <p>${cv.comment}</p>
    </div>
</div>


<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
</body>
</html>
