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
    <title>Product list</title>
    <!--自适应字体大小-->
</head>
<body>
<div style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
    <div style="width: 100%;height: auto;">
        <div style="width: 100%;height: 30px;"></div>
        <a href="prof/index.jhtml">
            <div style="width: 98%;height: auto;margin: 0 auto;overflow: hidden;">
                <div style="width: 34%;height: auto;float: left;">
                    <img src="static/images/prof.png" style="width: 100%;height: auto;"/>
                </div>
                <div style="width: 6%;;height: 20px;float: left;"></div>
                <div style="width: 48%;height: auto;float: left;font-family: arial;">
                    <div style="width: 100%;height: 8px;"></div>
                    <div style="font-weight: 700;color: #27809D;line-height: 38px;font-size: 16px;">Moshe Szyf, Prof.
                    </div>
                    <div style="color: #666666;">Chairman & CEO</div>
                    <div style="color: #666666;font-size: 12px;">HKG epiTHERAPEUTICS Ltd.</div>
                </div>
                <div style="width: 10%;height: auto;float: left;line-height: 30px;">
                    <div style="width: 100%;height: 28px;"></div>
                    <div style="width: 50%;height: 20px;"><img src="static/images/arr.png"
                                                               style="width: 100%;height: auto;"/></div>
                </div>
            </div>
        </a>

        <div style="width: 100%;height: 20px;"></div>
        <a href="david/index.jhtml">
            <div style="width: 98%;height: auto;margin: 0 auto;overflow: hidden;">
                <div style="width: 34%;height: auto;float: left;">
                    <img src="static/images/David.png" style="width: 100%;height: auto;"/>
                </div>
                <div style="width: 6%;;height: 20px;float: left;"></div>
                <div style="width: 48%;height: auto;float: left;font-family: arial;">
                    <div style="width: 100%;height: 8px;"></div>
                    <div style="font-weight: 700;color: #27809D;line-height: 38px;font-size: 16px;">David Cheishvili
                    </div>
                    <div style="color: #666666;">Senior Scientific Adviser</div>
                    <div style="color: #666666;font-size: 12px;">HKG epiTHERAPEUTICS Ltd.</div>
                </div>
                <div style="width: 10%;height: auto;float: left;line-height: 30px;">
                    <div style="width: 100%;height: 28px;"></div>
                    <div style="width: 50%;height: 20px;">
                        <img src="static/images/arr.png" style="width: 100%;height: auto;"/>
                    </div>
                </div>
            </div>
        </a>
        <div style="width: 100%;height: 20px;"></div>
        <a href="huili/index.jhtml">
            <div style="width: 98%;height: auto;margin: 0 auto;overflow: hidden;">
                <div style="width: 34%;height: auto;float: left;">
                    <img src="static/images/HuiLi.png" style="width: 100%;height: auto;"/>
                </div>
                <div style="width: 6%;;height: 20px;float: left;"></div>
                <div style="width: 48%;height: auto;float: left;font-family: arial;">
                    <div style="width: 100%;height: 8px;"></div>
                    <div style="font-weight: 700;color: #27809D;line-height: 38px;font-size: 16px;">Hui Li</div>
                    <div style="color: #666666;">Laboratory Manager</div>
                    <div style="color: #666666;font-size: 12px;">HKG epiTHERAPEUTICS Ltd.</div>
                </div>
                <div style="width: 10%;height: auto;float: left;line-height: 30px;">
                    <div style="width: 100%;height: 28px;"></div>
                    <div style="width: 50%;height: 20px;">

                        <img src="static/images/arr.png" style="width: 100%;height: auto;"/>

                    </div>
                </div>
            </div>
        </a>
        <div style="width: 100%;height: 20px;"></div>
        <a href="chifat/index.jhtml">
            <div style="width: 98%;height: auto;margin: 0 auto;overflow: hidden;">
                <div style="width: 34%;height: auto;float: left;">
                    <img src="static/images/Chi Fat.png" style="width: 100%;height: auto;border-radius: 10px;"/>
                </div>
                <div style="width: 6%;;height: 20px;float: left;"></div>
                <div style="width: 48%;height: auto;float: left;font-family: arial;">
                    <div style="width: 100%;height: 8px;"></div>
                    <div style="font-weight: 700;color: #27809D;line-height: 38px;font-size: 16px;">Chi Fat Wong</div>
                    <div style="color: #666666;">Senior Research Scientist</div>
                    <div style="color: #666666;font-size: 12px;">HKG epiTHERAPEUTICS Ltd.</div>
                </div>
                <div style="width: 10%;height: auto;float: left;line-height: 30px;">
                    <div style="width: 100%;height: 28px;"></div>
                    <div style="width: 50%;height: 20px;"><img src="static/images/arr.png"
                                                               style="width: 100%;height: auto;"/></div>
                </div>
            </div>
        </a>
        <div style="width: 100%;height: 20px;"></div>
        <a href="zhiyuan/index.jhtml">
            <div style="width: 98%;height: auto;margin: 0 auto;overflow: hidden;">
                <div style="width: 34%;height: auto;float: left;">
                    <img src="static/images/Zhiyuan Lv.png" style="width: 100%;height: auto;border-radius: 10px;"/>
                </div>
                <div style="width: 6%;;height: 20px;float: left;"></div>
                <div style="width: 48%;height: auto;float: left;font-family: arial;">
                    <div style="width: 100%;height: 8px;"></div>
                    <div style="font-weight: 700;color: #27809D;line-height: 38px;font-size: 16px;">Zhiyuan Lv</div>
                    <div style="color: #666666;">Laboratory Manager</div>
                    <div style="color: #666666;font-size: 12px;">Beijing Epidial Medical Diagnostic Technology Co.,
                        Ltd.
                    </div>
                </div>
                <div style="width: 10%;height: auto;float: left;line-height: 30px;">
                    <div style="width: 100%;height: 28px;"></div>
                    <div style="width: 50%;height: 20px;"><img src="static/images/arr.png"
                                                               style="width: 100%;height: auto;"/></div>
                </div>
            </div>
        </a>
        <div style="width: 100%;height: 60px;"></div>
        <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
            <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
                @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
            </div>
        </div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
