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
	<title>Biological age Detection</title>
</head>
<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: auto;font-family: arial;color: #666666;line-height: 22px;">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="header" style="width: 100%;height: auto;">
		<img src="static/images/bio-1.png"style="width: 100%;"height="auto"/>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 96%;height: auto;margin: 0 auto;line-height: 22px;">Stop counting your age by birthdays or candles on the cake, wrinkles, crow’s feet or the frown lines on your face — those are only numbers. And today, the numbers don’t count. </div>
		<div style="width: 100%;height: 15px;"></div>
	</div>
	<div class="clock"style="width: 100%;height: auto;background-color:#F4F4F4 ;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 96%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				Your Biological DNA Age is the Only Age That Counts
			</div>
			<div style="font-weight: 600;font-size: 18px; line-height: 40px;">
				Everyone has a DNA clock
			</div>
			<div style="width: 100%;height: auto;">
				<p>We all know our chronological age. But how old we really are?</p>
				<p style="line-height: 22px;">People age at different rates. Some “look” and “feel” older than their chronological age while other look younger than their chronological age.</p>
			</div>
			<div style="width: 100%;height: auto;"><img src="static/images/bio-2.png"style="width: 100%;height: auto;"/></div>
		</div>
	</div>

	<div class="content" style="width: 100%;height: auto;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 94%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				Our Biological age is a better parameter of our health well being and life span than our chronological age.
			</div>
			<div style="width: 100%;height: auto;font-size: 18px;font-weight: 500;line-height: 80px;">But how do we know our “biological age”?  </div>
			<div style="line-height: 22px;">It has been believed that if we can define the true “biological age” we might test and design interventions that will decelerate the rate of biological aging.
				During the past decades, extensive effort has been invested in identifying different parameters that could predict “biological aging” and life span such as measures of frailty, graying of hair, aging of skin, levels of different kinds of white blood cells.
				However most of these markers were found to offer no advantage over knowing your chronological age.
			</div>
			<div style="width: 100%;height: 30px;"></div>
			<div style="width:80%;margin: 0 auto; height: auto; font-size:18px;color: #0071BC;text-align: center;line-height: 20px;">
				Parameters that predict "biological aging" and longevity
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div><img src="static/images/bio-3.png"style="width: 100%;height: auto;"/></div>
		</div>
	</div>

	<div class="method" style="width: 100%;height: auto;background-color: #F4F4F4;">
		<div style="width: 96%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;text-align: center;color: #0071BC;font-size: 18px;line-height: 80px;">
				Biological age detection method
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 33%;height: auto;"></div>
				<div style="width: 24%;height: auto; margin: 0 auto;text-align: center;"><img src="static/images/bio-4.png"style="width: 100%;height: auto;"/></div>
				<div style="width: 33%;height: auto;"></div>
			</div>
			<div style="width: 100%;height: auto;color: #899F54;text-align: center;">
				Telomere Length
			</div>
			<div style="width: 100%;height: auto;text-align: center;line-height: 3px;color: #666666;">
				<p>Low correlation</p>
				<p>	High technical requirements</p>
				<p>Small technical errors may have a decisive </p>
				<p>	impact on the results.</p>
			</div>
			<div style="width: 100%;height:20px;"></div>
			<div style="width: 100%;height: auto;">
				<div style="width: 33%;height: auto;"></div>
				<div style="width: 24%;height: auto; margin: 0 auto;text-align: center;">
					<img src="static/images/bio-6.png"style="width: 100%;height: auto;"/></div>
				<div style="width: 33%;height: auto;"></div>
			</div>
			<div style="width: 100%;height: auto;color: #FBA32E;text-align: center;">
				Metabolic age scores
			</div>
			<div style="width: 80%;height: auto;margin: 0 auto; text-align: center;line-height: 20px;color: #666666;">
				<p>Sampling and detection methods are complex and have not been verified in a large number of population samples</p>
			</div>

			<div style="width: 90%;margin: 0 auto; height: auto;background-color:#29ABE2 ; border-radius: 5px;">
				<div style="width: 100%;height: 10px;"></div>
				<div style="width: 100%;height: auto;">
					<div style="width: 33%;height: auto;"></div>
					<div style="width: 24%;height: auto; margin: 0 auto;text-align: center;">
						<img src="/static/images/bio-7.png"style="width: 100%;height: auto;"/></div>
					<div style="width: 33%;height: auto;"></div>
				</div>
				<div style="width: 100%;height: auto;color: #FBA32E;text-align: center;color: #FFFFFF;">
					<i>HKG epi THERAPEUTICS</i>
				</div>
				<div style="width: 96%;height: auto;margin: 0 auto; text-align: center;line-height: 20px;color: #FFFFFF;">
					<p>It is closely related to the biological function of human body, and the acceleration of epigenetic clock is related to the risk of neurodegenerative diseases and cancer.</p>
				</div>
			</div>
		</div>
	</div>

	<div class="epitherapia" style="width: 100%;height: auto">
		<div style="width: 94%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;color: #0071BC;font-weight: 500;font-size: 20px;">
				<i>HKG epi THERAPEUTICS</i>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px;">
				<i>HKG epi THERAPEUTICS</i> is on the cutting edge of this “new age” science. It’s called Epigenetics and it uses a method called DNA methylation to determine your true age — which might,
				as science is thinking at this time and age, reveal some important information on your true health, and possibly the quality and even span of your life.
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px;">
				Epigenetics is new, but <i>HKG epi THERAPEUTICS</i> already has three decades of pioneering research in this exciting area of DNA methylation.
				With our unique method of diagnosing the DNA methylation stored in your cells in saliva,
				we reveal your actual age, which may encourage you to make lifestyle changes that some claim might lead to the following:
			</div>
			<div style="width: 100%;height: 30px;"></div>
			<div style="line-height: 80px;"><img src="static/images/bio10.png"style="width: 100%;height: auto;"/></div>
		</div>
	</div>

	<div class="simple"style="width: 100%;height: auto;background-color: #F4F4F4;">
		<div style="width: 96%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				Making Science Simple
			</div>
			<div style="line-height: 60px; ">
				How Fast Is Your Biological Clock Ticking?
			</div>
			<div style="line-height: 22px;">
				If your chronological age is 50 and your biological age is 35, excellent!
				But if yourchronological age is 35 and your biological age says that you’re 50 years old — it might be the alarm calling on you to make life style changes.
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px; ">
				Advanced aging is possibly associated with increased risk of serious illness. Epigenetics may not be The Fountain of Youth but it is The Fountain of Life.
			</div>
			<div style="width: 100%;height:20px ;"></div>
			<div style=" line-height: 22px;">
				So grab the key and learn how old you are, really
			</div>
			<div>
				<img src="static/images/bio-8.png"style="width: 100%;height: auto;"/>
			</div>
		</div>
	</div>

	<div style="width: 100%;height: auto;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 96%;height: auto;margin: 0 auto;">
			<div style="white-space: 100%;height: auto;color: #0071BC;font-weight: 500;font-size: 20px;line-height: 60px;">
				The HKG Epiaging test
			</div>
			<div style="width: 100%;height: auto;line-height: 22px;">
				HKG epitherapeutics developed and introduced a convenient and efficient Epiaging detection.
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px;">
				Scientists at HKG epitherapeutics have excavated a large number of age-related CG methylation sites in hundreds of published DNA methylation data,
				and selected a region containing 13 methylation sites from which saliva samples can accurately predict biological age.
			</div>
			<div style="width: 100%;height: 40px;"></div>
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				Discover Your Biological Age<br /> in 3 Simple Steps
			</div>

			<div style="width: 100%;height: auto;margin-top: 30px;">
				<img src="static/images/bio-9.png"style="width: 100%;height: auto;"/>
			</div>
		</div>
	</div>
	<div style="width: 100%;height: 40px;"></div>
	<div class="download"style="width: 100%;height: auto;">
		<div style="width: 90%;height: 40px;margin: 0 auto;color: #FFFFFF;background-color: #0071BC;text-align: center;line-height: 40px;border-radius: 5px;">Download APP</div>
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
