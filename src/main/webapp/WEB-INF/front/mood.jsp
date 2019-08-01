<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" href="/static/css/stylesheet.css" />
	<!--
        作者：julie
        时间：2019-03-11
        描述：slide-bar -->
	<link href="static/css/lifestyle-bootstrap-slider.css" rel="stylesheet">
	<script type='text/javascript' src="static/js/jquery-2.1.0.min.js"></script>
	<script type='text/javascript' src="static/js/bootstrap-slider.js"></script>
	<script src="static/js/build/dist/echarts.js"></script>
	<script type="text/javascript">
        // 路径配置
        require.config({
            paths : {
                echarts : 'static/js/build/dist'
            }
        });
	</script>
	<title>情绪自我评估</title>
	<!--slide-bar css-->
	<style>
		#ex1Slider .slider-selection {
			background: #BABABA;
		}
	</style>
</head>
<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: 100%;background-color: #FFFFFF;">
	<jsp:include page="header.jsp"></jsp:include>
	<div style="width: 100%;height: 20px;clear: both;"></div>
	<div id="title" style="width: 100%;height: auto;">
		<div>
			<img src="static/images/mood.png" style="width: 20%;height: 16%;float: right;" />
		</div>
		<div style="width: 100%;height: auto;">
			<div style="width: 100%;height: 90px;text-align: center;font-size: 20px;font-family: arial;line-height: 46px; background-color: #FFFFFF; font-weight: 700;">Mood Self Assessment</div>
			<div style="accelerator: 100%;height: auto;background-color: #6950F4;">
				<div style="width: 90%;height: auto;margin: 0 auto;color: #FFFFFF; font-family: arial;font-size: 14px;">
					<div style="width: 100%;height: 20px;"></div>
					当情绪来临时，有时不难发现我们是能完全感受到它的存在的
					<div style="width: 100%;height: 20px;"></div>
					<p>如果你16岁或以上，完成以下问卷能：</p>
					<p>1) 它能帮助你更好地了解过去两周你的感受</p>
					<p>2) 给你提供正确的方向以获得有用的健康建议和信息</p>
					<div style="width: 100%;height: 20px;"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="content" style="width: 100%;height: auto;background-color: #EDEDED;">
		<div style="width: 100%;height: 20px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart1 = ec.init(document.getElementById('mood-report-1'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Mood\",\"number\" : \"1\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart1.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex1");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"1\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex1SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"1\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart1.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques1" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">1.你多久会感觉做一件事情没有兴趣或乐趣?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 10px;"></div>
				<div class="mood-ex1SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex1" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"   data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex1CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-1'></div>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-2'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"2\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex2-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"2\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex2-barSliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"2\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques2" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">2.你多久会感到失落，沮丧或绝望?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex2-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex2-bar"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex2-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-2'></div>
		</div>

		<div style="width: 100%;height: 20px;"></div>

		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-3'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"3\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex3");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"3\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex3SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"2\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques3" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 10px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">3.你多久会因为很难入睡或睡得太久而烦恼一次?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex3SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex3" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex3CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-3'></div>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-4'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"4\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex4");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"4\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex4SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"4\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques4" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;;padding: 10px;">4.你多长时间会感到疲劳或精力不足?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex4SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex4" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex4CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-4'></div>
		</div>
		<div style="width: 100%;height: 20px;"></div>

		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-5'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"5\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex5");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"5\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex5SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"5\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques5" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;;padding: 10px;">5.你多久会因为食欲不振或暴饮暴食而烦恼一次?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex5SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex5" type="text"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex5CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-5'></div>
		</div>
		<div style="width: 100%;height: 20px;"></div>

		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-6'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"6\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex6");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"6\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".ex6SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"6\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques6" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;;padding: 10px;">6.你多久会因为对自己的感觉不好，或者觉得自己是个失败者，或者让你自己或你的家人失望而烦恼一次?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="ex6SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex6" type="text"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex6CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-6'></div>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-7'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"7\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex7");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"7\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex7SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"7\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques7" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">7.你多久会因为注意力不集中而烦恼一次，比如看报纸或看电视?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex7SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex7" type="text"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex7CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-7'></div>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-8'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"8\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex8");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"8\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex8SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"8\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques8" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">8.你经常被别人注意到的动作或说话速度太慢而困扰，或者相反 - 如此坐立不安或不安，以致于你的走动比平时要频繁得多?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex8SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex8" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex8CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-8'></div>
		</div>
		<div style="width: 100%;height: 20px;"></div>

		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-9'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"9\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex9");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"9\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex9SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"9\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques9" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">9.你是否有过焦虑症发作（突然感到恐惧或恐慌）?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex9SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex9" type="text"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex9CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-9'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-10'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"10\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex10");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"10\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex10SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"10\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div style="width: 100%;height: 20px;"></div>
		<div class="ques10" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">10.你多久会感到紧张，焦虑或紧张?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex10SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex10" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex10CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-10'></div>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-11'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"11\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex11");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"11\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex11SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"11\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques11" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">11.你有多少次因为不能停止或控制焦虑而烦恼?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex11SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex11" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex11CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-11'></div>
		</div>

		<div style="width: 100%;height: 20px;"></div>

		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-12'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"12\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex12");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"12\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex12SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"12\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques12" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">12.你经常为不同的事情担心太多而烦恼?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex12SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex12" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex12CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-12'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-13'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"13\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex13");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"13\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex13SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"13\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div style="width: 100%;height: 20px;"></div>
		<div class="ques13" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">13..你多久会因为很难放松而烦恼?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex13SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex13" type="text"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex13CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-13'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-14'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"14\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex14");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"14\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex14SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"14\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div style="width: 100%;height: 20px;"></div>
		<div class="ques14" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">14.你多久会因为坐立不安而烦躁不安?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex14SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex14" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex14CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-14'></div>
		</div>

		<div style="width: 100%;height: 20px;"></div>

		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-15'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"15\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".mood-ex15");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"15\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".mood-ex15SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"15\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques15" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">15.你多久会因为容易生气或易怒而烦恼一次?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="mood-ex15SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="mood-ex15" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="mood-ex15CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-15'></div>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    var chart = ec.init(document.getElementById('mood-report-16'));
                    var data = "{\"type\" :\"Mood\",\"number\" : \"16\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'mood status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".ex16");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "从来不会(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "从来不会(level 1)";
                                break;
                            case 2:
                                value = "几天(level 2)";
                                break;
                            case 3:
                                value = "超过一半时间(level 3)";
                                break;
                            case 4:
                                value = "几乎每天(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Mood\",\"data\" : {\"id\" : \"16\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".ex16SliderVal").text(value);
                                var data = "{\"type\" :\"Mood\",\"number\" : \"16\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'mood status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'mood status',
                                                type : 'line',
                                                data : data[0],
                                                markPoint : {
                                                    data : [ {
                                                        type : 'max',
                                                        name : '最大值'
                                                    }, ]
                                                },
                                                markLine : {
                                                    data : [ {
                                                        type : 'average',
                                                        name : '平均值'
                                                    } ]
                                                }
                                            }, ]
                                        };
                                        // 为echarts对象加载数据
                                        chart.setOption(option);
                                    }
                                });

                            },
                            error : function(jqXHR) {
                                console.info("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            });
		</script>
		<div class="ques16" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">16.你多久会感到害怕，好像发生了什么可怕的事情?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="ex16SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #6950F4;line-height: 40px">从来不会(level 1)</div>
				<div>
					<input class="ex16" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="ex16CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='mood-report-16'></div>
		</div>

		<!-- <div style="width: 100%;height: 15px;"></div>
        <div class="ques17" style="width: 96%;height: auto;margin: 0 auto;background-color: #FFFFFF;">
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">17. Have you been bothered by worrying about any of the following?</div>
            <form action="" method="get">
                <div style="width: 100%;height: auto;font-size: 16px;font-family: arial;color: #666666;">
                    <div>
                        <input name="health" type="checkbox" value="" />Your health
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />Your weight or how you look
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />Little or no sexual desire or pleasure during sex
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />Difficulties with your partner
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />The stress of taking care of family members
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />Stress at work, school or outside home
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />By financial problems or worries
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />Something bad that happened recently
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />None of the above
                    </div>

                </div>
            </form>
            <div class="scroll-bar" style="width: 100%;height: auto;"></div>
            <div style="width: 100%;height: 20px;"></div>
        </div>
        <div style="width: 100%;height: 15px;"></div>
        <div class="ques18" style="width: 96%;height: auto;margin: 0 auto;background-color: #FFFFFF;">
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">18. If this questionnaire has highlighted any problems, how difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?</div>
            <form action="" method="get">
                <div style="width: 100%;height: auto;font-size: 16px;font-family: arial;color: #666666;">
                    <div>
                        <input name="health" type="checkbox" value="" />Not difficult at all
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />Somewhat difficult
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />Very difficult
                    </div>
                    <div>
                        <input name="health" type="checkbox" value="" />Extremely difficult
                    </div>

                </div>
            </form>
            <div class="scroll-bar" style="width: 100%;height: auto;"></div>
        </div>
    </div> -->

		<!-- <div class="submit" style="width: 100%;height: 30px;">
			<button type="button" style="width: 90%;height: 40px;margin-left: 18px;border: 0px; display: block; margin: 0 auto; text-align:center;border-radius: 10px; font-size: 18px;line-height:28px; vertical-align:middle;background-color:#9650F4; color:#FFFFFF ;">Submit</button>
		</div> -->
		<div style="width: 100%;height: 60px;"></div>
		<div id="all-right" style="width: 100%;height: auto;font-family: arial;">
			<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved</div>
		</div>
		<jsp:include page="footnav.jsp"></jsp:include>
	</div>
</body>

</html>
