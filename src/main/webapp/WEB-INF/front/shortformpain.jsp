<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="static/css/stylesheet.css"/>
    <!-- <link href="static/css/bootstrap-slider.min.css" rel="stylesheet"> -->
    <!-- <link href="/static/css/pain-bootstrap-slider.css" rel="stylesheet"> -->
    <link href="static/css/lifestyle-bootstrap-slider.css" rel="stylesheet">
    <script type='text/javascript' src="static/js/jquery-3.3.1.min.js"></script>
    <script type='text/javascript' src="static/js/bootstrap-slider.js"></script>
    <script src="static/js/build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'static/js/build/dist'
            }
        });
    </script>
    <title>Short-form McGill Pain Questionnaire</title>
</head>
<body>
<div id="container" style="width: 100%;height: 100%;background-color: #DEDEDE;">
    <jsp:include page="header.jsp"/>
    <div style="width: 100%;height: 20px;background-color:#FFFFFF;clear: both;"></div>
    <div id="title" style="width: 100%;height: auto;">
        <div>
            <img src="static/images/pain.png" style="width: 20%;height: 16%;float: right;"/>
        </div>
        <div style="width: 100%;height: auto;">
            <div style="width: 100%;height: 90px;text-align: center;font-size: 20px;font-family: arial;line-height: 46px; background-color: #FFFFFF; font-weight: 700;">
                麦吉尔疼痛问卷
            </div>
            <div style="accelerator: 100%;height: auto;background-color: #C1272D;">
                <div style="width: 90%;height: auto;margin: 0 auto;color: #FFFFFF; font-family: arial;font-size: 14px;">
                   简介：麦吉尔疼痛问卷（MPQ）（）已经成为最广泛使用的疼痛测量方法之一。它提供了关于疼痛经历的感官，情感和评价维度的有价值的信息，并且能够区分不同的问题[7] MPQ不是一个完美的工具，已经开发了几种变体[2,4,7]。然而，尽管使用了专门的替代形式，原始的MPQ仍然常用于各种疼痛问题的诊断和研究。[7]
                </div>
            </div>
        </div>
    </div>
    <div id="content" style="width: 100%;height: auto;background-color: #DEDEDE">

        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-1'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"1\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    name: "data",
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    name: "level",
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value}'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex1-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛 (level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1) ";
                                break;
                            case 2:
                                value = "中度疼痛  (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;

                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"1\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex1SliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"1\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value} level'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques1"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-family: arial;font-size: 20px;line-height:66px;text-align:center; font-weight: 700;">
                你的疼痛感觉如何？
            </div>
            <div style="width: 96%;height: auto;margin:0 auto; color:#666666">声明：下面的一些词语描述了您目前的痛苦。 只圈出那些最能描述它的词。 遗漏任何不合适的类别。 在每个适当的类别中只使用一个最适合的单词。
            </div>

            <div style="width: 96%;height: auto;font-size: 16px;margin:0 auto; font-family: airal;font-weight: 600; color: #666666;">
                1.悸动?
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
                <div class="pain-ex1SliderVal"
                     style="font-size: 16px;font-family: arial;line-height: 40px; font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pain-ex1-bar" type="text"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
                </div>
            </div>
            <div style="width: 100%;height: auto;">
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div><span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp; <span style="color: #92D050;">轻微疼痛 (level1)</span>&nbsp;<span
                            style="color: #FFC000;">中度疼痛  (level 2)</span></div>
                    <div><span style="color: #FFC000;">严重疼痛 (level 3)</span></div>

                </div>
                <div>
                    <div style="width: 100%;height: 350px;" id='pain-report-1'></div>
                </div>
            </div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-2'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"2\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    name: "data",
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    name: "level",
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value}'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex2-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "跳痛(level 1)";
                                break;
                            case 2:
                                value = "闪痛(level 2)";
                                break;
                            case 3:
                                value = "shooting(level 3)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"2\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex2SliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"2\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value} level'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques2"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                2.射痛
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
                <div style="width: 100%;height: 10px;"></div>
                <div class="pain-ex2SliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px">
                    没有疼痛(level 0)
                </div>
                <div><input class="pain-ex2-bar" type="text"
                            style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                            data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0"></div>
            </div>
            <div style="width: 100%;height: auto;">
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div><span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp; &nbsp;<span style="color: #92D050;">轻微疼痛 (level 1)</span>
                    </div>
                    <div><span style="color: #FFC000;">中度疼痛 (level 2)</span>&nbsp; &nbsp;<span style="color: red;">严重疼痛 (level 3)</span>
                    </div>
                </div>
                <div style="width: 100%;height: 350px;" id='pain-report-2'></div>
            </div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('report-3'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"3\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    name: "data",
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    name: "level",
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value}'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pian-ex3-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1)";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;

                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"3\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pian-ex3-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"3\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                name: "data",
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                name: "level",
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value}'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques3"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                3. 刺痛
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pian-ex3-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pian-ex3-bar" type="text"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
                </div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">轻微疼痛 (level 1)</span>&nbsp;&nbsp;<span
                            style="color: #FFC000;">中度疼痛 (level 2)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">严重疼痛 (level 3)</span>
                    </div>

                </div>
                <div class="pian-ex3-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
            </div>
            <div style="width: 100%;height: 350px;" id='report-3'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-4'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"4\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value} level'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex4-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1)";
                                break;
                            case 2:
                                value = " 中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"4\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex4-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"4\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            noDataLoadingOption: {
                                                text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                                effect: 'whirling',
                                                effectOption: {effect: {n: 0}}
                                            },
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value} level'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques4"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;font-weight: 600;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">4.
               4 尖锐
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex4-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pain-ex4-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0"/>
                </div>
                <div class="pain-ex4-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">轻微疼痛 (level 1)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">中度疼痛 (level 2)</span>&nbsp;<span style="color: red;">严重疼痛 (level 3)</span>
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-4'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-5'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"5\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    name: "data",
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    name: "level",
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value}'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex5-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0) ";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1) ";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;

                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"5\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex5-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"5\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            noDataLoadingOption: {
                                                text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                                effect: 'whirling',
                                                effectOption: {effect: {n: 0}}
                                            },
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                name: "data",
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                name: "level",
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value}'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques5"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                5. 抽筋
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex5-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pain-ex5-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp; <span style="color: #92D050;">轻微疼痛 (level1)</span>&nbsp;<span
                            style="color: #FFC000;">modereate  (level 2)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">严重疼痛 (level 3)</span>
                    </div>

                </div>
                <div class="pain-ex5-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-5'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-6'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"6\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    name: "data",
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    name: "level",
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value}'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex6-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1) ";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"6\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex6-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"6\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                name: "data",
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                name: "level",
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value}'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques6"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                6. 咀嚼痛
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex6-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pain-ex6-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">轻微疼痛 (level1)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">中度疼痛 (level 2)</span>&nbsp;<span style="color: red;">严重疼痛 (level 3)</span>
                    </div>
                </div>
                <div class="pain-ex6-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-6'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('bar-report-7'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"7\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value} level'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex7-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1)";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;

                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"7\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex7-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"7\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value} level'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques7"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                7. 灼热痛
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex7-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pain-ex7-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div class="pain-ex7-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">轻微疼痛 (level1)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">中度疼痛 (level 2)</span>&nbsp;<span style="color: red;">严重疼痛 (level 3)</span>
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 350px;" id='bar-report-7'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-8'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"8\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    name: "data",
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    name: "level",
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value}'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex8-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1) ";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;

                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"8\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex8-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"8\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                name: "data",
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                name: "level",
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value} level'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques8"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                8. 酸痛
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex8-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pain-ex8-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div class="pain-ex8-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">轻微疼痛 (level1)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">中度疼痛 (level 2)</span>&nbsp;<span style="color: red;">严重疼痛 (level 3)</span>
                    </div>

                </div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-8'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-9'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"9\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value} level'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex9-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1) ";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;

                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"9\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex9-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"9\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        if (data == "") {
                                            return;
                                        }
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value} level'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques9"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                9. 沉痛
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex9-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pain-ex9-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div class="pain-ex9-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">轻微疼痛 (level1)</span>&nbsp;&nbsp;<span
                            style="color: #FFC000;">中度疼痛 (level 3)</span>
                    </div>
                    <div>
                        <span style="color: #FFFC00;">严重疼痛 (level 4)</span>
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-9'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-10'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"10\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value}'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex10-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1)";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;

                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"10\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex10-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"10\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value}'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques10"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                10. 温和
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex10-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pain-ex10-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div class="pain-ex10-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">轻微疼痛 (level1)</span>&nbsp;&nbsp;<span
                            style="color: #FFC000;">中度疼痛 (level 2)</span>
                    </div>
                    <div>
                        <span style="color: #FFFC00;">严重疼痛 (level 3)</span>
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-10'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-11'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"11\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value}'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".ex11");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1)";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"11\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".ex11SliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"11\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value} level'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques11"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                11. 分裂
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="ex11SliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="ex11"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div class="ex11CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp;&nbsp; <span style="color: #FFFC00;">sickening(level1)</span>
                    </div>
                    <div>
                        <span style="color: red;">suffocating(level 2)</span>
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-11'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-12'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"12\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value} level'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex12-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "sickening(level 1)";
                                break;
                            case 2:
                                value = "suffocating(level 2)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"12\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex12-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"12\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value} level'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques12"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                12. 泄气
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex12-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pain-ex12-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div class="pain-ex12-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp;&nbsp; <span style="color: #FFFC00;">轻微疼痛 (level1)</span>
                    </div>
                    <div>
                        <span style="color: red;">中度疼痛 (level 2)</span>&nbsp;&nbsp; <span style="color: #FFFC00;">严重疼痛  (level1)</span>
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-12'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-13'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"13\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value} level'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex13-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1)";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"13\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex13-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"13\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value}'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques13"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">
                13. 恶心
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex13-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有(level 0)
                </div>
                <div>
                    <input class="pain-ex13-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div class="pain-ex13-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有(level 0)</span>&nbsp;&nbsp; <span style="color: #FFFF00;">轻微(level1)</span>
                    </div>
                    <div>
                        <span style="color: #FFFC00;">中度(level 2)</span>&nbsp;&nbsp;<span style="color: red;">严重 (level 3)</span>
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-13'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-14'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"14\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value}'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex14-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1)";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛 (level 3)";
                                break;

                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"14\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex14-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"14\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            noDataLoadingOption: {
                                                text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                                effect: 'whirling',
                                                effectOption: {effect: {n: 0}}
                                            },
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value} level'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques14"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">
                14. 可怕的
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex14-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有(level 0)
                </div>
                <div>
                    <input class="pain-ex14-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div class="pain-ex14-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">轻微(level1)</span>&nbsp;&nbsp;<span
                            style="color: #FFC000;">中度(level 2)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">严重(level 3)</span>
                    </div>

                </div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-14'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
        <script>
            $(function () {
                require(['echarts', 'echarts/chart/line'], function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-15'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"15\"" + "}";
                    $.ajax({
                        type: "post",
                        url: "Questionnaire/GetData.jhtml",
                        data: data,
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data == "") {
                                return;
                            }
                            var option = {
                                noDataLoadingOption: {
                                    text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report',
                                    effect: 'whirling',
                                    effectOption: {effect: {n: 0}}
                                },
                                xAxis: [{
                                    name: 'data',
                                    type: 'category',
                                    boundaryGap: false,
                                    data: data[1]
                                }],
                                yAxis: [{
                                    name: 'level',
                                    type: 'value',
                                    axisLabel: {
                                        formatter: '{value}'
                                    }
                                }],
                                series: [{
                                    name: 'pain status',
                                    type: 'line',
                                    data: data[0],
                                },]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex15-bar");
                    //拖动发送
                    slider.on("slide", function (slideEvt) {
                        var value = "没有疼痛(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "没有疼痛(level 0)";
                                break;
                            case 1:
                                value = "轻微疼痛 (level 1)";
                                break;
                            case 2:
                                value = "中度疼痛 (level 2)";
                                break;
                            case 3:
                                value = "严重疼痛  (level 3)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"15\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type: "post",
                            url: "Questionnaire/Input.jhtml",
                            dataType: "json",
                            contentType: "application/json",
                            data: data,
                            success: function (data) {
                                $(".pain-ex15-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"15\"" + "}";
                                $.ajax({
                                    type: "post",
                                    url: "Questionnaire/GetData.jhtml",
                                    data: data,
                                    dataType: "json",
                                    contentType: "application/json",
                                    success: function (data) {
                                        var option = {
                                            legend: {
                                                data: ['pain status']
                                            },
                                            calculable: true,
                                            xAxis: [{
                                                name: 'data',
                                                type: 'category',
                                                boundaryGap: false,
                                                data: data[1]
                                            }],
                                            yAxis: [{
                                                name: 'level',
                                                type: 'value',
                                                axisLabel: {
                                                    formatter: '{value}'
                                                }
                                            }],
                                            series: [{
                                                name: 'pain status',
                                                type: 'line',
                                                data: data[0],
                                                markPoint: {
                                                    data: [{
                                                        type: 'max',
                                                        name: '最大值'
                                                    },]
                                                },
                                                markLine: {
                                                    data: [{
                                                        type: 'average',
                                                        name: '平均值'
                                                    }]
                                                }
                                            },]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error: function (jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
        </script>
        <div class="ques15"
             style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">
                15. 推痛
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex15-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    没有疼痛(level 0)
                </div>
                <div>
                    <input class="pain-ex15-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div class="pain-ex15-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">没有疼痛(level 0)</span>&nbsp; <span style="color: #92D050;">轻微疼痛 (level1)</span>&nbsp;<span
                            style="color:red;">中度疼痛 (level 2)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">严重疼痛 (level 3)</span>
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 350px;" id='pain-report-15'></div>
        </div>
        <div style="width: 100%;height: 10px;"></div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
