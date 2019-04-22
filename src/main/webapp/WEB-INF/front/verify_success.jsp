<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/19
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>Success</title>
</head>
</head>
<body style="margin: 0;padding: 0">
    <div style="width: 100%;">
        <div style="width:100%;height: 300px;border:1px solid #000"></div>
        <div style="width:100%;height: 400px;border:1px solid #000;display:flex">
            <div style="width: 30%;height: 100%;border: 1px solid #000;float: left"></div>
            <div style="width: 40%;height: 100%;border: 1px solid #000;float: left">
                <div style="width: 100%;height: 40%;border:1px solid #000;text-align: center">
                    <img src="static/images/success.png" style="width: 20%;height: auto"/>
                </div>
                <div style="width: 100%;height: 40%;border:1px solid #000;text-align: center">
                    <h1>Welcome to HKG</h1>
                    Verify success
                </div>

            </div>
            <div style="width: 30%;height: 100%;border: 1px solid #000;float: left"></div>
        </div>

    </div>
</body>
</html>
