<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title>Data Security</title>
	</head>
	<style>
			div[id=dot]:before{
				content:"●";
				color: #207EBF;;
				font-size: 0.3rem;
				margin-right: 8px;
			}
		</style>
	<body style="padding: 0px;margin: 0px;">
		<div style="width: 100%;height: 100%;">
		<jsp:include page="header.jsp"></jsp:include>
			<div style="width: 100%;height: auto;background-color: #F6F8F9;">
			<div style="width: 96%;height: auto;margin: 0 auto; overflow: hidden;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;">
					<div style="width: 70%;height: auto;float: left;font-weight: 700;font-family: arial;font-size:18px;">Importance of filling out questionnaires</div>
					<div style="width: 25%;height: auto;float: left;"><img src="static/images/ques1.png"style="width: 100%;height:auto ;"/></div>
					<div style="width: 100%;height: 30px;"></div>
					<div style="width: 100%;height: auto;color: #666666;">
						<div id="dot" >Our strict standards guarantee high quality service.</div>
						<div style="width: 100%;height: 20px;"></div>
						<div id="dot" style="width: 100%;height: auto;">The leading illmina chip analysis platform guarantees your DNA results.</div>
						<div style="width: 100%;height: 20px;"></div>
						<div id="dot" style="width: 100%;height: auto;">Authoritative scientists and medical experts use rigorous procedures to prepare these report.</div>
						<div style="width: 100%;height: 20px;"></div>
						<div id="dot" style="width: 100%;height: auto;">Your personalized report is based on sound scientific research.</div>
					</div>
				</div>
			</div>
			</div>
			<div style="width: 100%;height: 100%;">
			<div style="width: 96%;height: auto;margin: 0 auto;overflow: hidden;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;">
				<div style="width: 25%;height: auto;float: left;"><img src="static/images/ques2.png"style="width: 100%;height:auto ;"/></div>
					<div style="width: 70%;height: 116px;float: left;font-weight: 700; font-family: arial;font-size:18px;">
					<div style="width: 90%; height: 60px;margin: 18px auto; ">
					How do we conduct data analysis
					</div>
					</div>
					
					<div style="width: 100%;height: 30px;"></div>
					<div style="width: 100%;height: auto;color: #666666;">
						<div id="dot" >All saliva samples are processed in the laboratory, in accordance with local regulations.</div>
						<div style="width: 100%;height: 20px;"></div>
						<div id="dot" >Genotyping is a mature and reliable platform for DNA analysis.</div>
						<div style="width: 100%;height: 20px;"></div>
						<div id="dot" >Our scientists and medical experts use rigorous procedures to prepare these reports. Your personalized reports are based on sound scientific research.</div>
					</div>
				</div>
			</div>
			</div>
			<div style="width: 100%;height: 100%;">
			<div style="width: 96%;height: auto;margin: 0 auto;overflow: hidden;background-color: #F6F8F9;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;">
					<div style="width: 70%;height: auto;float: left;font-weight: 700;font-family: arial;font-size:18px;">How do we ensure that information is confidential</div>
					<div style="width: 25%;height: auto;float: left;"><img src="static/images/ques3.png"style="width: 100%;height:auto ;"/></div>
					<div style="width: 100%;height: 30px;"></div>
					<div style="width: 100%;height: auto;color: #666666;">
						<div id="dot" >We have a perfect data privacy and security management system</div>
						<div style="width: 100%;height: 20px;"></div>
						<div id="dot" style="width: 100%;height: auto;">Without your explicit consent, we will not share any of your personal data.</div>
						<div style="width: 100%;height: 20px;"></div>
						<div id="dot" style="width: 100%;height: auto;">We will not provide your information or results to employers or health insurance companies.</div>
						<div style="width: 100%;height: 20px;"></div>
						<div id="dot" style="width: 100%;height: auto;">Unless we are required to comply with valid tickets or court orders, we will not provide information to law enforcement agencies.</div>
					</div>
				</div>
			</div>
			</div>
			<div style="width: 100%;height: 100%;">
			<div style="width: 96%;margin: 0 auto;height: auto;overflow: hidden;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;">
				<div style="width: 25%;height: auto;float: left;"><img src="static/images/ques4.png"style="width: 100%;height: ;"/></div>
					<div style="width: 70%;height: 116px;float: left;font-weight: 700;font-size:18px; font-family: arial;">
						<div style="width: 90%; height: 60px;margin: 18px auto; ">
					How do we ensure that information is confidential
						</div>
					</div>
					
					<div style="width: 100%;height: 30px;"></div>
					<div style="width: 100%;height: auto;color: #666666;">
						<div id="dot" >When you are not logged into the system, your health information and personal user information will be in a 'separate' state, and no one can find your related information.</div>
						<div style="width: 100%;height: 20px;"></div>
						<div id="dot"> Only by scanning the code on your mobile phone can the health information in the "separate" state be changed into the "hosted" state, and the data in the "hosted" state be monitored by the system.</div>
						<div style="width: 100%;height: 20px;"></div>
						<div id="dot"> Information is in the "hosted" state. If you do not modify data through your mobile phone, your health data will become "locked" and automatically become "separate". At this time, the system will send a "unlock code" to let you confirm that your authorized authentication is a third-party mobile phone that can modify personal health information data.</div>
					</div>
				</div>
			</div>
			</div>
			<div style="width: 100%;height: 60px;"></div>
				<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
					<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;">
						@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
					</div>
				</div>
		</div>
	</body>
</html>
