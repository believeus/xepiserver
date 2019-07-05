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
		<img src="static/images/bio-1.jpg"style="width: 100%;"height="auto"/>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;line-height: 22px;">Stop counting your age by birthdays or candles on the cake, wrinkles, crow’s feet or the frown lines on your face — those are only numbers. And today, the numbers don’t count. </div>
		<div style="width: 100%;height: 15px;"></div>
	</div>

	<div class="clock"style="width: 100%;height: auto;background-color:#F4F4F4 ;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				How old are you? Why is it important?
			</div>
			<div style="width: 100%;height: auto;">
				<div>• People age at different rates. Some "look" and "feel" older than their chronological age while other look younger than their chronological age.</div>
				<div>• Our biological age is a better parameter of our health well being and life span than our chronological age.</div>
				<div>• DNA is the hardware, genetics is the operating system and DNA methylation and other epigenetic factors are the software that programs the genome.</div>
				<div>• A paradigm shift in the search for biological age markers occurred with the discovery of the "epigenetic clock" by Horvath, which is based on measurement of DNA methylation status at 500 strategic positions in DNA.</div>
				<div>• Studies suggest that accelerated "epigenetic clock" might be associated with increased risk for several age related chronic disease such as cardiovascular disease and cancer at later age. (link: https://www.ncbi.nlm.nih.gov/pubmed/?term=epigenetic+clock+disease). This is however still an open field and more studies are needed.</div>
				<div>• Importantly, "epigenetics" in different from "genetics" is potentially reversible by dietary interventions and lifestyle changes.</div>
				<div>• Preliminary studies are coming up that show that dietary changes can cause deceleration of epigenetic clock in certain people, however this is still an open life. (link: https://www.ncbi.nlm.nih.gov/pubmed/30350398)</div>
				<div>• Lifestyle changes including exercise and change in dietary habits have been recommended by national medical associations for some time, however we need more data about the most advisable changes and they should be personalized.</div>
				<div>• One way for us to learn about advisable life style changes is sharing our experiences with others and analyzing the impact of differences in life style. This is now possible using sharing technologies such as Apps as well as artificial intelligence. </div>
			</div>
		</div>
	</div>

	<div class="clock"style="width: 100%;height: auto;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				What is the epiAging test?  What does it mean?
			</div>
			<div style="width: 100%;height: auto;">
				<div>• After extensive data mining, we have discovered a single age-related CG methylation region that was sufficient to accurately predict biological age using saliva. </div>
				<div>• Although it is still not clear how one can decelerate his age life style changes recommended by most national medical associations are perhaps a point to start. An older age is a "red flag" not more that suggest that perhaps it is time to make some life style changes. </div>
				<div>• We consider a "red flag" an "epigenetic age" that is older than one standard deviation of the test. Standard deviation provides an idea about the distribution in the normal population which at this point of analysis  is 5 years. As more tests are accumulated we will get a more accurate number of the "normal distribution".</div>
				<div>• A "red flag" might prompt you to act on your life style.</div>
				<div>• Our App will link you to information on recommended life style behaviors by important US national medical association. These are updated regularly and we suggest that you keep updating by examining the links periodically. These recommendations are based on what "science" knows today, they are not perfect. With more data and more analysis science is improving. </div>
				<div>• You will update your life style data as regularly as you wish. You might update all questions, some or none. However, we believe that accurate reporting will provide a more accurate better analysis.</div>
				<div>• Initially our report will show how far are your life style parameters from consensus recommendations. Your data will be anonymized and your data and data from other anonymous users we will be analyzed by artificial intelligence to develop a model based on many users that measures the impact that life style changes have on "epigenetic clock". In time as more data is accumulated., the model will be used on your life style data and results of the "model" will be shared with you. </div>
				<div>• Our test is simple to administer, low cost, robust and accurate, and is dynamically integrated into a life-long health ecosystem driven by App technology and machine learning</div>
			</div>
		</div>
	</div>

	<div class="clock"style="width: 100%;height: auto;background-color:#F4F4F4 ;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				How does the epiAging test work?
			</div>
			<div style="width: 100%;height: auto;">
				<div>• Order epiAging kit through HKG epiaging App.</div>
				<div>• The kit will be sent to you by express.</div>
				<div>• Scan the unique barcode included in your kit.</div>
				<div>• Collect saliva into the collection tubes following the instruction.</div>
				<div>• Sent the kit back in the provided envelop.</div>
				<div>• Log in the app to view your test results. </div>
				<div>• Feed us with your health and lifestyle information to establish your personalized health ecosystem </div>
				<div>• You will receive live analysis of your life data to your App. Once the test is complete you will receive the results.</div>
			</div>
		</div>
	</div>

	<div class="clock"style="width: 100%;height: auto;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				Why do you need questionnaires in the app?
			</div>
			<div style="width: 100%;height: auto;">
				<div>• EpiAging tests make sense only within a dynamic life-long life style, environmental and health management system.</div>
				<div>• A personalized evaluation including intervention will be generated based on the health and lifestyle information you provided. </div>
				<div>• Updates on your health and lifestyle parameters periodically to activate the life-long personalized analysis report</div>
				</div>
		</div>
	</div>

	<div class="clock"style="width: 100%;height: auto;background-color:#F4F4F4 ;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				How the data will be used?
			</div>
			<div style="width: 100%;height: auto;">
				<div>• Continuously analyze Epiaging test results, general health parameters, personal interventions and its outcomes of multiple users using state of the art machine learning algorithms .</div>
				<div>• Personalized analysis with some possible routes for improvement.</div>
				<div>• Coevolving of your well being and our "Epiaging" learning environment.</div>
			</div>
		</div>
	</div>

	<div class="clock"style="width: 100%;height: auto;background-color:#F4F4F4 ;">
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 90%;height: auto;margin: 0 auto;;">
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				Your Biological DNA Age is the Only Age That Counts
			</div>
			<div style="font-weight: 600;font-size: 18px; line-height: 40px;">
				Everyone has a DNA clock
			</div>
			<div style="width: 100%;height: auto;">
				<div>We all know our chronological age. But how old we really are?</div>
				<div style="line-height: 22px;">People age at different rates. Some "look" and "feel" older than their chronological age while other look younger than their chronological age.</div>
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
			<div style="width: 100%;height: auto;font-size: 18px;font-weight: 500;line-height: 80px;">But how do we know our "biological age"?  </div>
			<div style="line-height: 22px;">It has been believed that if we can define the true "biological age" we might test and design interventions that will decelerate the rate of biological aging.
				During the past decades, extensive effort has been invested in identifying different parameters that could predict "biological aging" and life span such as measures of frailty, graying of hair, aging of skin, levels of different kinds of white blood cells.
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
		<div style="width: 90%;height: auto;margin: 0 auto;">
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
			<div style="width: 100%;height: auto;text-align: center;line-height: 20px;color: #666666;">
				<div>The correlation between chronological age and telomere length was found to be weak</div>
				<div>	High technical requirements</div>
				<div>Small technical errors may have a decisive </div>
				<div>	impact on the results.</div>
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
				<div>Sampling and detection methods are complex and have not been verified in a large number of population samples</div>
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
					<i>Epigenetic clock</i>
				</div>
				<div style="width: 90%;height: auto;margin: 0 auto; text-align: center;line-height: 20px;color: #FFFFFF;">
					<div>is closely related to the biological function of human body, and the acceleration of epigenetic clock is related to the risk of neurodegenerative diseases and cancer.</div>
				</div>
			</div>
		</div>
	</div>

	<div class="epitherapia" style="width: 100%;height: auto">
		<div style="width: 94%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;color: #0071BC;font-weight: 500;font-size: 20px;">
				<i>epiAging</i>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px;">
				<i>epiAging </i>uses a method called DNA methylation to determine your true age — which might,
				as science is thinking at this time and age, reveal some important information on your true health, and possibly the quality and even span of your life.
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px;">
				<i>HKG epi THERAPEUTICS</i> already has three decades of pioneering research in this exciting area of DNA methylation.
				With our unique method of diagnosing the DNA methylation stored in your cells in saliva,
				we reveal your actual age, which may encourage you to make lifestyle changes that some evidence suggetss might lead to the following:
			</div>
			<div style="width: 100%;height: 30px;"></div>
			<div style="line-height: 80px;"><img src="static/images/bio10.png"style="width: 100%;height: auto;"/></div>
		</div>
	</div>
	<div style="width: 100%;height: 30px;"></div>
	<div class="simple"style="width: 100%;height: auto;background-color: #F4F4F4;">
		<div style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				Making Science Simple
			</div>
			<div style="line-height: 60px; ">
				How Fast Is Your Biological Clock Ticking?
			</div>
			<div style="line-height: 22px;">
				If your chronological age is 50 and your biological age is 35, excellent!
				But if your chronological age is 35 and your biological age says that you’re 50 years old — it might be the alarm calling on you to make life style changes.
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
		<div style="width: 90%;height: auto;margin: 0 auto;">
			<div style="height: auto;color: #0071BC;font-weight: 500;font-size: 20px;line-height: 60px;">
				The Epiaging test
			</div>
			<div style="width: 100%;height: auto;line-height: 22px;">
				We developed and introduced a convenient and efficient Epiaging detection test.
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="line-height: 22px;">
				Scientists at HKG epitherapeutics have mined a large number of age-related CG methylation sites in hundreds of published DNA methylation data,
				and selected a region containing 13 methylation sites from which saliva samples can accurately predict biological age.
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="height: auto;color: #0071BC;font-weight: 500;font-size: 16px;line-height: 30px;">
				Your life style and your health;
			</div>
			<div style="height: auto;color: #0071BC;font-weight: 500;font-size: 16px;line-height: 30px;">
				sharing data and analysis
			</div>
			<div style="line-height: 22px;">
				Epiaging tests makes sense only within a dynamic life-long life-style management. Advice from science by the most reputable national medical associations is presented in the questions section. You enter your data and then decide which recommendations to act upon. You share the data and your decisions with us  using our "fully blinded" app. You can enter the data and the changes you made as often as you want. Data and outcomes of multiple users are analyzed continuously using state of the art machine learning and a personalized analysis is provided to you with some possible routes for improvement. Medicine is not an absolute science. We are never perfect, but we are asymptotically trying to improve by iterative analysis of dat. We consider our platform as an "evolutionary" platform which dynamically improves with use with ever-expanding body of data.
			</div>

			<div style="width: 100%;height: 40px;"></div>
			<div style="width: 100%;height: auto;color: #0071BC;font-size: 20px;font-weight: 500;">
				Discover Your Biological Age<br /> in 5 Simple Steps,change your lifestyle and improve your health
			</div>

			<div style="width: 100%;height: auto;margin-top: 30px;">
				<img src="static/images/bio-9.png"style="width: 100%;height: auto;"/>
			</div>
		</div>
	</div>
	<div style="width: 100%;height: 40px;"></div>
	<%--<div class="download"style="width: 100%;height: auto;">--%>
		<%--<div style="width: 90%;height: 40px;margin: 0 auto;color: #FFFFFF;background-color: #0071BC;text-align: center;line-height: 40px;border-radius: 5px;">Download APP</div>--%>
	<%--</div>--%>
	<div style="width: 100%;height: 60px;"></div>
	<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
		<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 70px;">
			@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
		</div>
	</div>
	<jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
