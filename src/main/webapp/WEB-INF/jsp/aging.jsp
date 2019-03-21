<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
<base href="<%=basePath%>">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>2.0 for DNA Methylation Detection</title>
<style>
div[id=box]:before {
	content: "●";
	color: #207EBF;;
	font-size: 0.15rem;
}
</style>
</head>
<body style="padding: 0px;margin: 0px;">
	<jsp:include page="header.jsp"/>
	<div id="container">
		<div id="illu-pic" style="width: 100%;height: auto;">
			<img src="static/images/ic1.png" style="width: 100%;height: auto;" />
		</div>
		<div id="version-2.0" style="width: 100%;height: auto;">
			<div style="width: 100%;height: auto;margin-bottom: 10px;">
				<div
					style="width: 96%;height: auto;font-family: arial;color: #000000;font-size: 22px;font-weight: 700;  margin: 0 auto;text-align: center;">
					Standard Edition 2.0 for DNA Methylation Detection</div>
			</div>
			<div
				style="width: 96%;margin: 0 auto; height: auto;margin-bottom: 10px; font-family: arial;font-size: 18px;color: #1566B9;font-weight:600; ">
				DNA methylation detection helps you decrypt age codes</div>
			<div
				style="width: 96%;height: auto;margin: 0 auto; font-size: 16px;line-height: 18px; color:  #666666;font-family: arial; ">
				<p>Everyone pays more attention to their age, especially as a
					female customer. When we ask about age, we will take it into
					account.</p>
				<p>Of course, now we are talking about our actual age. How do we
					know the age of our body?</p>
				<p>That's biological age. That's what we need for our
					professional testing program.</p>
			</div>
		</div>
		<div id="age-pic" style="width: 100%;height: auto;">
			<img src="static/images/ic5.png" style="width: 100%;height: auto;" />
		</div>
		<div id="age-cont" style="width: 100%;height: auto;">
			<div style="width: 100%;height: auto;">
				<div style="width: 100%;height: auto;">
					<div
						style="width: 96%;height: auto;margin: 0 auto; font-family: arial;margin-top: 30px; font-size: 18px;color: #1566B9;font-weight: 600;">
						Biological Age Detection of DNA Methylation</div>
					<div
						style="width: 96%;height: auto;margin: 0 auto;font-family: arial; font-size: 18px;color:#666666;">
						<div style="width: 100%;height: auto;font-size: 16px;">
							<div style="width: 100%;height: 20px;"></div>
							<strong> Biological age≠Actual age </strong>
							<p>We all know our age, but how old are we?</p>
							<p>We age differently</p>
							<p>
								Some people "look" and "feel" older than they are. <br />
								Others look younger than they really are.
							</p>
							<p>Although the actual age of humans as a whole is related to
								their biological age, it is not always the case.</p>
						</div>
					</div>
					<div style="width: 100%;height: auto; ">
						<img src="static/images/ic6.png" style="width: 100%;height: auto;" />
					</div>
					<div
						style="width: 96%;height: auto;margin: 0 auto;font-family: arial; font-size: 16px;color:#666666;">
						<p>Biological age can be measured with only 1 ml saliva sample
							Samples of saliva are collected according to the instructions and
							sent back to our laboratory in pay on delivery.</p>
						<p>We will push the test report to you through APP within 24
							working days, you can easily get personal DNA biological age test
							reports at home.</p>
						<p>Official interpretation of about 5-10 core reports
							(specific reports are based on actual tests), PDF version reports
							and lifelong free updates.</p>
					</div>
				</div>
			</div>
		</div>
		<div id="four-adg" style="width: 100%;height: auto;">
			<div
				style="width: 100%;height: auto;font-family: arial;font-size:20px ;font-weight: 400; color: #0F86A4; margin-top: 30px;">
				<div
					style="width: 96%;height: auto;margin: 0 auto;font-size: 18px;color: #1566B9;font-family: arial;font-weight: 600;">
					Our Intelligence management system can help you customize
					personalized services in all directions.</div>
			</div>
			<div style="width: 100%;height: auto;margin-top: 20px;">
				<div style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 49%;height: auto; float: left;">
						<img src="static/images/ic2.png" style="width: 100%;height: auto;" />
					</div>
					<div style="width: 49%;height: auto;float: left;">
						<img src="static/images/ic4.png" style="width: 100%;height: auto;" />
					</div>
				</div>
				<div style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 49%;height: auto; float: left;">
						<img src="static/images/ic3.png" style="width: 100%;height: auto;" />
					</div>
					<div style="width: 49%;height: auto;float: left;">
						<img src="static/images/ic7.png" style="width: 100%;height: auto;" />
					</div>
				</div>
			</div>
		</div>
		<div id="aging-func" style="width: 100%;height: auto;">
			<div style="width: 100%;height: auto;">
				<div
					style="width: 96%;height: auto;margin: 0 auto; font-family: arial;font-size: 18px;color: #1566B9;font-weight: 600;">
					What can the product provide for users ?</div>
				<div style="clear: both;">
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 95%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: auto; font-size: 16px;">

							<div id='box' style="color: #666666;font-family: arial;">
								Accurate assessment - high accuracy of detection, which can
								truly reflect biological aging</div>
							<div style="width: 100%;height: 20px;"></div>


							<div id="box" style="color: #666666;font-family: arial;">Tracking
								Detection - Provides a biological age reversal program to track
								aging improvements by re-evaluating the tests</div>
							<div style="width: 100%;height: 20px;"></div>

							<div id="box" style="color: #666666;font-family: arial;">Advanced
								Technology--Based on Second Generation Sequencing Detection and
								Highly Age-related Methylation Loci in Human Biology</div>
							<div style="width: 100%;height: 20px;"></div>

							<div id="box" style="color: #666666;font-family: arial;">Big
								Data Management - Check through APP Channel, Pay Real-time
								Attention to Your Health and Intervention</div>
							<div style="width: 100%;height: 20px;"></div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="coupon"
			style="width: 100%;height: auto;font-size: 16px;font-family:arial; color: #FF6B03; ">
			<div style="width: 90%;height: auto;margin: 0 auto;">
				<span
					style="text-decoration: line-through;font-family: arial; font-size: 18px;color: #7F7F7F;">$150/kit
					for original price<br />
				</span>
				<p></p>
				<span style="font-size: 18px;font-family: arial"><strong
					style="font-weight: 600 ;font-size: 18px; font-family: arial; ">$120</strong>
					per kit for purchase <strong
					style="font-family: arial;font-size: 18px;"> 2</strong> kit<br />
				</span>
				<p></p>
				<span style="font-family: arial;font-size: 18px;"><strong
					style="font-weight: bold;font-size: 24px;">$110</strong> per kit
					when purchase over <strong
					style="font-weight: bold;font-size: 24px;">3</strong> kit </span>
				<p></p>
			</div>
		</div>
		<div id="add-cart" style="width: 100%;height: auto;margin-top: 20px;">
			<div style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 40%;height: 40px;font-family: arial;font-size: 18px;text-align: center;line-height: 40px; color:#FFFFFF ;float: left;background-color: #0365D2; border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;">
					ADD TO CART</div>
				<a href="cart/index.jhtml">
				<div style="width: 40%;height: 40px;font-family: arial;font-size: 18px;text-align: center;line-height: 40px; color:#FFFFFF ;float: right;background-color: #0365D2; border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;">
					BUY
				</div>
				 </a>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div style="width: 100%;height: 60px;"></div>
				<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
					<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;">
						@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
					</div>
		<div style="width: 100%;height: 20px;"></div>
	</div>
	
</body>

</html>
