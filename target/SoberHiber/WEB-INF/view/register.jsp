<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

    <title>Register</title>
</head>
<body>
<div class="col-md-offset-3">
    <div class="col-md-6">
        <div class="modal-dialog" style="margin-bottom:0">
            <div class="modal-content">
                <div class="panel-heading">
                    <h3 class="panel-title">Register</h3>
                </div>
                <div class="panel-body">
                    <form role="form">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus="">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="First name" name="first_name" type="text"
                                       autofocus="">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Last name" name="last_name" type="text"
                                       autofocus="">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="password" type="password"
                                       value="">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Repeat password" name="password2"
                                       type="password"
                                       value="">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Birthday YYYY-mm-dd" name="birthday"
                                       type="text"
                                       value="">
                            </div>
                            <a href="javascript:;" class="btn btn-sm btn-success">Register</a>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>

</body>
</html>
