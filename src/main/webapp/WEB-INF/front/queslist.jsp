<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <title>queslist</title>

</head>
<body>
<div style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
    <%--<div style="width: 100%;height: 20px;"></div>--%>
    <%--<div style="width: 100%;height: auto">--%>
    <%--<div style="width: 95%;height: auto;margin: 0 auto;">--%>
    <%--<a href="cancer/index.jhtml"><img src="static/images/iQ5.png" style="width: 100%;height: auto;"></a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div style="width: 100%;height: 20px;"></div>--%>
    <%--<div style="width: 100%;height: auto">--%>
    <%--<div style="width: 95%;height: auto;margin: 0 auto;">--%>
    <%--<a href="preventcancer/index.jhtml"><img src="static/images/iQ6.png" style="width: 100%;height: auto;"></a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div style="width: 100%;height: 20px;"></div>--%>
    <%--<div style="width: 100%;height: auto">--%>
    <%--<div style="width: 95%;height: auto;margin: 0 auto;">--%>
    <%--<a href="quantitycancer/index.jhtml"><img src="static/images/iQ7.png" style="width: 100%;height: auto;"></a>--%>
    <%--</div>--%>
    <%--</div>--%>

    <div style="width: 100%;height: 20px;clear: both;"></div>
    <div style="width: 100%;height: auto">
        <div style="width: 95%;height: auto;margin: 0 auto;">
            <a href="/user/lifestyle/index.jhtml"><img src="static/images/iQ1.png"
                                                       style="width: 100%;height: auto;"></a>
        </div>
    </div>
    <div style="width: 100%;height: 20px;"></div>
    <div style="width: 100%;height: auto">
        <div style="width: 95%;height: auto;margin: 0 auto;">
            <a href="/user/mood/index.jhtml"><img src="static/images/iQ2.png" style="width: 100%;height: auto;"></a>
        </div>
    </div>
    <%--<div style="width: 100%;height: 20px;"></div>--%>
    <%--<div style="width: 100%;height: auto">--%>
    <%--<div style="width: 95%;height: auto;margin: 0 auto;">--%>
    <%--<a href="pain/index.jhtml"><img src="static/images/iQ3.png" style="width: 100%;height: auto;"></a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <div style="width: 100%;height: 20px;"></div>
    <div style="width: 100%;height: auto">
        <div style="width: 95%;height: auto;margin: 0 auto;">
            <a href="/user/pian/shortform.jhtml"><img src="static/images/iQ5.png" style="width: 100%;height: auto;"></a>
        </div>
    </div>
    <div style="width: 100%;height: 20px;"></div>
    <div style="width: 100%;height: auto">
        <div style="width: 95%;height: auto;margin: 0 auto;">
            <a href="/user/sleep/index.jhtml"><img src="static/images/iQ4.png" style="width: 100%;height: auto;"></a>
        </div>
    </div>
    <div style="width: 100%;height: 20px;"></div>
    <div style="width: 100%;height: auto">
        <div style="width: 95%;height: auto;margin: 0 auto;">
            <a href="/user/diet/index.jhtml"><img src="static/images/iQ6.png" style="width: 100%;height: auto;"></a>
        </div>
    </div>
    <div style="width: 100%;height: 60px;"></div>
    <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
        <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
            @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
        </div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
