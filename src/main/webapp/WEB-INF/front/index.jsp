<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="static/css/style.css" />
<script src="static/js/slide.js"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>主页</title>

<style>
div[id=dot]:before {
	content: "●";
	font-size: 0.3rem;
	color: #FFFFFF;
	margin-right: 8px;
}
</style>
<style>
div[id=blue-dot]:before {
	content: "●";
	font-size: 0.3rem;
	color: #207EBF;
	margin-right: 8px;
}
</style>
</head>


<body style="padding: 0;margin: 0;">
	<div style="width: 100%;height: 100%;">
		<jsp:include page="header.jsp" />
		<div id="header" style="z-index: -1">
			<div id="slide" class="slide" style="width: 100%;height:auto;">
				<ul>
					<li><a href="bioage/index.jhtml"> <img id="img1" src="static/images/h1.jpg">
					</a></li>
					<li><a href="same/index.jhtml"> <img id="img1" src="static/images/h2.jpg">
					</a></li>
					<li><a href="vitaminA/index.jhtml"> <img id="img1" src="static/images/h3.jpg">
					</a></li>
					<li><img id="img1" src="static/images/home4.jpg"></li>
					<li><img id="img1" src="static/images/home5.jpg"></li>

				</ul>
				<div>
					<span class="prev_btn"> &lt; </span> <span class="next_btn"> &gt; </span>
				</div>
			</div>
		</div>
<div style="height: 30px;width: 100%;clear: both;"></div>
		<div style="width: 100%;height: auto;">
			<div style="width: 96%;height: 300px;margin: 0 auto; background-image: url(/static/images/taiji.png);background-position:center; background-size: 100% 100%; background-repeat: no-repeat; ">
				<div class="left" style="width: 30%;height: 100%;float: left; ">
					<a href="aboutus/index.jhtml">
						<div style="width: 100%;height: 50%;"></div>
					</a> <a href="user/cart/index.jhtml">
						<div style="width: 100%;height: 50%;"></div>
					</a>
				</div>
				<div class="mid" style="width: 38%;height: 100%;float: left; ">
					<div style="width: 100%;height: 26%;"></div>
					<div style="width: 100%;height: 45%;">
						<div style="width: 100%;height: 50%; ">
							<div style="width: 27%;height: 100%;float: left; "></div>
							<a href="user/lifestyle/index.jhtml">
								<div style="width: 73%;height: 100%;float: left; "></div>
							</a>
						</div>

						<div style="width: 100%;height: 50%; ">
							<a href="user/bioreport/index.jhtml">
								<div style="width: 73%;height: 100%;float: left; "></div>
							</a>
							<div style="width: 27%;height: 100%;float: left; "></div>
						</div>
					</div>

					<div style="width: 100%;height: 28%;"></div>
				</div>
				<div class="right" style="width: 31%;height: 100%;float: left; ">
					<a href="testprocess/index.jhtml">
						<div style="width: 100%;height: 50%;"></div>
					</a> <a href="queslist/index.jhtml"><div style="width: 100%;height: 50%;"></div></a>
				</div>
			</div>
		</div>
		   <div style="height: 10px;width: 100%;clear: both;"></div>       
		<div style="width: 100%;height: 200px">
			<div style=" margin: 0 auto;width: 95%;height: 100%;">
				<video id="my-video" class="video-js" controls preload="auto" style="width: 100%;height: 100%;" poster="static/images/ted.png" data-setup="{}">
					<source src="https://app.beijingepidial.com/How_early_life_experience_is_written_into_DNA _Moshe_Szyf.mp4" type="video/mp4">
				
				</video>
			</div>
		</div>

		<div id="bio" style="width: 100%;height: auto; background-color: #F0F0F0;position: relative;">
			<div style="width: 100%;height: 50px;"></div>
			<div class="bio-title" style="width: 100%;height:60px ;">
				<div style="width: 57%;height: auto;float: left; line-height: 27px;font-size: large; font-weight: 700; font-family: arial;">DNA甲基化生物学年龄检测</div>
				<div style="width: 20%;height: 61px;float: left; font-family: arial;font-size: 30px;font-weight: bold;color: #036EB7;line-height: 40px; ">
					<div style="width: 80%;height: auto;margin: 0 auto;line-height: 55px;">$99</div>
				</div>
				<div style="width: 23%;height: 61px;float: right; ">
					<a href="/user/cart/index.jhtml"> <a href="aging/index.jhtml" style="text-decoration: none"><div style="width: 78%;height: 40px;color: white; background-color: #93278F;margin: 0 auto ;margin-top: 9px;text-align: center; line-height: 40px; font-size: large; border-top-left-radius: 5px;border-top-right-radius: 5px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">更多</div></a>
					</a>
				</div>
			</div>
			<div class="bio-con" style="width: 100%;height:auto ;background-color: #F0F0F0;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="font-family: arial; color: #666666;">
					仅需1毫升唾液样本即可检测，方便、安全样品以货到付款的形式寄回到实验室进行检测。
					然后，测试结果将在20个工作日内通过应用程序发送给您，我们将从各个方面跟踪您的结果。
				</div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
			<div class="bio-pic" style="width: 100%;height: auto;background-color: #F0F0F0;">
				<div style="width: 90%;height: auto;margin: 0 auto;">

					<img src="static/images/hm4.jpg" style="width: 100%;height: auto;" />
				</div>
				<div style="width: 100%;height: 50px;background-color: #F0F0F0;"></div>
			</div>

		</div>

		<div id="app" style="width: 100%;height: auto;background-color: #036EB7; ">
			<div style="width: 100%;height: 40px; background-color: #036EB7;"></div>
			<div style="width: 96%;height: auto;margin: 0 auto; color: white; font-size: 12px;">
				<div style="margin: 0 auto;margin-bottom: 8px; font-size: large;">智能应用系统</div>
				<div id="dot">动态个人报告</div>
				<div id="dot">独特的问卷系统</div>
				<div id="dot">干预和持续的后续计划</div>

			</div>
			<div style="width: 100%;height: 40px; background-color: #036EB7;"></div>
		</div>
		<div id="app-pic" style="width: 100%;height: auto;margin: 0 auto;">
			<img src="static/images/hm5.jpg" style="width: 100%;height: auto;" />

		</div>
		<div style="clear: both;"></div>
		<div style="width: 100%;height: auto;background-color: #036EB7;margin: 0 auto; ">
			<div class="blank" style="width: 100%;height: 30px;background-color: #036EB7 ; "></div>
			<img src="/static/images/hm6.png" style="width: 100%;height: auto;background-color: #036EB7;" />
			<div class="blank" style="width: 100%;height: 30px;background-color: #036EB7 ; "></div>
		</div>
		<div id="sam-e" style="width: 100%;height: 800px;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="bio-title" style="width: 100%;height:60px ;">
				<div style="width: 58%;height: auto;float: left; line-height: 59px;font-size: large; font-weight: 700; font-family: arial;">什么是 SAM-e？</div>
				<div style="width: 17%;height: 61px;float: left; font-family: arial;font-size: 30px;font-weight: bold;color: #036EB7;line-height: 40px; ">
					<div style="width: 80%;height: auto;margin: 0 auto;line-height: 58px;">$60</div>
				</div>
				<div style="width: 25%;height: 61px;float: right; ">
					<a href="same/index.jhtml" style="text-decoration: none"><div style="width: 78%;height: 40px;color: white; background-color: #93278F;margin: 0 auto ;margin-top: 9px;text-align: center; line-height: 40px; font-size: large; border-top-left-radius: 5px;border-top-right-radius: 5px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">More</div> </a>
				</div>
			</div>
			<div id="sam-e-pic" style="width: 100%;height: auto;margin: 0 auto; ">
				<img src="static/images/hm7.png" style="width: 100%;height: auto;" />
			</div>
			<div id="sam-e-con" style="width: 100%;height: auto;font-size: 12px; ">
				<div style="width: 96%;height: auto;margin: 0 auto; font-family: arial;color: #666666;">
					<div id="blue-dot">SAM-e（S-Adenosyl methionine， S-腺苷甲硫氨酸）是一种营养补充剂，并非药物。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="blue-dot">SAM-e是人体中天然存在的化合物。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="blue-dot">SAM-e被认为是人体中最重要的甲基供体。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="blue-dot">随着机体老化，SAM-e水平会下降。随之而来，一系列与情绪、关节和肝脏功能等相关的健康问题可能出现。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="blue-dot">所有的SAM-e分子有两种异构体：SS（活性）异构体和RS（非活性）异构体。</div>
					<div style="width: 100%;height: 20px;"></div>
					<div id="blue-dot">虽然SAM-e有两种成盐形式--甲苯磺酸盐和丁烷二硫酸盐，但只有甲苯磺酸盐的安全性和有效性有二十年的研究数据支持。</div>
				</div>
			</div>
			<div id="intro-sam" style="width: 100%;height: auto;background-color: #F4F4F6; ">
				<div style="width: 100%;height: auto;">
					<div class="blank" style="width: 100%;height: 30px;background-color: #F4F4F6 ; "></div>
					<div style="width: 96%;height: auto;margin: 0 auto;font-family: arial; font-weight: 600;">据临床研究报道，SAM-e有助于增进情绪健康、关节舒展功能和肝脏功能。</div>
					<div class="blank" style="width: 100%;height: 30px;background-color: #F4F4F6 ; "></div>
				</div>
				<div style="width: 100%;height: auto;margin: 0 auto;">
					<img src="static/images/hm8.png" style="width: 100%;height: auto;" />
				</div>
				<div style="width: 100%;height: auto;background-color: #F4F4F6;overflow: hidden; ">
					<div style="width: 95%;height:auto;margin: 0 auto;border-top: 9px; align-content: center;background-color: #C1E1E8;border-radius: 10px;">
						<br />2003年3月，美国卫生及公共服务部发表了一项关于SAM-e的重要研究。<br /> <i style="color: #4A9ACA;"><a href="https://www.ncbi.nlm.nih.gov/books/NBK11886/" target="_blank">https://www.ncbi.nlm.nih.gov/books/NBK11886/</a></i>
					</div>
					<div style="width: 100%;height: 20px;overflow: hidden;">
						<div style="width: 20%;height: 20px;float: left;"></div>
						<div style="width: 10%;height: 20px;float: left;">
							<img src="static/images/sam4.png" style="width: 100%;height: auto;vertical-align:left;display:block;">
						</div>
						<div style="width: 60%;height: 20px;float: left;"></div>
					</div>
					<div style="width: 100%;height: auto;">
						<div style="width: 96%;height: auto;margin: 0 auto;font-family: arial; color: #666666;">
							<div style="width:100%;height:auto;margin:0 auto;">
								<div id="blue-dot">SAM-e和传统的抗抑郁处方药相比同样有效。</div>
								<div style="width: 100%;height: 20px;"></div>
								<div id="blue-dot">SAM-e和用于治疗骨性关节炎的标准处方非甾体抗炎药相比同样有效。</div>
								<div style="width: 100%;height: 20px;"></div>
								<div id="blue-dot">SAM-e对患有多种肝病的病人有明显益处。</div>
								<div style="width: 100%;height: 20px;"></div>
								<div id="blue-dot">并未发现天然SAM-e有明显副作用。</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="vitamine" style="width: 100%;height: auto;">
				<div class="blank" style="width: 100%height: 20px;"></div>
				<%--<div class="vit-con" style="width: 100%;height:auto ;">
					<div style="width: 100%;height: 50px;"></div>
					<div style="width: 96%;height: auto; font-family: arial;font-size: large; font-weight: 700;margin: 0 auto;">Vitamins</div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 96%;height: auto;margin: 0 auto; font-size: 12px;font-family: arial;line-height: 20px;">Vitamins are natural products in our body that are required for our physiological function. Vitamin deficiency might cause health problems.</div>
					<div style="width: 100%;height: 30px;"></div>
				</div>
				<div style="width: 100%;height: 30px;"></div>
				<div class="vit-list" style="width: 100%;height: auto;">
					<div style="width: 100%;height: auto;">
						<div style="width: 92%;height: auto;margin: 0 auto;">
							<a href="vitaminA/index.jhtml"><img src="static/images/hm11.png" style="width: 100%;height: auto;" /></a>
						</div>
					</div>
					<div style="width: 100%;height: 30px;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 92%;height: auto;margin: 0 auto;">
							<a href="vitaminC/index.jhtml"> <img src="static/images/hm9.png" style="width: 100%;height: auto;" /></a>
						</div>
					</div>
					<div style="width: 100%;height: 30px;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 92%;height: auto;margin: 0 auto;">
							<a href="vitaminD/index.jhtml"><img src="static/images/hm10.png" style="width: 100%;height: auto;" /></a>
						</div>
					</div>
				</div>
			</div>--%>
			<div style="width: 100%;height: 90px;"></div>
			<div id="fun-list" style="width: 100%;height: auto;">
				<div class="rep-style" style="width: 100%;height: auto;">
					<div style="width: 92%;height: auto;margin: 0 auto;">
						<a href="user/bioreport/index.jhtml"><img src="static/images/hm14.png" style="width: 100%;height: auto;" />
						</a>
					</div>
				</div>
				<div style="width: 100%;height: 30px;"></div>
				<div class="rep-style" style="width: 100%;height: auto;">
					<div style="width: 92%;height: auto;margin: 0 auto;">
						<a href="queslist/index.jhtml"> <img src="static/images/hm15.png" style="width: 100%;height: auto;" />
						</a>
					</div>
				</div>
				<div style="width: 100%;height: 30px;"></div>
				<div class="rep-style" style="width: 100%;height: auto;">
					<div style="width: 92%;height: auto;margin: 0 auto;">
						<a href="concent/index.jhtml"> <img src="static/images/hm20.png" style="width: 100%;height: auto;" />
						</a>
					</div>
				</div>
				<div style="width: 100%;height: 30px;"></div>
				<div class="rep-style" style="width: 100%;height: auto;">
					<div style="width: 92%;height: auto;margin: 0 auto;">
						<a href="testprocess/index.jhtml"><img src="static/images/hm16.png" style="width: 100%;height: auto;" /></a>
					</div>
				</div>
				<div style="width: 100%;height: 30px;"></div>

				<div class="rep-style" style="width: 100%;height: auto;">
					<div style="width: 92%;height: auto;margin: 0 auto;">
						<a href="orderecord/index.jhtml"> <img src="static/images/hm17.png" style="width: 100%;height: auto;" />
						</a>
					</div>
				</div>
				<div style="width: 100%;height: 30px;"></div>

				<div class="rep-style" style="width: 100%;height: auto;">
					<div style="width: 92%;height: auto;margin: 0 auto;">
						<a href="faqlist/index.jhtml"> <img src="static/images/hm18.png" style="width: 100%;height: auto;" />
						</a>
					</div>
				</div>
				<div style="width: 100%;height: 30px;"></div>

				<div class="rep-style" style="width: 100%;height: auto;">
					<div style="width: 92%;height: auto;margin: 0 auto;">
						<a href="data/index.jhtml"> <img src="static/images/hm19.png" style="width: 100%;height: auto;" />
						</a>
					</div>
				</div>
				<div style="width: 100%;height: 30px;"></div>

			</div>
			<div id="download" style="width: 100%;height: 50px;">
				<%--<a href="download/EPIAging-apk.jhtml"><div style="width: 60%;height: 50px;margin: 0 auto; background-color: #036EB7;color: white; font-size: large;font-weight: bolder;text-align: center;line-height: 50px; border-radius: 5px;">Download App</div></a>--%>
			</div>
			<div style="width: 100%;height: 60px;"></div>
			<div id="all-right" style="width: 100%;height: auto;font-family: arial;">
				<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved</div>
			</div>
		</div>
		<jsp:include page="footnav.jsp"></jsp:include>
	</div>
</body>
</html>
