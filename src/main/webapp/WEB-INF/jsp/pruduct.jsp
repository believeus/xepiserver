<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta content="" name="description">
<meta content="" name="keywords">
<title>Health Market</title>
</head>
<body style="padding: 0px;margin: 0px;">
	<div style="width:100%;height: auto">
		<div style="width: 100%;height: 20px;"></div>
		<div style="margin: 0 auto;width: 95%;height: auto;">
			<a href="product/aging.jhtml"><img src="static/images/ic10.png"style="width: 100%;height: auto" /></a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="margin: 0 auto;width: 95%;height: auto;">
			<a href="product/aging.jhtml"><img src="static/images/ic11.png"style="width: 100%;height: auto" /></a>
		</div>
	</div>


</body>
</html>
