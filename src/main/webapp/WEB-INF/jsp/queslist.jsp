<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>Product list</title>

</head>
<body>
	<div style="width: 100%;height: 100%;">
		<jsp:include page="header.jsp"></jsp:include>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto">
			<div style="width: 95%;height: auto;margin: 0 auto;">
				<a href="lifestyle/index.jhtml"><img src="static/images/iQ1.png" style="width: 100%;height: auto;"></a>
			</div>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto">
			<div style="width: 95%;height: auto;margin: 0 auto;">
				<a href="mood/index.jhtml"><img src="static/images/iQ2.png" style="width: 100%;height: auto;"></a>
			</div>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto">
			<div style="width: 95%;height: auto;margin: 0 auto;">
				<a href="pain/index.jhtml"><img src="static/images/iQ3.png" style="width: 100%;height: auto;"></a>
			</div>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto">
			<div style="width: 95%;height: auto;margin: 0 auto;">
				<a href="sleep/index.jhtml"><img src="static/images/iQ4.png" style="width: 100%;height: auto;"></a>
			</div>
		</div>
	</div>
</body>
</html>
