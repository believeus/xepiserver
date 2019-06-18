<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/17
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>User manual</title>
</head>
<body>
<div id="container" style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
    <div style="width: 80%;height: auto;margin: 0 auto;">
        <div>
            <h4 style="margin-top: 30px;text-align: center;">
                EpiAging App User Manual
            </h4>
            <h5>1.Download the IOS App from Apple Store or Android App from Google Play Store</h5>
            <h5>2.Register accounts by your e-mail and accept the customer data consent</h5>
        </div>
        <div style="width: 100%;height: auto">
            <img src="static/images/usermanual/m1.png">
        </div>
        <div style="width: 100%;height: auto">
            <img src="static/images/usermanual/m2.png">
        </div>
        <ul>
            <li> Click the Agree to accept Customer Consent.</li>
        </ul>
        <div style="width: 100%;height: auto">
            <img src="static/images/usermanual/m4.png">
        </div>
        <ul>
            <li>You can use your registered email address & password that you create to Login to the App next time.</li>
        </ul>
        <div style="width: 100%;height: auto">
            <img src="static/images/usermanual/m3.png">
        </div>
        <h5>3. Purchase the epiAging test kit by clicking epiAging test nitriduction page or SHOP.</h5>
        <div>
            <img src="static/images/usermanual/m6.png">
        </div>
        <div>
            <img src="static/images/usermanual/m7.png">
        </div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
