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
<div id="container" style="width: 100%;height: 100%;">
    <div style="width: 100%;height: 50px;">
    </div>

    <div style="width: 90%;height: auto;margin: 0 auto;">
        <div style="width:100%;height:100%;">
            <div style="width: 100%;height: 40px;">
                <div style="cursor: pointer;float: right;font-size: 20px;font-weight: bold">
                    <a href="/wix/wixorder/index.jhtml" style="text-decoration: none;color: black;">Register</a>
                    <span>|</span>
                    <a href="https://www.epi-age.com/" style="text-decoration: none;color: black">Home</a>
                </div>
            </div>
            <div id="login"></div>
            <form action="/user/login.jhtml" method="post">
                <div class="login_bg">
                    <div style=" width: 80%; margin: 0 auto;text-align: left;">
                        <div id="PWDSignIn" style="display:block">
                            <div class="userName">
                                <lable style="color:#808080"> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="static/images/InOrUp/mail.png" style="width: 16px;height: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                </lable>
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
                                <lable style="color:#696969;text-decoration: none;float: right;"><a
                                        href="/user/forgotPaswd.jhtml">forget password?</a>
                                </lable>
                                <div class="other_login"
                                     style="width:90%;line-height: 27px;float: left; margin: 0 auto;">
                                    <div style="width: 100%;height: 110px;"></div>
                                    <div name="concent"
                                         style="width: 80%;height: auto;font-size: 0.93em; color: #666666;margin: 0 auto;float: left">
                                        <div style="width: 50%;margin: 0 auto;">
                                            <a href="concent/index.jhtml" style="text-decoration: none;"><i>By clicking
                                                the button below, I agree to
                                                the User Agreement and Privacy Policy.</i></a>
                                        </div>
                                    </div>
                                    <div style="width: 80%;height: 45px;text-align: center;overflow: hidden;">
                                        <input type="submit" class="login_btn" value="Login">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div id="all-right" style="width: 100%;height: auto;font-family: arial;padding-top: 178px;">
                <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
                    @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
                </div>
            </div>
        </div>
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
            $.post("/user/login.jhtml", data, function (data) {
                if (data.indexOf("ERROR") != -1) {
                    alert(data);
                } else {
                    window.location.href = "https://www.epi-age.com/";
                }
            });
            return false;
        });
    });

</script>
