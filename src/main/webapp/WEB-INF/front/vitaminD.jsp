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
		<title>VitamineD introduction</title>
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
				<a href="cart/index.jhtml"><img src="static/images/vd1.png"style="width: 100%;height: auto;"/></a>
			</div>
		
			<div id="overview"style="width: 100%;height: auto;">
				<div style="width: 90%;height: auto; margin: 0 auto; ">
					<div style="font-family: arial;line-height: 60px;font-weight: 600; color: #666666;">
						Overview
					</div>
					<div style="height: auto;font-family: arial;line-height: 20px; color: #A0A0A0;">
						<div >
							Vitamin D is necessary for building and maintaining healthy bones. That's because calcium, the primary component of bone, can only be absorbed by your body when vitamin D is present.
							 Your body makes vitamin D when direct sunlight converts a chemical in your skin into an active form of the vitamin (calciferol).
						</div>
						<div style="width: 100%;height: 20px;"></div>
						<div>
							Vitamin D isn't found in many foods, but you can get it from fortified milk,
							 fortified cereal, and fatty fish such as salmon, mackerel and sardines.
						</div>
					</div>
					<div style="width: 100%;height: auto;">
						<img src="static/images/vd2.png"style="width: 100%;height: auto;"/>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: auto;background-color: #F4F4F4;overflow: hidden;">
				<div style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;line-height: 20px; font-family: arial;color:#A0A0A0 ;">
						<div>
						The amount of vitamin D your skin makes depends on many factors, including the time of day, season, latitude and your skin pigmentation.
						 Depending on where you live and your lifestyle, vitamin D production might decrease or be completely absent during the winter months. 
						Sunscreen, while important, also can decrease vitamin D production.
						</div>
						<div style="width: 100%;height: 20px;"></div>
						<div>
							Many older adults don't get regular exposure to sunlight and have trouble absorbing vitamin D, so taking a multivitamin with vitamin D will likely help improve bone health.
							 The recommended daily amount of vitamin D is 400 international units (IU) for children up to age 12 months, 600 IU for ages 1 to 70 years, and 800 IU for people over 70 years.
						</div>
						</div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;">
					<div style="width: 90%;height: auto;margin: 0 auto;overflow: hidden;">
						<div style="width: 30%;height: auto;float: left;">
							<img src="static/images/vd3.png" style="width: 100%;height: auto;"/>
						</div>
							<div style="width: 5%;height: 30px;float: left;"></div>
						<div style="width: 30%;height: auto;float: left;">
							<img src="static/images/vd4.png"style="width: 100%;height: auto;"/></div>
							<div style="width: 5%;height: 30px;float: left;"></div>
						<div style="width: 30%;height: auto;float: left;">
							<img src="static/images/vd4.png"style="width: 100%;height: auto;"/></div>
					</div>
					</div>					
				</div>
			</div>
			<div id="evidence"style="width: 100%;height: auto;overflow: hidden;background-color: #FFFFFF;">
				<div style="width: 98%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;font-family: arial;line-height: 86px;font-weight: 600; color: #666666;">
						Evidence
					</div>
					<div style="width: 100%;height: auto;color: #A0A0A0;font-size: 12px;">
						Research on vitamin D use for specific conditions shows:
					</div>
					<div style="width: 100%;height: 20px;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 120px;">
							<img src="/static/images/vd5.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Cancer. </strong>
							 Research suggests that vitamin D, 
							 especially when taken with calcium, might help prevent certain cancers.
						</div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 141px;">
							<img src="static/images/vd6.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Cognitive health. </strong>
							Early research suggests that vitamin D might play a role in cognitive health. In one small study of adults age 60 years and older being treated for dementia,
							 researchers found that taking a vitamin D supplement helped improve cognitive function.
						</div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 160px;">
							<img src="static/images/vd7.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Inherited disorders. </strong>
							Vitamin D supplements can be used to help treat inherited disorders resulting from an inability to absorb or process vitamin D,
							 such as familial hypophosphatemia.
						</div>
					</div>
					
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 156px;">
							<img src="static/images/vd8.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Multiple sclerosis.</strong>
							 Research suggests that long-term vitamin D supplementation reduces the risk of multiple sclerosis.
						</div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 145px;">
							<img src="static/images/vd9.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Osteomalacia. </strong>
							Vitamin D supplements are used to treat adults with severe vitamin D deficiency, resulting in loss of bone mineral content, bone pain, muscle weakness and soft bones (osteomalacia).
						</div>
					</div>
						<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;">
						<div style="width: 20%;height: auto;float: left;line-height: 100px;">
							<img src="static/images/vd10.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 5%;height: 100px;float: left;"></div>
						<div style="width: 69%;height: auto;float: left;  font-family: arial;color: #A0A0A0;">
							<div style="width: 100%;height: 20px;"></div>
							<strong style="font-weight: 900;">Osteoporosis. </strong>
							Studies suggest that people who get enough vitamin D and calcium in their diets can slow bone mineral loss, help prevent osteoporosis and reduce bone fractures.
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
					Without vitamin D your bones can become soft, thin and brittle. Insufficient vitamin D is also connected to osteoporosis and some types of cancer.
					 If you don't get enough vitamin D through sunlight or dietary sources, you might need vitamin D supplements.
				</div>
				<div style="width: 100%;height: 10px;"></div>
				<hr />
				
				<div style="width: 100%;height: auto;line-height: 56px; font-family: arial;color: #666666;">
					Safety and side effects
				</div>
				<div style="width: 100%;height: auto;font-family: arial;color: #A0A0A0;line-height: 20px;">
					Taken in appropriate doses, vitamin D is generally considered safe.
				</div>
				<div style="width: 100%;height: 10px;"></div>
				<div style="width: 100%;height: auto;font-family: arial;color: #A0A0A0;line-height: 20px;">
					However, taking too much vitamin D can be harmful. Children age 9 years and older, adults, and pregnant and breast-feeding women who take more than 4,000 IU a day of vitamin D might experience:
				</div>
				<div style="width: 100%;height: 20px;;"></div>
				<div style="width: 100%;height: auto; font-family: arial;color: #A0A0A0;line-height: 20px;">
					<div id="dot">Nausea</div>
					<div id="dot">Vomiting</div>
					<div id="dot">Poor appetite</div>
					<div id="dot">Constipation</div>
					<div id="dot">Weakness</div>
					<div id="dot">Weight loss</div>
					<div id="dot">Confusion</div>
					<div id="dot">Disorientation</div>
					<div id="dot">Heart rhythm problems</div>
					<div id="dot">Heart rhythm problems</div>
					<div id="dot">Kidney damage</div>
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
					<div id="dot">Aluminum. Taking vitamin D and aluminum-containing phosphate binders long term might cause harmful levels of aluminum in people with kidney failure.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Anticonvulsants. The anticonvulsants phenobarbital and phenytoin (Dilantin, Phenytek) increase the breakdown of vitamin D and reduce calcium absorption.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Atorvastatin (Lipitor). Taking vitamin D might affect the way your body processes this cholesterol drug.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Calcipotriene (Dovonex). Don't take vitamin D with this psoriasis drug. The combination might increase the risk of too much calcium in the blood (hypercalcemia).</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Cholestyramine (Prevalite). Taking this weight-loss drug can reduce your absorption of vitamin D.</div>
					<div style="width: 100%;height: 30px;"></div>
					<div id="dot">Cytochrome P450 3A4 (CYP3A4) substrates. Use vitamin D cautiously if you're taking drugs processed by these enzymes.</div>
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
