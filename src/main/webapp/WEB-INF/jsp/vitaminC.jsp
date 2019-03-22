<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title></title><meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>Vitamin C introduction</title>
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
		<div style="width: 100%;height: 100%;">
		<jsp:include page="header.jsp"></jsp:include>
			<div style="width:100%;height: auto;">
				<a href="cart/index.jhtml"><img src="static/images/vc1.png"style="width: 100%;height: auto;"/></a>
			</div>
		
			<div id="overview"style="width: 100%;height: auto;">
				<div style="width: 90%;height: auto; margin: 0 auto; ">
					<div style="font-family: arial;line-height: 60px;font-weight: 600; color: #666666;">
						Overview
					</div>
					<div style="height: auto;font-family: arial;line-height: 20px; color: #A0A0A0;">
						<div >
							Vitamin C (ascorbic acid) is a vitamin your body needs to form blood vessels, cartilage, 
							muscle and collagen in bones. Vitamin C is also vital to your body's healing process
						</div>
						<div style="width: 100%;height: 20px;"></div>
						<div>
							An antioxidant, vitamin C might help protect your cells against the effects of free radicals — molecules produced when your body breaks down food or is exposed to tobacco smoke and radiation.
							 Free radicals might play a role in heart disease, cancer and other diseases. 
							Vitamin C also helps your body absorb and store iron.
						</div>
					</div>
					<div style="width: 100%;height: auto;">
						<img src="static/images/vc2.png"style="width: 100%;height: auto;"/>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: auto;background-color: #F4F4F4;overflow: hidden;">
				<div style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;line-height: 20px; font-family: arial;color:#A0A0A0 ;">
						<div>
						Because your body doesn't produce vitamin C, you need to get it from your diet. Vitamin C is found in citrus fruits, berries, potatoes, tomatoes, peppers, cabbage, Brussels sprouts, broccoli and spinach. 
						Vitamin C is also available as an oral supplement, typically in the form of capsules and chewable tablets.
						</div>
						<div style="width: 100%;height: 20px;"></div>
						<div>
							People with gastrointestinal conditions and some types of cancer might be susceptible to vitamin C deficiency. Vitamin C is also used to increase iron absorption from the gastrointestinal tract.
							 Severe vitamin C deficiency can lead to a disease characterized by anemia, bleeding gums, bruising and poor wound healing (scurvy). If you take vitamin C for its antioxidant properties, keep in mind that the supplement might not offer the same benefits as naturally occurring antioxidants in food.
						</div>
						</div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;">
					<div style="width: 90%;height: auto;margin: 0 auto;overflow: hidden;">
						<div style="width: 30%;height: auto;float: left;">
							<img src="static/images/vc3.png"style="width: 100%;height: auto;"/>
						</div>
							<div style="width: 5%;height: 30px;float: left;"></div>
						<div style="width: 30%;height: auto;float: left;">
							<img src="static/images/vc4.png"style="width: 100%;height: auto;"/></div>
							<div style="width: 5%;height: 30px;float: left;"></div>
						<div style="width: 30%;height: auto;float: left;">
							<img src="static/images/vc5.png"style="width: 100%;height: auto;"/></div>
					</div>
					</div>					
				</div>
			</div>
			<div id="evidence"style="width: 100%;height: auto;overflow: hidden;background-color: #EEFFEF;">
				<div style="width: 98%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;font-family: arial;line-height: 86px;font-weight: 600; color: #666666;">
						Evidence
					</div>
					<div style="width: 100%;height: auto;color: #A0A0A0;font-size: 12px;">
						Research on the use of vitamin C for specific conditions shows:
					</div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;">
							<img src="static/images/vc8.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Cancer. </strong>
							 Eating a diet rich in fruits and vegetables might lower your risk of many types of cancer, 
							such as breast, colon and lung cancers. However, it's not clear whether this protective effect is related to the vitamin C content in the food. 
							Taking oral vitamin C supplements doesn't appear to offer the same benefit.
						</div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 195px;">
							<img src="static/images/vc6.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;"> Common cold.  </strong>
							Taking oral vitamin C supplements won't prevent the common cold. However, there's some evidence that when people who regularly take vitamin C supplements get a cold, 
							the illness lasts fewer days and symptoms are less severe.
							 Starting a vitamin C supplement only after you develop a cold is of no help.
						</div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 200px;">
							<img src="/static/images/vc7.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Eye diseases. </strong>
							Taking oral vitamin C supplements in combination with other vitamins and minerals seems to prevent age-related macular degeneration (AMD) from worsening. 
							Some studies also suggest that people who have higher levels of vitamin C in their diets have a lower risk of developing cataracts.
						</div>
					</div>
					
	
				</div>
						<div style="width: 100%;height: 20px;"></div>
				</div>
				
			</div>
			<div style="clear: both;"></div>
			<div id="take" style="width: 100%;height: auto;overflow: hidden;">
				<div style="width: 90%;height: auto;margin: 0 auto;">
					<div style=" font-family: arial;color: #666666;line-height: 70px;font-weight: 600;"> 
						Our take
					</div>
				<div style="width:100%;height: auto;font-family: arial;; font-weight: 600px;">
					Generally safe
				</div>
				<div style="width: 100%;height: 10px;"></div>
				<div style="width: 100%;height: auto;line-height: 20px;color: #A0A0A0; font-family: arial;">
					Most people get enough vitamin C from a balanced diet. However, people with gastrointestinal conditions and some types of cancer might be susceptible to vitamin C deficiency and benefit from the use of oral supplements. 
					Taking vitamin C supplements also might have other protective benefits.
				</div>
				<div style="width: 100%;height: 10px;"></div>
				<hr />
				
				<div style="width: 100%;height: auto;line-height: 56px; font-family: arial;color: #666666;">
					Safety and side effects
				</div>
				<div style="width: 100%;height: auto;font-family: arial;color: #A0A0A0;line-height: 20px;">
					When taken at appropriate doses, oral vitamin C supplements are generally considered safe. 
					Side effects tend to be dose-related. Oral vitamin C supplements can cause:
				</div>
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto; font-family: arial;color: #A0A0A0;line-height: 20px;">
					<div id="dot">Nausea</div>
					<div id="dot">Vomiting</div>
					<div id="dot">Heartburn</div>
					<div id="dot">Inflammation that might damage the esophagus (esophagitis)</div>
					<div id="dot">A blockage that keeps food or liquid from passing through your small intestine or large intestine (intestinal obstruction)</div>
					<div id="dot">Stomach cramps</div>
					<div id="dot">Fatigue</div>
					<div id="dot">Headache</div>
					<div id="dot">Sleepiness</div>
					<div id="dot">Diarrhea</div>
					<div id="dot">Insomnia</div>
					<div id="dot">Skin flushing</div>
				</div>
				<div style="width: 100%;height: 40px;"></div>
				<div style="width: 100%;height: auto;font-family: arial;color: #A0A0A0;line-height: 20px;">
					In some people, oral use of vitamin C can cause kidney stones. Long-term use of oral vitamin C supplements over 2,000 milligrams a day increases the risk of significant side effects.
				</div>
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;font-family: arial;color: #A0A0A0;line-height: 20px;">
					Tell your doctor that you're taking vitamin C supplements before having any medical tests. High levels of vitamin C might interfere with the results of certain tests, such as stool tests for occult blood or glucose screening tests.
				</div>
				<div style="width: 100%;height: 40px;"></div>
				
			</div>
			
			</div>
			<div id="interactions" style="width: 100%;height: auto;overflow: hidden; background-color: #F4F4F4;">
				<div style="width: 90%;height: auto;margin: 0 auto;">
					<div style="font-family: arial; color: #666666; line-height: 80px;">
						Interactions
					</div> 
				<div style="width: 100%;height: auto; font-family: arial;color: #A0A0A0;">
					Possible interactions include:
				</div>
				<div style="width: 100%;height: 30px;"></div>
				<div style="width: 100%;height: auto;line-height: 20px; font-family: arial;color: #A0A0A0;">
					<div id="dot">Aluminum. Taking vitamin C can increase your absorption of aluminum from medications containing aluminum, such as phosphate binders. This can be harmful for people with kidney problems.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Chemotherapy. There is concern that use of antioxidants, such as vitamin C, during chemotherapy might reduce the drug's effect.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Estrogen. Taking vitamin C with oral contraceptive or hormone replacement therapy might increase your estrogen levels.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Protease inhibitors. Oral use of vitamin C might reduce the effect of these antiviral drugs.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Statins and niacin. Taking vitamin C with niacin, which might benefit people with high cholesterol, could reduce niacin's effect.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Warfarin (Coumadin, Jantoven). High doses of vitamin C might reduce your response to this anticoagulant.</div>
				</div>
				<div style="width: 100%;height: 30px;"></div>
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

