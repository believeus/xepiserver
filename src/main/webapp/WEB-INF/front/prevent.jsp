<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/2
  Time: 9:17
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
    <title>癌症预防知识调查表</title>
    <script src="static/js/jquery-2.1.1.min.js" type="application/javascript"></script>
    <script src="static/js/Detection.js" type="text/javascript"></script>
</head>
<body style="padding: 0;margin: 0;">
<jsp:include page="header.jsp"/>
<div id="container" style="width: 100%;height: auto;">
    <form id="form" action="FormTableController/getForm.jhtml" method="get" onsubmit="return prev()">
        <div id="header" style="width: 100%;height: auto;background: linear-gradient(to bottom right, #FFB1B1 0%, #FF5762 100%);">
            <div style="width: 47%;height: 60px;float: left;">
                <img src="static/images/bg-logo.png" style="width: 100%;height: auto;"/>
            </div>
            <div style="width: 90%;height: auto;margin: 0 auto;color: #FFFFFF;text-align: center;font-family: arial;">
                <div style="width: 100%;height: 70px;"></div>
                <div style="width: 100%;height: auto;font-size: 20px;font-weight: 800;">癌症预防知识调查表</div>
                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 30%;float: left;text-align: right;">姓名：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" id="name" name="name" style="width: 80%; text-align: center; font-size: 16px; border:none; outline: none;background:transparent;border-bottom:1px solid #ffffff;"/>
                    </div>
                </div>
                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">性别：</div>
                    <div style="width: 70%;text-align: center; height: auto;float: left;text-align: left;">
                        <input type="radio" name="sex" style=" width: 16px;height: 16px; background-color: transparent; border: 2px solid #282828 ;-webkit-border-radius: 100px;"value="男"/>男
                        <input type="radio" name="sex" style=" width: 16px;height: 16px; background-color: transparent; border: 2px solid #282828 ;-webkit-border-radius: 100px;"value="女"/>女
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">出生日期：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" id="birthday" name="birthday" placeholder="1990-01-01" style="width: 80%;border:none;text-align: center; color: #FFFFFF; outline: none; background:transparent;border-bottom:1px solid #ffffff;" >
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">

                    <div style="width: 30%;float: left;text-align: right;">身份证号码：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input class="card" type="text" id="id" name="id" style="width: 80%;border:none;text-align: center; color: #FFFFFF; outline: none; background:transparent;border-bottom:1px solid #ffffff;" >
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">问卷编号：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text" name="Code" readonly="readonly" value="002" style="width: 80%;font-size: 16px; border:none;text-align: center;  outline: none;background:transparent;border-bottom:1px solid #ffffff;"/>
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">调查员姓名：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text"  name="investigator"  readonly="readonly" value="1001" style="width: 80%;border:none;text-align: center; color: #FFFFFF; outline: none; background:transparent;border-bottom:1px solid #ffffff;" >
                    </div>
                </div>
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;overflow: hidden;">
                    <div style="width: 30%;float: left;text-align: right;">调查日期：</div>
                    <div style="width: 70%;height: auto;float: left;text-align: left;">
                        <input type="text"  name="investigate-date" id="time" readonly="readonly" style="width: 80%;border:none;text-align: center; color: #FFFFFF; outline: none; background:transparent;border-bottom:1px solid #ffffff;" >
                    </div>
                </div>
                <div style="width: 100%;height: 60px;"></div>
            </div>
        </div>
        <div id="first-part" style="width: 100%;height: auto;background-color: #FFE0E0;">
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">
                <div style="width: 100%;height: auto;font-weight: 800;line-height: 80px;font-size: 18px;">第一部分：</div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">您知道我国常见的癌症有哪些？(可多选)</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="cancertype"  value="肺癌，肝癌，胃癌，食管癌" />肺癌，肝癌，胃癌，食管癌
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="cancertype"  value="结，直肠癌" />结，直肠癌
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="cancertype" value="乳腺癌，宫颈癌" />乳腺癌，宫颈癌
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="cancertype"  value="前列腺癌，鼻咽癌" />前列腺癌，鼻咽癌
                </div>

                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">70年代以来我国患癌症的人数</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="cancer-population" style="-webkit-appearance: radio;"value="越来越多"/>越来越多
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="cancer-population" style="-webkit-appearance: radio;"value="越来越少"/>越来越少
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="cancer-population" style="-webkit-appearance: radio;"value="没多大变化"/>没多大变化
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="cancer-population" style="-webkit-appearance: radio;"value="不太了解"/>不太了解
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>
        <div id="first-part-2" style="width: 100%;height: auto;background-color: #FFFFFF;">
            <div style="width: 100%;height: 30px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">
                <div style="width: 100%;height: auto;font-weight: 700;font-size: 16px;">您知道我国癌症的主要危险因素有哪些？(可多选)</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="danger"  value="吸烟，饮酒" />吸烟，饮酒
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="danger"  value="各种感染因素" />各种感染因素
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="danger"  value="不合理的饮食习惯" />不合理的饮食习惯
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="danger"  value="职业危害" />职业危害
                </div>

                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-weight: 700;font-size: 16px;">下列哪些预防措施可以减少癌症的发生(可多选)</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reduce-cancer"  value="戒烟，少饮酒" />戒烟，少饮酒
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reduce-cancer"  value="乙肝疫苗的接种" />乙肝疫苗的接种
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reduce-cancer"  value="合理膳食和适当的锻炼" />合理膳食和适当的锻炼
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reduce-cancer"  value="消除职业危害" />消除职业危害
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>

        <div id="first-part-3" style="width: 100%;height: auto;background-color: #FFE0E0;overflow: hidden;">
            <div style="width: 100%;height: 30px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">
                <div style="width: 100%;height: auto;font-weight: 700;font-size: 16px;">相当一部分癌症有警示症状，只要保持警惕，及时就诊，就可以早期发现，您认为下列哪些症状应该及时去医院检查？(可多选)</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="sign"  value="肿块，疼痛" />肿块，疼痛
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="sign"  value="不明原因的出血" />不明原因的出血
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="sign"  value="不明原因的上腹不适" />不明原因的上腹不适
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="sign"  value="大便习惯改变或功能障碍" />大便习惯改变或功能障碍
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 40%;height: auto;float: left;">
                    <input type="checkbox" name="sign"  value="其他" />其他(请注明)
                </div>
                <div style="width: 60%;height: auto;float: left;">
                    <input type="text" name="remark" id="remark" style="width: 100%;float: left; border:none; text-align: center; outline: none;background:transparent;border-bottom:1px solid #FF5B65;"/>
                </div>
                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-weight: 700;font-size: 16px;">您知道“有效的预防措施至少可以较少1/3的癌症” 吗？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="know"  value="不知道"  style="-webkit-appearance: radio;" />不知道
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="know"  value="听了宣传后才知道" style="-webkit-appearance: radio;" />听了宣传后才知道
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="know"  value="本来就知道"  style="-webkit-appearance: radio;"/>本来就知道
                </div>

            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>
        <div id="first-part-3" style="width: 100%;height: auto;background-color: #FFFFFF;overflow: hidden;">
            <div style="width: 100%;height: 30px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">
                <div style="width: 100%;height: auto;font-weight: 700;font-size: 16px;">您知道”早期发现，早期诊断，早期治疗可根治1/3的癌症“吗？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="notice"  value="不知道"  style="-webkit-appearance: radio;"/>不知道
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="notice"  value="听了宣传后才知道"  style="-webkit-appearance: radio;"/>听了宣传后才知道
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="notice"  value="本来就知道"  style="-webkit-appearance: radio;"/>本来就知道
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>

        <div id="second-part" style="width: 100%;height: auto;background-color: #FFE0E0;">
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">
                <div style="width: 100%;height: auto;font-weight: 800;line-height: 80px;font-size: 18px;">第二部分：</div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">您认为大肠癌能治好吗？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="cancer-cureable"  value="不能" style="-webkit-appearance: radio;"/>不能
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="cancer-cureable"  value="不太了解" style="-webkit-appearance: radio;"/>不太了解
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="cancer-cureable" value="能" style="-webkit-appearance: radio;"/>能
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="cancer-cureable"  value="早期能治好" style="-webkit-appearance: radio;"/>早期能治好
                </div>

                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">您知道大肠癌的早期阶段吗？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="early-stage"  value="不知道" style="-webkit-appearance: radio;"/>不知道
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="early-stage"  value="听了宣传后才知道" style="-webkit-appearance: radio;"/>听了宣传后才知道
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="early-stage"  value="本来我就知道" style="-webkit-appearance: radio;"/>本来我就知道
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="early-stage"  value="不太了解" style="-webkit-appearance: radio;"/>不太了解
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>
        <div id="second-part2" style="width: 100%;height: auto;background-color: #FFFFFF;">
            <div style="width: 100%;height: 30px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">

                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">您知道早期大肠癌治疗后应能活多少年？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="canlive"  value="一年左右" style="-webkit-appearance: radio;"/>一年左右
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="canlive"  value="五年左右" style="-webkit-appearance: radio;"/>五年左右
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="canlive" value="大于十年" style="-webkit-appearance: radio;"/>大于十年
                </div>


                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">下列哪些方法可以早期发现大肠癌？(可多选)</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="check-method"  value="大便化验" />大便化验
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="check-method"  value="X-线检查" />X-线检查
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="check-method"  value="肠镜检查"/>肠镜检查
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="check-method"  value="其他方法" />其他方法
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>
        <div id="second-part3" style="width: 100%;height: auto;background-color: #FFE0E0;">
            <div style="width: 100%;height: 30px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">

                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">您认为不参加普查主要是因为？(可多选)</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reason"  value="不知道检查的好处" />不知道检查的好处
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reason"  value="做肠镜难受"/>做肠镜难受
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reason" value="查处后有心理负担" />查处后有心理负担
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reason" value="查出大肠癌治疗不好" />查出大肠癌治疗不好
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reason" value="没有症状，所以不愿检查" />没有症状，所以不愿检查
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reason" value="害怕上当受骗" />害怕上当受骗
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="reason" value="工作忙，没时间"/>工作忙，没时间
                </div>


                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">下列那些方法可以治疗早期大肠癌？(多选)</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="cure-method"  value="手术治疗" />手术治疗
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="cure-method"  value="不开刀肠镜直视下切除治疗" />不开刀肠镜直视下切除治疗
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="cure-method"  value="反射治疗(照光)"/>反射治疗(照光)
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="checkbox" name="cure-method"  value="其他" />其他
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>

        <div id="second-part4" style="width: 100%;height: auto;background-color: #FFFFFF;">
            <div style="width: 100%;height: 40px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">

                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">合理饮食，粗细粮搭配等能预防大肠癌吗？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="can-prevent"  value="能" style="-webkit-appearance: radio;"/>能
                </div>

                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="can-prevent" value="不能" style="-webkit-appearance: radio;"/>不能
                </div>


                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">经常吃新鲜水果，蔬菜，含粗纤维事物能预防大肠癌吗？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="can-cure"  value="能" style="-webkit-appearance: radio;"/>能
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="can-cure"  value="不能" style="-webkit-appearance: radio;"/>不能
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>

        <div id="second-part5" style="width: 100%;height: auto;background-color: #FFE0E0;">
            <div style="width: 100%;height: 40px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">

                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">养成良好的大便习惯，能预防大肠癌吗？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="habit"  value="能" style="-webkit-appearance: radio;"/>能
                </div>

                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="habit" value="不能" style="-webkit-appearance: radio;"/>不能
                </div>


                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">经常饮用不洁水容易得大肠癌吗？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="waste-water"  value="容易" style="-webkit-appearance: radio;"/>容易
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="waste-water"  value="困难" style="-webkit-appearance: radio;"/>困难
                </div>
            </div>
            <div style="width: 100%;height: 60px;"></div>
        </div>

        <div id="second-part6" style="width: 100%;height: auto;background-color: #FFFFFF;">
            <div style="width: 100%;height: 40px;"></div>
            <div style="width: 90%;height: auto;margin: 0 auto;font-family: arial;color: #282828;">

                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">您认为大便带血或腹泻，便秘交替您会到医院就诊吗？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="see-doctor"  value="会" style="-webkit-appearance: radio;"/>会
                </div>

                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="see-doctor" value="不会" style="-webkit-appearance: radio;"/>不会
                </div>


                <div style="width: 100%;height: 40px;"></div>
                <div style="width: 100%;height: auto;font-size: 16px;font-weight: 700;">您知道家属中有大肠腺瘤病(息肉)或大肠癌的人应积极参加普查吗？</div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="fam-member-atten"  value="知道" style="-webkit-appearance: radio;"/>知道
                </div>
                <div style="width: 100%;height: 10px;"></div>
                <div style="width: 100%;height: auto;">
                    <input type="radio" name="fam-member-atten"  value="不知道" style="-webkit-appearance: radio;"/>不知道
                </div>
            </div>

        </div>
        <div style="width: 100%;height: 80px;float: left;background-color: #FFFFFF;font-family: arial;"></div>
        <div id="submit" style="width: 100%;height: 40px;overflow: hidden;background-color: #FFFFFF;">
            <div style="width: 25%;height: 40px;float: left;"></div>
            <div style="width: 40%;height: 40px;float: left;">
                <input type="submit"name="submit"value="提交"style="width: 100%;font-size: 18px;font-weight: 700; height: 40px; text-align: center; border-radius: 10px;background-color: #F8B551;" /></div>
            <div style="width: 25%;height: 40px;float: left;"></div>
        </div>
        <div style="width: 100%;height: 40px;"></div>
        <div style="width: 98%;height: auto;margin: 0 auto;font-family: arial;font-size: 14px;">
            <div style="width: 40%;height: auto;float: left;"> 北京肛肠学会  </div>
            <div style="width: 60%;height: auto;float: left;">电话：010-57282998</div>
            <div style="width: 48%;height: auto;float: left;">网址：<a href="http://www.med626.com/">www.med626.com   </a>  </div>
            <div style="width: 52%;height: auto;float: left;"> 邮箱：xuehui@med626.com </div>
        </div>
        <div style="width: 100%;height: 60px;"></div>
    </form>
</div>
</body>
</html>

