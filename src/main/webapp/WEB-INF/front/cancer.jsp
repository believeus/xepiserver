<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/1
  Time: 14:32
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
    <title>大肠癌高危人群</title>
    <script src="static/js/jquery-2.1.1.min.js" type="application/javascript"></script>
    <script src="static/js/Detection.js" type="text/javascript"></script>
</head>
<body style="padding: 0;margin: 0;">
<jsp:include page="header.jsp"/>
<div id="container" style="width: 100%;height: auto;">
    <form id="form" action="FormTableController/getForm.jhtml" method="get" onsubmit="return check()">
        <div id="header" style="width: 100%;height: auto;background: linear-gradient(to bottom right, #BFC8FE 0%, #809DFA 100%);">
            <div style="width: 47%;height: 60px;float: left;">
                <img src="static/images/bg-logo.png"style="width: 100%;height: auto;"/>
            </div>

            <div style="width: 90%;height: auto;margin: 0 auto;color: #FFFFFF;text-align: center;font-family: arial;">
                <div style="width: 100%;height: 70px;"></div>
                <div style="width: 100%;height: auto;line-height: 30px;font-size: 20px;font-weight: 800;">大肠癌高危人群基本信息调查表</div>
                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 30%;float: left;text-align: right;">姓名：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" name="name" id="name" style="width: 80%; text-align: center; font-size: 16px; border:none; outline: none;background:transparent;border-bottom:1px solid #ffffff;"/>
                    </div>
                </div>
                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">性别：</div>
                    <div style="width: 70%;text-align: center; height: auto;float: left;text-align: left;">
                        <input type="radio" name="sex"style=" width: 16px;height: 16px; background-color: transparent; border: 2px solid #282828 ;-webkit-border-radius: 100px;"value="男"/>男
                        <input type="radio" name="sex" style=" width: 16px;height: 16px; background-color: transparent; border: 2px solid #282828 ;-webkit-border-radius: 100px;"value="女"/>女
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">出生日期：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" placeholder="1990-01-01"  name="birthday" id="birthday" style="width: 80%;border:none;text-align: center; color: #FFFFFF; outline: none; background:transparent;border-bottom:1px solid #ffffff;" >
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">

                    <div style="width: 30%;float: left;text-align: right;">身份证号码：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input class="card" type="text" name="id" id="id" style="width: 80%;border:none;text-align: center; color: #FFFFFF; outline: none; background:transparent;border-bottom:1px solid #ffffff;" >
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">问卷编号：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" value="001" readonly name="Code" style="width: 80%;font-size: 16px; border:none;text-align: center;  outline: none;background:transparent;border-bottom:1px solid #ffffff;"/>
                    </div>
                </div>
                <div style="width: 100%;height: 60px;"></div>
            </div>
        </div>


        <div id="basic-state" style="width: 100%;height: auto;background-color: #D9F6FF;color: #282828;overflow: hidden;">
            <div style="width: 90%;height: auto;margin: 0 auto;">
                <div style="width: 100%;height: auto;font-weight:900 ;font-size: 18px;line-height: 100px;">一般情况：</div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 800;">婚姻状况：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 20%; float: left;"> <input type="radio" name="marry"style="-webkit-appearance: radio;"value="未婚 "  />未婚 </div>
                    <div style="width: 20%; float: left;"><input type="radio" name="marry"style="-webkit-appearance: radio;"value="已婚" />已婚</div>
                    <div style="width: 20%; float: left;"><input type="radio" name="marry" style="-webkit-appearance: radio;"value="离婚"/>离婚</div>
                    <div style="width: 20%; float: left;"><input type="radio" name="marry"style="-webkit-appearance: radio;"value="丧偶" />丧偶</div>
                </div>
                <div style="width: 100%;height: 30px;"></div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 800;">文化程度：</div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 18%; float: left;"> <input type="radio" name="education" style="-webkit-appearance: radio;" value="文盲"/>文盲</div>
                    <div style="width: 18%; float: left;"><input type="radio" name="education"style="-webkit-appearance: radio;" value="小学" />小学</div>
                    <div style="width: 18%; float: left;"><input type="radio" name="education"style="-webkit-appearance: radio;" value="中学"/>中学</div>
                    <div style="width: 30%; float: left;"><input type="radio" name="education"style="-webkit-appearance: radio;" value="大专及以上"/>大专及以上</div>
                </div>

                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 800;overflow: hidden;">您家共有几口人，平均年收入大约为多少元？</div>
                <div style="width: 100%;height: 30px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 10%;float: left;">共</div>
                    <div style="width: 20%;float: left;"><input type="text" name="famil-menber" id="famil-menber" style="width: 100%;float: left;text-align: center;  border:none; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/></div>
                    <div style="width: 10%;float: left;">人 </div>
                    <div style="width: 10%;float: left;"></div>


                    <div style="width: 20%;float: left;"><input type="text" name="income-per-year" id="income-per-year" style="width: 100%;text-align: center; float: left; border:none; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/></div>
                    <div style="width: 30%;float: left;">元 / 年  </div>
                    <div style="width: 10%;float: left;"></div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 800;">您的饮用水主要来源于：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 22%; float: left;"> <input type="radio" name="water-source" style="-webkit-appearance: radio;" value="池塘水"/>池塘水 </div>
                    <div style="width: 20%; float: left;"><input type="radio" name="water-source" style="-webkit-appearance: radio;"value="河水"/>河水</div>
                    <div style="width: 20%; float: left;"><input type="radio" name="water-source" style="-webkit-appearance: radio;"value="井水"/>井水</div>
                    <div style="width: 22%; float: left;"><input type="radio" name="water-source" style="-webkit-appearance: radio;"value="自来水"/>自来水</div>
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>

        <div id="smok-state" style="width: 100%;height: auto;background-color: #FFFFFF;color: #282828;overflow: hidden;">
            <div style="width: 90%;height: auto;margin: 0 auto;">
                <div style="width: 100%;height: auto;line-height: 100px;font-size: 18px;font-weight: 900;">吸烟情况：</div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 800;">您是否吸烟？如果是，您已经吸烟多少年了？</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 20%; float: left;">
                        <div style="width: 30%;float: left;">
                            <input type="radio" name="smoke-or-not" style="-webkit-appearance: radio;"value="是"/>
                        </div>
                        <div style="width: 40%;float: left;">是</div>
                    </div>
                    <div style="width: 5%;float: left;">共</div>
                    <div style="width: 10%;float: left;">
                        <input type="text" name="smoke-year" id="smoke-year"  style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">年 </div>
                    <div style="width: 40%; float: left;">
                        <div style="width: 20%;float: left;">
                            <input type="radio" name="smoke-or-not" id="smoke-or-not" style="-webkit-appearance: radio;"value="没有吸烟"/>
                        </div>
                        <div style="width: 80%;float: left;">没有吸烟</div>
                    </div>
                </div>

                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 800;line-height: 60px;">您是否戒烟了？如果是，之前吸烟多少年了？</div>

                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 20%; float: left;">
                        <div style="width: 30%;float: left;">
                            <input type="radio" name="quit-smoke" id="quit-smoke" style="-webkit-appearance: radio;"value="是"/>
                        </div>
                        <div style="width: 40%;float: left;">是</div>
                    </div>
                    <div style="width: 5%;float: left;">共</div>
                    <div style="width: 10%;float: left;">
                        <input type="text" name="quit-smoke-year" id="quit-smoke-year"  style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">年 </div>
                    <div style="width: 40%; float: left;">
                        <div style="width: 20%;float: left;">
                            <input type="radio" name="quit-smoke" style="-webkit-appearance: radio;"value="没有戒烟"/>
                        </div>
                        <div style="width: 80%;float: left;">没有戒烟</div>
                    </div>
                </div>
                <div style="width: 100%;height: 60px;"></div>
            </div>
        </div>

        <div id="drink-state" style="width: 100%;height: auto;background-color: #D9F6FF;">
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;overflow: hidden;">
                <div style="width: 100%;height: auto;font-size: 18px;font-weight: 800;line-height: 100px;">饮酒情况：</div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 800;">您有饮酒的习惯吗？每天饮多少？共饮多少年？</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%; float: left ;line-height: 40px;">
                    <div style="width: 10%;float: left;">
                        <input type="radio" name="drink" style="-webkit-appearance: radio;"value="否，没有饮酒"/>
                    </div>
                    <div style="width: 80%;float: left;">否，没有饮酒</div>
                </div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 10%;float: left;">
                        <input type="radio" name="drink"value="啤酒" />
                    </div>
                    <div style="width: 15%;float: left;">啤酒，</div>

                    <div style="width: 15%;float: left;">
                        <input type="text" name="litre/day"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 23%;float: left;">两 / 天，</div>
                    <div style="width: 5%;float: left;">共</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="beer-drink-year"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">年 </div>
                </div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 10%;float: left;">
                        <input type="radio" name="drink"value="白酒" />
                    </div>
                    <div style="width: 15%;float: left;">白酒，</div>

                    <div style="width: 15%;float: left;">
                        <input type="text" name="litre/day"style="width: 100%;float: left; border:none;text-align: center;  outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 23%;float: left;">两 / 天，</div>
                    <div style="width: 5%;float: left;">共</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="white-drink-year"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">年 </div>
                </div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 10%;float: left;">
                        <input type="radio" name="drink" value="黄酒"/>
                    </div>
                    <div style="width: 15%;float: left;">黄酒，</div>

                    <div style="width: 15%;float: left;">
                        <input type="text" name="litre/day"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 23%;float: left;">两 / 天，</div>
                    <div style="width: 5%;float: left;">共</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="yellow-drink-year"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">年 </div>
                </div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 10%;float: left;">
                        <input type="radio" name="drink"value="米酒" />
                    </div>
                    <div style="width: 15%;float: left;">米酒，</div>

                    <div style="width: 15%;float: left;">
                        <input type="text" name="litre/day"style="text-align: center; width: 100%;float: left; border:none; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 23%;float: left;">两 / 天，</div>
                    <div style="width: 5%;float: left;">共</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="rice-drink-year"style="width: 100%;float: left;text-align: center; border:none; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">年 </div>
                </div>
                <div style="width: 100%;height: 60px;"></div>
            </div>
        </div>

        <div id="tea-state" style="width: 100%;height: auto;background-color:#FFFFFF ;font-family: arial;overflow: hidden;">
            <div style="width: 90%;height: auto;margin: 0 auto;color: #282828;">
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 18px;line-height: 100px;">饮茶情况：</div>
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;">您有饮茶的习惯吗？每天饮多少？共饮多少年？</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;line-height: 40px;">
                    <div style="width: 10%;float: left;">
                        <input type="radio" name="tea" style="-webkit-appearance: radio;"value="否，没有饮茶"/>
                    </div>
                    <div style="width: 80%;float: left;">否，没有饮茶</div>
                </div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 10%;float: left;">
                        <input type="radio" name="tea"value="花茶" />
                    </div>
                    <div style="width: 15%;float: left;">花茶，</div>

                    <div style="width: 15%;float: left;">
                        <input type="text" name="ml/day"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 23%;float: left;">两 / 天，</div>
                    <div style="width: 5%;float: left;">共</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="flower-tea-year"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">年 </div>
                </div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 10%;float: left;">
                        <input type="radio" name="tea" value="红茶"/>
                    </div>
                    <div style="width: 15%;float: left;">红茶，</div>

                    <div style="width: 15%;float: left;">
                        <input type="text" name="ml/day"style="width: 100%;float: left; border:none;text-align: center;  outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 23%;float: left;">两 / 天，</div>
                    <div style="width: 5%;float: left;">共</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="black-tea-year"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">年 </div>
                </div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 10%;float: left;">
                        <input type="radio" name="tea" value="绿茶"/>
                    </div>
                    <div style="width: 15%;float: left;">绿茶，</div>

                    <div style="width: 15%;float: left;">
                        <input type="text" name="ml/day"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 23%;float: left;">两 / 天，</div>
                    <div style="width: 5%;float: left;">共</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="green-tea-year"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">年 </div>
                </div>

                <div style="width: 100%;height: 60px;"></div>
            </div>
        </div>

        <div id="diet-state" style="width: 100%;height: auto;background-color:#D9F6FF ;font-family: arial;overflow: hidden;">
            <div style="width: 90%;height: auto;margin: 0 auto;color: #282828;">
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 18px;line-height: 100px;">饮食习惯（近5年）：</div>
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;">您每周食用新鲜蔬菜的次数？</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="vegitable"style=" -webkit-appearance: radio;"value="0-1 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">0-1 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="vegitable"style=" -webkit-appearance: radio;"value="2-3 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">2-3 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="vegitable"style=" -webkit-appearance: radio;"value="4-5 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">4-5 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="vegitable"style=" -webkit-appearance: radio;"value="6-7次"/>
                    </div>
                    <div style="width: 22%;height: auto;float: left;">6-7次</div>
                </div>

                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;line-height: 50px;">您每周食用新鲜水果的次数？</div>

                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="fruit"style=" -webkit-appearance: radio;"value="0-1 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">0-1 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="fruit"style=" -webkit-appearance: radio;"value="2-3 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">2-3 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="fruit"style=" -webkit-appearance: radio;"value="4-5 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">4-5 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="fruit"style=" -webkit-appearance: radio;"value="6-7次"/>
                    </div>
                    <div style="width: 22%;height: auto;float: left;">6-7次</div>
                </div>

                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;line-height: 50px;">您每周食用肉蛋奶类的次数？</div>

                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="eggmilk"style=" -webkit-appearance: radio;"value="0-1 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">0-1 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="eggmilk"style=" -webkit-appearance: radio;"value="2-3 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">2-3 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="eggmilk"style=" -webkit-appearance: radio;"value="4-5 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">4-5 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="eggmilk"style=" -webkit-appearance: radio;"value="6-7次"/>
                    </div>
                    <div style="width: 22%;height: auto;float: left;">6-7次</div>
                </div>

                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;line-height: 50px;">您每周食用腌制食品的次数？</div>

                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="pickledfood"style=" -webkit-appearance: radio;"value="0-1 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">0-1 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="pickledfood"style=" -webkit-appearance: radio;"value="2-3 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">2-3 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="pickledfood"style=" -webkit-appearance: radio;"value="4-5 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">4-5 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="pickledfood"style=" -webkit-appearance: radio;"value="6-7次"/>
                    </div>
                    <div style="width: 22%;height: auto;float: left;">6-7次</div>
                </div>
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;line-height: 50px;">您每周食用油炸熏制食品的次数？</div>

                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="smokefood"style=" -webkit-appearance: radio;"value="0-1 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">0-1 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="smokefood"style=" -webkit-appearance: radio;"value="2-3 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">2-3 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="smokefood"style=" -webkit-appearance: radio;"value="4-5 次"/>
                    </div>
                    <div style="width: 18%;height: auto;float: left;">4-5 次</div>

                    <div style="width: 6%;float: left;">
                        <input type="radio" name="smokefood"style=" -webkit-appearance: radio;"value="6-7 次"/>
                    </div>
                    <div style="width: 22%;height: auto;float: left;">6-7 次</div>
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>

        <div id="intestinal-tract-state" style="width: 100%;height: auto;background-color:#FFFFFF ;font-family: arial;overflow: hidden;">
            <div style="width: 90%;height: auto;margin: 0 auto;color: #282828;">
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 18px;line-height: 100px;">肠道疾病史：</div>
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;">您是否患过慢性结肠炎？如果是，患病诊断时是几岁了？</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="colitis"style=" -webkit-appearance: radio;"value="否"/>
                    </div>
                    <div style="width: 22%;height: auto;float: left;">否</div>
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="colitis"style=" -webkit-appearance: radio;"value="是"/>
                    </div>
                    <div style="width: 12%;height: auto;float: left;">是，</div>
                    <div style="width: 18%;float: left;">诊断时</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="age-get-colitis"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">岁 </div>
                </div>
                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;">您是否患过慢性溃疡性结肠炎？如果是，患病诊断时是几岁了？</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="ulcerative-colitis"style=" -webkit-appearance: radio;"value="否"/>
                    </div>
                    <div style="width: 22%;height: auto;float: left;">否</div>
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="ulcerative-colitis"style=" -webkit-appearance: radio;"value="是"/>
                    </div>
                    <div style="width: 12%;height: auto;float: left;">是，</div>
                    <div style="width: 18%;float: left;">诊断时</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="age-get-ul-colitis"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">岁 </div>
                </div>

                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;">您是否患过肠息肉？如果是，患病诊断时是几岁了？</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="Intestinal-polyps"style=" -webkit-appearance: radio;"value="否"/>
                    </div>
                    <div style="width: 22%;height: auto;float: left;">否</div>
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="Intestinal-polyps"style=" -webkit-appearance: radio;"value="是"/>
                    </div>
                    <div style="width: 12%;height: auto;float: left;">是，</div>
                    <div style="width: 18%;float: left;">诊断时</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="age-get-int-polyps"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">岁 </div>
                </div>

                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;">您是否患过慢性阑尾炎？如果是，患病诊断时是几岁了？</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="appendicitis"style=" -webkit-appearance: radio;"value="否"/>
                    </div>
                    <div style="width: 22%;height: auto;float: left;">否</div>
                    <div style="width: 6%;float: left;">
                        <input type="radio" name="appendicitis"style=" -webkit-appearance: radio;"value="是"/>
                    </div>
                    <div style="width: 12%;height: auto;float: left;">是，</div>
                    <div style="width: 18%;float: left;">诊断时</div>
                    <div style="width: 18%;float: left;">
                        <input type="text" name="age-get-appendicitis"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;"/>
                    </div>
                    <div style="width: 10%;float: left;">岁 </div>
                </div>
                <div style="width: 100%;height: 60px;"></div>
                <div style="width: 100%;height: auto;font-weight: 800;">如果您之前患过上述以外的肠道疾病，请在下方注明疾病名称及患病时年龄</div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 100%;height: 20px;"></div>
                    <input type="text" name="app-other-disease"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;" />
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>

        <div id="tumor-state" style="width: 100%;height: auto;background-color:#D9F6FF ;font-family: arial;overflow: hidden;">
            <div style="width: 90%;height: auto;margin: 0 auto;color: #282828;">
                <div style="width: 100%;height: 50px;"></div>
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 16px;">您所在的家族中是否有肿瘤患病史，如果有请在下方注明肿瘤名称，以及与您的亲属关系。</div>
                <div style="width: 100%;height: 20px;"></div>
                <div><input type="radio"name="tumor" style="-webkit-appearance: radio;" value="否，没有"/>否,没有</div>
                <div style="width: 16%; float: left;"><input type="radio"name="tumor" style="-webkit-appearance: radio;" value="是"/>是</div>
                <div style="width: 50%;float: left;"><input type="text" name="tumor-other-disease"style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #8AA4FA;" />  </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>
        <div id="bodycheck-state" style="width: 100%;height: auto;background-color:#FFFFFF ;font-family: arial;overflow: hidden;">
            <div style="width: 90%;height: auto;margin: 0 auto;color: #282828;">
                <div style="width: 100%;height: auto;font-weight: 800;font-size: 18px;line-height: 50px;">体格检查结果：</div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: 80px;border: 2px solid #282828;font-size: 14px;">

                    <div style="width: 24%;height: 100%;float: left;border-right: 2px solid #282828;">
                        <div style="width: 100%;height: 40px;text-align: center;font-weight: 700;line-height: 40px;border-bottom: 2px solid #282828;">身高 (cm)</div>
                        <div style="width: 100%;height: 40px;">
                            <input type="text" name="height" value="" style="width: 100%;height: 40px;font-weight: 700; border:none; text-align: center; outline: none;background:transparent;"/> </div>
                    </div>
                    <div style="width: 24%;height: 100%;float: left;border-right: 2px solid #282828;">
                        <div style="width: 100%;height: 40px;text-align: center;font-weight: 700;line-height: 40px;border-bottom: 2px solid #282828;">体重 (kg)</div>
                        <div style="width: 100%;height: 40px;">
                            <input type="text" name="weight" value="" style="width: 100%;height: 40px;font-weight: 700; border:none; text-align: center; outline: none;background:transparent;"/> </div>
                    </div>
                    <div style="width: 24%;height: 100%;float: left;border-right: 2px solid #282828;">
                        <div style="width: 100%;height: 40px;text-align: center;font-weight: 700;line-height: 40px;border-bottom: 2px solid #282828;">脉搏 (次/分)</div>
                        <div style="width: 100%;height: 40px;">
                            <input type="text" name="pulse" value="" style="width: 100%;height: 40px;font-weight: 700; border:none; text-align: center; outline: none;background:transparent;"/> </div>
                    </div>
                    <div style="width: 25.8%;height: 100%;float: left;">
                        <div style="width: 100%;height: 40px;text-align: center;;line-height: 40px;border-bottom: 2px solid #282828;">血压 (mmHg)</div>
                        <div style="width: 100%;height: 40px;">
                            <input type="text" name="blood-pressure"  style="width: 100%;height: 40px;font-weight: 700; border:none; text-align: center; outline: none;background:transparent;"/> </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="width: 100%;height: 80px;float: left;background-color: #FFFFFF;font-family: arial;"></div>
        <div id="submit" style="width: 100%;height: 40px;overflow: hidden;background-color: #FFFFFF;">
            <div style="width: 25%;height: 40px;float: left;"></div>
            <div style="width: 40%;height: 40px;float: left;">
                <input type="submit" name="submit"  value="提交" style="width: 100%;font-size: 18px;font-weight: 700; height: 40px; text-align: center; border-radius: 10px;background-color: #F8B551;" /></div>
            <div style="width: 25%;height: 40px;float: left;"></div>
        </div>
        <div style="width: 100%;height: auto;overflow: hidden;background-color: #FFFFFF;">
            <div style="width: 98%;height: auto;margin: 0 auto;font-family: arial;font-size: 14px;">
                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 40%;height: auto;float: left;"> 北京肛肠学会  </div>
                <div style="width: 60%;height: auto;float: left;">电话：010-57282998</div>
                <div style="width: 48%;height: auto;float: left;">网址：<a href="http://www.med626.com/">www.med626.com   </a>  </div>
                <div style="width: 52%;height: auto;float: left;"> 邮箱：xuehui@med626.com </div>
                <div style="width: 100%;height: 60px;"></div>
            </div>
        </div>
    </form>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>

