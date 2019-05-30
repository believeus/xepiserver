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
        $(function () {
            $.post("/user/report/state.jhtml", function (state) {
                $("div[name="+state+"]").css("display","block");
            });
        });
    </script>
    <div style="width: 100%;height: 100px;"></div>
    <div style="width: 100%;display: none" name="pending">
        <div style="font-size: 24px;width: 95%;margin: 0 auto;">
            Your order has been accepted. We will send the saliva collection box to your order address. When you
            receive the saliva collection box, please collect 1ML saliva in the saliva collection tube and seal
            it
            properly and send it back to our laboratory in the form of pay-on-demand. After the test report is
            issued, we will remind you by mail and send it to you. The report is updated on this page.
        </div>
    </div>
    <div style="font-size: 24px;width: 95%;margin: 0 auto;display: none" name="processing">
        Our research team is analyzing your biological age, which requires at least 5-10 working days. When the test is
        completed, you will see your biological age test report on this page.
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
                            $.ajax({
                                type: "post",
                                url: "user/report/iage.jhtml",
                                dataType: "json",
                                contentType: "application/json",
                                success: function (data) {
                                    $("div[id=id]").text(data.uuid);
                                    $("div[id=name]").text(data.nickname);
                                    $("div[id=chroage]").text(data.naturally);
                                    $("div[id=bioage]").text(data.biological);
                                    $("div[id=data]").text(data[4]);
                                }
                            });
                        });
                    </script>
                    <script>
                        $(function () {
                            require(
                                ['echarts', 'echarts/chart/scatter'],
                                function (ec) {
                                    // 基于准备好的dom，初始化echarts图表
                                    var chart = ec.init(document.getElementById('biological-age-report'));
                                    $.post("/user/report/getData.jhtml", function (data) {
                                        var ntrGtBioData = [];

                                        data.split("@")[0].split("#").forEach(function (v) {
                                            ntrGtBioData.push([window.parseInt(v.split("-")[0]), window.parseInt(v.split("-")[1])])
                                        });
                                        var ntrLtBioData = [];
                                        data.split("@")[1].split("#").forEach(function (v) {
                                            ntrLtBioData.push([window.parseInt(v.split("-")[0]), window.parseInt(v.split("-")[1])])
                                        });
                                        var x = parseInt(data.split("@")[2].split("-")[0]);//自然年龄
                                        var y = parseInt(data.split("@")[2].split("-")[1]);//生物学年龄
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
                                                data: ntrLtBioData,//自然年龄<生物学年龄
                                                markPoint: {
                                                    itemStyle: {
                                                        normal: {
                                                            color: 'blue'
                                                        }
                                                    },
                                                    data: [{
                                                        name: 'Biological Age',
                                                        value: y,
                                                        xAxis: x,
                                                        yAxis: y
                                                    }] //x:自然年龄,y生物学年龄
                                                },
                                                markLine: {
                                                    data: []
                                                }
                                            },
                                                {
                                                    name: 'Chronological Age>Biological Age',
                                                    type: 'scatter',
                                                    data: ntrGtBioData,//自然年龄>生物学年龄
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
                                                            value: y,
                                                            xAxis: x,
                                                            yAxis: y
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


                                });
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


</div>
</body>
</html>
