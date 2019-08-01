<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <base href="<%=basePath%>">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <title>DNA甲基化检测2.0</title>
    <style>
        div[id=box]:before {
            content: "●";
            color: #207EBF;;
            font-size: 0.15rem;
        }
    </style>
</head>
<body style="padding: 0px;margin: 0px;">
<jsp:include page="header.jsp"/>
<div id="container">
    <div id="illu-pic" style="width: 100%;height: auto;">
        <img src="static/images/ic1.png" style="width: 100%;height: auto;"/>
    </div>
    <div id="version-2.0" style="width: 100%;height: auto;">
        <div style="width: 100%;height: auto;margin-bottom: 10px;">
            <div style="width: 90%;height: auto;font-family: arial;color: #000000;font-size: 18px;  margin: 0 auto;ont-weight: bold;margin-top: 30px;">Dear User:</div>
            <div style="width: 90%;height: auto;font-family: arial;color: #000000;font-size: 18px;  margin: 0 auto;">You haven't purchased DNA Methylation epiAging test yet. Please read the following product information in detail and click the Buy button to purchase the product.</div>
            <div id="coupon"
                 style="width: 100%;height: auto;font-size: 16px;font-family:arial; color: #FF6B03; ">
                <div style="width: 90%;height: auto;margin: 0 auto;">
				<span
                        style="text-decoration: line-through;font-family: arial; font-size: 18px;color: #7F7F7F;">原价 $120/套<br/>
				</span>
                    <div></div>
                    <span style="font-size: 18px;font-family: arial">现价<strong
                            style="font-weight: 600 ;font-size: 18px; font-family: arial; ">$99</strong>
					<strong
                                style="font-family: arial;font-size: 18px;"> 1</strong> 套<br/>
				</span>
                    <div></div>
                </div>
            </div>
            <div id="add-cart" style="width: 100%;height: auto;margin-top: 20px;">
                <div style="width: 90%;height: auto;margin: 0 auto;">
                    <div style="width: 40%;height: 40px;font-family: arial;font-size: 18px;text-align: center;line-height: 40px; color:#FFFFFF ;float: left;">
                    </div>
                    <a href="/user/cart/index.jhtml">
                        <div style="width: 40%;height: 40px;font-family: arial;font-size: 18px;text-align: center;line-height: 40px; color:#FFFFFF ;float: right;background-color: #0365D2; border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;">
                            购买
                        </div>
                    </a>
                </div>
            </div>
            <div style="width: 100%;height: 90px;"></div>
            <div style="width: 96%;height: auto;font-family: arial;color: #000000;font-size: 22px;font-weight: bold;  margin: 0 auto; text-align: center;">
                DNA甲基化生物学年龄检测标准版2.0
            </div>
        </div>
        <div
                style="width: 96%;margin: 0 auto; height: auto;margin-bottom: 10px; font-family: arial;font-size: 18px;color: #1566B9;font-weight:600; ">
            DNA 甲基化检测解密人类生物学年龄
        </div>
        <div
                style="width: 96%;height: auto;margin: 0 auto; font-size: 16px;line-height: 18px; color:  #666666;font-family: arial; ">
            <div>我们都知道自己的年龄</div>
            <div> 然而，我们总是在谈论我们的实际年龄。但我们怎么知道我们的生物学年龄呢？</div>
            <div>表观遗传学检测提供了我们真实生物学年龄的检测。</div>
        </div>
    </div>
    <div id="age-pic" style="width: 100%;height: auto;">
        <img src="static/images/ic5.png" style="width: 100%;height: auto;"/>
    </div>
    <div id="age-cont" style="width: 100%;height: auto;">
        <div style="width: 100%;height: auto;">
            <div style="width: 100%;height: auto;">
                <div
                        style="width: 96%;height: auto;margin: 0 auto; font-family: arial;margin-top: 30px; font-size: 18px;color: #1566B9;font-weight: 600;">
                    DNA甲基化检测生物年龄
                </div>
                <div
                        style="width: 96%;height: auto;margin: 0 auto;font-family: arial; font-size: 18px;color:#666666;">
                    <div style="width: 100%;height: auto;font-size: 16px;">
                        <div style="width: 100%;height: 20px;"></div>
                        <strong> 生物学年龄≠实际年龄 </strong>
                        <div>我们都知道自己的实际年龄，但我们真实年龄到底多大了？</div>
                        <div>每个人衰老程度不同</div>
                        <div>
                           有些人“看起来”和“感觉”比他们实际年龄老。<br/>
                           而另一些人看起来比实际年龄年轻。
                        </div>
                        <div>尽管实际年龄与他们的生理年龄并不总是如此。</div>
                    </div>
                </div>
                <div style="width: 100%;height: auto; ">
                    <img src="static/images/ic6.png" style="width: 100%;height: auto;"/>
                </div>
                <div
                        style="width: 96%;height: auto;margin: 0 auto;font-family: arial; font-size: 16px;color:#666666;">
                    <div>根据说明书步骤收集唾液样本并以到付形式寄回实验室。</div>
                    <div>我们将在24个工作日内通过应用程序向您推送检测报告</div>
                    <div>我们将提供您输入到应用程序中的生活方式数据的分析，以及PDF报告和更新数据。</div>
                    <div>同时我们的人工智能系统将分析您和其他用户的数据，并向您提供“个性化”的建议。</div>
                </div>
            </div>
        </div>
    </div>
    <div id="four-adg" style="width: 100%;height: auto;">
        <div
                style="width: 100%;height: auto;font-family: arial;font-size:20px ;font-weight: 400; color: #0F86A4; margin-top: 30px;">
        </div>
        <div style="width: 100%;height: auto;margin-top: 20px;">
            <div style="width: 90%;height: auto;margin: 0 auto;">
                <div style="width: 49%;height: auto; float: left;">
                    <img src="static/images/ic2.png" style="width: 100%;height: auto;"/>
                </div>
                <div style="width: 49%;height: auto;float: left;">
                    <img src="static/images/ic3.png" style="width: 100%;height: auto;"/>
                </div>
            </div>
        </div>
    </div>
    <div id="aging-func" style="width: 100%;height: auto;">
        <div style="width: 100%;height: auto;">
            <div
                    style="width: 96%;height: auto;margin: 0 auto; font-family: arial;font-size: 18px;color: #1566B9;font-weight: 600;">
               我们的产品能为用户提供什么？
            </div>
            <div style="clear: both;">
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 95%;height: auto;margin: 0 auto;">
                    <div style="width: 100%;height: auto; font-size: 16px;">

                        <div id='box' style="color: #666666;font-family: arial;">
                           精准DNA甲基化技术-- 检测您的生物学年龄。
                        </div>
                        <div style="width: 100%;height: 20px;"></div>


                        <div id="box" style="color: #666666;font-family: arial;">基于应用程序的管理-- 动态跟踪个人生活方式的数据和干预与反复评估进展。
                        </div>
                        <div style="width: 100%;height: 20px;"></div>

                        <div id="box" style="color: #666666;font-family: arial;">大数据分析-- 基于第二代序列检测和人类生物学中与年龄相关的高度甲基化位点
                        </div>
                        <div style="width: 100%;height: 20px;"></div>

                        <div id="box" style="color: #666666;font-family: arial;">
                           大数据分析
                        </div>
                        <div style="width: 100%;height: 20px;"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="clear: both;"></div>
    <div style="width: 100%;height: 60px;"></div>
    <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
        <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 70px;">
            @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
        </div>
        <jsp:include page="footnav.jsp"></jsp:include>
    </div>

</body>

</html>
