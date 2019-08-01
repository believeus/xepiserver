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
	<title>为什么要输入我的生活方式数据？</title>
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
				<div style="width: 70%;height: auto;float: left;font-weight: 700;font-family: arial;font-size:18px;">填写调查表的重要性</div>
				<div style="width: 25%;height: auto;float: left;"><img src="static/images/ques1.png"style="width: 100%;height:auto ;"/></div>
				<div style="width: 100%;height: 30px;"></div>
				<div style="width: 100%;height: auto;color: #666666;">
					<div id="dot" >生物学年龄检测只有在一个动态的终身生活方式、环境和健康管理系统中才有意义。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">根据您提供的健康和生活方式信息，将生成包括干预在内的个性化评估。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">定期更新您的健康和生活方式参数，以激活终身个性化分析报告。</div>
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
						我们如何进行数据分析
					</div>
				</div>

				<div style="width: 100%;height: 30px;"></div>
				<div style="width: 100%;height: auto;color: #666666;">
					<div id="dot" >我们使用最先进的机器学习算法，通过一般健康参数、个人干预和多个用户的结果持续分析生物学年龄检测结果。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" >个性化分析，并提供一些可能的改进途径。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" >我们数据库中的数据在个人身份方面是盲目的。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" >任何有权访问您的健康和生活方式数据的人都不允许访问您的个人信息。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" >只有基于全人口概况的一般统计才会被分享。</div>
					<div style="width: 100%;height: 20px;"></div>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 100%;height: 100%;">
		<div style="width: 96%;height: auto;margin: 0 auto;overflow: hidden;background-color: #F6F8F9;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;">
				<div style="width: 70%;height: auto;float: left;font-weight: 700;font-family: arial;font-size:18px;">我们如何确保信息保密</div>
				<div style="width: 25%;height: auto;float: left;"><img src="static/images/ques3.png"style="width: 100%;height:auto ;"/></div>
				<div style="width: 100%;height: 30px;"></div>
				<div style="width: 100%;height: auto;color: #666666;">
					<div id="dot" >下载应用程序后，将为您分配一个ID，该ID允许您检索数据并接收健康报告，但您的身份将在应用程序或“云”分析数据库中保持未知。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">一旦你收到唾液试剂盒，你就用手机扫描条形码。测试ID现在与您的盲法ID链接。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">您的个人信息和分配的ID将存储在一个独立的云防火墙服务器中，“数据库”服务器将无法访问。此信息将用于向您发送工具包、在丢失时恢复分配的ID以及您可能有的个人请求。例如，请求删除您的盲数据和个人数据。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">对个人信息的访问将被标记化，并防止被链接到盲的健康数据。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">分析您的健康数据的团队将无权访问盲健康数据。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">您的健康数据将用于生成通用的内部网络，并基于许多盲用户派生通用模型。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="dot" style="width: 100%;height: auto;">您的个人数据将永远不会与任何其他公司共享。 </div>
				</div>
			</div>
		</div>
	</div>

	<div style="width: 100%;height: 60px;"></div>
	<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
		<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px">
			@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
		</div>
	</div>
	<jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
