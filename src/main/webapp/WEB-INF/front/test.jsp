<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div>
    <input type="radio" class="radio" name="progress" value="five" id="five">
    <label for="five" class="label">5%</label>

    <input type="radio" class="radio" name="progress" value="twentyfive" id="twentyfive" checked>
    <label for="twentyfive" class="label">25%</label>

    <input type="radio" class="radio" name="progress" value="fifty" id="fifty">
    <label for="fifty" class="label">50%</label>

    <input type="radio" class="radio" name="progress" value="seventyfive" id="seventyfive">
    <label for="seventyfive" class="label">75%</label>

    <input type="radio" class="radio" name="progress" value="onehundred" id="onehundred">
    <label for="onehundred" class="label">100%</label>

    <div class="progress">
      <div class="progress-bar"></div>
    </div>
    </div>
  </body>
</html>
