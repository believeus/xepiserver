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
	<title>Why should I enter my life style data?</title>
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
					<div id="dot" >EpiAging tests make sense only within a dynamic life-long life style, environmental and health management system.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">A personalized evaluation including intervention will be generated based on the health and lifestyle information you provided.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">Update your health and lifestyle parameters periodically to activate the life-long personalized analysis report.</div>
					<div style="width: 100%;height: 20px;"></div>

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
					<div id="dot" >Epiaging test results are continuously analyzed with general health parameters, personal interventions and outcomes of multiple users using state of the art machine learning algorithms.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" >Personalized analysis with some possible routes for improvement.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" >Data in our data base in blinded with respect to personal identity.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" >No access is allowed to your personal information by any one who has access to your health and life style data.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" >Only general conclusions based on a population wide summary will be shared.</div>
					<div style="width: 100%;height: 20px;"></div>
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
					<div id="dot" >Once you download the App you will be assigned an ID that will allow you to retrieve your data and receive health reports, but your identity will remain unknown either on the app or the "cloud" analysis data base.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">Once you receive a saliva kit you scan the bar code with your Mobile. the test ID is now linked with your blind ID.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">Your personal information and assigned ID will be stored in a fire clouded separate server and will not be accessible to the "data base" server. This information will be used to send you kits, restore your assigned ID if you lose it and for personal requests that you might have. For example, a request for erasure of your blinded and personal data. </div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">Access to personal information will be tokenized and protected from being linked to the blinded health data.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">The team analyzing your health data will have no permission to access the blinded health data.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">Your health data will serve for generating general neiral networks and deriving general models based on many blinded users.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">Your personal data will never be shared with any other company. </div>
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
