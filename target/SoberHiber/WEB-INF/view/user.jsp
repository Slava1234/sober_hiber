<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

    <title>User data</title>
</head>
<body>

<div class="container">
    <jsp:include page="./parts/nav.jsp"/>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Email</th>
            <th scope="col">First name</th>
            <th scope="col">Last name</th>
            <th scope="col">Birthday</th>
            <th scope="col">Role</th>
            <th scope="col">Home Street</th>
            <th scope="col">Office Street</th>
        </tr>
        </thead>
        <tbody>


        <c:forEach items="${users}" var="user">
            <tr>
                <th scope="row">${user.id}</th>
                <td>${user.email}</td>
                <td>${user.first_name}</td>
                <td>${user.last_name}</td>
                <td>${user.birthday}</td>
                <td>
                    <ul class="roles_dropdown">
                        <c:forEach items="${user.user_roles}" var="role">
                            <li>${role.role}</li>
                            <li class="divider"></li>
                        </c:forEach>
                    </ul>
                </td>
                <td>${user.homeAddress.street}</td>
                <td>${user.officeAddress.street}</td>
            </tr>
        </c:forEach>


        </tbody>
    </table>

</div>

<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>

</body>
</html>
