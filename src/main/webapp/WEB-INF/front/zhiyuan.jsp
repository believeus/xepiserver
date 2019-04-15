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
	<title>Dr. Zhiyuan Lv</title>

	<!--局部移动浏览-->
	<style type="text/css">
		*{margin:0;padding:0;font-family: "微软雅黑";}
		.wrap{margin:0 auto;}
		.tabs{height:32px;background: #F4F4F4;width: 100%;padding-top: 8px;text-align: center}
		.tabs .part{display:block;float:left;width:45%;color:#666666;text-align:center;height: 20px;}
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
				<img src="static/images/zhiyuan-1.png"style="width: 100%;height: auto;"/>
			</div>
			<div style="width: 30%;height: auto;float: left;"></div>
		</div>
		<div style="clear: both;"></div>
		<div style="width: 100%;height: auto;text-align: center;font-family: arial;color: #666666;font-weight: 600;line-height: 29px;">
			<strong>Zhiyuan Lv Postdoctoral</strong><br />
			Lab Manager <br/> <i style="font-weight: 600;">Beijing Epidial Medical Diagnostic Technology Co., Ltd.</i>
		</div>
		<div style="width: 100%;height: 20px;"></div>
	</div>
	<div id="pro-stem"style="width: 100%;height: auto;background-color: #F7F7F9;margin: 0 auto;">
		<div style="width: 96%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;line-height: 50px;font-weight: 700;">Professional Experiences</div>

			<div style="width: 100%;height: auto;">
				<img  src="static/images/zhiyuan-2.png"style="width: 100%;height: auto;">
			</div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>

	<div class="pg-main">
		<div id="wrapper">
			<!--header end-->
			<div class="wrap">
				<div class="tabs">
				<span class="part active" style="border-right: 1px solid #666666">
				<a href="#career" hidefocus="true" >Honors</a>
				</span>

					<span class="part" >
					<a href="#" hidefocus="true">Conferences</a>
				</span>

				</div>

				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide swiper-slide-visible swiper-slide-active">
							<div class="content-slide">
								<div id="career" >
									<div style="width: 90%;height: auto;margin: 0 auto;">
										<div style="width: 100%;height: 40px;"></div>
										<div>
											<strong>2015.05</strong> Excellent Topic Summary Award for the 2015 Annual Meeting of the American Society of Immunologists
										</div>
										<div style="width: 100%;height: 20px;"></div>
										<div>
											<strong> 2010.09 </strong>State Overseas Studies Fund appointed joint doctoral scholarship
										</div>
										<div style="width: 100%;height: 20px;"></div>
										<div style="font-weight: 800;line-height: 22px;">Ad Hoc Reviewer for Journals totally have reviewed more than 20 research articles</div>
										<div style=" width: 100%;height:auto;text-align: left;">
											<div>Molecular and Cellular Biochemistry</div>
											<div>Annuals of Clinical Biochemistry</div>
											<div>Cellular and Molecular Biology</div>
											<div>Journal of Immunoassay and Immunochemistry</div>
										</div>
										<div style="font-weight: 800;line-height: 40px;">Editorial Board of Journal</div>
										<div>Journal of Immunoassay and Immunochemistry</div>
									</div>
								</div>

							</div>
						</div>
						<div class="swiper-slide">
							<div class="content-slide">
								<div style="width: 90%;height: auto;margin: 0 auto;line-height: 22px">
									<div style="width: 100%;height: 40px;"></div>
									<ul>
										<li>2015 Annual Meeting of the American Society of Immunologists (<i style="font-weight: 600;">New Orleans, USA</i>)</li>
										<div style="width: 100%;height: 20px;"></div>
										<li>Third Annual Conference of the 2014 Southeast American Symposium on Immunology (<i style="font-weight: 600;">Atlanta, USA</i>)</li>
										<div style="width: 100%;height: 20px;"></div>
										<li>2014 Georgia State University Biotechnology Seminar (<i style="font-weight: 600;">Atlanta, USA</i>)</li>
										<div style="width: 100%;height: 20px;"></div>
										<li>2013 Georgia State University-Nanjing University Biotechnology Seminar (<i style="font-weight: 600;">Atlanta, USA</i>)</li>
										<div style="width: 100%;height: 20px;"></div>
										<li>Third Asia-Pacific Diabetes Symposium 2009 (<i style="font-weight: 600;">Nanjing, China</i>)</li>
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
				<div id="din"><span style="font-weight: 700;color: #27809D;font-size: 18px;line-height: 50px;"> Published Papers</span></div>
			</div>
		</div>
		<div style="width: 100%;height: auto;background-color: #27809D;overflow: hidden;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 90%;height: auto;font-family: arial;font-weight: 500;color: #FFFFFF; line-height: 20px; margin: 0 auto;">

				<div style="width: 100%;height: auto;">
					<a href="https://www.pnas.org/content/113/37/E5434">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">Cd47-Sirpαinteraction and IL-10 constrain inflammation-induced
							macrophage phagocytosis of healthy self-cells. PNAS. 2016 Sep;</div>
					</a>

				</div>
				<div style="width: 100%;height: 80px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4490976/">
						<div style="width: 1-0%;height: auto;float: left;color:#FFFFFF">Loss of Cell Surface CD47 Clustering Formation and Binding Avidity to
							SIRPa Facilitate Apoptotic Cell Clearance by Macrophages. The Journal of Immunology. 2015 Jul;</div>
					</a>

				</div>

				<div style="width: 100%;height: 100px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4607582/">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">CD47 deficiency ameliorates autoimmune nephritis in Faslpr mice by
							suppressing IgG autoantibody production. The Journal of Pathology.  2015 Jun;</div>
					</a>

				</div>
				<div style="width: 100%;height: 100px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0103599">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">Argonaute 2 in cell-secreted microvesicles guides the function of
							secreted miRNAs in recipient cells. PloS One. 2014 Jul;</div>
					</a>

				</div>
				<div style="width: 100%;height: 80px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3797048/">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF"> Clustering’SIRPα into the plasma membrane lipid microdomains is
							required for activated monocytes and macrophages to mediate effective cell surface interactions with CD47. PloS One. 2013 Oct;.</div>
					</a>

				</div>
				<div style="width: 100%;height: 120px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.nature.com/articles/ncomms3436">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF"> Inflammation-induced proteolytic processing of the SIRPα
							cytoplasmic ITIM in neutrophils propagates a proinflammatory state. Nature Communications. 2013 Sep;</div>
					</a>

				</div>
				<div style="width: 100%;height: 100px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.sciencedirect.com/science/article/pii/S0091674913003102">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">MicroRNA-17/20a/106a modulate macrophage inflammatory responses
							through targeting signal-regulatory protein α. Journal of Allergy and Clinical Immunology. 2013 Aug;</div>
					</a>

				</div>
				<div style="width: 100%;height: 100px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://onlinelibrary.wiley.com/doi/abs/10.1002/jcp.24015">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">The protective role of peroxisome proliferator-activated receptor γ
							coactivator-1α in hyperthyroid cardiac hypertrophy. Journal of Cellular Physiology. 2012 Sep;</div>
					</a>

				</div>
				<div style="width: 100%;height: 100px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.ncbi.nlm.nih.gov/pubmed/20816931">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF"> Molecular cloning of amphioxus uncoupling protein and assessment
							of its uncoupling activity using a yeast heterologous expression system. Biochem Biophys Res Commun. 2010 Aug</div>
					</a>

				</div>
				<div style="width: 100%;height: 100px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.nature.com/articles/cr201046">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF"> Hypoxia induces PGC-1α expression and mitochondrial biogenesis in
							myocardium of TOF patients. Cell Research. 2010 Apr;</div>
					</a>

				</div>
				<div style="width: 100%;height: 100px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.sciencedirect.com/science/article/pii/S1567724909001500">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF"> Molecular cloning of lamprey uncoupling protein and assessment of
							its uncoupling activity using a yeast heterologous expression system. Mitochodrion. 2009 Sep;</div>
					</a>

				</div>
				<div style="width: 100%;height: 100px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.sciencedirect.com/science/article/abs/pii/S0168827808008052">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">HDMCP uncouples yeast mitochondrial respiration and alleviates
							steatosis in L02 and hepG2 cells by decreasing ATP and H2O2 levels: A novel mechanism for NAFLD. Journal of Hepatology. 2008 Oct. </div>
					</a>

				</div>

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
