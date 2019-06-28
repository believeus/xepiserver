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
    <title>Methylation technology</title>
    <!--自适应字体大小-->


    <style>
        div[id=dot]:before {
            content: "●";
            color: #207EBF;;
            font-size: 0.6rem;
            margin-right: 8px;
        }
    </style>

</head>
<body style="padding: 0px;margin: 0px;">
<div id="container" style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"/>
    <div id="diag" style="width: 100%;height: auto;">
        <div style="width: 100%;height: 20px;"></div>
        <div style="width: 90%;height: auto;margin: 0 auto;">
            <div style="width: 100%;height: auto;font-family: arial;font-size: 24px; color: #036EB8;font-weight: 700;">
                DNA methylation is a chemical mark on DNA
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;line-height: 24px;">
                <p>DNA methylation is a chemical mark that is added to DNA at different positions during gestation.</p>
                <p>DNA methylation is part of the "epigenetic" program of our genes.</p>
                <p> when DNA methylation happens at several important positions in genes it can silence the function of
                    the gene.</p>
                <p>This is how the same gene can be expressed or silenced in different cells in our body.</p>
            </div>
            <div style="width: 100%;height: auto;"><img src="static/images/methy-1.png"
                                                        style="width: 100%;height: auto;"/></div>
            <div style="width: 100%;height: 20px;"></div>
            <hr/>
        </div>
    </div>
    <div id="methy" style="width: 100%;height: auto;">
        <div style="width: 100%;height: 20px;"></div>
        <div style="width: 90%;height: auto;margin: 0 auto;">
            <div style="width: 100%;height: auto;">
                <p style="font-family: arial;font-size: 24px;font-weight: 700;color: #036EB8;"> DNA methylation; the
                    genome software</p>

            </div>
            <div style="width: 100%;height: auto;"><img src="static/images/met1.jpg" style="width: 100%;height: auto;"/>
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;line-height: 24px;">
                <div style="width: 100%;height: auto;font-family: arial;color: #666666;line-height: 24px;">
                    If we imagine that our DNA is a minicomputer running our cells then :
                </div>


                <ul>
                    <li> DNA - is the Hardware.</li>
                    <li>The genetic Sequence - is the Operating system.</li>
                    <li>DNA methylation is the - Softwre coding Apps on DNA.</li>
                    <li>Different " Apps" make cells perform specific tasks in space and time.</li>
                </ul>
            </div>

            <div style="width: 100%;height: 20px;"></div>
            <div style="font-family: arial;font-size: 16px;color: #036EB8;">
                These genomic Apps make sure that our body functions properly. Each tissue is properly programmed to
                ensure our health and well being. Each cell type has its unique combination of methylation marks and as
                a consequence a unique combination of genes that are active and silent.
            </div>
            <div style="width: 100%;height: auto;"><img src="static/images/methy-2.png"
                                                        style="width: 100%;height: auto;"/></div>
            <div style="font-family: arial;font-size: 24px;font-weight: 700;color: #036EB8;">
                Changes in DNA methylation can cause disease; mapping DNA methylation changes could detect disease
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
                Changes in DNA methylation alter the way cells and tissues operate and can convert a healthy tissue to a
                diseased tissue.
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
                More than three decades ago Szyf has suggested that changes in DNA methylation would cause diseases such
                as cancer.
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
                Therefore, DNA methylation is a great platform for detecting and treating disease.
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
                Studies from the laboratory of Szyf at McGill University showed that one can reverse cancer in an animal
                model by blocking the protein that adds methylation groups to DNA. This has been replicated by many
                studies since.
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
                More recently Szyf has shown that by examining DNA methylation in white blood cells, it is possible to
                detect liver cancer early.
            </div>
        </div>
    </div>
    <div id="tumor" style="width: 100%;height: auto;">
        <div style="width: 90%;height: auto;margin: 0 auto;">
            <div style="width: 100%;height: auto;"><img src="static/images/met2.jpg" style="width: 100%;height: auto;"/>
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #036EB8;line-height: 24px;font-size: 24px;font-weight: 700;">
                The environment can cause changes in DNA methylation
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #6D6D6D;">
                Studies by Jirtle and his colleagues in 2004 showed in a mouse model that maternal diet during
                pregnancy affects DNA methylation of her offspring and change their coat color and rish of obesity and
                other conditions.
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="font-family: arial;color: #666666;">
                Studies by Szyf and colleagues discovered that maternal care and behavior affects DNA methylation of her
                offspring and how they react to stress later in life. These studies launched the fields of behavioral
                epigenetics and epigenetic psychiatry.
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="font-family: arial;color: #666666;">
                These discoveries provided the first evidence that both psychological and physical environments can
                affect DNA methylation.
            </div>
            <div style="width: 100%;height: 40px;"></div>
            <hr/>
            <div style="width: 100%;height: auto;">
                <img src="static/images/met3.jpg" style="width: 100%;height: auto;"/>
            </div>

        </div>
    </div>
    <div style="width: 100%;height: 40px;"></div>
    <div id="tec-adv" style="width: 100%;height: auto;">
        <div style="width: 90%;height: auto;margin: 0 auto;">
            <div style="width: 100%;height: auto;">
                <div style="width: 65%;height: 100px;float: left;; font-family: arial;color: #036EB8;font-weight: 600;padding-top: 40px ;">
                    DNA methylation is potentially reversible by both physical and behavioral interventions
                </div>
                <div style="width: 35%;height: 100px;float: left;">
                    <img src="static/images/met-icon.jpg" style="width: 100%;height: auto;"/>
                </div>
                <div style="clear: both;"></div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto; ">

                    <div id='dot' style="color: #666666;font-family: arial;"> Studies suggest that different
                        environmental changes can change or reverse DNA methylation events.
                    </div>
                    <div style="width: 100%;height: 20px;"></div>


                    <div id="dot" style="color: #666666;font-family: arial;">Thus, the potential is there that we might
                        be able to change DNA methylation by lifestyle changes.
                    </div>
                    <div style="width: 100%;height: 20px;"></div>

                    <div id="dot" style="color: #666666;font-family: arial;">Our optimism about DNA methylation derives
                        from the fact that DNA methylation in difference from genetics is reversible.
                    </div>
                    <div style="width: 100%;height: 20px;"></div>

                </div>
            </div>
            <div style="width: 100%;height: auto;">
                <div style="width: 98%;height: auto;margin: 0 auto;">
                    <div style="width: 65%;height: 100px;float: left; font-family: arial;color: #036EB8;;font-weight: 600;padding-top: 40px">
                        DNA methylation and the epigenetic clock
                    </div>
                    <div style="width: 35%;height: 100px;float: left;">
                        <img src="static/images/met-icon1.jpg" style="width: 100%;height: auto;"/>
                    </div>
                </div>
                <div style="clear: both;"></div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 90%;height: auto;margin: 0 auto;">
                        <div id='dot' style="width: 100%; height: auto;color: #666666;font-family: arial;">
                            A paradigm shift in the search for biological age markers has happened with the discovery of
                            the "epigenetic clock" by Horvath.
                        </div>
                        <div style="width: 100%;height: 20px;"></div>


                        <div id="dot" style="width: 100%; height: auto; color: #666666;font-family: arial;">
                            It was discovered that the level of methylation of certain genes in our DNA changes as we
                            age.
                        </div>
                        <div style="width: 100%;height: 20px;"></div>

                        <div id="dot" style="width: 100%;height: auto; color: #666666;font-family: arial;">
                            By measuring methylation in these genes it is possible to determine our biological age
                        </div>
                        <div style="width: 100%;height: 20px;"></div>
                        <div id="dot" style="width: 100%;height: auto; color: #666666;font-family: arial;">
                            Our biological age is a better measure of our health and well being than chronological
                            age.
                        </div>
                        <div style="width: 100%;height: 20px;"></div>
                        <div id="dot" style="width: 100%;height: auto; color: #666666;font-family: arial;">
                            Studies show that acceleration of " DNA methylation age" is a predictor of early death and
                            chronic disease.
                        </div>
                        <div style="width: 100%;height: 20px;"></div>
                        <div id="dot" style="width: 100%;height: auto; color: #666666;font-family: arial;">
                            Experiments in animals show that it is possible to reverse the biological clock by
                            dietary changes.
                        </div>

                    </div>
                </div>
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
</body>
</html>
