<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/2
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>大肠癌筛查数量化风险评估问卷</title>
    <script src="static/js/jquery-2.1.1.min.js" type="application/javascript"></script>
    <script src="static/js/Detection.js" type="text/javascript"></script>
</head>
<body style="padding: 0;margin: 0;">
<jsp:include page="header.jsp"/>
<div id="container" style="width: 100%;height: auto;">
    <form action="FormTableController/getForm.jhtml" method="get" onsubmit="return quan()">
        <div id="header" style="width: 100%;height: auto;background: linear-gradient(to bottom right, #FFE9B0 0%, #FDC46A 100%);overflow: hidden;">
            <div style="width: 90%;height: auto;margin: 0 auto;color: #FFFFFF;text-align: center;font-family: arial;">
                <div style="width: 47%;height: 60px;float: left;">
                    <img src="static/images/bg-logo.png" style="width: 100%;height: auto;" />
                </div>
                <div style="width: 100%;height: 70px;"></div>
                <div style="width: 100%;height: auto;font-size: 20px;font-weight: 800;">大肠癌筛查数量化风险评估问卷</div>
                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 30%;float: left;text-align: right;">姓名：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" name="name" id="name" style="width: 80%; text-align: center; font-size: 16px;color: #282828; border:none; outline: none;background:transparent;border-bottom:1px solid #ffffff;" />
                    </div>
                </div>
                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">性别：</div>
                    <div style="width: 70%;text-align: center; height: auto;float: left;text-align: left;">
                        <input type="radio" name="sex" style=" width: 16px;height: 16px; background-color: transparent; border: 2px solid #282828 ;-webkit-border-radius: 100px;"
                               value="男" />男
                        <input type="radio" name="sex" style=" width: 16px;height: 16px; background-color: transparent; border: 2px solid #282828 ;-webkit-border-radius: 100px;"
                               value="女" />女
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">出生日期：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" name="birthday" id="birthday" placeholder="1990-01-01" style="width: 80%;border:none;text-align: center; font-size: 16px; color: #282828;outline: none; background:transparent;border-bottom:1px solid #ffffff;">
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">

                    <div style="width: 30%;float: left;text-align: right;">身份证号码：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input class="card" type="text" name="id" id="id" style="width: 80%;border:none;text-align: center; font-size: 16px; color: #282828; outline: none; background:transparent;border-bottom:1px solid #ffffff;">
                    </div>
                </div>

                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">问卷编号：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" name="Code" value="003" readonly="readonly" style="width: 80%;font-size: 16px; border:none;text-align: center; color: #282828; outline: none;background:transparent;border-bottom:1px solid #ffffff;" />
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">电话号码：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" name="telephone" id="telephone" style="width: 80%;border:none;text-align:center; font-size: 16px; center;color: #282828; outline: none; background:transparent;border-bottom:1px solid #ffffff;">
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">调查日期：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" name="investigate-date" id="time" style="width: 80%;border:none;text-align:center; font-size: 16px; center;color: #282828; outline: none; background:transparent;border-bottom:1px solid #ffffff;">
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">现居地址：</div>
                    <div style="width: 70%;height: auto;float: left;"></div>
                    <div style="width: 100%;height: 30px;"></div>
                    <div style="width: 90%;height: auto;text-align: left;margin: 0 auto;">
                        <textarea name="address" id="address" rows="2" cols="0" style="overflow: hidden;width: 100%;border:none;text-align: left;color: #282828;  outline: none; background:transparent;border-bottom:1px solid #ffffff;"></textarea>
                    </div>

                </div>
                <div style="width: 100%;height: 60px;"></div>
            </div>
        </div>
        <div id="max-state" style="width: 100%;height: auto;overflow: hidden;">
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">婚姻状况：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="marry" value="未婚" />未婚
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="marry" value="已婚" />已婚
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="marry" value="离婚" />离婚
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="marry" value="丧偶" />丧偶
                    </div>
                </div>

            </div>
            <div style="width: 100%;height: 40px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">文化程度：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="education" value="文盲" />文盲
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="education" value="小学" />小学
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 35%;height: auto;float: left;"><input type="radio" name="education" value="中学，中专" />中学，中专
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 35%;height: auto;float: left;"><input type="radio" name="education" value="大学，大专" />大学，大专
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 40%;height: auto;float: left;"><input type="radio" name="education" value="研究生及以上" />研究生及以上</div>
                </div>

            </div>
            <div style="width: 100%;height: 60px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;overflow: hidden;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">职业：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="work"  value="农民" />农民
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="work"  value="工人" />工人
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 35%;height: auto;float: left;"><input type="radio" name="work"  value="个体户" />个体户
                    </div>
                </div>

                <div style="width: 100%;height: auto;">
                    <div style="width: 50%;height: auto;float: left;"><input type="radio" name="work"  value="各类专业技术人员" />各类专业技术人员
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 40%;height: auto;float: left;"><input type="radio" name="work"  value="其他" />其他</div>
                </div>
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;overflow: hidden;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">本人有无慢性腹泻史：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="diarrhea"  value="有" />有
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="diarrhea"  value="无" />无</div>
                </div>

            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;overflow: hidden;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">本人有无慢性便秘史：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="constipation"  value="有" />有
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="constipation"  value="无" />无
                    </div>
                </div>

            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;overflow: hidden;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">本人有无粘液或血便史：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="bloody-stool"  value="有" />有 </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="bloody-stool"  value="无" />无 </div>
                </div>

            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;overflow: hidden;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">本人有无慢性阑尾炎或阑尾切除史：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="appendix"  value="有" />有
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="appendix"  value="无" />无
                    </div>
                </div>

            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;overflow: hidden;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">本人有无慢性胆囊炎或胆囊切除史：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="cholecystitis" value="有" />有 </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="cholecystitis" value="无" />无 </div>
                </div>

            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;overflow: hidden;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">近二十年来本人有无不良生活事件史：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="unhealth-life" value="有" />有 </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="unhealth-life"  value="无" />无 </div>
                </div>

            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;overflow: hidden;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">本人有无癌症史：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="cancer-own" value="有" />有
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;"><input type="radio" name="cancer-own" value="无" />无
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 15px;"></div>
            <div style="width: 90%;height: auto;overflow: hidden;margin: 0 auto; font-family: arial;color: #282828;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">如有，请具体描述癌症名称：</div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 20%;height: auto;float: left;">发病年龄 </div>
                    <div style="width: 20%;height: auto;float: left;">
                        <input type="text" name="cancer-age" id="cancer-age" value="" style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;" />
                    </div>
                    <div style="width: 10%;height: auto;float: left;">岁 </div>
                </div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 20%;height: auto;float: left;">诊断医院</div>
                    <div style="width: 40%;height: auto;float: left;">
                        <input type="text" name="hospital" id="hospital" value="" style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;" />
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;overflow: hidden;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">本人有无肠息肉史：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;">
                        <input type="radio" name="cancer" value="有" />有 </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;">
                        <input type="radio" name="cancer" value="无" />无 </div>
                </div>
            </div>
            <div style="width: 100%;height: 15px;"></div>
            <div style="width: 90%;height: auto;overflow: hidden;margin: 0 auto; font-family: arial;color: #282828;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 700;">一级亲属（父，母，兄弟姐妹，子女肠癌史）：</div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 100%;height: auto;">
                        <div style="width: 25%;height: auto;float: left;">
                            <input type="radio" name="Family-disease"  value="有" />有 </div>
                    </div>
                    <div style="width: 100%;height: auto;">
                        <div style="width: 25%;height: auto;float: left;">
                            <input type="radio" name="Family-disease"  value="无" />无 </div>
                    </div>
                </div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 20%;height: auto;float: left;">姓名：</div>
                    <div style="width: 20%;height: auto;float: left;">
                        <input type="text" name="relative-name" value="" style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;" />
                    </div>
                </div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 25%;height: auto;float: left;">发病年龄：</div>
                    <div style="width: 20%;height: auto;float: left;">
                        <input type="text" name="cancer-age"  value="" style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;" />
                    </div>
                </div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 25%;height: auto;float: left;">在世与否：</div>
                    <div style="width: 100%;height: auto;">
                        <div style="width: 25%;height: auto;float: left;">
                            <input type="radio" name="alive" value="有" />有 </div>
                    </div>
                    <div style="width: 100%;height: auto;">
                        <div style="width: 25%;height: auto;float: left;">
                            <input type="radio" name="alive" value="无" />无 </div>
                    </div>
                </div>
            </div>

        </div>
        <div style="width: 100%;height: 80px;float: left;background-color: #FFFFFF;font-family: arial;"></div>
        <div id="submit" style="width: 100%;height: 40px;overflow: hidden;background-color: #FFFFFF;">
            <div style="width: 25%;height: 40px;float: left;"></div>
            <div style="width: 40%;height: 40px;float: left;">
                <input type="submit" name="submit" value="提交" style="width: 100%;font-size: 18px;font-weight: 700; height: 40px; text-align: center; border-radius: 10px;background-color: #F8B551;" /></div>
            <div style="width: 25%;height: 40px;float: left;"></div>
        </div>
        <div style="width: 100%;height: 40px;"></div>
        <div style="width: 98%;height: auto;margin: 0 auto;font-family: arial;font-size: 14px;">
            <div style="width: 40%;height: auto;float: left;"> 北京肛肠学会 </div>
            <div style="width: 60%;height: auto;float: left;">电话：010-57282998</div>
            <div style="width: 48%;height: auto;float: left;">网址：<a href="http://www.med626.com/">www.med626.com </a> </div>
            <div style="width: 52%;height: auto;float: left;"> 邮箱：xuehui@med626.com </div>
        </div>
        <div style="width: 100%;height: 60px;"></div>
    </form>
</div>
</body>
</html>
