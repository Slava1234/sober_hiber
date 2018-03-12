<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TEST</title>
</head>
<body>
    <c:forEach items="${test}" var="t">
        <h3>${t.first_name}</h3>
        <c:forEach items="${t.userRoles}" var="r">
            <br>
            <h4>${r.users.get(0)}</h4>
            <h4>${r.role}</h4>
            <h4>${r.id}</h4>
            <br>
        </c:forEach>
    </c:forEach>
</body>
</html>
