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
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>Successful Payment</title>
</head>
<body style="padding: 0px;margin: 0px;">
<div style="width: 100%;height: auto;overflow: hidden;">
	<jsp:include page="header.jsp"></jsp:include>
	<div style="width: 100%;height: 72px;"></div>
	<div style="width: 100%;height: auto;">
		<div style="width: 40%;height: 100px;float: left;"></div>
		<div style="width: 20%;height: 100px;float: left;">
			<img src="static/images/success-2.png"style="width: 100%;height: auto;"/>
		</div>
		<div style="width: 30%;height: 100px;float: left;"></div>
	</div>
	<div style="width: 100%;height: 300px;overflow: hidden;">
		<div style="width: 100%;height: 87px;text-align: center;line-height: 40px;font-weight: bold;font-family: arial;font-size: 20px;color: #0071BC;font-family: arial;"> Payment successful</div>

		<div style="width: 100%;height: 40px;">
			<a href="index.jhtml">
				<div style="width: 50%;height: 40px;border-radius: 10px;border: 1px solid grey;margin: 0 auto;text-align: center;line-height: 40px;font-size:16px ;background-color: #0071BC;font-family: arial;color: #FFFFFF;">Done</div>
			</a>
		</div>
	</div>

	<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
		<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;">
			@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
		</div>
	</div>
</div>
</body>
</html>
