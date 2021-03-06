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
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>公司介绍</title>

	</head>
	<body style="padding: 0px;margin: 0px;">
		<div id="container"style="width: 100%;height: 100%;">
		<jsp:include page="header.jsp"></jsp:include>
			<div id="company"style="width: 100%;height: auto;">
				<img src="static/images/company4.jpg"style="width: 100%;height: auto;"/>
			</div>
			<%--<div id="intro"style="width: 100%;height: auto;">--%>
				<%--<div style="width: 100%;height: 20px;"></div>--%>
				<%--<div style="width: 96%;height: auto;margin: 0 auto;font-size: 16px;font-family: arial;color: #666666;line-height: 24px;">--%>
					<%--<div style="width: 100%;height: auto;">--%>
						<%--Hong Kong Precision Medicine is a professional engaged in epigenetic diagnosis and research and development of new advanced technology enterprise.</div>--%>
					<%--<div style="width: 100%;height: 20px;"></div>--%>
					<%--<div style="width: 100%;height: auto;">--%>
						<%--Company focused on tumor, biological age assessment, a variety of diseases such as autoimmune diseases, mental illness, the methylation of the development of diagnostic technology, has successfully developed for a wide variety of tumor methylation diagnostic technology,--%>
						 <%--not only can effectively diagnose tumorigenesis in super early stage, can also be staging diagnosis of tumor and evaluate the efficacy of treatment, auxiliary pathological diagnosis.--%>
						<%--In addition, the company also in methylation diagnosis technology on the basis of the screening of drug targets and development related to cancer, disease effective drug treatment</div>--%>
				<%--</div>--%>
				<%--<div style="width: 100%;height: 20px;"></div>--%>
			<%--</div>--%>
			<div style="width: 96%;height: auto;margin: 0 auto;"><hr /></div>
			<div id="tech-list"style="width: 100%;height: auto;">
				<div class="cancer" style="width: 100%;height: auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 96%;height: 150px;margin: 0 auto;">
						<div style="width: 100%;height: 93px;margin: 0 auto;">
							<div style="width: 63%;height: 93px;float: left;font-size: 14px;color:#666666;line-height: 24px;font-weight: 600; font-family: arial; ">
								我们正在开发新一代DNA甲基化生物标记物，用于早期癌症检测和管理健康衰老。
							</div>
							<div style="width: 36%;height: auto;float: left;">
								<img src="static/images/company1.jpg"style="width: 100%;height: auto;"/>
							</div>
						</div>
						<%----%>
						<%--<div style="width: 100%;height: 280px;font-family: arial;font-size: 16px; color: #666666;margin-top: 30px;line-height: 24px;">--%>
							<%--By accurately detecting DNA methylation in human peripheral blood cells, we can efficiently assess and accurately predict the risk of ultra-early cancer, and accurately assess the occurrence, progression and therapeutic intervention effect of cancer.--%>
						<%--</div>--%>
					</div>
					<div style="width: 96%;height: auto;margin: 0 auto;"><hr /></div>
				</div>
				<div class="bio" style="width: 100%;height: auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 96%;height: 150px;margin: 0 auto;">
						<div style="width: 100%;height: 93px;">
							<div style="width: 63%;height: 93px;float: left;font-size: 14px;color:#666666;line-height: 24px;font-weight: 600; font-family: arial; ">
								我们致力于建设一个全新的健康生态系统，以指导健康生活的个性化管理。
							</div>
							<div style="width: 36%;height: auto;float: left;">
								<img src="static/images/company2.jpg"style="width: 100%;height: auto;"/>
							</div>
						</div>
						<%--<div style="width: 100%;height: 151px;font-family: arial;font-size: 16px;color: #666666;margin-top: 30px;line-height: 24px;">--%>
							<%--<a>The biological age of human body was accurately calculated by detecting highly correlated methylation sites of biological age of human body</a>--%>
						<%--</div>--%>
					</div>
					<div style="width: 96%;height: auto;margin: 0 auto;"><hr /></div>
				</div>
				<div class="dhea" style="width: 100%;height: auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 96%;height: 150px;margin: 0 auto;">
						<div style="width: 100%;height: 93px;">
							<div style="width: 63%;height: 93px;float: left;font-size: 14px;color:#666666;line-height: 24px;font-weight: 600; font-family: arial; ">
								我们相信，在IT技术和DNA甲基化检测的帮助下，人们应该能够掌控自己的健康。
							</div>
							<div style="width: 36%;height: auto;float: left;">
								<img src="static/images/company3.jpg"style="width: 100%;height: auto;"/>
							</div>
						</div>
						<%--<div style="width: 100%;height: 181px;font-family: arial;font-size: 16px;color: #666666;margin-top: 30px;line-height: 24px;">--%>
							<%--Cooperating with Beijing Gaoxin hospital dehydroepiandrosterone (DHEA) additional treatment and its dependence on epigenetic markers addicts of quality of life and social psychological factors experiment.--%>
						<%--</div>--%>
					</div>
					
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
