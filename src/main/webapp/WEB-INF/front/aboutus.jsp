<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
	<base href="<%=basePath%>">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta charset="UTF-8">
		<title>About us</title>
	
<style>
			div[id=dot]:before{
				content:"▋";
				color: #113965;;
				font-size: 0.3rem;
				margin-right: 3px;
			}
		</style>
	</head>
	<body style="padding:0px;margin: 0px;">
		<div style="width: 100%;height: 100%;">
			<jsp:include page="header.jsp"></jsp:include>
			<div style="width: 100%;height: auto;">
			<div style="width: 96%;height: auto;margin: 0 auto;overflow: hidden;">
				<div id="dot" style="width: 100%;color: #0071BC;line-height: 50px; font-weight: 700;">
					Company Introduction
				</div>
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="company/index.jhtml"><img src="static/images/au-1.png"style="width: 100%;height: auto;"/></a></div>
			</div>
			</div>
			<div style="width: 100%;height: 10px;background-color: #F0F0F0;"></div>
			
			<div style="width: 100%;height: auto;">
			<div style="width: 96%;height: auto;margin: 0 auto;overflow: hidden;">
				<div id="dot" style="width: 100%;color: #0071BC;line-height: 50px; font-weight: 700;">
					Science Team
				</div>
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="scienceteam/index.jhtml"><img src="static/images/au-2.png"style="width: 100%;height: auto;"/></a></div>
			</div>
			</div>
			<div style="width: 100%;height: 10px;background-color: #F0F0F0;"></div>
			
			<div style="width: 100%;height: auto;">
			<div style="width: 96%;height: auto;margin: 0 auto;overflow: hidden;">
				<div id="dot" style="width: 100%;color: #0071BC;line-height: 50px; font-weight: 700;">
					DNA Methylation
				</div>
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="methylation/index.jhtml"><img src="static/images/au-3.png"style="width: 100%;height: auto;"/></a></div>
			</div>
			</div>
			
			<div style="width: 100%;height: auto;">
			<div style="width: 96%;height: auto;margin: 0 auto;overflow: hidden;">
				<div id="dot" style="width: 100%;color: #0071BC;line-height: 50px; font-weight: 700;">
					Customer Data Consent Form
				</div>
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="concent/index.jhtml"><img src="/static/images/company5.png"style="width: 100%;height: auto;"/></a></div>
			</div>
			</div>
			<div style="width: 100%;height: 10px;background-color: #F0F0F0;"></div>
			
			<div style="width: 100%;height: auto;">
			<div style="width: 96%;height: auto;margin: 0 auto;overflow: hidden;">
				<div id="dot" style="width: 100%;color: #0071BC;line-height: 50px; font-weight: 700;">
					Biological Age Detection
				</div>
				<div style="width: 100%;height: auto;line-height: 50px;"><a href="bioage/index.jhtml"><img src="static/images/company6.png"style="width: 100%;height: auto;"/></a></div>
			</div>
			</div>
			<div style="width: 100%;height: 10px;background-color: #F0F0F0;"></div>
			<div style="width: 100%;height: 60px;"></div>
				<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
					<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;">
						@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
					</div>
		</div>
	</body>
</html>
