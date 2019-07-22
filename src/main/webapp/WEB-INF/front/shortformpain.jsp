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
    <div style="width: 100%;height: 75px;background-color:#FFFFFF;clear: both;"></div>
    <div id="title" style="width: 100%;height: auto;">
        <div>
            <img src="static/images/pain.png" style="width: 20%;height: 16%;float: right;"/>
        </div>
        <div style="width: 100%;height: auto;">
            <div style="width: 100%;height: 63px;text-align: center;font-size: 20px;font-family: arial;line-height: 46px; background-color: #FFFFFF; font-weight: 700;">
                The McGill Pain Questionnaire
            </div>
            <div style="width: 100%;height: auto;background-color: #C1272D;">
                <div style="width: 90%;height: auto;margin: 0 auto;color: #FFFFFF; font-family: arial;font-size: 14px;">
                    Introduction: The Mcgill Pain Questionnaire(MPQ)(] has become one of the most wideused tests for the
                    measurement of pain.
                    It provides valuable information on thesensory, affective and evaluative dimensions of pain
                    experience and is capablediscriminating among differentproblems [7].
                    The MPQ is not a perfect tooland several variants have been developed [2, 4,7]. Yet despite the
                    usefulness ofspecialized alternative forms,
                    the original MPQ is still commonly used in diagnosisand research on a wide variety of pain problems
                    [7]
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none (level 0)";
                                break;
                            case 1:
                                value = "mild (level 1) ";
                                break;
                            case 2:
                                value = "moderate  (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                What Does Your Pain Feel Like?
            </div>
            <div style="width: 96%;height: auto;margin:0 auto; color:#666666">Statement: Some of the following words
                below describe your present pain. Circle ONLY those words that best describe it. Leave out any category
                that is not suitable. Use only a single word in each appropriate category - the one that applies best.
            </div>

            <div style="width: 96%;height: auto;font-size: 16px;margin:0 auto; font-family: airal;font-weight: 600; color: #666666;">
                1.Throbbing?
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
                <div class="pain-ex1SliderVal"
                     style="font-size: 16px;font-family: arial;line-height: 40px; font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px">
                    none(level 0)
                </div>
                <div>
                    <input class="pain-ex1-bar" type="text"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
                </div>
            </div>
            <div style="width: 100%;height: auto;">
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div><span style="color: #92D050;">none(level 0)</span>&nbsp; <span style="color: #92D050;">mild (level1)</span>&nbsp;<span
                            style="color: #FFC000;">moderate  (level 2)</span></div>
                    <div><span style="color: #FFC000;">severe (level 3)</span></div>

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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "jumping(level 1)";
                                break;
                            case 2:
                                value = "flashing(level 2)";
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
                2.shooting
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
                <div style="width: 100%;height: 10px;"></div>
                <div class="pain-ex2SliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px">
                    none(level 0)
                </div>
                <div><input class="pain-ex2-bar" type="text"
                            style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                            data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0"></div>
            </div>
            <div style="width: 100%;height: auto;">
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div><span style="color: #92D050;">none(level 0)</span>&nbsp; &nbsp;<span style="color: #92D050;">mild (level 1)</span>
                    </div>
                    <div><span style="color: #FFC000;">moderate (level 2)</span>&nbsp; &nbsp;<span style="color: red;">severe (level 3)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1)";
                                break;
                            case 2:
                                value = "moderate (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                3. Stabbing
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pian-ex3-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
                </div>
                <div>
                    <input class="pian-ex3-bar" type="text"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
                </div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">mild (level 1)</span>&nbsp;&nbsp;<span
                            style="color: #FFC000;">moderate (level 2)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">severe (level 3)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1)";
                                break;
                            case 2:
                                value = " moderate (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                Sharp
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex4-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
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
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">mild (level 1)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">moderate (level 2)</span>&nbsp;<span style="color: red;">severe (level 3)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0) ";
                                break;
                            case 1:
                                value = "mild (level 1) ";
                                break;
                            case 2:
                                value = "moderate (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                5. Cramping
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex5-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
                </div>
                <div>
                    <input class="pain-ex5-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">none(level 0)</span>&nbsp; <span style="color: #92D050;">mild (level1)</span>&nbsp;<span
                            style="color: #FFC000;">modereate  (level 2)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">severe (level 3)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1) ";
                                break;
                            case 2:
                                value = "moderate (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                6. Gnawing
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex6-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
                </div>
                <div>
                    <input class="pain-ex6-bar"
                           style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"
                           type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1"
                           data-slider-value="0">
                </div>
                <div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
                    <div>
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">mild (level1)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">moderate (level 2)</span>&nbsp;<span style="color: red;">severe (level 3)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1)";
                                break;
                            case 2:
                                value = "moderate (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                7. Hot-burning
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex7-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
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
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">mild (level1)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">moderate (level 2)</span>&nbsp;<span style="color: red;">severe (level 3)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1) ";
                                break;
                            case 2:
                                value = "moderate (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                8. Aching
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex8-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
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
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">mild (level1)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">moderate (level 2)</span>&nbsp;<span style="color: red;">severe (level 3)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1) ";
                                break;
                            case 2:
                                value = "moderate (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                9. Heavy
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex9-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
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
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">mild (level1)</span>&nbsp;&nbsp;<span
                            style="color: #FFC000;">moderate (level 3)</span>
                    </div>
                    <div>
                        <span style="color: #FFFC00;">severe (level 4)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1)";
                                break;
                            case 2:
                                value = "moderate (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                10. Tender
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex10-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
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
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">mild (level1)</span>&nbsp;&nbsp;<span
                            style="color: #FFC000;">moderate (level 2)</span>
                    </div>
                    <div>
                        <span style="color: #FFFC00;">severe (level 3)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1)";
                                break;
                            case 2:
                                value = "moderate (level 2)";
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
                11. Splitting
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="ex11SliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
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
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #FFFC00;">sickening(level1)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
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
                12. Tiring-exhausting
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex12-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
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
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #FFFC00;">mild (level1)</span>
                    </div>
                    <div>
                        <span style="color: red;">moderate (level 2)</span>&nbsp;&nbsp; <span style="color: #FFFC00;">severe  (level1)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1)";
                                break;
                            case 2:
                                value = "moderate (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                13. Sickening
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex13-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
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
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #FFFF00;">mild (level1)</span>
                    </div>
                    <div>
                        <span style="color: #FFFC00;">moderate (level 2)</span>&nbsp;&nbsp;<span style="color: red;">severe (level 3)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1)";
                                break;
                            case 2:
                                value = "moderate (level 2)";
                                break;
                            case 3:
                                value = "severe (level 3)";
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
                14. Fearful
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex14-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
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
                        <span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">mild (level1)</span>&nbsp;&nbsp;<span
                            style="color: #FFC000;">moderate (level 2)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">severe (level 3)</span>
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
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild (level 1)";
                                break;
                            case 2:
                                value = "moderate (level 2)";
                                break;
                            case 3:
                                value = "severe  (level 3)";
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
                15. Pushing-curel
            </div>
            <div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

                <div class="pain-ex15-barSliderVal"
                     style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">
                    none(level 0)
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
                        <span style="color: #92D050;">none(level 0)</span>&nbsp; <span style="color: #92D050;">mild (level1)</span>&nbsp;<span
                            style="color:red;">moderate (level 2)</span>
                    </div>
                    <div>
                        <span style="color: #FFC000;">severe (level 3)</span>
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
