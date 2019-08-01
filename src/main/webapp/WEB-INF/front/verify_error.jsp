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
    <title>验证错误</title>
</head>
</head>
<body style="margin: 0;padding: 0">
<div style="width: 100%;">
    <div style="width:100%;height: 135px">
        <div style="width: 207px;height: 100%;float: left;text-align: center;">
            <div style="width: 100%;height: 15px"></div>
            <img src="static/images/top-logo1.png" style="width: 100%;height: auto;"/>
        </div>
        <div style="width: 270px;height: 100%;float: left;text-align: center;margin-left: 30px;">
            <div style="width: 100%;height: 49px"></div>
            <img src="static/images/top-logo2.png" style="width: 100%;height: auto;"/>
        </div>

    </div>
    <div style="width:100%;height: 700px;display:flex;background-color: #efefef">
        <div style="width: 80%;height: 80%;margin-top:5%;margin-left: 10%;background-color: #fff">
            <div style="width: 30%;height: 100%;float: left"></div>
            <div style="width: 40%;height: 100%;float: left">
                <div style="width: 100%;height: 40%;text-align: center">
                    <div style="width: 100%;height: 20%;"></div>
                    <img src="static/images/var-error.png" style="width: 20%;height: auto"/>
                </div>
                <div style="width: 100%;height: 40%;text-align: center">
                    <div style="font-size: 24px;color:#fc8d6b">验证失败！</div>
                </div>
                <div style="width: 100%;height: 10%;text-align: center">
                    <div style="font-size: 17px;color:#000">请联系我们: info@hkgepitherapeutics.com</div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
