<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title></title><meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>VitamineA introduction</title>
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
		<jsp:include page="header.jsp"/>
			<div style="width:100%;height: auto;">
			
				<a href="cart/index.jhtml"><img src="static/images/A-09.png"style="width: 100%;height: auto;"/></a>
			</div>
		
			<div id="overview"style="width: 100%;height: auto;">
				<div style="width: 90%;height: auto; margin: 0 auto; ">
					<div style="font-family: arial;line-height: 60px; color: #666666;">
						Overview
					</div>
					<div style="height: auto;font-family: arial;line-height: 20px; color: #A0A0A0;">
						Vitamin A (retinol, retinoic acid) is a nutrient important to vision, growth, cell division, reproduction and immunity. Vitamin A also has antioxidant properties.
						 Antioxidants are substances that might protect your cells against the effects of free radicals — molecules produced when your body breaks down food or is exposed to tobacco smoke and radiation. 
						 Free radicals might play a role in heart disease, cancer and other diseases.
					</div>
					<div style="width: 100%;height: auto;">
						<img src="static/images/A-10.png"style="width: 100%;height: auto;"/>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: auto;background-color: #F4F4F4;overflow: hidden;">
				<div style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div style="accelerator: 100%;height: auto;line-height: 20px; font-family: arial;color:#A0A0A0 ;">
						Vitamin A is found in many foods, such as spinach, dairy products and liver.
						 Other sources are foods rich in beta-carotene, such as green leafy vegetables, carrots and cantaloupe. 
						Your body converts beta-carotene into vitamin A.
					</div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 30%;height: auto;float: left;">
							<img src="static/images/A-11.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 30px;float: left;"></div>
						<div style="width: 30%;height: auto;float: left;">
							<img src="static/images/A-12.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 30px;float: left;"></div>
						<div style="width: 30%;height: auto;float: left;">
							<img src="static/images/A-14.png"style="width: 100%;height: auto;"/>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 90%;height: auto;margin: 0 auto;color: #A0A0A0;line-height: 20px; font-family: arial;">
					As an oral supplement, vitamin A mainly benefits people who have a poor or limited diet or who have a condition that increases the need for vitamin A,
					 such as pancreatic disease, eye disease or measles. 
					If you take vitamin A for its antioxidant properties, keep in mind that the supplement might not offer the same benefits as naturally occurring antioxidants in food.
				</div>
				<div style="width: 100%;height: 40px;"></div>
			</div>
			<div id="evidence"style="width: 100%;height: auto;overflow: hidden;background-color: #FCF2E6;">
				<div style="width: 98%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;font-family: arial;line-height: 86px;color: #666666;">
						Evidence
					</div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;">
							<img src="static/images/A-15.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Acne. </strong>Large doses of oral vitamin A supplements don't appear to affect acne. 
						</div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 195px;">
							<img src="static/images/A-16.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Age-related macular degeneration 
							</strong> A large clinical trial showed that people at high risk of advanced age-related macular degeneration reduced their risk of developing the condition by 25 percent by taking a specific combination of vitamins that included beta-carotene.
							 It's not entirely clear what role beta-carotene played.
						</div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 200px;">
							<img src="static/images/A-13.png" style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Cancer.
							</strong>The association between use of vitamin A supplements and reduced risk of lung, prostate and other types of cancer is unclear.
						</div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 160px;">
							<img src="static/images/A-17.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Measles. 
							</strong>Vitamin A supplements are recommended for children with measles who are at an increased risk of vitamin A deficiency. 
							Research suggests that supplementation might reduce death due to measles.
						</div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 290px;">
							<img src="static/images/A-18.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: 100px;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Vitamin A deficiency.
							</strong>Vitamin A supplements are recommended for children with measles who are at an increased risk of vitamin A deficiency. 
							Research suggests that supplementation might reduce death due to measles.
							People who have low levels of vitamin A appear to benefit most from vitamin A supplements. 
							This kind of deficiency isn't common in the United States. 
							Vitamin A deficiency causes anemia and dry eyes.
						</div>
						
					</div>
					<div style="clear: both;"></div>
						<div style="width: 100%;height: auto;font-family: arial;color: #A0A0A0;">
							Beyond use as an oral supplement, vitamin A is used in topical creams to reduce fine wrinkles, splotches and roughness and treat acne.
						</div>
						<div style="width: 100%;height: 20px;"></div>
				</div>
				
			</div>
			<div style="clear: both;"></div>
			<div id="take" style="width: 100%;height: auto;overflow: hidden;">
				<div style="width: 90%;height: auto;margin: 0 auto;">
					<div style=" font-family: arial;color: #666666;line-height: 70px;"> 
						Our take
					</div>
				<div style="width:100%;height: auto;font-family: arial;; font-weight: 600px;">
					Caution
				</div>
				<div style="width: 100%;height: 10px;"></div>
				<div style="width: 100%;height: auto;line-height: 20px;color: #A0A0A0; font-family: arial;">
					A healthy and varied diet will provide most people with enough vitamin A. If you're interested in the antioxidant properties of vitamin A, food sources are best.
					 It's not clear if vitamin A supplements offer the same benefits as naturally occurring antioxidants in food. 
					Too much vitamin A can be harmful and excess vitamin A during pregnancy has been linked to birth defects.
				</div>
				<div style="width: 100%;height: 10px;"></div>
				<hr />
				
				<div style="width: 100%;height: auto;line-height: 56px; font-family: arial;color: #666666;">
					Safety and side effects
				</div>
				<div style="width: 100%;height: auto;font-family: arial;color: #A0A0A0;line-height: 20px;">
					Too much vitamin A can be harmful. Even a single large dose — over 200,000 mcg — can cause:
				</div>
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto; font-family: arial;color: #A0A0A0;line-height: 16px;">
					<div id="dot">Nausea</div>
					<div id="dot">Vomiting</div>
					<div id="dot">Vertigo</div>
					<div id="dot">Blurry vision</div>
				</div>
				<div style="width: 100%;height: auto;font-family: arial;color: #A0A0A0;line-height: 20px;">
					Taking more than 10,000 mcg a day of oral vitamin A supplements long term can cause:
				</div>
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto; font-family: arial;color: #A0A0A0;line-height: 20px;">
					<div id="dot">Bone thinning</div>
					<div id="dot">Liver damage</div>
					<div id="dot">Headache</div>
					<div id="dot">Diarrhea</div>
					<div id="dot">Nausea</div>
					<div id="dot">Skin irritation</div>
					<div id="dot">Pain in the joints and bone</div>
					<div id="dot">Nausea</div>
					<div id="dot">Birth defects</div>
				</div>
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;font-family: arial;color: #A0A0A0;line-height: 20px;">
					If you are or might become pregnant, talk to your doctor before taking vitamin A. Excess use of vitamin A during pregnancy has been linked to birth defects.
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
					<div id="dot">Anticoagulants. Oral use of vitamin A supplements while taking these medications used to prevent blood clots might increase your risk of bleeding.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Bexarotene (Targretin). Taking vitamin A supplements while using this topical cancer drug increases the risk of the drug's side effects, such as itchy, dry skin.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Hepatotoxic drugs. Taking high doses of vitamin A supplements can cause liver damage. Combining high doses of vitamin A supplements with other drugs that can damage the liver could increase the risk of liver disease.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Orlistat (Alli, Xenical). This weight-loss drug can decrease the absorption of food sources of vitamin A. Your doctor might suggest that you take a multivitamin with vitamin A and beta-carotene while taking this medication.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Retinoids. Don't use vitamin A supplements and these oral prescription drugs at the same time. This could increase the risk of high vitamin A blood levels.</div>
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
