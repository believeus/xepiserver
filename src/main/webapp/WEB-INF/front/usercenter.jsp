<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>User Centre</title>
	</head>
	<body style="padding: 0;margin: 0;">
		<div id="container" style="width: 100%;height: auto;">
			<div style="width: 100%;height: auto;background-color: #0071BC;overflow: hidden;">
				<div style="width: 100%;height: 30px;"></div>
				<div style="width: 100%;height: auto;">
					<div style="width: 8%;height: 100px;float: left;"></div>
					<div style="width: 15%;height: auto;float: left;"><img src="img/bio/bio-6.png"style="width: 100%;height: auto;"/></div>
					<div style="width: 30%;height: auto;float:left;margin: 20px 0 0 20px;">Una</div>
					
				</div>
				<div style="width: 100%;height: 60px;"></div>
			</div>
			<div style="width: 100%;height: 10px;background-color: #F4F4F4;"></div>
			<div style="width: 100%;height: auto;">
				<div style="width: 94%;height: auto;margin: 0 auto;background-color: #FFFFFF;">
					<div style="width: 70%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;line-height: 50px;">User Information</div>
					</div>
					<hr size="1"/>
					
					<div style="width: 70%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;line-height: 50px;">Questionnaire</div>
					</div>
					<hr size="1"/>
					
					<div style="width: 70%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;line-height: 50px;">My Report</div>
					</div>
					<hr size="1"/>
					
					<div style="width: 70%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;line-height: 50px;">Order List</div>
					</div>
					<hr size="1"/>
					
					<div style="width: 70%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;line-height: 50px;">Q&A</div>
					</div>
					<hr size="1"/>
					
					<div style="width: 70%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;line-height: 50px;">Contact Us</div>
					</div>
					<hr size="1"/>
				</div>
			</div>
		</div>
	</body>
</html>
