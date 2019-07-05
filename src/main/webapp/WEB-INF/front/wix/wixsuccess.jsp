<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
<div style="width: 90%;height: 50px;margin: 0 auto">
    <div style="width: 100%;height: 50px;">
    </div>
    <div style="width: 12%;height: auto;margin: 0 auto;">
        <a href="https://www.epi-age.com/"><img src="static/images/InOrUp/com_logo.png" style="width: 100%;height: auto;margin: 0 auto;"></a>
    </div>
    <div style="width:100%;height:270px;">
        <div id="login"></div>
        <div class="login_bg">
            <div id="PhonePart" style="width:100%">
                <div style=" width: 100%;
                margin: 0 auto;
                text-align: center;line-height: 30px; ">
                    <div style="width: 100%;text-align: center;line-height: 100px;"><div style="font-size: 24px">Thank you
                        for your
                        registration.</div></div>


                    <div style="font-size: 20px;">We have sent to you a verification
                        email.</div>
                    <div style="font-size: 20px;">Please complete your registration by following the
                        instruction in the
                        email.</div>
                    <a style="color: black;font-size: 24px;font-weight: bold;text-decoration: underline;" href="https://www.epi-age.com/">[Home Page]</a>
                </div>
            </div>

        </div>

    </div>
    <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
        <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;;">
            @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
        </div>
    </div>
</div>
</body>

</html>
