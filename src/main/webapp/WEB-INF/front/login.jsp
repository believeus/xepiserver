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
<!--头部开始-->
<div style="width: 100%;height: 50px;">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<div style="background-image:url('static/images/bg.png');width: 100%;height: 667px;">
    <div style="width:100%;height:100%;">
        <c:if test="${sessionuser ==null}"><div id="zhuce" style="cursor: pointer" onclick="window.location.href = '/concent/index.jhtml'">Register</div></c:if>
        <div id="login"></div>
        <form action="App/login.jhtml" method="post">
            <div class="login_bg">
                <div id="logo">
                    <img src="static/images/InOrUp/com_logo.png" style="width: 100%;height: 100%"/>
                </div>
                <div style="    width: 80%;
            margin: 0 auto;
            text-align: left;">
                    <div id="PWDSignIn" style="display:block">
                        <div class="userName">
                            <lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                            <input name="email" id="email" placeholder="Email" type="email" required="required"
                                   style="width: 70%">
                        </div>
                        <div class="passWord">
                            <lable style="color:#808080">&nbsp;&nbsp;&nbsp;&nbsp;
                                <img src="static/images/InOrUp/pwd.png" style="width: 16px;height: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;
                            </lable>
                            <input type="password" name="password" id="password" placeholder="Password"
                                   required="required"
                                   style="width:60%">
                        </div>
                        <div class="choose_box">
                            <lable style="color:#696969;text-decoration: none;float: right;"><a href="/user/forgotPaswd.jhtml">forget password</a></lable>
                            <div class="other_login" style="margin-top: 100px;line-height: 22px;">
                                <span>By clicking the button below, I agree to <a href="concent/index.jhtml" style="text-decoration: none;"><i> the User Agreement and Privacy Policy.</i></a></span>
                                <input type="submit" class="login_btn" value="Login"  style="margin-top: 0px;text-align: center"></input>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

</body>

</html>

<script>
    $(function(){
        $("form").submit(function (e) {
            var data = {};
            data.email = $("#email").val();
            data.password = $("#password").val();
            $.post("/user/login.jhtml", data, function (data) {
                if (data.indexOf("ERROR")!=-1) {
                    alert(data);
                } else {
                    window.location.href = data;
                }
            });
            return false;
        });
    });

</script>
