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
    <title>Q&A</title>
</head>
<body>
<div id="container" style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
    <div style="width: 90%;height: auto;margin: 0 auto;clear: both;">
        <div style="margin-top: 50px;">
            <a href="usermanual/index.jhtml" style="text-decoration: none;">
                <h4>1. How does the epiAging test work?</h4>
            </a>
        </div>
        <hr/>
</div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
