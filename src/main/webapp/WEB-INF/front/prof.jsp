<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="static/css/swiper.min.css"/>
    <title>Prof.Moshe</title>

    <!--局部移动浏览-->
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            font-family: "微软雅黑";
        }

        .wrap {
            margin: 0 auto;
        }

        .tabs {
            height: 32px;
            background: #F4F4F4;
            width: 100%;
            padding-top: 8px;
            text-align: center
        }

        .tabs .part {
            display: block;
            float: left;
            width: 33%;
            color: #666666;
            text-align: center;
            height: 20px;
        }

        .tabs .part:first-child {
            border-right: 0px solid #000000;
        }

        .tabs a {
            width: 100px;
            display: block;
            color: #666666;
            text-align: center;
            margin: 0 auto;
            font-size: 16px;
            text-decoration: none;
            padding-bottom: 0px;
        }

        .tabs span.active a {
            color: #666666;
            border-bottom: 2px solid #000000;
        }

        .swiper-container {
            width: 100%;
            border-top: 0;
            margin-top: 10px !important
        }

        .swiper-slide {
            width: 100%;
            background: none;
            color: #666666;
        }

        p {
            text-align: center;
        }
    </style>


    <style>
        div[id=dot]:before {
            content: "●";
            color: #207EBF;
            font-size: 0.6rem;
            margin-right: 8px;
        }
    </style>
    <style>
        div[id=din]:before {
            content: "▍";
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
            border-image: -webkit-linear-gradient(#666666, #666666) 30 30;
            border-image: -moz-linear-gradient(#666666, #666666) 30 30;
            border-image: linear-gradient(#666666, #666666) 30 30;
        }

        .vertical-circle {
            float: left;
            width: 16px;
            height: 16px;
            border: 2px solid white;
            background-color: #0071BC;
            -webkit-border-radius: 100px;
        }

        .vertical-text {
            float: left;
            margin-top: -7px;
        }
    </style>
</head>
<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
    <div id="header" style="width: 100%;height: 100%;">
        <div style="width: 100%;height: 28px;margin: 0 auto;"></div>
        <div style="width: 100%;height: 142px;overflow: hidden;margin: 0 auto;">
            <div style="width: 33%;height: 80px;float: left;"></div>
            <div style="width: 33%;height: 100px;float: left; ">
                <img src="static/images/moshe.png" style="width: 100%;height: auto;"/>
            </div>
            <div style="width: 30%;height: auto;float: left;"></div>
        </div>
        <div style="clear: both;"></div>
        <div style="width: 100%;height: auto;text-align: center;font-family: arial;color: #666666;font-weight: 600;line-height: 29px;">
            <strong>Moshe Szyf, Prof.</strong><br/>
            Chairman & CEO<br/> <i style="font-weight: 600;"> HKG epiTHERAPEUTICS, Hong Kong</i></div>
    </div>

    <div id="pro-stem" style="width: 100%;height: auto;background-color: #F7F7F9;margin: 0 auto;">
        <div style="width: 96%;height: auto;margin: 0 auto;">
            <div style="width: 100%;height: auto;line-height: 50px;font-weight: 700;">Professional Experiences</div>
            <hr/>
            <div style="width: 100%;height: auto;line-height: 22px;font-weight: 500">
                <div id="dot">
                    Pioneer of the field of epigenetics
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    Inventor of the first broad patents in the field
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    Inventor of the first patents on DNA methylation and cancer
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    Founder of the field of behavioral and psychiatry epigenetics
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    Thought leader, published 295 papers in the area
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    Fellow of the Royal Society of Canada
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    Fellow of the Canadian Academy of Health Sciences
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    Professor Department of Pharmacology and Therapeutics McGill University Montreal Canada
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">Resident chief scientist of Beijing epidial medical diagnostic technology co., LTD.</div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">Director of epigenetic institute, Beijing yizhuang innovation institute</div>
            </div>
        </div>
    </div>
    <hr style="font-size: 14px;color: #E7E7E7;"/>


    <div class="video" ; style="width: 100%;height: auto;">
        <div style="width: 100%;height: auto;background-color:#EDEEF0 ;overflow: hidden;">
            <div style="width: 96%;height: auto;margin: 0 auto;">
                <p style="line-height: 60px;font-weight: 900;">Related Videos</p>
                <div style="width: 100%;height: auto; font-size: 14px;font-family: arial;line-height: 20px ;color: #666666;">
                    Healthtech O2O Summit Dr. Moshe Szyf, HKG Epitherapeutics.mp4
                </div>
            </div>
        </div>
        <div style="width: 100%; height: auto; background-color: :#EDEEF0; ">
            <div style="width: 100%;height: 10px;"></div>
            <div style="width: 100%;height: 200px;">
                <div style=" margin: 0 auto;width: 95%;height: 100%;background-color: :#EDEEF0;">
                    <video id="my-video" class="video-js" controls preload="auto" style="width: 100%;height: 100%;"
                           poster="static/images/vid-1.png" data-setup="{}">
                        <source src="https://app.beijingepidial.com/Healthtech_O2O_Summit_Dr_Moshe_Szyf_HKG_Epitherapeutics.mp4"
                                type="video/mp4"></source>
                    </video>
                </div>
            </div>
            <div style="width: 100%;height: 10px;"></div>
        </div>


        <div style="width: 100%;height: auto;overflow: hidden;background-color:#EDEEF0 ;">
            <div style="width: 100%;height: 30px;"></div>
            <div style="width: 96%;height: auto;margin: 0 auto;">
                <div style="width: 100%;height: auto;float: left; font-size: 14px;font-family: arial;color: #666666;">
                    Dr. Moshe Szyf , Science of Hope Conference 2017.mp4
                </div>
            </div>
            <div style="width: 100%;height: 10px;"></div>
        </div>

        <div style="width: 100%; height: auto; background-color: :#EDEEF0; ">
            <div style="width: 100%;height: 10px;"></div>
            <div style="width: 100%;height: 200px;">
                <div style=" margin: 0 auto;width: 95%;height: 100%;background-color: :#EDEEF0;">
                    <video id="my-video" class="video-js" controls preload="auto" style="width: 100%;height: 100%;"
                           poster="static/images/vid-2.png" data-setup="{}">
                        <source src="https://app.beijingepidial.com/Keynote_Dr_Moshe_Szyf_Science_of_Hope_Conference_2017.mp4"
                                type="video/mp4"></source>
                    </video>
                </div>
            </div>
            <div style="width: 100%;height: 10px;"></div>
        </div>


        <div style="width: 100%;height: auto;overflow: hidden;background-color:#EDEEF0 ;">
            <div style="width: 100%;height: 30px;"></div>
            <div style="width: 96%;height: auto;margin: 0 auto;">


                <div style="width: 100%;height: auto;float: left; font-size: 14px;font-family: arial;color: #666666;">
                    Dr. Moshe Szyf, What is epigenetic and why knowing it will change your life .mp4
                </div>
            </div>
        </div>
        <div style="width: 100%; height: auto; background-color: :#EDEEF0; ">
            <div style="width: 100%;height: 10px;"></div>
            <div style="width: 100%;height: 200px;">
                <div style=" margin: 0 auto;width: 95%;height: 100%;background-color: :#EDEEF0;">
                    <video id="my-video" class="video-js" controls preload="auto" style="width: 100%;height: 100%;"
                           poster="static/images/vid-3.png" data-setup="{}">
                        <source src="https://app.beijingepidial.com/What_is_epigenetic_and_why_knowing_it_will_change_your_life_Dr_Moshe_Szyf.mp4"
                                type="video/mp4"></source>
                    </video>
                </div>
            </div>
            <div style="width: 100%;height: 10px;"></div>
        </div>


        <div style="width: 100%;height: auto;overflow: hidden;background-color:#EDEEF0 ;">
            <div style="width: 100%;height: 30px;"></div>
            <div style="width: 96%;height: auto;margin: 0 auto;">


                <div style="width: 100%;height: auto;float: left; font-size: 14px;font-family: arial;color: #666666;">

                    Moshe Szyf, Behavioral Epigenetics.mp4

                </div>

            </div>

        </div>
        <div style="width: 100%; height: auto; background-color: :#EDEEF0; ">
            <div style="width: 100%;height: 10px;"></div>
            <div style="width: 100%;height: 200px;">
                <div style=" margin: 0 auto;width: 95%;height: 100%;background-color: :#EDEEF0;">
                    <video id="my-video" class="video-js" controls preload="auto" style="width: 100%;height: 100%;"
                           poster="static/images/vid-4.png" data-setup="{}">
                        <source src="https://app.beijingepidial.com/Moshe_Szyf_Behavioral_Epigenetics.mp4"
                                type="video/mp4"></source>
                    </video>
                </div>
            </div>
            <div style="width: 100%;height: 10px;"></div>
        </div>

        <div style="width: 100%;height: 50px;background-color:#EDEEF0 ;"></div>
    </div>


    <div class="pg-main">
        <div id="wrapper">
            <!--header end-->
            <div class="wrap">
                <div class="tabs">
				<span class="part" style="border-right: 1px solid #666666">
				<a href="#career" hidefocus="true">Career</a>
				</span>
                    <span class="part" style="border-right: 1px solid #666666">
					<a href="#" hidefocus="true">Honors</a>
				</span>
                    <span class="part">
				<a href="#" hidefocus="true">Sponsored</a>
				</span>
                </div>

                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide swiper-slide-visible swiper-slide-active">
                            <div class="content-slide">

                                <div id="career"><img src="static/images/careers.png"
                                                      style="width: 100%; height: auto;"></div>

                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="content-slide">
                                <div style="width: 100%;height: 30px;"></div>
                                <ul style="font-family: arial;font-size: 14px;color: #666666;line-height: 30px; margin-left: 30px;list-style: none;">
                                    <li><strong> 2013--</strong>Member of the Royal Society of Canada</li>
                                    <li><strong> 2011--</strong>CCNP Neuropsychopharmacology Innovation Award</li>
                                    <li><strong> 2009--</strong>Radio Canada Annual Scientist Award</li>
                                    <li><strong> 2009--</strong>Carolinska Speech at the Nobel Forum</li>
                                    <li><strong> 2007--</strong>GlaxoSmithKline Pharmacology</li>
                                    <li><strong>2003--</strong> Honorary Professor of James McGill</li>
                                    <li><strong> 2001--</strong>Medical College Teaching Honors List</li>
                                    <li><strong>1999--</strong>Carrie Derek Graduate Teaching Guidance Award</li>
                                    <li><strong>1999--</strong>Israel Cancer Research Foundation "Eliot Osseman
                                        Outstanding Contribution Award"
                                    </li>
                                    <li><strong>1989-1995--</strong>Canadian National Cancer Institute "Outstanding
                                        Young Professor Award"
                                    </li>
                                    <li><strong>1987--</strong>American Cancer Society Scholarship</li>
                                    <li><strong>1984--</strong>Rothschild Scholarship</li>
                                    <li><strong>1980--</strong>Medical Scholarship of Hebrew University</li>
                                    <li><strong>1980--</strong>Distinguished master</li>
                                    <li></li>
                                </ul>

                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="content-slide">
                                <div style="width:100%;height: auto; ">
                                    <img src="static/images/prof3.png" style="width: 100%;height: auto;">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="font-size: 10px;color: #E8E8E8;">
        <hr style="height: 10px; font-size: 30px;color: #000000;"/>
    </div>
    <div id="paper" style="width: 100%;height: auto;">
        <div style="width: 100%;height: auto;background-color: #F4F4F4;">
            <div style="width: 90%;height: auto;margin: 0 auto; font-weight: 600;font-family: arial;">
                <div id="din"><span style="font-weight: 700;color: #27809D;font-size: 18px;line-height: 50px;"> Published papers</span>
                </div>
            </div>
        </div>
        <div style="width: 100%;height: auto;background-color: #27809D;overflow: hidden;">
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;font-family: arial;font-weight: 500;color: #FFFFFF; line-height: 20px; margin: 0 auto;">

                <div style="width: 100%;height: auto;">
                    <a href="https://www.ncbi.nlm.nih.gov/pubmed/15220929">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Epigenetic programming by
                            maternal behavior.Aug 1st 2004 Nature Neuroscience volume 7 issue 8 pp 847-854
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">5530 Citations</div>
                </div>
                <div style="width: 100%;height: 100px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2944040/">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Epigenetic regulation of the
                            glucocorticoid receptor in human brain associates with childhood abuse.Nat Neurosci.2009
                            Mar; 12(3): 342–348.
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">2892 Citations</div>
                </div>

                <div style="width: 100%;height: 100px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://www.nature.com/articles/17533">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">A mammalian protein with specific
                            demethylase activity for mCpG DNA Nature. 1999 Feb 18
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">528 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0002085">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Promoter-wide hypermethylation of
                            the ribosomal RNA gene promoter in the suicide brain. PLoS One. 2008 May 7
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">351 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0014739">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Broad epigenetic signature of
                            maternal care in the brain of adult rats. PLoS One.2011 Feb 28
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">347 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2365485/">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Expression of antisense to DNA
                            demethylation and inhibits tumorigenesis .J Biol Chem. 1995 Apr 7
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">256 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://www.annualreviews.org/doi/abs/10.1146/annurev-pharmtox-061008-103102">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Epigenetics, DNA methylation,
                            and chromatin modifying drugs. Annu Rev Pharmacol Toxicol.2009;49
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: left;">432 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1413873/">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Maternal care effects on the
                            hippocampal transcriptome and anxiety-mediated behaviors in the offspring that are
                            reversible in adulthood.Proc Natl
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: left;">786 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
            </div>
        </div>
    </div>
    <div style="width: 100%;height: 60px;"></div>
    <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
        <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
            @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
        </div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
<!--局部滚动页面js代码-->
<script type="text/javascript" src="static/js/zepto.min.js"></script>
<script type="text/javascript" src="static/js/idangerous.swiper.min.js"></script>
<script type="text/javascript">
    $(function () {

        var tabsSwiper;
        tabsSwiper = new Swiper('.swiper-container', {
            speed: 500,
            onSlideChangeStart: function () {
                $(".tabs .active").removeClass('active');
                $(".tabs span").eq(tabsSwiper.activeIndex).addClass('active');
            }
        });

        $(".tabs span").on('touchstart mousedown', function (e) {
            e.preventDefault()
            $(".tabs .active").removeClass('active');
            $(this).addClass('active');
            tabsSwiper.swipeTo($(this).index());

        });

        $(".tabs span").click(function (e) {
            e.preventDefault();
        });


    });//end
</script>
</body>
</html>
