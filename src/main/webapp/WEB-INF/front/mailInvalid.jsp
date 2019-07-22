<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">

    <title>Login</title>

    <link rel="stylesheet" type="text/css" href="static/css/login.css">
    <script src="static/js/jquery-2.1.1.min.js"></script>

</head>
<body style="margin: 0;padding: 0">


<div style="background-image:url('static/images/bg.png');width: 100%;height: 667px;">
    <div style="width:100%;height:100%;">
        <div id="login"></div>
        <form action="user/login.jhtml" method="post">
            <div class="login_bg">
                <div id="logo">
                    <img src="static/images/InOrUp/com_logo.png" style="width: 100%;height: 100%"/>
                </div>
                <div style=" width: 80%;margin: 0 auto;text-align: left;font-size: 22px;">
                    ${message}
                </div>
            </div>
        </form>
    </div>
</div>

</body>

</html>

<script>
    $(function () {
        $("form").submit(function (e) {
            var data = {};
            data.email = $("#email").val();
            data.password = $("#password").val();
            $.post("user/login.jhtml", data, function (data) {
                if (data.indexOf("ERROR") != -1) {
                    alert(data);
                } else {
                    window.location.href = data;
                }
            });
            return false;
        });
    });

</script>
