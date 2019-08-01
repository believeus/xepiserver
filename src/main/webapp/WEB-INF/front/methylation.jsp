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
                DNA甲基化是DNA上的化学标记。
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;line-height: 24px;">
                <div>DNA甲基化是怀孕期间在不同位置加在DNA上的一种化学标记。</div>
                <div>DNA甲基化是我们基因的“表观遗传”程序的一部分</div>
                <div>当DNA甲基化发生在基因的几个重要位置时，它可以使基因的功能沉默。</div>
                <div>这就是同一个基因如何在我们身体的不同细胞中表达或沉默。</div>
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
                <div style="font-family: arial;font-size: 24px;font-weight: 700;color: #036EB8;">DNA甲基化；基因组软件</div>

            </div>
            <div style="width: 100%;height: auto;"><img src="static/images/met1.jpg" style="width: 100%;height: auto;"/>
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;line-height: 24px;">
                <div style="width: 100%;height: auto;font-family: arial;color: #666666;line-height: 24px;">
                    如果我们设想我们的DNA是一台运行细胞的微型计算机，那么：
                </div>


                <ul>
                    <li> DNA- 就是硬件。</li>
                    <li>基因序列- 就是操作系统。</li>
                    <li>DNA甲基化是DNA上的软件编码应用程序。</li>
                    <li>不同的“应用程序”使单元在空间和时间上执行特定的任务</li>
                </ul>
            </div>

            <div style="width: 100%;height: 20px;"></div>
            <div style="font-family: arial;font-size: 16px;color: #036EB8;">
                这些基因组应用程序确保我们的身体正常工作。每个组织都经过适当的程序设计，以确保我们的健康和幸福。每一种细胞类型都有其独特的甲基化标记组合，因此有一种独特的活性和沉默的基因组合。
            </div>
            <div style="width: 100%;height: auto;"><img src="static/images/methy-2.png"
                                                        style="width: 100%;height: auto;"/></div>
            <div style="font-family: arial;font-size: 24px;font-weight: 700;color: #036EB8;">
                DNA甲基化的变化会导致疾病；标测DNA甲基化的变化图可以检测疾病。
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
               DNA甲基化的变化改变了细胞和组织的运作方式，可以将健康组织转化为患病组织。
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
                30多年前，SZYF提出DNA甲基化的变化会导致癌症等疾病。
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
               因此，DNA甲基化是检测和治疗疾病的重要平台。
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
               麦吉尔大学SZYF实验室的研究表明，在动物模型中，通过阻断将甲基化基团添加到DNA中的蛋白质，可以逆转癌症。自那以后，许多研究都重复了这一点。
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #666666;">
               最近SZYF发现，通过检测白细胞中的DNA甲基化，可以早期发现肝癌。
            </div>
        </div>
    </div>
    <div id="tumor" style="width: 100%;height: auto;">
        <div style="width: 90%;height: auto;margin: 0 auto;">
            <div style="width: 100%;height: auto;"><img src="static/images/met2.jpg" style="width: 100%;height: auto;"/>
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #036EB8;line-height: 24px;font-size: 24px;font-weight: 700;">
               环境会引起DNA甲基化的变化。
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-family: arial;color: #6D6D6D;">
               Jirtle及其同事在2004年的一项研究表明，在小鼠模型中，怀孕期间的母亲饮食会影响其后代的DNA甲基化，并改变其皮毛颜色、肥胖风险和其他状况。
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="font-family: arial;color: #666666;">
               Szyf及其同事的研究发现，母亲的关心和行为会影响她后代的DNA甲基化，以及他们对生活后期压力的反应。这些研究开创了行为表观遗传学和表观遗传学精神病学领域。
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="font-family: arial;color: #666666;">
              这些发现提供了心理和生理环境都能影响DNA甲基化的第一个证据。
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
                   DNA甲基化可能通过物理和行为干预可逆。
                </div>
                <div style="width: 35%;height: 100px;float: left;">
                    <img src="static/images/met-icon.jpg" style="width: 100%;height: auto;"/>
                </div>
                <div style="clear: both;"></div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto; ">

                    <div id='dot' style="color: #666666;font-family: arial;"> 研究表明，不同的环境变化可以改变或逆转DNA甲基化事件。
                    </div>
                    <div style="width: 100%;height: 20px;"></div>


                    <div id="dot" style="color: #666666;font-family: arial;">因此，我们有可能通过改变生活方式来改变DNA甲基化。
                    </div>
                    <div style="width: 100%;height: 20px;"></div>

                    <div id="dot" style="color: #666666;font-family: arial;">我们对DNA甲基化的乐观来自于这样一个事实- 即DNA甲基化与遗传学的差异是可逆的。
                    </div>
                    <div style="width: 100%;height: 20px;"></div>

                </div>
            </div>
            <div style="width: 100%;height: auto;">
                <div style="width: 98%;height: auto;margin: 0 auto;">
                    <div style="width: 65%;height: 100px;float: left; font-family: arial;color: #036EB8;;font-weight: 600;padding-top: 40px">
                        DNA甲基化和表观遗传时钟
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
                            随着Horvath发现了“表观遗传时钟”，生物年龄标记的研究发生了范式转变。
                        </div>
                        <div style="width: 100%;height: 20px;"></div>


                        <div id="dot" style="width: 100%; height: auto; color: #666666;font-family: arial;">
                            人们发现，随着年龄的增长，DNA中某些基因的甲基化水平会发生变化。
                        </div>
                        <div style="width: 100%;height: 20px;"></div>

                        <div id="dot" style="width: 100%;height: auto; color: #666666;font-family: arial;">
                           通过测量这些基因的甲基化，就可以确定我们的生物年龄。
                        </div>
                        <div style="width: 100%;height: 20px;"></div>
                        <div id="dot" style="width: 100%;height: auto; color: #666666;font-family: arial;">
							我们的生理年龄比年龄更能衡量我们的健康和福祉。
                        </div>
                        <div style="width: 100%;height: 20px;"></div>
                        <div id="dot" style="width: 100%;height: auto; color: #666666;font-family: arial;">
                            研究表明，加速“DNA甲基化年龄”是早期死亡和慢性疾病的预测因素。
                        </div>
                        <div style="width: 100%;height: 20px;"></div>
                        <div id="dot" style="width: 100%;height: auto; color: #666666;font-family: arial;">
                            在动物身上进行的实验表明，通过饮食改变来逆转生物钟是可能的。
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
