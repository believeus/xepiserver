<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/5
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<base href="<%=basePath%>">
<head>
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
    <title>Title</title>
    <script src="static/js/jquery-2.1.0.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="width: 100%;height: 667px;">
    <a onclick="show()">Loading</a>
    <div id="popDiv"
         style="z-index: 99; display: none;width: 100%;height: 100%; position: absolute;top:0;left: 0; background-color: #efefef;text-align: center;">
        <img src="static/images/loading.gif" style="width: 80px;height: 80px;margin-top: 50%"/>
    </div>
</div>
</body>
<script>
    function show() {
        var pop = document.getElementById("popDiv");

        if (pop.style.display == "block"){
            pop.style.display = "none";
        }else
            pop.style.display = "block";
    }
</script>
</html>
