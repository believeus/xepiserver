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
		<title>Methylation technology</title>
<!--自适应字体大小-->


</style>
		<style>
			div[id=dot]:before{
				content:"●";
				color: #207EBF;;
				font-size: 0.6rem;
				margin-right: 8px;
			}
		</style>
		
	</head>
	<body style="padding: 0px;margin: 0px;">
		<div id="container"style="width: 100%;height: 100%;">
			<jsp:include page="header.jsp"/>
			<div id="diag"style="width: 100%;height: auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 96%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;font-family: arial;color: #036EB8;">
						 DNA methylation is more effective than previous techniques in early diagnosis of diseases.
					</div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;font-family: arial;color: #666666;line-height: 24px;">
						Disease occurrence is highly correlated with changes in the immune system.
						<p>In the course of the occurrence and development of diseases, the methylation status of some sites on DNA of immune cells in peripheral blood will change significantly. 
						These sites are called highly correlated methylation sites in the occurrence of diseases.
					 	Joint detection of these sites'methylation status can achieve more accurate diagnosis of ultra-early diseases than previous techniques.
					 	</p> 
					</div>
					<div style="width: 100%;height: 20px;"></div>
					<hr />
				</div>
			</div>
			<div id="methy"style="width: 100%;height: auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 96%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;">
						<p style="font-family: arial;font-size: 26px;font-weight: 700;"> DNA methylation </p> 
						<p style="font-size: 24px;font-family: arial;color: #036EB8;"> Important research results </p> 
					</div>
					<div style="width: 100%;height: auto;"><img src="static/images/met1.jpg" style="width: 100%;height: auto;"/></div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;font-family: arial;color: #666666;line-height: 24px;">
						 Aiming at DNA methylation technology, Professor Moshe Szyf, the chief scientist of Epidial, has conducted a large number of in-depth studies on healthy people and patients through collaboration with Beijing Youan Hospital,
						 	 thus realizing ultra-early cancer and biology. 
						 	<span style="color: #036EB8;"> Two core techniques for accurate diagnosis of age DNA methylation.
						 	 Among them, the accurate diagnosis of ultra-early cancer DNA methylation has been patented.
						 	</span>
					</div>
					<div style="width: 100%;height: 20px;"></div>
					<hr />
				</div>
			</div>
			<div id="tumor"style="width: 100%;height: auto;">			
				<div style="width: 96%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;"><img src="static/images/met2.jpg"style="width: 100%;height: auto;"/></div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;font-family: arial;color: #036EB8;line-height: 24px;font-weight: 600;">
						Precise Diagnosis of Ultra-early Tumors by DNA Methylation
					</div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;font-family: arial;color: #6D6D6D;line-height: 24px;font-weight: 600;">
						Ultra-early high accuracy, sensitivity and specificity of more than 90%.
					</div>
					<div style="font-family: arial;color: #666666;line-height: 24px;">
						By detecting DNA methylation modification status in human peripheral blood cells, we can effectively assess and accurately predict the risk of ultra-early cancer.
					</div>
					<div style="width: 100%;height: 40px;"></div>
					<div style="width: 100%;height: auto;font-family: arial;color: #6D6D6D;line-height: 24px;font-weight: 600;">
						Covering 16 kinds of malignant tumors with the highest morbidity and mortality in China
					</div>
					<div style="font-family: arial;color: #666666;line-height: 24px;">
					including liver cancer, lung cancer, prostate cancer, breast cancer, colorectal cancer, pancreatic cancer, brain cancer, stomach cancer, ovarian cancer, cervical cancer, nasopharyngeal cancer, esophageal cancer, bladder cancer, renal cancer, testicular cancer, etc.
					</div>
					<div style="width: 100%;height: 40px;"></div>
					<div style="font-family: arial;font-weight: 600; color: #036EB8;">
						Technical Advantages
					</div>
					<div style="width: 100%;height: 30px;"></div>
					<div style="width: 100%;height: auto;">
						<img src="static/images/met4.png"style="width: 100%;height: auto;"/>
					</div>
					<div style="width: 100%;height: 40px;"></div>
					<hr />
					<div style="width: 100%;height: auto;">
						<img src="static/images/met3.jpg"style="width: 100%;height: auto;"/>
					</div>
					<div style="width: 100%;height: auto;font-family: arial;color: #036EB8;line-height: 24px;font-weight: 600;">
						Accurate detection of DNA methylation in biological age
					</div>
					<div style="width: 100%;height: 40px;"></div>
					<div style="font-family: arial;color: #666666;line-height: 24px;">
					Epidial Biological Age DNA Methylation Precision Detection Technology is a new generation of international patented technology developed by HKG epitherapeutics of Hong Kong based on its breakthrough research results. 
					It can accurately detect the biological age of individuals only by analyzing saliva samples. It has three advantages:<span style="color: #036EB8;">convenient sampling, rapid analysis and accurate results.</span> 
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 40px;"></div>
			<div id="tec-adv"style="width: 100%;height: auto;">
				<div style="width: 96%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;">
					<div style="width: 65%;height: 125px;float: left;line-height: 110px; font-family: arial;color: #036EB8;;font-weight: 600;">
						Technical Advantages
					</div>
					<div style="width: 35%;height: 100px;float: left;">
						<img src="static/images/met-icon.jpg"style="width: 100%;height: auto;"/>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto; ">
						 
							 <div id='dot' style="color: #666666;font-family: arial;">Only a few oral saliva samples are needed for detection.</div>
							<div style="width: 100%;height: 20px;"></div>
						
						
							<div id="dot" style="color: #666666;font-family: arial;">Real-time monitoring can be carried out at different age stages according to individual needs.</div>
							<div style="width: 100%;height: 20px;"></div>
					
							<div id="dot" style="color: #666666;font-family: arial;">Only with high accuracy, can you confirm your biological age most truthfully</div>
							<div style="width: 100%;height: 20px;"></div>
					
					</div>
				</div>
				<div style="width: 100%;height: auto;">
					<div style="width: 98%;height: auto;margin: 0 auto;">
					<div style="width: 65%;height: 125px;float: left;line-height: 110px; font-family: arial;color: #036EB8;;font-weight: 600;">
						Technical Advantages
					</div>
					<div style="width: 35%;height: 100px;float: left;">
						<img src="static/images/met-icon1.jpg"style="width: 100%;height: auto;"/>
					</div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;">
						 <div style="width: 96%;height: auto;margin: 0 auto;">
							 <div id='dot' style="width: 100%; height: auto;color: #666666;font-family: arial;">
							 	To provide a lifelong dynamic assessment of biological age and health conditioning.</div>
							<div style="width: 100%;height: 20px;"></div>
						
						
							<div id="dot" style="width: 100%; height: auto; color: #666666;font-family: arial;">
								Provide lifelong guidelines and roadmaps for disease prevention and health improvement</div>
							<div style="width: 100%;height: 20px;"></div>
					
							<div id="dot" style="width: 100%;height: auto; color: #666666;font-family: arial;">
								To provide important criteria for formulating effective individualized anti-aging programs</div>
							<div style="width: 100%;height: 20px;"></div>
					</div>
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
