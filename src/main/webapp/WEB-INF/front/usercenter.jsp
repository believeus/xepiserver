<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <title>User Center</title>
</head>
<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: auto;">
    <jsp:include page="header.jsp"></jsp:include>
    <div style="width: 100%;height: auto;background-color: #0071BC;overflow: hidden;">
        <div style="height: 20px;width: 100%;"></div>
        <div style="width: 100%;height: 70px;">
            <div style="width: 40%;height: 70px;float: left;"></div>
            <div style="width: 16%;height: 70px;float: left;">
                <img src="static/images/user-logo.png" alt="" style="width: 100%;height: auto">
            </div>
            <div style="width: 44%;height: 70px;float: left;"></div>
        </div>
        <div style="width: 100%;height: auto;text-align: center;">
           <%-- <div style="width: 8%;height: 50px;float: left;"></div>--%>
            <c:choose>
                <c:when test="${sessionuser==null}">
                    <div style="width: 100%;height: auto;margin: 20px 0 0 20px;color:#ffffff">
                        <a href="login.jhtml" style="font-size: 18px;font-weight: bold;color: white;">login</a>
                        <span>&nbsp;|&nbsp;</span>
                        <a style="font-size: 18px;font-weight: bold;color: white;">register</a></div>
                </c:when>
                <c:otherwise>
                    <div style="width: 100%;height: auto;color:#ffffff;font-size: 18px;color: white">USER
                        ID:${sessionuser.uuid}</div>
                </c:otherwise>
            </c:choose>


        </div>
        <div style="width: 100%;height: 50px;"></div>
    </div>
    <div style="width: 100%;height: 10px;background-color: #F4F4F4;"></div>
    <div style="width: 100%;height: auto;">
        <div style="width: 80%;height: auto;margin: 0 auto;background-color: #FFFFFF;color: #000000;overflow: hidden;">
            <div style="width: 100%;height: 92px;margin: 0 auto;border-bottom: 1px solid #E0E0E0;">
                <div style="width: 12%;height: 60px;float: left; margin-top: 26px;">
                    <img src="static/images/userlogo/uc8.png"
                         style="width: 100%;height: auto;">
                </div>
                <div style="width: 70%;height: 92px;float: left;text-align: left;margin-left: 20px;">
                    <div style="width: 100%;height: 92px;font-weight: 600;line-height: 93px">
                        <a href="#" style="text-decoration: none">User Information </a>

                    </div>
                </div>
                <div style="width: 8%;height: 92px;float: left;text-align: left;line-height: 92px">
                    &gt;
                </div>
            </div>
            <div style="width: 100%;height: 92px;margin: 0 auto;border-bottom: 1px solid #E0E0E0;">
                <div style="width: 12%;height: 60px;float: left;margin-top: 26px;">
                    <img src="static/images/userlogo/uc3.png"
                         style="width: 100%;height: auto; display:inline-block;vertical-align:middle;">
                </div>
                <div style="width: 70%;height: 92px;float: left;text-align: left;margin-left: 20px;">
                    <div style="width: 100%;height: 92px;font-weight: 600;line-height: 93px">
                        <a href="queslist/index.jhtml" style="text-decoration: none"> Questionnaire</a>
                    </div>
                </div>
                <div style="width: 8%;height: 92px;float: left;text-align: left;line-height: 92px">
                    &gt;
                </div>
            </div>
            <div style="width: 100%;height: 92px;margin: 0 auto;border-bottom: 1px solid #E0E0E0;">
                <div style="width: 12%;height: 60px;float: left;    margin-top: 26px;">
                    <img src="static/images/userlogo/uc4.png"
                         style="width: 100%;height: auto;">
                </div>
                <div style="width: 70%;height: 92px;float: left;text-align: left;margin-left: 20px;">
                    <div style="width: 100%;height: 92px;font-weight: 600;line-height: 93px">
                        <a href="user/bioreport/index.jhtml" style="text-decoration: none">My Report </a>
                    </div>
                </div>
                <div style="width: 8%;height: 92px;float: left;text-align: left;line-height: 92px">
                    &gt;
                </div>
            </div>
            <div style="width: 100%;height: 92px;margin: 0 auto;border-bottom: 1px solid #E0E0E0;">
                <div style="width: 12%;height: 60px;float: left;    margin-top: 26px;">
                    <img src="static/images/userlogo/uc5.png"
                         style="width: 100%;height: auto;">
                </div>
                <div style="width: 70%;height: 92px;float: left;text-align: left;margin-left: 20px;">
                    <div style="width: 100%;height: 92px;font-weight: 600;line-height: 93px">
                        <a href="user/taskrecord/index.jhtml" style="text-decoration: none">Order
                            Record </a>
                    </div>
                </div>
                <div style="width: 8%;height: 92px;float: left;text-align: left;line-height: 92px">
                    &gt;
                </div>
            </div>
            <div style="width: 100%;height: 92px;margin: 0 auto;border-bottom: 1px solid #E0E0E0;">
                <div style="width: 12%;height: 60px;float: left;    margin-top: 26px;">
                    <img src="static/images/userlogo/uc1.png"
                         style="width: 100%;height: auto;">
                </div>
                <div style="width: 70%;height: 92px;float: left;text-align: left;margin-left: 20px;">
                    <div style="width: 100%;height: 92px;font-weight: 600;line-height: 93px">
                        <a href="faqlist/index.jhtml" style="text-decoration: none"> Q&A</a>
                    </div>
                </div>
                <div style="width: 8%;height: 92px;float: left;text-align: left;line-height: 92px">
                    &gt;
                </div>
            </div>
            <div style="width: 100%;height: 92px;margin: 0 auto;border-bottom: 1px solid #E0E0E0;">
                <div style="width: 12%;height: 60px;float: left;    margin-top: 26px;">
                    <img src="static/images/userlogo/uc6.png"
                         style="width: 100%;height: auto;">
                </div>
                <div style="width: 70%;height: 92px;float: left;text-align: left;margin-left: 20px;">
                    <div style="width: 100%;height: 92px;font-weight: 600;line-height: 93px">
                        <a href="contact/index.jhtml" style="text-decoration: none"> Contact Us </a>
                    </div>
                </div>
                <div style="width: 8%;height: 92px;float: left;text-align: left;line-height: 92px">
                    &gt;
                </div>
            </div>
            <div style="width: 100%;height: 92px;margin: 0 auto;border-bottom: 1px solid #E0E0E0;">
                <div style="width: 12%;height: 92px;float: left;margin-top: 26px;">
                    <img src="static/images/userlogo/uc7.png"
                         style="width: 100%;height: auto; display:inline-block;vertical-align:middle;">
                </div>
                <div style="width: 70%;height: 92px;float: left;text-align: left;margin-left: 20px;">
                    <div style="width: 100%;height: 92px;font-weight: 600;line-height: 93px">
                        <a href="user/logout.jhtml" style="text-decoration: none"> Log Out</a>
                    </div>
                </div>
                <div style="width: 8%;height: 92px;float: left;text-align: left;line-height: 92px">
                    &gt;
                </div>
            </div>

        </div>
    </div>
    <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
        <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 55px;">
            @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
        </div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
