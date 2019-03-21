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
		<title>Company introduction</title>

	</head>
	<body style="padding: 0px;margin: 0px;">
		<div id="container"style="width: 100%;height: 100%;">
		<jsp:include page="header.jsp"></jsp:include>
			<div id="company"style="width: 100%;height: auto;">
				<img src="static/images/company4.jpg"style="width: 100%;height: auto;"/>
			</div>
			<div id="intro"style="width: 100%;height: auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 96%;height: auto;margin: 0 auto;font-size: 16px;font-family: arial;color: #666666;line-height: 24px;">
					<div style="width: 100%;height: auto;">
						Hong Kong Precision Medicine is a professional engaged in epigenetic diagnosis and research and development of new advanced technology enterprise.</div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;">
						Company focused on tumor, biological age assessment, a variety of diseases such as autoimmune diseases, mental illness, the methylation of the development of diagnostic technology, has successfully developed for a wide variety of tumor methylation diagnostic technology,
						 not only can effectively diagnose tumorigenesis in super early stage, can also be staging diagnosis of tumor and evaluate the efficacy of treatment, auxiliary pathological diagnosis.
						In addition, the company also in methylation diagnosis technology on the basis of the screening of drug targets and development related to cancer, disease effective drug treatment</div>
				</div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
			<div style="width: 96%;height: auto;margin: 0 auto;"><hr /></div>
			<div id="tech-list"style="width: 100%;height: auto;">
				<div class="cancer" style="width: 100%;height: auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 96%;height: 277px;margin: 0 auto;">
						<div style="width: 100%;height: 93px;margin: 0 auto;">
							<div style="width: 63%;height: 93px;float: left;font-size: 18px;color: #000000;line-height: 24px;font-weight: 600; font-family: arial; ">
								Accurate diagnosis technology of super early cancer DNA methylation
							</div>
							<div style="width: 36%;height: auto;float: left;">
								<img src="static/images/company1.jpg"style="width: 100%;height: auto;"/>
							</div>
						</div>
						
						<div style="width: 100%;height: 280px;font-family: arial;font-size: 16px; color: #666666;margin-top: 30px;line-height: 24px;">
							By accurately detecting DNA methylation in human peripheral blood cells, we can efficiently assess and accurately predict the risk of ultra-early cancer, and accurately assess the occurrence, progression and therapeutic intervention effect of cancer.
						</div>
					</div>
					<div style="width: 96%;height: auto;margin: 0 auto;"><hr /></div>
				</div>
				<div class="bio" style="width: 100%;height: auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 96%;height: 234px;margin: 0 auto;">
						<div style="width: 100%;height: 93px;">
							<div style="width: 63%;height: 93px;float: left;font-size: 18px;color: #000000;line-height: 24px;font-weight: 600; font-family: arial; ">
								Biological age methylation diagnostic technique
							</div>
							<div style="width: 36%;height: auto;float: left;">
								<img src="static/images/company2.jpg"style="width: 100%;height: auto;"/>
							</div>
						</div>
						<div style="width: 100%;height: 151px;font-family: arial;font-size: 16px;color: #666666;margin-top: 30px;line-height: 24px;">
							The biological age of human body was accurately calculated by detecting highly correlated methylation sites of biological age of human body
						</div>
					</div>
					<div style="width: 96%;height: auto;margin: 0 auto;"><hr /></div>
				</div>
				<div class="dhea" style="width: 100%;height: auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 96%;height: 277px;margin: 0 auto;">
						<div style="width: 100%;height: 93px;">
							<div style="width: 63%;height: 93px;float: left;font-size: 18px;color: #000000;line-height: 34px;font-weight: 600; font-family: arial; ">
								The DHEA auxiliary rehabilitation technology
							</div>
							<div style="width: 36%;height: auto;float: left;">
								<img src="static/images/company3.jpg"style="width: 100%;height: auto;"/>
							</div>
						</div>
						<div style="width: 100%;height: 181px;font-family: arial;font-size: 16px;color: #666666;margin-top: 30px;line-height: 24px;">
							Cooperating with Beijing Gaoxin hospital dehydroepiandrosterone (DHEA) additional treatment and its dependence on epigenetic markers addicts of quality of life and social psychological factors experiment.
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
