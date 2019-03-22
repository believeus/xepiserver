<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Healthtech_O2O_Summit_Dr_Moshe_Szyf_HKG_Epitherapeutics</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="padding: 0px;margin: 0px;">
  <dir style="width: 100%;height: auto;">
  <jsp:include page="header.jsp"/>
    <div style="width: 100%;height: 200px">
			<div style=" margin: 0 auto;width: 95%;height: 100%;">
				<video id="my-video" class="video-js" controls preload="auto" style="width: 100%;height: 100%;" poster="static/images/ted.png" data-setup="{}">
					<source src="https://app.beijingepidial.com/Moshe_Szyf_Behavioral_Epigenetics.mp4" type="video/mp4"/>
				</video>
			</div>
		</div>
	 </dir>
  </body>
</html>
