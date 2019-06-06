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
	<title>Dr. David</title>

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
				<img src="static/images/david-1.png"style="width: 100%;height: auto;"/>
			</div>
			<div style="width: 30%;height: auto;float: left;"></div>
		</div>
		<div style="clear: both;"></div>
		<div style="width: 100%;height: auto;text-align: center;font-family: arial;color: #666666;font-weight: 600;line-height: 29px;">
			<strong>David Cheishvili Ph.D.</strong><br />
			Senior Scientific Consultant<br/><i style="font-weight: 600;">  HKG Epitherapeutics, Hong Kong</i>
		</div>
		<div style="width: 100%;height: 20px;"></div>
	</div>

	<div id="pro-stem"style="width: 100%;height: auto;background-color: #F7F7F9;margin: 0 auto;">
		<div style="width: 96%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: auto;line-height: 60px">Professional Experiences</div>
			<img  src="/static/images/david-2.png"style="width: 100%;height: auto;">
		</div>
	</div>


	<div class="pg-main">
		<div id="wrapper">
			<!--header end-->
			<div class="wrap">
				<div class="tabs">
				<span class="part active"style="border-right: 1px solid #666666">
				<a href="#patent" hidefocus="true" >Patents</a>
				</span>



					<span class="part">
				<a href="#" hidefocus="true">Conference</a>
				</span>

				</div>

				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide swiper-slide-visible swiper-slide-active">
							<div class="content-slide">

								<div id="patent" >
									<div  style="width: 90%;height: auto;margin: 0 auto;line-height: 22px">
										<div style="width: 100%;height: 30px"></div>
										<ul>

											<div style="width: 100%;height: 20px"></div>
											<li><i style="font-weight: 600;">US patent 62/774</i>,994 DNA methylation markers for early detection of cervical cancer (Filed 04-Dec-2018)</li>
											<div style="width: 100%;height: 20px"></div>
											<li><i style="font-weight: 600;"> US patent 62/695</i>,429 DNA Methylation Markers for Noninvasive Detection of Cancer(Filed 07-Sept-2018)</li>

										</ul>
										<div style="width: 100%;height: 30px"></div>
										<ul>
											<li> 2011--<i style="font-weight: 600;">Postdoctoral fellow </i>of the Israel Cancer Research Foundation</li>
											<div style="width: 100%;height: 20px"></div>
											<li>2010--Toronto Alumni and Alumni Medical <i style="font-weight: 600;">Excellence Award</i></li>
											<div style="width: 100%;height: 20px"></div>
											<li>2009--Toronto Alumni and Friends Medical<i style="font-weight: 600;"> Excellence Award</i></li>
										</ul>

									</div>
								</div>

							</div>
						</div>

						<div class="swiper-slide">
							<div class="content-slide">
								<div  style="width: 90%;height: auto;margin: 0 auto;line-height: 22px;">
									<ul>
										<li>2017 Sixth Asian Chromatin and Chromosome Forum (Hyderabad, India)</li>
										<div style="width: 100%;height: 20px"></div>
										<li>2016 3rd Canadian Conference on Epigenetics of Development and Diseases (Canada)</li>
										<div style="width: 100%;height: 20px"></div>
										<li>2011 Family Autonomic Neurological Dysfunction Foundation Basic Scientific Research Conference (New York, USA)</li>
										<div style="width: 100%;height: 20px"></div>
										<li>2010 First Scientific Conference of the Medical Research Institute of Hebrew University in Israel-Hadassah Medical College, Canada (Erat, Israel)</li>
										<div style="width: 100%;height: 20px"></div>
										<li>Twenty-first European Union for Cancer Research Conference, 2010 (Oslo, Norway)</li>
										<div style="width: 100%;height: 20px"></div>
										<li>The 8th European Conference on Glial Cell Health and Diseases, 2009 (Paris, France)</li>
										<div style="width: 100%;height: 20px"></div>
										<li>2008 Family Autonomic Neurological Dysfunction Foundation Basic Scientific Research Conference (New York, USA)</li>
										<div style="width: 100%;height: 20px"></div>
										<li>The 8th European Conference on Gliocyte Health and Diseases, 2007 (London, UK)</li>
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
				<div id="din"><span style="font-weight: 700;color: #27809D;font-size: 18px;line-height: 50px;"> Cited papers</span></div>
			</div>
		</div>
		<div style="width: 100%;height: auto;background-color: #27809D;overflow: hidden;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 90%;height: auto;font-family: arial;font-weight: 500;color: #FFFFFF; line-height: 20px; margin: 0 auto;">

				<div style="width: 100%;height: auto;">
					<a href="https://www.x-mol.com/paper/712300">
						<div style="width: 90%;height: auto;float: left;color:#FFFFFF"> Identification of an Epigenetic Signature of Osteoporosis in Blood DNA of
							Postmenopausal Women. JBMR. 2018;</div>
					</a>

				</div>
				<div style="width: 100%;height: 80px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://bmccancer.biomedcentral.com/articles/10.1186/s12885-018-4482-7">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF"> DNA methylation signatures of breast cancer in peripheral T-cells. BMC  Cancer.
							2018;</div>
					</a>

				</div>

				<div style="width: 100%;height: 60px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://clinicalepigeneticsjournal.biomedcentral.com/articles/10.1186/s13148-017-0436-1">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">The signature of liver cancer in immune cells DNA methylation. Clin Epigenetics.
							2018;</div>
					</a>

				</div>
				<div style="width: 100%;height: 60px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.onlinelibrary.wiley.com/doi/full/10.1002/mnfr.201701008">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">Personalized cardio-metabolic responses to an anti-inflammatory nutrition
							intervention in obese adolescents: a randomized controlled crossover trial. Mol Nutr Food Res. 2018;</div>
					</a>

				</div>
				<div style="width: 100%;height: 100px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.sciencedirect.com/science/article/pii/S1094695016301780">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF">Genetic polymorphisms in ESR1 and VDR genes do not correlate with
							osteoporosis with familial dysautonomia. J Clin Densitom. 2018;
						</div>
					</a>

				</div>
				<div style="width: 100%;height: 80px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="http://www.greenmedinfo.com/article/methyl-donor-s-adenosylmethionine-sam-supplementation-attenuates-breast-cancer">
						<div style="width: 100%;height: 100px;float: left;color:#FFFFFF"> Methyl donor S-adenosylmethionine (SAM) supplementation attenuates
							breast cancer growth, invasion, and metastasis in vivo; therapeutic and chemopreventive applications. Oncotarget. 2017;
						</div>
					</a>

				</div>
				<div style="width: 100%;height: 80px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://academic.oup.com/nar/article/45/22/12681/4259028">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF"> Epigenetic mechanisms underlie the crosstalk between growth factors and a
							steroid hormone. Nucleic Acids Res. 2017;
						</div>
					</a>

				</div>
				<div style="width: 100%;height: 100px;"></div>
				<div style="width: 100%;height: auto;">
					<a href="https://www.researchgate.net/publication/316689941_DNA_methylation_controls_unmethylated_transcription_start_sites_in_the_genome_in_trans">
						<div style="width: 100%;height: auto;float: left;color:#FFFFFF"> DNA methylation controls unmethylated transcription start sites in the genome
							in trans”. Epigenomics. 2017;</div>
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
