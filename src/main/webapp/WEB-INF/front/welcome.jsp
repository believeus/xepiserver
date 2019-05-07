<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/19
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>Welcome</title>
</head>
</head>
<body style="margin: 0;padding: 0">
<div style="width: 100%;height: 607px;">
    <div style="width: 100%;height: auto;text-align: center">
        <div style="width: 100%;height:10%"></div>
        <img src="static/images/welcome-logo.png" style="width:50%;height:auto"/>
        <div style="width: 100%;height:10%">How old are you, <i>really?</i><br>Discover your biological age. </div>
        <div style="width: 100%;height:10%"></div>
    </div>
    <div style="width: 100%;height: 42%;display: flex">
        <div style="width: 10%;height: 100%;"></div>
        <div style="width: 79.5%;height: 100%;">
            <div style="width:100%;height: 20%;border: 1px solid #026eb8;color: #026eb8;text-align: center;line-height: 53px;font-size: 20px;font-weight: 700" onclick="toregister()">Register</div>
            <div style="width:100%;height: 20%;color: #b2b2b2;text-align: center;line-height: 53px;font-size: 20px">OR</div>
            <div style="width:100%;height: 20%;background-color: #026eb8;color: #fff;text-align: center;line-height: 53px;font-size: 20px;font-weight: 700" onclick="tologin()">Sign In</div>
            <div style="width:100%;height: 40%;">
                <div style="display: flex;height: 104px;width: 100%;margin-top:30px">
                <div style="width: 49.5%;height: 40px;border-right: 1px solid #000;text-align: center;line-height: 40px;font-size: 16px;" onclick="toBuy()">BUY A KIT</div>
                <div style="width: 49.5%;height: 40px;text-align: center;line-height: 40px;font-size: 16px;" onclick="toindex()">HOME</div>
                </div>
            </div>

        </div>
        <div style="width: 10%;height: 100%;"></div>

    </div>


</div>
</body>
</html>
<script>
    function tologin() {
        window.location.href = "login.jhtml"
    }

    function toregister() {
        window.location.href = "register.jhtml"
    }

    function toindex() {
        window.location.href = "index.jhtml"
    }

    function toBuy() {
        window.location.href = "cart/index.jhtml"
    }

</script>
