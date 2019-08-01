<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <title>Sam-e introduction</title>
    <style>
        .vertical-line {
            height: 150px;
            border-left: 2px solid;
            margin-left: 50px;
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
    <style>
        div[id=dot]:before {
            content: "●";
            color: #207EBF;;
            font-size: 0.3rem;
            margin-right: 8px;
        }
    </style>
</head>
<body style="padding: 0px;margin: 0px;">
<div id="sam-e" style="width: 100%;height: auto;">
    <jsp:include page="header.jsp"/>
    <div class="same-pic" style="width: 100%;height: auto;margin: 0 auto;">
        <img src="static/images/hm2.jpg" style="width: 100%;height: auto;"/>
    </div>
    <div class="same-box" style="width: 100%;height: auto;margin: 0 auto;">
        <img src="static/images/sam1.png" style="width: 100%;height: auto;"/>
        <div style="width: 100%;height: auto;">
            <div style="width: 96%;height: auto;margin: 0 auto;font-family: arial; color: #666666;">
                <div style="width: 100%;height: 20px;"></div>
                <div id="dot" style="font-size: 18px">SAM-e（S-Adenosyl methionine， S-腺苷甲硫氨酸）是一种营养补充剂，并非药物</div>
                <div style="width: 100%;height: 20px;"></div>

                <div id="dot" style="font-size: 18px">SAM-e是人体中天然存在的化合物。
                </div>
                <div style="width: 100%;height: 20px;"></div>

                <div id="dot">SAM-e被认为是人体中最重要的甲基供体。</div>
                <div style="width: 100%;height: 20px;"></div>

                <div id="dot">随着机体老化，SAM-e水平会下降。随之而来，一系列与情绪、关节和肝脏功能等相关的健康问题可能出现。
                </div>
                <div style="width: 100%;height: 20px;"></div>

                <div id="dot">所有的SAM-e分子有两种异构体：SS（活性）异构体和RS（非活性）异构体
                </div>
                <div style="width: 100%;height: 20px;"></div>

                <div id="dot">虽然SAM-e有两种成盐形式--甲苯磺酸盐和丁烷二硫酸盐，但只有甲苯磺酸盐的安全性和有效性有二十年的研究数据支持。
                </div>
                <div style="width: 100%;height: 20px;"></div>

            </div>
        </div>
    </div>

    <div class="intro-sam" style="width: 100%;height: auto; background-color: #F4F4F6;">
        <div style="width: 96%;height: auto;margin: 18px auto;">
            <div style="width: 100%;height: auto; font-family: arial;font-weight:600;">
              据临床研究报导，SAM-e有助于增进情绪健康、关节舒功能和肝脏功能
            </div>
        </div>
        <div style="width: 100%;height: auto;">
            <img src="static/images/sam2.png" style="width: 100%;height: auto;"/>
        </div>
        <div style="width: 100%;height: 20px;"></div>
        <div style="clear: both;"></div>
        <div style="width: 100%;height: auto; background-color: #F4F4F6;">
            <div style="width: 88%;height:auto;margin: 0 auto;border-top: 9px; align-content: center;color: #666666; background-color: #C1E1E8; border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;">
               2003年3月，美国卫生及公共服务部发表了一项关于SAM-e的重要研究。
                Health and Human Services, released the findings of a major study on SAM-e. <br/>
                <i style="color: #4A9ACA;"><a href="https://www.ncbi.nlm.nih.gov/books/NBK11886" target="_blank">https://www.ncbi.nlm.nih.gov/books/NBK11886/</a></i>
            </div>
            <div style="width:0;height:0;border-width:13px 16px 0;border-style:solid;border-color:#C1E1E8 transparent transparent;margin:0 auto;position:relative;"></div>
            <div style="width: 100%;height: auto;">
                <div style="width: 95%;height: auto; color: #666666;margin: 0 auto;font-family: arial;">

                    <div id="dot">SAM-e和传统的抗抑郁处方药相比同样有效。
                    </div>
                    <div style="width: 100%;height: 20px;"></div>
                    <div id="dot">SAM-e和用于治疗骨性关节炎的标准处方非甾体抗炎药相比同样有效。
                    </div>
                    <div style="width: 100%;height: 20px;"></div>
                    <div id="dot">SAM-e对患有多种肝病的病人有明显益处。
                    </div>
                    <div style="width: 100%;height: 20px;"></div>
                    <div id="dot">并未发现天然SAM-e有明显副作用</div>
                </div>
            </div>
        </div>
    </div>

    <div class="spot-sam" style="width: 100%;height: auto;">
        <div style="width: 100%;height: auto;margin: 0 auto;">
            <div style="width: 96%;height: auto;margin: 0 auto;font-weight: 600;line-height: 100px; font-family: arial; align-content: center;">
                聚光灯下的SAM-e
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
<div class="sam-link" style="width: 100%;height: auto;">
    <div style="width: 100%;height: auto;">
        <div style="width: 96%;height: auto;font-weight: 600; ">
            SAM-e对人类细胞系和动物的基础研究尚未进行临床研究
        </div>
    </div>
    <div style="width: 100%;height: 50px;"></div>
    <div style="width: 100%;height: auto;line-height: 18px;">
        <div style="width: 100%;height: auto;">
            <div style="width: 92%;height: auto; border-bottom:1px solid #CBCBCC;margin: 0 auto; ">

                <div id="dot" style="color: #666666;font-family: arial;">
                    在乳腺癌细胞系和动物的实验中，SAM-e显示可阻断乳腺癌的生长和转移。
                </div>
                <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/29435170" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/29435170</a></i>
                <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/15150277" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/15150277</a></i>
                <div></div>
            </div>
        </div>
        <div style="width: 100%;height: auto;">
            <div style="width: 92%;height: auto;border-bottom:1px solid #CBCBCC;margin: 0 auto;">

                <div id="dot" style="color: #666666;font-family: arial;">
                    研究显示，SAM-e 能够阻止肝癌细胞增殖。
                </div>
                <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/29340097" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/29340097</a></i>
                <div></div>
            </div>
        </div>
        <div style="width: 100%;height: auto;">
            <div style="width: 92%;height: auto;border-bottom:1px solid #CBCBCC;margin: 0 auto; ">

                <div id="dot" style="color: #666666;font-family: arial;">
                    研究显示， SAM-e能够抑制前列腺癌细胞增殖。
                </div>
                <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/25631332" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/25631332</a></i>
                <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/16982764" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/16982764</a></i>
                <div></div>
            </div>
        </div>
        <div style="width: 100%;height: auto;">
            <div style="width: 92%;height: auto;border-bottom:1px solid #CBCBCC;margin: 0 auto;">

                <div id="dot" style="color: #666666;font-family: arial;">
                    研究显示， SAM-e能够抑制大鼠肝脏肿瘤及小鼠结直肠肿瘤的形成。
                </div>
                <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/23073625" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/23073625</a></i>
                <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/19444874" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/19444874</a></i>
                <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/22159228" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/22159228</a></i>
                <div></div>
            </div>
        </div>
        <div style="width: 100%;height: auto;">
            <div style="width: 92%;height: auto;border-bottom:1px solid #CBCBCC;margin: 0 auto;">

                <div id="dot" style="color: #666666;font-family: arial;">
                    研究显示， 在症状开始前服用，SAM-e能够增强阿尔茨海默模型小鼠的记忆力。
                </div>
                <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/27681803" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/27681803</a></i>
                <i style="color: #2E86C3;"><a href="https://www.ncbi.nlm.nih.gov/pubmed/22221883" target="_blank">https://www.ncbi.nlm.nih.gov/pubmed/22221883</a></i>
                <div></div>
                </ul>
            </div>
        </div>
    </div>
</div>
<div style="width: 100%;height: auto;">
    <img src="static/images/sam3.png" style="width: 100%;height: auto;"/>
</div>
<div class="why-sam" style="width: 100%;height: auto;">
    <div style="width: 100%;height: auto;ont-family: arial;line-height: 77px; margin: 0 auto;font-weight: 600;">
        <div style="width: 96%;height: auto;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为什么选择我们的产品？
        </div>
    </div>
    <div style="width: 100%;height: auto;color:#207EBF ;">
        <div style="width: 96%;height: auto;margin: 0 auto; color: #666666;">
            <div id="dot">
                我们的产品采用原版意大利工艺，根据最高标准生产。
            </div>

            <div style="width: 100%;height: 20px;"></div>

            <div id="dot">
                我们产品的原材料是市面上SS/RS异构体比例最高的--SS活性异构体>80%, RS 活性异构体<20%。
            </div>

            <div style="width: 100%;height: 20px;"></div>

            <div id="dot">
                我们SAM-e是肠溶片，有利于机体吸收。
            </div>

            <div style="width: 100%;height: 20px;"></div>

            <div id="dot">
               我们的产品采用独立吸塑包装以保持新鲜度。
            </div>

            <div style="width: 100%;height: 20px;"></div>

            <div id="dot">
               我们的产品有严格的纯度质量保证:
            </div>

            <div style="width: 100%;height: 20px;"></div>

            <div id="dot">
               不含人工香料、不含乳制品、不含防腐剂、无过敏原、不含酵母或麸质、犹太认证
            </div>

            <div style="width: 100%;height: 20px;"></div>

            <div id="dot">
                我们的产品全部通过至少两年的稳定性测试。
            </div>
        </div>

    </div>
</div>
<div class="caution" style="width: 100%;height: auto;margin-top: 25px;">
    <div style="width: 100%;height: auto;font-family: arial;margin: 0 auto;font-weight: 600;line-height: 77px; ">
        &nbsp;&nbsp;&nbsp;&nbsp;注意事项
    </div>
    <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
        <div style="width: 96%;height: auto;margin: 0 auto;">
            <div id="dot">
                SAM-e不应当与医生建议的治疗手段连用，也不应当取代医生建议的治疗手段。
            </div>
            <div style="width: 100%;height: 20px;"></div>

            <div id="dot">
               如果您正在服用药物并考虑使用SAM-e作为补充剂，请咨询医生SAM-e是否与所服用药物有相互作用。
            </div>
            <div style="width: 100%;height: 20px;"></div>
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
