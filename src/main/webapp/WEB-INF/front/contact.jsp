<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title>Contact Us</title>
	</head>
	<body style="padding: 0;margin: 0;">
		<div style="width: 100%;height: auto;overflow: hidden;">
		<jsp:include page="header.jsp"/>
			<div style="width: 100%;height: 100px;"></div>
			<div style="width: 100%;height: 136px;">
				<div style="width: 37%;height: 100px;float: left;"></div>
				<div style="width: 22%;height: 100px;float: left;">
					<img src="static/images/CallCenter.png"style="width: 100%;height: auto;"/>
				</div>
				<div style="width: 30%;height: 100px;float: left;"></div>
			</div>
			<div style="width: 100%;height: 400px;overflow: hidden;">
				<div style="width: 100%;height: 40px;text-align: center;line-height: 40px;font-family: arial;font-size: 18px;color: #666666;">(+852) 2354 8297</div>
				<div style="width: 100%;height: 40px;text-align: center;line-height: 40px;color: #666666;">
					<p> <i>info@hkgepitherapeutics.com</i></p>
					<p> https://www.hkgepitherapeutics.com</p>
					<p>HKG epitherapeutics Limited Unit 613, Biotech Centre 2,Hong Kong Science Park,Sha Tin,N.T.,Hong Kong</p>
				</div>
			</div>
		</div>
	</body>
</html>
