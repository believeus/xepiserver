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
            <strong>摩西▪西夫 教授</strong><br/>
            董事长兼CEO<br/> <i style="font-weight: 600;">香港精准医学技术有限公司</i></div>
    </div>

    <div id="pro-stem" style="width: 100%;height: auto;background-color: #F7F7F9;margin: 0 auto;">
        <div style="width: 96%;height: auto;margin: 0 auto;">
            <div style="width: 100%;height: auto;line-height: 50px;font-weight: 700;">职业经历</div>
            <hr/>
            <div style="width: 100%;height: auto;line-height: 22px;font-weight: 500">
                <div id="dot">
                    表观遗传学领域的先驱
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                   发明者在该领域的第一个广泛专利
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    关于DNA甲基化和癌症的第一批专利的发明者
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    行为和精神病学表观遗传学领域的创始人
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    思想领袖，在该领域发表了295篇论文
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                   加拿大皇家学会会员
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    加拿大卫生科学院院士
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">
                    加拿大蒙特利尔麦吉尔大学药理学和治疗学系教授
                </div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">北京埃彼达雅医疗诊断技术有限公司驻地首席科学家</div>
                <div style="width: 30%;height: 20px;"></div>
                <div id="dot">北京亦庄创新研究所表观遗传研究所所长</div>
            </div>
        </div>
    </div>
    <hr style="font-size: 14px;color: #E7E7E7;"/>


    <div class="video" ; style="width: 100%;height: auto;">
        <div style="width: 100%;height: auto;background-color:#EDEEF0 ;overflow: hidden;">
            <div style="width: 96%;height: auto;margin: 0 auto;">
                <div style="line-height: 60px;font-weight: 900;">精彩视频</div>
                <div style="width: 100%;height: auto; font-size: 14px;font-family: arial;line-height: 20px ;color: #666666;">
                    健康科技O2O峰会,摩西▪ 西夫 教授，香港精准医学.mp4
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
                   2017年希望科学大会,摩西▪ 西夫 教授，香港精准医学.mp4
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
                    什么是表观遗传学?它如何改变你的生活,摩西▪ 西夫 教授，香港精准医学.mp4
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
                    行为表观遗传学,摩西▪ 西夫 教授，香港精准医学.mp4
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
				<a href="#career" hidefocus="true">职业生涯</a>
				</span>
                    <span class="part" style="border-right: 1px solid #666666">
					<a href="#" hidefocus="true">荣誉</a>
				</span>
                    <span class="part">
				<a href="#" hidefocus="true">所获资助</a>
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
                                    <li><strong> 2013--</strong>加拿大皇家学会院士</li>
                                    <li><strong> 2011--</strong>CCNP神经心理药理学创新奖</li>
                                    <li><strong> 2009--</strong>加拿大广播电台年度科学家奖</li>
                                    <li><strong> 2009--</strong>诺贝尔论坛卡罗林斯卡讲</li>
                                    <li><strong> 2007--</strong>葛兰素史克药理学</li>
                                    <li><strong>2003--</strong> 詹姆斯·麦吉尔荣誉教授</li>
                                    <li><strong> 2001--</strong>医学院教学荣誉榜</li>
                                    <li><strong>1999--</strong>卡莉·德里克研究生教学指导奖</li>
                                    <li><strong>1999--</strong>以色列癌症研究基金会“艾略特·奥瑟曼杰出贡献奖”
                                    </li>
                                    <li><strong>1989-1995--</strong>加拿大国立癌症研究所“杰出青年教授奖”
                                    </li>
                                    <li><strong>1987--</strong>美国癌症学会奖学金</li>
                                    <li><strong>1984--</strong>罗斯柴尔德奖学金</li>
                                    <li><strong>1980--</strong>希伯来大学医学院奖学金</li>
                                    <li><strong>1980--</strong>杰出硕士</li>
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
                <div id="din"><span style="font-weight: 700;color: #27809D;font-size: 18px;line-height: 50px;">发表论文</span>
                </div>
            </div>
        </div>
        <div style="width: 100%;height: auto;background-color: #27809D;overflow: hidden;">
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;font-family: arial;font-weight: 500;color: #FFFFFF; line-height: 20px; margin: 0 auto;">

                <div style="width: 100%;height: auto;">
                    <a href="https://www.ncbi.nlm.nih.gov/pubmed/15220929">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Epigenetic programming by
                            maternal behavior.Aug 1st 2004 <i> Nature Neuroscience </i>volume 7 issue 8 pp 847-854
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">5530 Citations</div>
                </div>
                <div style="width: 100%;height: 100px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2944040/">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Epigenetic regulation of the
                            glucocorticoid receptor in human brain associates with childhood abuse.<i> Nat Neurosci</i>.2009
                            Mar; 12(3): 342–348.
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">2892 Citations</div>
                </div>

                <div style="width: 100%;height: 100px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://www.nature.com/articles/17533">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">A mammalian protein with specific
                            demethylase activity for mCpG DNA.<i> Nature</i>. 1999 Feb 18
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">528 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0002085">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Promoter-wide hypermethylation of
                            the ribosomal RNA gene promoter in the suicide brain.<i> PLoS One</i>. 2008 May 7
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">351 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0014739">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Broad epigenetic signature of
                            maternal care in the brain of adult rats.<i> PLoS One</i>.2011 Feb 28
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">347 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2365485/">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Expression of antisense to DNA
                            demethylation and inhibits tumorigenesis .<i> J Biol Chem</i>. 1995 Apr 7
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: right;">256 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://www.annualreviews.org/doi/abs/10.1146/annurev-pharmtox-061008-103102">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Epigenetics, DNA methylation,
                            and chromatin modifying drugs. <i>Annu Rev Pharmacol Toxicol</i> .2009;49
                        </div>
                    </a>
                    <div style="width: 20%;height: auto;float: left;">432 Citations</div>
                </div>
                <div style="width: 100%;height: 80px;"></div>
                <div style="width: 100%;height: auto;">
                    <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1413873/">
                        <div style="width: 80%;height: auto;float: left;color:#FFFFFF">Maternal care effects on the
                            hippocampal transcriptome and anxiety-mediated behaviors in the offspring that are
                            reversible in adulthood.<i>Proc Natl</i>
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
