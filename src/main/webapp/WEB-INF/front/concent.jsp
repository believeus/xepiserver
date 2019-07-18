<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>Concent Form</title>
</head>
<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: auto;">
	<jsp:include page="header.jsp"></jsp:include>
	<div style="width: 96%;height: auto;margin: 0 auto;overflow: hidden;">

		<!-- <div id="language" style="width: 100%;height: 20px;overflow: hidden;margin-top: 20px;">
            <div style="width: 20%;height: 20px;text-align: center; border-right:1px solid  #000000 ;float: left;">Chinese</div>
            <div style="width: 20%;height: 20px;text-align: center; float: left;">English</div>
        </div> -->
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: 40px;">
			<div style="width: 100%;height: 40px;margin: 0 auto;border-radius: 50px;background-color: #0071BC;color: #FFFFFF;line-height: 40px; font-family: arial;text-align: center; font-size: 16px;">HKG epitherapeutics Customer Data Consent</div>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 96%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px; color: #0071BC;">Dear Users</div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px;color: #666666;">Welcome to <i>HKG epi THERAPEUTICS Ltd.</i>  Before registering, please read the following terms of service carefully.</div>
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px;color: #0071BC;">About <i>EPIAGING APP</i></div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px; color: #666666;"><i> EPIAGING APP</i> is  about to save your "blinded" personal medical data on the EpiAging Mobile App and the data analysis engine in the "cloud", which requires your information and consent. Your identity is blinded and you will be provided with an ID number. Your
				personal identity will not be stored in the mobile app or the server. Once you download the app you will be assigned an ID that will allow you to retrieve your data and receive <i>health reports</i>, but your identity will remain unknown either on the app or the "<i>cloud</i>" analysis engine.</div>
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px;color: #0071BC;"><i>EPIAGING APP</i> Purpose</div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px; color: #666666;"><i> EPIAGING APP</i> designed to help you to harness the power of your epigenome for healthy aging by providing you with a DNA methylation-based assessment of your true biological age and by providing you links and recommendations of reputable national
				medical societies on life style changes that can improve your health. It is your decision what changes to make.However, we are asking you to share with us “<i> anonymously</i>” the changes that you have made using the simple entry buttons in the app, these data will be streamed to a machine learning engine that will analyze your life style changes and provide you with
				a periodical report. Testing your biological age periodically using our <i> DNA methylation test</i> will help you assess progress. We ask you to share the changes that you have made with others and thus become a partner in a joint effort to improve your and other people health.</div>
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px;color: #0071BC;">How to enrich <i>health data</i></div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px; color: #666666;"> You are not obligated to answer the questions on this app and it is your decision what information to provide. Similarly, it is your decision to make or avoid life style changes and to attend or ignore the recommendations of the different medical associations
				that we are providing you with. However, the richer the data, the better and more helpful the analysis will be to you and others in the "epiaging app community". By analyzing data streaming from many other app users with “machine learning”, we will derive combinations of life style
				alterations that may have a positive impact on reducing the speed of aging.</div>
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px;color: #0071BC;">Anonymous data sharing</div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px; color: #666666;">We believe that good health requires partnership of many people sharing their experiences and learning from each other rather than a unidirectional flow of instructions from the “learned” health provider to the “patient”. We know that medical science
				is imperfect, and its progress involves trial and error.We will learn together as “partners” by sharing experiences, assessing progress and using the best of machine learning technology to analyze the data that you provide and get feedbacks
				that will guide further improvement. By learning from many people that will be engaged as you are, we will be able to work together on improving our and other people health. We understand that it is a strict requirement that your data remains
				absolutely "blinded" and that your personal identity remains anonymous. Only if these rules of anonymity are strictly adhered to, we will be able to freely participate in this grand partnership.</div>
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px;color: #0071BC;">Data security</div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px; color: #666666;">In accordance with the Data Protection Regulations with regards to data protection, you have the right to request access to and rectification or erasure of your personal data or restriction of processing concerning your data or to object
				to processing as well as the right to data portability. You can exercise this right by contacting (info@hkgepitherapeutics.com).Your name and identity will be encrypted and firewalled. Following your signature you will receive a blinded ID that will allow you to provide data and remain anonymous to the system.</div>
			<div style="width: 100%;height: 10px;"></div>

		</div>
		<div style="width: 100%;height: 30px"></div>
		<c:if test="${sessionuser==null}">
			<div style="width: 50%;margin: 0 auto; height: 40px;">
				<a href="register.jhtml"><div style="width: 50%;height: 40px;border-radius: 10px;border: 1px solid grey;margin: 0 auto;text-align: center;line-height: 40px;font-size:18px ;background-color: #0071BC;font-family: arial;color: #FFFFFF;">Agree</div></a>
			</div>
		</c:if>

	</div>

	<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
		<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
			@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
		</div>
	</div>
	<jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
