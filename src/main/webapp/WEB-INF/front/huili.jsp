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
		<link rel="stylesheet" href="static/css/swiper.min.css" />
		<title>Dr. Hui Li</title>
		
		<!--局部移动浏览-->
		<style type="text/css">
	*{margin:0;padding:0;font-family: "微软雅黑";}
		.wrap{margin:0 auto;}
		.tabs{height:32px;background: #F4F4F4;width: 100%;padding-top: 8px;text-align: center}
		.tabs .part{display:block;float:left;width:33%;color:#666666;text-align:center;height: 20px;}
		.tabs .part:first-child{border-right: 0px solid #000000;}
		.tabs a{width:100px;display:block;color:#666666;text-align:center;margin:0 auto;font-size:16px;text-decoration:none;padding-bottom: 0px;}
		.tabs span.active a{color:#666666;border-bottom: 2px solid #000000;}
		.swiper-container{width:100%;border-top:0;margin-top:10px!important}
		.swiper-slide{width:100%;background:none;color:#666666;}
		p{text-align: center;}
</style>



		<style>
			div[id=dot]:before{
				content:"●";
				color: #207EBF;;
				font-size: 0.6rem;
				margin-right: 8px;
			}
		</style>
		<style>
			div[id=din]:before{
				content:"▍";
				color: #27809D;;
				font-size: 1.6rem;
				margin-right: 8px;
			}
		</style>
		<!--tab页面切换-->

 <!--Year line-->
 <style>
.vertical-line {
height: 150px;
border-left: 2px solid;
margin-left: 66px;
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
	</head>
	<body style="padding: 0;margin: 0;">
		<div id="container" style="width: 100%;height: 100%;">
		<jsp:include page="header.jsp"></jsp:include>
			<div id="header"style="width: 100%;height: 100%;">
				<div style="width: 100%;height: 28px;margin: 0 auto;"></div>
				<div style="width: 100%;height: 142px;overflow: hidden;margin: 0 auto;">
					<div style="width: 33%;height: 80px;float: left;"></div>
					<div style="width: 33%;height: 100px;float: left; ">
						<img src="static/images/huili1-1.png"style="width: 100%;height: auto;"/>
					</div>
					<div style="width: 30%;height: auto;float: left;"></div>
				</div>
				<div style="clear: both;"></div>
				<div style="width: 100%;height: auto;text-align: center;font-family: arial;color: #666666;font-weight: 600;line-height: 29px;">
					<strong>Hui Li PhD</strong><br />
					Lab Manager <br/> HKG Epitherapeutics, Hong Kong
				</div>
				<div style="width: 100%;height: 20px;"></div>
				</div>
<div id="pro-stem"style="width: 100%;height: auto;background-color: #F7F7F9;margin: 0 auto;">
				<div style="width: 96%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: auto;line-height: 50px;font-weight: 700;">Professional Experiences</div>
			
					<div style="width: 100%;height: auto;">
						<img  src="static/images/huili-2.png"style="width: 100%;height: auto;">
					</div>
				</div>
			</div>

        <div class="pg-main">
	<div id="wrapper">
		<!--header end-->
		<div class="wrap">
			<div class="tabs">
				<span class="part active"style="border-right: 1px solid #666666">
				<a href="#publication" hidefocus="true" >Publications</a>
				</span>
				
				<span class="part" style="border-right: 1px solid #666666">
					<a href="#honor" hidefocus="true">Honors</a>
				</span>
				
				<span class="part">
				<a href="#" hidefocus="true">Conferences</a>
				</span>
			</div>

			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide swiper-slide-visible swiper-slide-active">
						<div class="content-slide">
       							 <div id="publication" style="width: 90%;height: auto;margin: 0 auto;line-height: 22px">
						<div style="width: 100%;height: 40px;"></div>
							<ul>
								<li><i style="font-weight: 600;">Hui Li</i>, Bing Li and Louise Larose. IRE1α links Nck1 deficiency to attenuated PTP1B expression in HepG2 cells. <i style="font-weight: 600;">Cellular Signaling</i>. 2017, 36: 79-90.</li>
								<div style="width: 100%;height: 20px;"></div>
								<li><i style="font-weight: 600;">Hui Li</i>, Julie Dusseault and Louise Larose. Nck1 depletion induces activation of the PI3K/Akt pathway by attenuating PTP1B protein expression.<i style="font-weight: 600;"> Cell Communication and Signaling</i>. 2014,12: 71.</li>
								<div style="width: 100%;height: 20px;"></div>
								<li><i style="font-weight: 600;">Hui Li</i>, Qing Ye, Yunman Li. Hepatocellular carcinoma induced specific angiogenesis. <i style="font-weight: 600;">Chinese Clinical Oncology</i>. 2009, 14(4): 369-372.</li>
								<div style="width: 100%;height: 20px;"></div>
								<li>Naifeng Liu, Guoqiu Wu,<i style="font-weight: 600;"> Hui Li</i>, Linxian Li, Honglei Xing, Cheng Zhang, Huixia Lu. A novel peptide isolated from phage display peptides library recognized by an antibody against connective tissue growth factor.<i style="font-weight: 600;"> International Immunopharmacology</i>. 2009, 9(3): 291-297.</li>
								<div style="width: 100%;height: 20px;"></div>
								<li>Guoqiu Wu, Jiaxuan Ding,<i style="font-weight: 600;"> Hui Li</i>, Linxian Li, Rui Zhao, Zilong Shen. Effects of cations and PH on antimicrobial activity of Thanatin and s-Thanatin against Escherichia coli ATCC25922 and B. subtilis ATCC 21332.<i style="font-weight: 600;"> Current Microbiology</i>. 2008, 57: 552-557.</li>
							</ul>
						</div>
       						 
						</div>
					</div>
					<div class="swiper-slide">
						<div class="content-slide">
								<div style="width: 100%;height: auto">
								<img src="static/images/huili-3.png"style="width: 100%;height: auto;">
								</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="content-slide">
						<div id="conference" style="width: 90%;height: auto;margin: 0 auto;line-height: 22px">
						<div style="width: 100%;height: 40px;"></div>
							<ul>
								<li><i style="font-weight: 600;">Hui Li</i>, Bing Li and Louise Larose. Silencing Nck1 prevents activation of the IRE1α-JNK-miR-122 pathway that controls PTP1B expression. 2015.<i style="font-weight: 600;"> McGill Endocrine Retreat</i>. Montreal, Canada.</li>
								<div style="width: 100%;height: 20px;"></div>
								<li><i style="font-weight: 600;">Hui Li</i> and Louise Larose. The adaptor protein Nck1 negatively regulates the PI3K/Akt pathway through protein tyrosine phosphatase 1B. 2014. <i style="font-weight: 600;">McGill Endocrine Retreat</i>. Montreal, Canada.</li>
								<div style="width: 100%;height: 20px;"></div>
								<li><i style="font-weight: 600;">Hui Li</i> and Louise Larose. Identification of the adaptor protein Nck1 as a negative regulator of the PI3K/Akt pathway through PTP1B and IRE1α. 2013. <i style="font-weight: 600;">Canadian Diabetes Association Professional Conference</i>. Montreal, Canada.</li>
								<div style="width: 100%;height: 20px;"></div>
								<li><i style="font-weight: 600;">Hui Li</i> and Louise Larose. Akt phosphorylation/activation is modulated by the adaptor protein Nck1 through its ability to regulate the Endoplasmic Reticulum (ER) stress sensor IRE1α. 2012.<i style="font-weight: 600;"> McGill Endocrine Retreat</i>. Montreal, Canada. (Poster Award)</li>
								<div style="width: 100%;height: 20px;"></div>
								<li><i style="font-weight: 600;">Hui Li</i> and Louise Larose. Nck1—an adaptor protein modulating expression of the Endoplasmic Reticulum (ER) stress sensor IRE1α. 2012.<i style="font-weight: 600;"> Experimental Biology 2012</i>, San Diego, USA.</li>
							</ul>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

        <div style="font-size: 10px;color: #E8E8E8;" >
        	<hr style="height: 10px; font-size: 30px;color: #000000;"/>
        </div>
        <div id="paper"style="width: 100%;height: auto;">
        	<div style="width: 100%;height: auto;background-color: #F4F4F4;">
        		<div style="width: 90%;height: auto;margin: 0 auto; font-weight: 600;font-family: arial;">
        			<div id="din"><span style="font-weight: 700;color: #27809D;font-size: 18px;line-height: 50px;">Published  papers</span></div> 
        		</div>
        	</div>
        	<div style="width: 100%;height: auto;background-color: #27809D;overflow: hidden;">
        		<div style="width: 100%;height: 20px;"></div>
        		<div style="width: 90%;height: auto;font-family: arial;font-weight: 500;color: #FFFFFF; line-height: 20px; margin: 0 auto;">
        		
        			<div style="width: 100%;height: auto;">
        				<a href="https://www.sciencedirect.com/science/article/pii/S0898656817301183">
        				 <div style="width: 100%;height: auto;float: left;color:#FFFFFF"> IRE1α links Nck1 deficiency to attenuated PTP1B expression in HepG2 cells. 
    Cellular Signaling. 2017; 
</div>
        				</a> 
        				
        			</div>
        			<div style="width: 100%;height: 80px;"></div>
        			<div style="width: 100%;height: auto;">
        			<a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4236421/">
        				<div style="width: 1-0%;height: auto;float: left;color:#FFFFFF">Nck1 depletion induces activation of the PI3K/Akt pathway by attenuating 
    PTP1B protein expression. Cell Communication and Signaling. 2014; 
</div>
        			</a>
        				
        			</div>
        			
        			<div style="width: 100%;height: 80px;"></div>
        			<div style="width: 100%;height: auto;">
        			
        				<div style="width: 100%;height: auto;float: left;color:#FFFFFF">Hepatocellular carcinoma induced specific angiogenesis. Chinese Clinical 
    Oncology. 2009;</div>
        
        		
        			</div>
        			<div style="width: 100%;height: 60px;"></div>
        			<div style="width: 100%;height: auto;">
        				<a href="https://www.sciencedirect.com/science/article/pii/S1567576908003548">
        				<div style="width: 100%;height: auto;float: left;color:#FFFFFF">A novel peptide isolated from phage display peptides library recognized by 
 						   an antibody against connective tissue growth factor. International  Immunopharmacology. 2009;</div>
        				</a>
        	
        			</div>
        			<div style="width: 100%;height: 100px;"></div>
        			<div style="width: 100%;height: auto;">
        				<a href="https://link.springer.com/article/10.1007%2Fs00284-008-9241-6">
        				<div style="width: 100%;height: auto;float: left;color:#FFFFFF"> Effects of cations and PH on antimicrobial activity of Thanatin and s-Thanatin 
   						 against Escherichia coli ATCC25922 and B. subtilis ATCC 21332. Current Microbiology. 2008.</div>
        				</a>
        	
        			</div>
        			<div style="width: 100%;height: 80px;"></div>
        			
        			
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
	<!--局部滚动页面js代码-->
<script type="text/javascript" src="static/js/zepto.min.js"></script>
<script type="text/javascript" src="static/js/idangerous.swiper.min.js"></script>
<script type="text/javascript">
	$(function() {

var tabsSwiper;
tabsSwiper = new Swiper('.swiper-container', {
	speed : 500,
	onSlideChangeStart : function() {
		$(".tabs .active").removeClass('active');
		$(".tabs span").eq(tabsSwiper.activeIndex).addClass('active');
	}
});

$(".tabs span").on('touchstart mousedown', function(e) {
	e.preventDefault()
	$(".tabs .active").removeClass('active');
	$(this).addClass('active');
	tabsSwiper.swipeTo($(this).index());

});

$(".tabs span").click(function(e) {
	e.preventDefault();
});


});//end
</script>
	</body>
</html>
