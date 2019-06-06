<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <title>Sam-e introduction</title>
<style>
.vertical-line {
height: 150px;
border-left: 2px solid;
margin-left: 50px;
border-image: -webkit-linear-gradient( #666666 , #666666) 30 30;
border-image: -moz-linear-gradient( #666666 , #666666) 30 30;
border-image: linear-gradient( #666666 , #666666) 30 30;
}

.vertical-circle {
    float: left;
    width: 16px;
    height: 16px;
    border:2px solid white;
    background-color: #0071BC;
    -webkit-border-radius: 100px;
}
.vertical-text{
    float:left;margin-top:-7px;
}
</style>
		<style>
			div[id=dot]:before{
				content:"●";
				color: #207EBF;;
				font-size: 0.3rem;
				margin-right: 8px;
			}
		</style>
	</head>
	<body style="padding: 0px;margin: 0px;">
	<div id="sam-e" style="width: 100%;height: auto;">
		<jsp:include page="header.jsp"/>
		<div class="same-pic"style="width: 100%;height: auto;margin: 0 auto;">
			<img src="static/images/hm2.jpg" style="width: 100%;height: auto;"/>
		</div>
		<div class="same-box"style="width: 100%;height: auto;margin: 0 auto;">
			<img src="static/images/sam1.png"style="width: 100%;height: auto;" />
			<div style="width: 100%;height: auto;">
				<div style="width: 96%;height: auto;margin: 0 auto;font-family: arial; color: #666666;">
					<div style="width: 100%;height: 20px;"></div>
							<div id="dot" style="font-size: 18px">SAM-e is a nutritional supplement not a drug.</div>
							<div style="width: 100%;height: 20px;"></div>
					
						<div  id="dot" style="font-size: 18px">SAM-e (S-Adenosyl Methionine) is a chemical found naturally in the body.</div>
						<div  style="width: 100%;height: 20px;"></div>
				
						<div  id="dot" >SAM-e is considered the most important methyl donor<br /> in the body.</div>
						<div style="width: 100%;height: 20px;"></div>
					
						<div  id="dot">The level of SAM-e decreases as the body ages. Concomitantly, a number of health issues, including mood, joint, and liver disorders are likely to occur. </div>
						<div style="width: 100%;height: 20px;"></div>
					
						<div  id="dot" >All SAM-e molecules have two forms: the SS (active) isomer and the RS (inactive) isomer. </div>
						<div style="width: 100%;height: 20px;"></div>
					
						<div  id="dot">While SAM-e comes in two stable salt forms; tosylate<br />  and butane disulphanate, only the tosylate form is <br /> backed by twenty years of research for safety and effectiveness. </div>
						<div style="width: 100%;height: 20px;"></div>
					
				</div>
			</div>
		</div>
		
		<div class="intro-sam"style="width: 100%;height: auto; background-color: #F4F4F6;">
					<div style="width: 96%;height: auto;margin: 18px auto;">
						<div style="width: 100%;height: auto; font-family: arial;font-weight:600;">
							According to clinical studies,sam-e can improve emotional health, joint relaxation and liver function
						</div>
					</div>
						<div style="width: 100%;height: auto;">
						<img src="static/images/sam2.png"style="width: 100%;height: auto;"/>
						</div>
						<div style="width: 100%;height: 20px;"></div>
						<div style="clear: both;"></div>
						<div style="width: 100%;height: auto; background-color: #F4F4F6;">
							<div style="width: 88%;height:auto;margin: 0 auto;border-top: 9px; align-content: center;color: #666666; background-color: #C1E1E8; border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;">
								In March of 2003, the AHRQ (Agency for Healthcare Research and Quality) a division of the United States Health and Human Services, released the findings of a major study on SAM-e. <br />
							<i style="color: #4A9ACA;"><a href="https://www.ncbi.nlm.nih.gov/books/NBK11886"  target="_blank">https://www.ncbi.nlm.nih.gov/books/NBK11886/</a></i>
							</div>
							<div style="width:0;height:0;border-width:13px 16px 0;border-style:solid;border-color:#C1E1E8 transparent transparent;margin:0 auto;position:relative;"></div>
							<div style="width: 100%;height: auto;">
								<div style="width: 95%;height: auto; color: #666666;margin: 0 auto;font-family: arial;">
									
									<div id="dot" >SAM-e is as effective as conventional prescription medications in the treatment of depression</div>
									<div style="width: 100%;height: 20px;"></div>
									<div  id="dot" >SAM-e is as effective as standard prescription medications (NSAIDs) in the treatment of osteoarthritis</div>
									<div style="width: 100%;height: 20px;"></div>
									<div  id="dot" >SAM-e has significant benefits for patients suffering from various liver diseases</div>
									<div style="width: 100%;height: 20px;"></div>
									<div id="dot" >Natural SAM-e was not found to have any noticeable side effects</div>
								</div>
							</div>
						</div>
				</div>
				
		<div class="spot-sam"style="width: 100%;height: auto;">
			<div style="width: 100%;height: auto;margin: 0 auto;">
				<div style="width: 96%;height: auto;margin: 0 auto;font-weight: 600;line-height: 100px; font-family: arial; align-content: center;">
					SAM-e in the spotlight
				</div>
			</div>
			
	
		<%--<div class="vertical-line"style="height: 70px;"></div>	--%>
		<%--<div style="width: 10%;height: auto;float: left;">2013</div>--%>
		<%--<div class="vertical-circle"style="width: 4%;float: left;" ></div>--%>
		<%--<div class="vertical-text"style="width: 78%;height: auto;float: left; margin: 0 auto;">Arthritis Today Magazine (October Issue) lists SAM-e as best supplement for osteoarthritis.--%>
		<%--</div>--%>
		<%--<div class="vertical-line"></div>--%>
		<%--<div style="width: 10%;height: auto;float: left;">2013</div>--%>
		<%--<div class="vertical-circle"style="width: 4%;float: left;"></div>--%>
		<%--<div class="vertical-text"style="width: 78%;height: auto;float: left; margin: 0 auto;">Arthritis Research UK study gives SAM-e the highest grade for oral supplement for osteoarthritis relief.--%>
		<%--</div>--%>
		<%--<div class="vertical-line"></div>--%>
		<%--<div style="width: 10%;height: auto;float: left;">2010</div>--%>
		<%--<div class="vertical-circle"style="width: 4%;float: left;"></div>--%>
		<%--<div class="vertical-text"style="width: 78%;height: auto;float: left; margin: 0 auto;">The study from Massachusetts General Hospital demonstrated that SAM-e combined with antidepressants significantly increased remission rates in patients with major depression who failed conventional therapy.--%>
						<%--<i style="color: #2E86C3;"><a href="https://ajp.psychiatryonline.org/doi/full/10.1176/"  target="_blank"> https://ajp.psychiatryonline.org/doi/full/10.1176/</a><br /> appi.ajp.2009.09081198</i>--%>
		<%--</div>--%>
		<%--<div class="vertical-line"style="height: 220px;"></div>--%>
		<%--<div style="width: 10%;height: auto;float: left;">2009</div>--%>
		<%--<div class="vertical-circle"style="width: 4%;float: left;"></div>--%>
		<%--<div class="vertical-text"style="width: 78%;height: auto;float: left; margin: 0 auto;">A Korean study found that SAM-e is as effective as the NSAID Nabumetone. --%>
						<%--<i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/20110025"  target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/20110025 </a></i>--%>
		<%--</div>--%>
		<%----%>
		<%--<div class="vertical-line"></div>--%>
		<%--<div style="width: 10%;height: auto;float: left;">2004</div>--%>
		<%--<div class="vertical-circle"style="width: 4%;float: left;"></div>--%>
		<%--<div class="vertical-text"style="width: 78%;height: auto;float: left; margin: 0 auto;"> The study done by University of California showed that SAM-e is as effective as Celecoxib, a prescription drug for Arthritis.--%>
			<%--<i><a href="https://www.ncbi.nlm.nih.gov/pubmed/15102339"  target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/15102339</a> </i> --%>
		<%--</div>--%>

			<div style="width: 100%;height: auto;">
				<img src="static/images/hm-same.png" style="width: 100%;height: auto;">
			</div>

		</div>
		</div>
		<div style="width: 100%;height: 100px;"></div>
		<div class="sam-link"style="width: 100%;height: auto;">
			<div style="width: 100%;height: auto;">
			<div style="width: 96%;height: auto;font-weight: 600; "> 
				Basic research on SAM-e on human cell lines and animals which were not yet followed by clinical studies
			</div>	
			</div>
			<div style="width: 100%;height: 50px;"></div>
			<div style="width: 100%;height: auto;line-height: 18px;">
			<div style="width: 100%;height: auto;">
				<div style="width: 92%;height: auto; border-bottom:1px solid #CBCBCC;margin: 0 auto; ">
					
						<div id="dot" style="color: #666666;font-family: arial;">
							SAM-e was shown to block breast cancer growth and metastasis in experiments on breast cancer cel lines and animals.
						</div>
						<i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/29435170"  target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/29435170</a></i>
					    <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/15150277"  target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/15150277</a></i>
						<p></p>
				</div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 92%;height: auto;border-bottom:1px solid #CBCBCC;margin: 0 auto;">
					
						<div id="dot"  style="color: #666666;font-family: arial;">
							SAM-e was shown to block growth of liver cancer cells.
						</div>
						<i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/29340097"  target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/29340097</a></i>
						<p></p>
				</div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 92%;height: auto;border-bottom:1px solid #CBCBCC;margin: 0 auto; ">
				
						<div id="dot"  style="color: #666666;font-family: arial;">
							SAM-e was shown to  block growth of prostate cancer cells.
						</div>
						<i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/25631332"  target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/25631332</a></i>
					    <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/16982764"  target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/16982764</a></i>
						<p></p>
				</div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 92%;height: auto;border-bottom:1px solid #CBCBCC;margin: 0 auto;">
					
						<div  id="dot" style="color: #666666;font-family: arial;">
							SAM-e was shown to inhibit formation of liver cancer in rats and colorectal cancer in mice.
						</div>
						<i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/23073625" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/23073625</a></i>
					    <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/19444874" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/19444874</a></i>
					    <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/22159228" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/22159228</a></i>
						<p></p>
				</div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 92%;height: auto;border-bottom:1px solid #CBCBCC;margin: 0 auto;">
				
						<div id="dot"  style="color: #666666;font-family: arial;">
							SAM-e was shown to improve memory in a mouse model of Alzheimer disease when taken before onset of symptoms.
						</div>
						<i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/27681803" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/27681803</a></i>
					    <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/22221883" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/22221883</a></i>
					    <p></p>
					</ul>
				</div>
			</div>
		</div>
		</div>
		<div style="width: 100%;height: auto;">
			<img src="static/images/sam3.png" style="width: 100%;height: auto;" />
		</div>
		<div class="why-sam"style="width: 100%;height: auto;">
			<div style="width: 100%;height: auto;ont-family: arial;line-height: 77px; margin: 0 auto;font-weight: 600;">
				<div style="width: 96%;height: auto;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Why Chose Our SAM-e?
				</div> 
			</div>
			<div style="width: 100%;height: auto;color:#207EBF ;">
				<div style="width: 96%;height: auto;margin: 0 auto; color: #666666;">
						<div id="dot" >
							Our SAMe is manufactured to the highest standards, using the original Italian method (salt - tosylate disulfate)
						</div> 
					
					<div style="width: 100%;height: 20px;"></div>
					
					<div  id="dot" >
						Our SAMe products’ starting raw materials consistently test at the highest SS to RS isomer ratio on the market: <br/> SS isomer >80% / RS isomer <20%.
					</div>
					
					<div style="width: 100%;height: 20px;"></div>
					
					<div  id="dot" >
						Our SAMe tablets are enteric coated for optimum absorption by the body
					</div>	
					
					<div style="width: 100%;height: 20px;"></div>
					
					<div id="dot" >
						Our SAMe tablets are sealed in blister packs to ensure freshness
					</div>	
					
					<div style="width: 100%;height: 20px;"></div>
					
					<div id="dot" >
						Our SAMe is made to guaranteed purity and potency standards
					</div>
					
					<div style="width: 100%;height: 20px;"></div>
					
					<div id="dot" >
						No Artifical Flavors, Dairy Free, No Preservatives, Allergen Free, No Yeast or Gluten, Kosher Certified
					</div>
					
					<div style="width: 100%;height: 20px;"></div>
					
					<div id="dot"  >
						Our SAMe tablets have been tested for a minimum full two year stability rating
					</div>
				</div>
				
			</div>
		</div>
		<div class="caution"style="width: 100%;height: auto;margin-top: 25px;">
			<div style="width: 100%;height: auto;font-family: arial;margin: 0 auto;font-weight: 600;line-height: 77px; ">
				&nbsp;&nbsp;&nbsp;&nbsp;Caution when taking SAM-e
			</div>
			<div style="width: 100%;height: auto;font-family: arial;color: #666666;">
					<div style="width: 96%;height: auto;margin: 0 auto;">
						<div id="dot">
							SAM-e should not be used in conjunction or in place of treatment recommended by your doctor. 
						</div>
						<div style="width: 100%;height: 20px;"></div>
				
						<div id="dot">
							If you're taking medication and considering taking SAM-e as supplementary, consulate your doctor to make sure that SAM-e has no interaction with the medication that you are taking.
						</div>
						<div style="width: 100%;height: 20px;"></div>
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
