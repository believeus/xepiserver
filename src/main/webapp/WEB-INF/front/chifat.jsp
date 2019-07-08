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
	<title> Chi Fat Wong</title>

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
				<img src="static/images/chifat-1.png"style="width: 100%;height: auto;"/>
			</div>
			<div style="width: 30%;height: auto;float: left;"></div>
		</div>
		<div style="clear: both;"></div>
		<div style="width: 100%;height: auto;text-align: center;font-family: arial;color: #666666;font-weight: 600;line-height: 29px;">
			<strong>Chi Fat Wong Ph.D.</strong><br />
			Senior Scientist <br/><i style="font-weight: 600;"> HKG epiTHERAPEUTICS, Hong Kong</i>
		</div>
		<div style="width: 100%;height: 20px;"></div>
	</div>
	<div id="pro-stem"style="width: 100%;height: auto;background-color: #F7F7F9;margin: 0 auto;">
		<div style="width: 96%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;line-height: 50px;font-weight: 700;">Professional Experiences</div>

			<div style="width: 100%;height: auto;">
				<img  src="static/images/chifat-2.png"style="width: 100%;height: auto;">
			</div>
		</div>
	</div>



	<div style="font-size: 10px;color: #E8E8E8;" >
		<hr style="height: 10px; font-size: 30px;color: #000000;"/>
	</div>
	<div id="paper"style="width: 100%;height: auto;">
		<div style="width: 100%;height: auto;background-color: #F4F4F4;">
			<div style="width: 90%;height: auto;margin: 0 auto; font-weight: 600;font-family: arial;">
				<div id="din"><span style="font-weight: 700;color: #27809D;font-size: 18px;line-height: 50px;">Published papers</span></div>
			</div>
		</div>
		<div style="width: 100%;height: auto;background-color: #27809D;overflow: hidden;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 96%;height: auto;font-family: arial;font-weight: 500;color: #FFFFFF; line-height: 20px; margin: 0 auto;">

				<div style="width: 100%;height: auto;">
					<a href="https://academic.oup.com/gbe/article/6/12/3344/549730">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">Li J*, Wong, C.F.*, Wong M.T., Huang, H., Leung F.C. (2014) Modularized evolution in archaeal methanogens phylogenetic forest.<i>Genome Bio
							Evol</i> , 6(12), 3344. doi: 10.1093/gbe/evu259.</div>
					</a>

				</div>
				<div style="width: 100%;height: 80px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="http://cis.hku.hk/publication.html">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">Bao X, Wang Y, Li X, Li XM, Liu Z, Yang T, Wong CF, Zhang J, Hao Q, Li XD. (2014) Identification of 'erasers' for lysine crotonylated histone marks
							using a chemical proteomics approach.<i>Elife</i> , Nov 4;3. doi: 10.7554/eLife.02999.</div>
					</a>

				</div>

				<div style="width: 100%;height: 120px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.ncbi.nlm.nih.gov/pubmed/25079268">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">Niu H, Leung DY, Wong C, Zhang T, Chan M, Leung FC. (2014) Nitric oxide removal by wastewater bacteria in a biotrickling filter.<i> J Environ Sci
							(China)</i>, 26(3), 555. doi: 10.1016/S1001-0742(13)60456-8.</div>
					</a>

				</div>
				<div style="width: 100%;height: 110px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.researchgate.net/publication/257075402_Comparative_Genome_Analysis_of_Enterobacter_cloacae">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">Liu W-Y, Wong C-F, Chung KM-K, Jiang J-W, Leung FC-C (2013) Comparative Genome Analysis of Enterobacter cloacae.<i>PLoS ONE 8(9)</i> : e74487.
							doi:10.1371/journal.pone.0074487</div>
					</a>

				</div>
				<div style="width: 100%;height: 110px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://jb.asm.org/content/194/22/6326.full?related-urls=yes&legid=jb;194/22/6326">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF"> Wong, C. F., Niu, H., Jiang, J., Li, J., Chan, C. M., Leung, D. Y., & Leung, F. C. (2012). Genome Sequence of Pseudomonas mendocina DLHK,
							Isolated from a Biotrickling Reactor.<i> J Bacteriol</i>, 194(22), 6326. doi: 10.1128/JB.01618-12</div>
					</a>

				</div>
				<div style="width: 100%;height: 120px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://jb.asm.org/content/194/21/5965.full">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">Liu, W. Y., Chung, K. M., Wong, C. F., Jiang, J. W., Hui, R. K., & Leung, F. C. (2012). Complete Genome Sequence of the Endophytic Enterobacter
							cloacae subsp. cloacae Strain ENHKU01.<i> J Bacteriol</i>, 194(21), 5965. doi: 10.1128/JB.01394-12</div>
					</a>

				</div>

				<div style="width: 100%;height: 80px;"></div>


			</div>
		</div>
	</div>
	<div style="width: 100%;height: 60px;"></div>
	<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
		<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
			@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
		</div>
	</div>
	<jsp:include page="footnav.jsp"></jsp:include>
</div>

</body>
</html>
