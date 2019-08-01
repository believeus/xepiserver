<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta charset="UTF-8">
    <title>测试流程</title>


</head>

<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: 100%;">
    <div style="width: 100%;height: 50px;">
        <jsp:include page="header.jsp"></jsp:include>
    </div>

    <div style="width: 100%;height: auto;">


        <img src="static/images/tp-1.png" style="width: 100%;height: auto;"/>
        <%--<a href="download/EPIAging-apk.jhtml">--%>
        <img src="static/images/tp-2.png" style="width: 100%;height: auto;"/>
        </a>
        <a href="aging/index.jhtml">
            <img src="static/images/tp-3.png" style="width: 100%;height: auto;"/>
        </a>
        <a href="queslist/index.jhtml">
            <img src="static/images/tp-4.png" style="width: 100%;height: auto;"/>
        </a>
        <a href="data/index.jhtml">
            <img src="static/images/tp-5.png" style="width: 100%;height: auto;"/>
        </a>

        <img src="static/images/tp-6.png" style="width: 100%;height: auto;"/>

        <img src="static/images/tp-7.png" style="width: 100%;height: auto;"/>

        <img src="static/images/tp-8.png" style="width: 100%;height: auto;"/>

        <img src="static/images/tp-9.png" style="width: 100%;height: auto;"/>
    </div>
    <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
        <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
            @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
        </div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>

</body>
</html>
