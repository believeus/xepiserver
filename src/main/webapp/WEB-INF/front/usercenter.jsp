<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>User Center</title>
</head>
<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: auto;">
	<jsp:include page="header.jsp"></jsp:include>
	<div style="width: 100%;height: auto;background-color: #0071BC;overflow: hidden;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;">
			<div style="width: 8%;height: 100px;float: left;"></div>
            <c:choose>
                <c:when test="${sessionuser==null}">
                    <div style="width: 100%;height: auto;margin: 20px 0 0 20px;color:#ffffff">
                        <a href="login.jhtml" style="font-size: 18px;font-weight: bold;color: white;">login</a>
                        <span>&nbsp;|&nbsp;</span>
                        <a style="font-size: 18px;font-weight: bold;color: white;">register</a></div>
                </c:when>
                <c:otherwise>
                    <div style="width: 100%;height: auto;color:#ffffff;font-size: 18px;color: white">USER ID:${sessionuser.uuid}</div>
                </c:otherwise>
            </c:choose>


		</div>
		<div style="width: 100%;height: 60px;"></div>
	</div>
	<div style="width: 100%;height: 10px;background-color: #F4F4F4;"></div>
	<div style="width: 100%;height: auto;">
		<div style="width: 94%;height: auto;margin: 0 auto;background-color: #FFFFFF;">
			<div style="width: 70%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: auto;line-height: 50px;"> User Information</div>
			</div>
			<hr size="1"/>

			<div style="width: 70%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="queslist/index.jhtml"> Questionnaire</a></div>
			</div>
			<hr size="1"/>

			<div style="width: 70%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="user/bioreport/index.jhtml"> My Report</a></div>
			</div>
			<hr size="1"/>

			<div style="width: 70%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="user/taskrecord/index.jhtml">Order Record</a></div>
			</div>
			<hr size="1"/>

			<div style="width: 70%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="illumina/index.jhtml"> Q&A</a></div>
			</div>
			<hr size="1"/>

			<div style="width: 70%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="contact/index.jhtml"> Contact Us</a></div>
			</div>
			<hr size="1"/>

			<div style="width: 70%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="user/logout.jhtml"> Log out</a></div>
			</div>
			<hr size="1"/>
		</div>
	</div>
</div>
</body>
</html>
