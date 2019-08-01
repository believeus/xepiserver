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
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px; color: #0071BC;">尊敬的用户</div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px;color: #666666;">欢迎您使用香港精准医学有限公司基因检测服务。在注册试用前，请您仔细阅读以下服务条款。</div>
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px;color: #0071BC;">关于 <i>EPIAGING APP</i></div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px; color: #666666;"><i> EPIAGING APP</i>会帮您在移动端APP及云端数据分析上对您的个人医疗数据保持匿名，并获取您微信小程序上的个人信息(例如头像，性别、称昵等)这需要您的信息及知情同意。 您真实的身份将会被屏蔽，取而代之的是我们将提供一个ID号码给您。因此，您的真实个人身份不会被储存在移动端APP或服务器上。所以，在您下载APP后，您会被授予一个ID号码，并通过这个ID号码来检索您的数据并接收健康报告，而无论是我们的APP还是"云端"数据分析引擎都不会记录您真实的个人身份。</div>
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px;color: #0071BC;"><i>EPIAGING APP</i> 目标</div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px; color: #666666;"><i> EPIAGING APP</i> 旨在帮助您利用表观基因组的力量，为您提供一个基于DNA甲基化的真实生物学年龄评估，并为您提供可改善您的健康的知名国家医学会的生活方式的链接和建议。
您可以决定要做什么更改。但是，我们请求您与我们共享“匿名数据”也就是您使用应用程序中的简单输入按钮所做的更改，这些数据将被流到机器学习引擎，该引擎将分析您的生活方式更改并为您提供定期报告。使用我们的DNA甲基化测试定期测试您的生物年龄将有助于您的健康评估进展。我们请求您与他人分享您所做的改变，从而成为共同努力改善您和他人健康的合作伙伴。</div>
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px;color: #0071BC;">如何丰富健康数据</div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px; color: #666666;"> 您没有义务回答这个应用程序上的问题，您决定提供什么样的信息。同样，我们的应用程序将链接到重要的美国国家医学协会推荐的生活方式行为信息。这些是定期更新的，我们建议您通过定期检查链接来保持更新。
			这些建议是基于“科学”今天所知道的，它们并不完美。随着更多的数据和更多的分析科学正在改进。通过使用“机器学习”分析来自许多其他应用程序用户的数据流，我们将得出生活方式的组合以及对降低衰老速度有积极影响的改变。</div>
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px;color: #0071BC;">匿名数据共享</div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px; color: #666666;">我们将像"伙伴"一样一起学习，并通过分享经验、评估进展以及使用最好的机器学习技术来分析您提供的数据，同时获得指导进一步改进的反馈。通过向许多与您一样参与进来的朋友学习，我们将共同努力改善我们和他人的健康。我们理解对您的数据保持绝对“隐匿”，以及对您的个人身份保持匿名的重要性。也只有在严格遵守这些匿名原则的前提下我们才能够自由地参与这一宏大的合作关系。</div>
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px;line-height: 50px;color: #0071BC;">数据安全</div>
			<div style="width: 100%;height: auto;font-size: 14px;line-height: 22px; color: #666666;">根据《中国数据保护条例》(CDPR)关于数据保护的规定，您有权要求访问、纠正或删除您的个人数据，抑或限制与您的数据有关的处理及数据可移动性。您可以通过联系（info@hkgepitherapeutics.com）行使此权利。您的数据会被加密和防火墙保护。同意接受条款之后，您将收到一个纯粹的ID号码，通过该ID号您可以进行数据录入同时对系统保持匿名。</div>
			<div style="width: 100%;height: 10px;"></div>

		</div>
		<div style="width: 100%;height: 30px"></div>
		<div style="width: 50%;margin: 0 auto; height: 40px;">
			<a href="register.jhtml">
				<div style="width: 50%;height: 40px;border-radius: 10px;border: 1px solid grey;margin: 0 auto;text-align: center;line-height: 40px;font-size:18px ;background-color: #0071BC;font-family: arial;color: #FFFFFF;">同意</div>
			</a>
		</div>
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
