<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <script src="static/js/build/dist/echarts.js"></script>
    <script src="static/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'static/js/build/dist'
            }
        });
    </script>
    <base href="<%=basePath%>">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <title>bioagereport</title>

</head>
<body style="padding: 0px;margin: 0px;background-color: #ffffff;">
<div style="width: 100%;height: auto;">
    <jsp:include page="header.jsp"/>

    <script>
        //定义两个全局变量存放生物学年龄数据
        window.ntrGtBioData = [];
        window.ntrLtBioData = [];
        window.ready = false;
    </script>
    <div id="illu-pic" style="width: 100%;height: auto;">
        <img src="static/images/ic1.png" style="width: 100%;height: auto;"/>
    </div>
    <div id="version-2.0" style="width: 100%;height: auto;">
        <div style="width: 100%;height: auto;margin-bottom: 10px;">
            <div style="width: 90%;height: auto;font-family: arial;color: #000000;font-size: 18px;  margin: 0 auto;ont-weight: bold;margin-top: 30px;">
                Dear User:
            </div>
            <div style="width: 90%;height: auto;font-family: arial;color: #000000;font-size: 18px;  margin: 0 auto;">You
                can click the "Repurchase" button below to buy again.
            </div>
            <div id="coupon"
                 style="width: 100%;height: auto;font-size: 16px;font-family:arial; color: #FF6B03; ">
                <div style="width: 90%;height: auto;margin: 0 auto;">
				<span
                        style="text-decoration: line-through;font-family: arial; font-size: 18px;color: #7F7F7F;">$120/kit
					for original price<br/>
				</span>
                    <p></p>
                    <span style="font-size: 18px;font-family: arial"><strong
                            style="font-weight: 600 ;font-size: 18px; font-family: arial; ">$99</strong>
					per kit for purchase <strong
                                style="font-family: arial;font-size: 18px;"> 1</strong> kit<br/>
				</span>
                    <p></p>
                </div>
            </div>
            <div id="add-cart" style="width: 100%;height: auto;margin-top: 20px;">
                <div style="width: 90%;height: auto;margin: 0 auto;">
                    <div style="width: 40%;height: 40px;font-family: arial;font-size: 18px;text-align: center;line-height: 40px; color:#FFFFFF ;float: left;">
                    </div>
                    <a href="/user/cart/index.jhtml">
                        <div style="width: 40%;height: 40px;font-family: arial;font-size: 18px;text-align: center;line-height: 40px; color:#FFFFFF ;float: right;background-color: #0365D2; border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;">
                            Repurchase
                        </div>
                    </a>
                </div>
            </div>
            <div style="width: 100%;height: 40px;"></div>
            <div style="width: 100%;" name="pending">
                <div name="barcode" style="font-size: 18px;width: 95%;margin: 0 auto;">
                    Your order has been accepted. We will send the saliva collection box to your order address. When you
                    receive the saliva collection kit, please collect 1ML saliva in the saliva collection tube and seal
                    it properly and send it back to our laboratory in the form of pay-on-demand. After the test report
                    is
                    issued, The report will be updated on this page.<br>
                    <div style="width: 100%;height: 15px;"></div>
                    <p><strong>enter the barcode on the saliva collection tube.</strong></p>
                    <div style="width: 100%;height: 10px;"></div>
                    <script>
                        $(function () {
                            //获得已经购买的DNA套件
                            $.post("/user/cart/paydnakit.jhtml", function (data) {
                                if (data.length != 0) {

                                    data.forEach(function (v) {
                                        var div = "<div style='width: 100%;height:auto;margin: 0 auto;'>";
                                        div += "<div style='border: 1px dashed grey;border-radius: 5px;padding: 5px;height:80px;width: 100%'>";
                                        div += "<form  action=''>" +
                                            "<div style='float: left;height: 30px;line-height: 30px;font-size: 16px;font-weight: bold;width: 22%;text-align: center;'>barcode:</div>" +
                                            "<div style='width: 78%;height: 30px;float: left'><input name='barcode'  style='width: 100%;height: 100%;border: 1px solid blue;' value='" + v.barcode + "' /></div>" +
                                            "<div style='width: 100%;height:5px;clear: both; '></div>" +
                                            "<div style='width: 100%;height: 30px;'>" +
                                            "<div style='width: 59%;float: left;height: 30px;'><input  id=" + v.id + " name='bind' type='button' style='width: 100%;height: 30px;background-color: #1e347b;color: white;border: none;border-radius: 5px;font-size: 14px' value='Link/Upload Your Barcode'/></div>" +
                                            "<div style='width: 1%;height: 30px;float: left'></div>" +
                                            "<div style='width: 40%;float: left;height: 30px;'><input id=" + v.id + " name='report' type='button' style='width: 100%;height: 30px;background-color: #1e347b;color: white;border: none;border-radius: 5px;font-size: 14px' value='Get Your Report'/></div>" +
                                            "</div>"
                                        "</form>";
                                        div += "</div>";
                                        div += "<div style='width: 100%;height: 10px'></div>";
                                        div += "</div>";
                                        $("div[name=barcode]").append(div);
                                    });

                                }
                            });
                            $("body").on("click", "input[name=bind]", function (event) {
                                var _oThis = $(event.currentTarget);
                                if (_oThis.val() == "edit the barcode") {
                                    _oThis.val("Link/Upload Your Barcode");
                                    _oThis.parents("form").find("input[name=barcode]").removeAttr("readonly");
                                } else {
                                    var data = {};
                                    data.id = _oThis.attr("id");
                                    data.barcode = _oThis.parents("form").find("input[name=barcode]").val();
                                    console.info(data.barcode);
                                    if (data.barcode == "") {
                                        alert("please enter the barcode!");
                                        return;
                                    }
                                    $.post("/user/report/bind.jhtml", data, function (data) {
                                        _oThis.parents("form").find("input[name=barcode]").attr("readonly", "readonly");
                                        _oThis.val("edit the barcode");
                                    });
                                }
                            });

                            $("body").on("click", "input[name=report]", function (event) {
                                var _oThis = $(event.currentTarget);
                                var data = {};
                                data.id = _oThis.attr("id");
                                data.barcode = _oThis.parents("form").find("input[name=barcode]").val();
                                if (data.barcode == "") {
                                    alert("please enter the barcode!");
                                    return;
                                }
                                //显示对应的div
                                $.post("/user/report/status.jhtml", data, function (status) {
                                    if (status == "pending" || status == "processing") {
                                        alert("Thanks for choosing our  \n epiAging product.Your report will be \n available in 21 working days.")
                                    } else if (status == "finished") {
                                        $.post("/user/report/getData.jhtml", data, function (value) {
                                            value.split("@")[0].split("#").forEach(function (v) {
                                                window.ntrGtBioData.push([window.parseInt(v.split("-")[0]), window.parseInt(v.split("-")[1])]);
                                            });
                                            value.split("@")[1].split("#").forEach(function (v) {
                                                window.ntrLtBioData.push([window.parseInt(v.split("-")[0]), window.parseInt(v.split("-")[1])]);
                                            });
                                            window.xx = parseInt(value.split("@")[2].split("-")[0]);//自然年龄
                                            window.yy = parseInt(value.split("@")[2].split("-")[1]);//生物学年龄
                                            window.ready = true;

                                        });
                                    }
                                    $("div[name=" + status + "]").css("display", "block");
                                });
                            });
                        });
                    </script>

                </div>
            </div>
            <div style="font-size: 24px;width: 95%;margin: 0 auto;display: none" name="processing">
                Thanks for choosing our epiAging product. Your report will be available in 21 working days on this page.
            </div>
            <div style="width: 90%;height: auto;margin: 0 auto;display: none" name="finished">
                <div style="width: 100%;height: 20px;"></div>
                <div style="width: 100%;height: auto;">
                    <div style="width: 90%;height: auto;margin:0 auto;text-align: center;">
                        <div style="width: 100%;height: 40px;border-top: 1px solid #5b9bd5;">
                            <div style="float: left;font-weight: bold;font-size: 12px;width: 50%;height: 40px;line-height: 40px;">
                                Your chronological age
                            </div>
                            <div style="float: left;width: 50%;font-size: 12px;height: 40px;font-weight: bold;line-height: 40px;"
                                 id="chroage"></div>
                        </div>
                        <div style="background-color:#DEEBF7;width: 100%;height: 40px;;border-top: 1px solid #5b9bd5;;border-bottom: 1px solid #5b9bd5;">
                            <div style="float: left;width: 50%;line-height: 40px;height: 40px;font-weight: bold;font-size: 12px;">
                                Your biological age
                            </div>
                            <div style="float: left; line-height: 40px;width: 50%;height: 40px;color: red;font-weight: bold;font-size: 12px;"
                                 id="bioage"></div>
                        </div>
                    </div>
                    <div style="width: 100%;height: 20px;"></div>
                    <div style="width: 100%;height: 400px;position: relative;">
                        <div style="width: 100%;height: auto;">
                            <div style="width: 5%;height: 100%;float: left;text-align: center;position: absolute;font-weight: bold;">
                                <div style="left:25px;position: relative; ">
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;height: 120px;"></div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;">e&nbsp;(years)</div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -11px;">g
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 13px;margin-top: -13px;">A
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;height: 5px"></div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">l
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -14px;">a
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -14px;">c
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -14px;">i
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -14px;">g
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -14px;">o
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -14px;">l
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -14px;">o
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -14px;">i
                                    </div>
                                    <div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -14px;">B
                                    </div>
                                </div>
                            </div>
                            <div style="width: 100%;height: auto;position: relative;">
                                <div style="width: 100%;height: 300px;float: left;margin: 0 auto;"
                                     id="biological-age-report"></div>
                            </div>

                            <script>
                                $(function () {
                                    var timer = window.setInterval(function () {
                                        if (window.ready == true) {
                                            $("div[id=chroage]").text(window.xx);
                                            $("div[id=bioage]").text(window.yy);
                                            require(
                                                ['echarts', 'echarts/chart/scatter'],
                                                function (ec) {
                                                    // 基于准备好的dom，初始化echarts图表
                                                    var chart = ec.init(document.getElementById('biological-age-report'));
                                                    var option = {
                                                        tooltip: {
                                                            trigger: 'axis',
                                                            showDelay: 0,
                                                            formatter: function (params) {
                                                                if (params.value.length > 1) {
                                                                    return params.seriesName + ' :<br/>' + params.value[0] + 'age   ' + params.value[1] + ' Age ';
                                                                } else {
                                                                    return params.seriesName + ' :<br/>' + params.name + ' : ' + params.value + ' Age';
                                                                }
                                                            },
                                                            axisPointer: {
                                                                show: true,
                                                                type: 'cross',
                                                                lineStyle: {
                                                                    type: 'dashed',
                                                                    width: 1
                                                                }
                                                            }
                                                        },
                                                        legend: {
                                                            data: ['Chronological Age<Biological Age', 'Chronological Age>Biological Age']
                                                        },
                                                        xAxis: [{
                                                            name: '',
                                                            type: 'value',
                                                            nameLocation: 'end',
                                                            scale: true,
                                                            axisLabel: {
                                                                formatter: '{value}'
                                                            }
                                                        }],
                                                        yAxis: [{
                                                            name: ' ',
                                                            nameLocation: 'end',
                                                            position: 'left',
                                                            nameGap: 60,
                                                            nameRotate: 90,
                                                            type: 'value',
                                                            scale: true,
                                                            axisLabel: {
                                                                formatter: '{value}'
                                                            }
                                                        }],
                                                        series: [{
                                                            name: 'Chronological Age<Biological Age',
                                                            type: 'scatter',
                                                            itemStyle: {
                                                                normal: {
                                                                    color: 'red'
                                                                }
                                                            },
                                                            data: window.ntrLtBioData,//自然年龄<生物学年龄
                                                            markPoint: {
                                                                itemStyle: {
                                                                    normal: {
                                                                        color: 'blue'
                                                                    }
                                                                },
                                                                data: [{
                                                                    name: 'Biological Age',
                                                                    value: window.yy,
                                                                    xAxis: window.xx,
                                                                    yAxis: window.yy
                                                                }] //x:自然年龄,y生物学年龄
                                                            },
                                                            markLine: {
                                                                data: []
                                                            }
                                                        },
                                                            {
                                                                name: 'Chronological Age>Biological Age',
                                                                type: 'scatter',
                                                                data: window.ntrGtBioData,//自然年龄>生物学年龄
                                                                itemStyle: {
                                                                    normal: {
                                                                        color: 'green'
                                                                    }
                                                                },
                                                                markPoint: {
                                                                    data: [{
                                                                        itemStyle: {
                                                                            normal: {
                                                                                color: 'blue'
                                                                            }
                                                                        },
                                                                        name: 'Biological Age',
                                                                        value: window.yy,
                                                                        xAxis: window.xx,
                                                                        yAxis: window.yy
                                                                    }]
                                                                },
                                                                markLine: {
                                                                    itemStyle: {
                                                                        normal: {
                                                                            color: 'black'
                                                                        }
                                                                    },
                                                                    data: [[{
                                                                        name: '标线1起点',
                                                                        xAxis: 0,
                                                                        yAxis: 21,
                                                                        symbol: 'circle'
                                                                    }, {
                                                                        name: '标线1终点',
                                                                        xAxis: 100,
                                                                        yAxis: 100,
                                                                        symbol: 'circle'
                                                                    },],],
                                                                }
                                                            }]
                                                    };
                                                    // 为echarts对象加载数据
                                                    chart.setOption(option);
                                                });
                                        }
                                    }, 1000);

                                });
                            </script>
                        </div>
                        <div style="width: 100%;height: 15px;"></div>
                        <div style="width: 100%;height: 20px;text-align: center;position: relative;top:-25px;font-weight: bold;">
                            Chronological Age&nbsp;(years)
                        </div>
                    </div>
                </div>
            </div>
            <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
                <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 70px">
                    @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
                </div>
                <jsp:include page="footnav.jsp"></jsp:include>
            </div>
        </div>
</body>
</html>
