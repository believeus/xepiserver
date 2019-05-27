<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/15
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0065)http://www.17sucai.com/preview/1149930/2018-04-11/login/demo.html -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1,shrink-to-fit=no">

    <meta name="TTUNION_verify" content="b846c3c2b85efabc496d2a2b8399cd62">
    <meta name="sogou_site_verification" content="gI1bINaJcL">
    <meta name="360-site-verification" content="37ae9186443cc6e270d8a52943cd3c5a">
    <meta name="baidu_union_verify" content="99203948fbfbb64534dbe0f030cbe817">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">--%>
    <meta name="format-detection" content="telephone=no">

    <title>登录页面</title>

    <link rel="stylesheet" type="text/css" href="static/css/login.css">
    <link rel="stylesheet" type="text/css" href="static/css/login2.css">
    <link rel="stylesheet" href="static/js/build/css/intlTelInput.css">
    <link rel="stylesheet" href="static/js/build/css/demo.css">
    <link rel="stylesheet" href="static/js/flag/js/dependancies/bootstrap-select-1.12.4/dist/css/bootstrap-select.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/flag/js/countrypicker.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/flag/js/dependancies/bootstrap-select-1.12.4/dist/js/bootstrap-select.js"></script>
    <script src="static/js/build/js/intlTelInput.js"></script>
    <script src="static/js/bootstrap.min.js"></script>


</head>
<body style="margin: 0;padding: 0">
<div  style="width: 100%;height: 50px">
    <jsp:include page="header.jsp"></jsp:include>
</div>
<div style="background-image:url('static/images/bg.png');width:100%;height:667px;">
    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="static/images/InOrUp/com_logo.png" style="width: 100%;height: 100%"/>
        </div>

        <div id="PhonePart" style="width:100%">
            <div style=" width: 80%;
                margin: 0 auto;
                text-align: left; ">
                <div style="width: 100%;text-align: center"> <p style="font-size: 26px">Thank you for your registration.</p></div>
                <p style="font-size: 20px">We have sent to you a verification email.</p>
                <p style="font-size: 20px">Please complete your registration by following the instruction in the email.</p>
            </div>
        </div>

    </div>
</div>
</body>

</html>



<script>
    function ToLogin() {
        window.location.href = 'login.jhtml';
    }
</script>