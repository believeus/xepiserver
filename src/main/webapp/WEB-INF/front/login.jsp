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

    <title>登录</title>

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
        <c:if test="${sessionuser ==null}">
            <div id="zhuce" style="cursor: pointer" onclick="window.location.href = '/concent/index.jhtml'">注册
            </div>
        </c:if>
        <div id="login" style="width: 100%;height: 20px;"></div>
        <form action="/user/login.jhtml" method="post">
            <div class="login_bg">
                <div id="logo" style="width: 22%; margin: 0 auto;">
                    <img src="static/images/InOrUp/com_logo.png" style="width: 100%;height: 100%;"/>
                </div>
                <div style="width: 100%;height: 10px;"></div>
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
                        <div style="width: 100%;height: 100px;">
                            <lable style="color:#696969;text-decoration: none;float: right;">
                                <a href="/user/forgotPaswd.jhtml">忘记密码？</a>
                            </lable>
                        </div>

                        <div class="choose_box">
                            <div class="other_login"
                                 style="width: 80%;margin: 0 auto;line-height: 12px;overflow: hidden;">
                                <div style=" width:100%;height: 40px; font-size: 0.8em;color: #909093;">
                                    <a href="concent/index.jhtml" style="text-decoration: none;">
                                        <i>点击下面的按钮，我同意用户协议和隐私政策。</i>
                                    </a>
                                </div>
                                <input type="submit" class="login_btn" value="Login" style="margin-top: 0px;text-align: center"></input>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
            <div style="width: 100%;height: 93px;"></div>
            <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
                @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
            </div>
        </div>
    </div>

    <jsp:include page="footnav.jsp"></jsp:include>
</div>

</body>

</html>

<script>
    $(function () {
        $("form").submit(function (e) {
            var data = {};
            data.email = $("#email").val();
            data.password = $("#password").val();
            $.post("/user/login.jhtml", data, function (data) {
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
