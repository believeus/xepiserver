<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<!-- <link href="static/css/sleep-bootstrap-slider.css" rel="stylesheet"> -->
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
	<title>Sleep Self Assessment</title>
</head>
<body>
<div id="container" style="width: 100%;height: 100%;background-color: #FFFFFF;">
	<jsp:include page="header.jsp"/>

	<div style="width: 100%;height: 75px;clear: both;"></div>
	<div id="title" style="width: 100%;height: auto;">
		<div>
			<img src="static/images/sleep.png" style="width: 20%;height: 16%;float: right;" />
		</div>
		<div style="width: 100%;height: auto;">
			<div style="width: 100%;height: 63px;text-align: center;font-size: 20px;font-family: arial;line-height: 60px; background-color: #FFFFFF; font-weight: 700;">Sleep Self Assesment</div>
			<div style="height: auto;background-color: #f77a78;">
				<div style="width: 90%;height: auto;margin: 0 auto;color: #FFFFFF; font-family: arial;font-size: 14px;">
					<div style="width: 100%;height: 20px;"></div>
					Most people experience problems with sleep in their life. In fact, it’s thought that a third of Brits will have episodes of insomnia at some point.
					<div>The causes can include psychological conditions (Such as depression or anxiety) or a combination of both. This short test from Sleepio will give you a’sleep score ' plus practical tips and advice for improving your sleep.</div>
					<div style="width: 100%;height: 20px;"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="content" style="width: 100%;height: auto;background-color: #EDEDED">
		<div style="width: 100%;height: 20px;"></div>
		<div class="ques1" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">1.Thinking about a typical night in the last month, if you wake up, how long are you awake for in total?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex1SliderVal" style="font-size: 16px;font-family: arial;font-weight: bold; margin: 0 auto;color: #f77a78;line-height: 40px;">0min</div>
				<div>
					<input class="sleep-ex1-bar"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="0" data-slider-max="300" data-slider-step="1" data-slider-value="1"/>
				</div>
				<div class="sleep-ex1CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='sleep-report-1'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('sleep-report-1'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Sleep\",\"number\" : \"1\"" + "}";
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
                                    name:'data',
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name:'min',
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'sleep status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
							console.info("data:"+data);
							if (data!=""){delete option.noDataLoadingOption; }
							console.info(option);
							chart.setOption(option);
                        }
                    });
                    var slider = new Slider(".sleep-ex1-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        $(".sleep-ex1SliderVal").text(slideEvt.value+"min");
                        var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"1\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {

                                var data = "{\"type\" :\"Sleep\",\"number\" : \"1\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'sleep status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name:'data',
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name:'min',
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'sleep status',
                                                type : 'line',
                                                data : data[0],
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
		<div class="ques2" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">2.Thinking about a typical night in the last month, how long does it take you to fall asleep?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex2SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">0min</div>
				<div>
					<input class="sleep-ex2-bar"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="0" data-slider-max="300" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="ex2CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='sleep-report-2'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('sleep-report-2'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Sleep\",\"number\" : \"2\"" + "}";
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
                                    name:'data',
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name:'min',
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'sleep status',
                                    type : 'line',
                                    data : data[0],
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

                    var slider = new Slider(".sleep-ex2-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        $(".sleep-ex2SliderVal").text(slideEvt.value+"min");
                        var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"2\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                var data = "{\"type\" :\"Sleep\",\"number\" : \"2\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'sleep status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name:"data",
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name:"min",
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} min'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'sleep status',
                                                type : 'line',
                                                data : data[0],
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
		<div class="ques3" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">3.Thinking about the last month, how many nights a week do you have a problem with your sleep?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex3SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">0night</div>
				<div>
					<input class="sleep-ex3-bar" type="text"     style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"   data-slider-min="1" data-slider-max="7" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="sleep-ex3CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='sleep-report-3'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('sleep-report-3'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Sleep\",\"number\" : \"3\"" + "}";
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
                                    name:"data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name:'night',
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'sleep status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".sleep-ex3-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        $(".sleep-ex3SliderVal").text(slideEvt.value+"night");
                        var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"3\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                var data = "{\"type\" :\"Sleep\",\"number\" : \"3\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'sleep status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name:"data",
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name:'night',
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'sleep status',
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
		<div class="ques4" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">4.Thinking about a typical night in the last month, how would you rate your sleep quality?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="ex4SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">Very good(1 level)</div>
				<div>
					<input class="sleep-ex4-bar" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"   data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="sleep-ex4CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color:#92D050;">Very good(level 1)</span>&nbsp;&nbsp;<span style="color:#92D050;">good(level 2)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: #FFFF00;">Average(level 3)</span>&nbsp;&nbsp;<span style="color: #FFCC00">Poor(level 4)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: red;">very poor(level 5)</span></div>
			</div>
			<div style="width: 100%;height: 350px;" id='sleep-report-4'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('sleep-report-4'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Sleep\",\"number\" : \"4\"" + "}";
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
                                    name:"data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name:'level',
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'sleep status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });
                    var slider = new Slider(".sleep-ex4-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "Very good(1 level)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "Very good(level 1)";
                                break;
                            case 2:
                                value = "Good(level 2)";
                                break;
                            case 3:
                                value = "Average(level 3)";
                                break;
                            case 4:
                                value = "Poor(level 4)";
                                break;
                            case 5:
                                value = "Very poor(level 5) ";
                                break;
                        }
                        var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"4\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".ex4SliderVal").text(value);
                                var data = "{\"type\" :\"Sleep\",\"number\" : \"4\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'sleep status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name:"data",
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name:'level',
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'sleep status',
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


		<div class="ques5" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">5.Thinking about the past month, to what extent has poor sleep affected your mood, energy, or relationships?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex5SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">Not at all(1 level)</div>
				<div>
					<input class="sleep-ex5-bar" type="text"    style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="sleep-ex5CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color:#92D050;">Not at all(level 1)</span>&nbsp;&nbsp;<span style="color:#92D050;">A little(level 2)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: #FFFF00;">Somewhat(level 3)</span>&nbsp;&nbsp;<span style="color: #FFCC00">Much(level 4)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: red;">Very much(level 5)</span></div>
			</div>
			<div style="width: 100%;height: 350px;" id='sleep-report-5'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('sleep-report-5'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Sleep\",\"number\" : \"5\"" + "}";
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
                                    name:"data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name:"level",
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} level'
                                    }
                                } ],
                                series : [ {
                                    name : 'sleep status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".sleep-ex5-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "Not at all(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "Not at all(level 2)";
                                break;
                            case 2:
                                value = "A little(level 3)";
                                break;
                            case 3:
                                value = "Somewhat(level 4)";
                                break;
                            case 4:
                                value = "Much(level 5)";
                                break;
                            case 5:
                                value = "Very much(5 level)";
                                break;
                        }
                        var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"5\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".sleep-ex5SliderVal").text(value);
                                var data = "{\"type\" :\"Sleep\",\"number\" : \"5\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'sleep status' ]
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
                                                name : 'sleep status',
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

		<div class="ques6" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">6.Thinking about the past month, to what extent has poor sleep affected your concentration, productivity, or ability to stay awake?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex6SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">Not at all(1 level)</div>
				<div>
					<input class="sleep-ex6-bar" type="text"    style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="sleep-ex6CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color:#92D050;">Not at all(level 1)</span>&nbsp;&nbsp;<span style="color:#92D050;">A little(level 2)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: #FFFF00;">Somewhat(level 3)</span>&nbsp;&nbsp;<span style="color: #FFCC00">Much(level 4)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: red;">Very much(level 5)</span></div>
			</div>
			<div style="width: 100%;height: 350px;" id='sleep-report-6'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('sleep-report-6'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Sleep\",\"number\" : \"6\"" + "}";
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
                                    name:"data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name:"level",
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'sleep status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".sleep-ex6-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "Not at all(1 level)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "Not at all(1 level)";
                                break;
                            case 2:
                                value = "Little(2 level)";
                                break;
                            case 3:
                                value = "Somewhat(3 level)";
                                break;
                            case 4:
                                value = "Much(4 level)";
                                break;
                            case 5:
                                value = "Very much(5 level)";
                                break;
                        }
                        var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"6\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".sleep-ex6SliderVal").text(value);
                                var data = "{\"type\" :\"Sleep\",\"number\" : \"6\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'sleep status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name:"data",
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name:"level",
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'sleep status',
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
		<div class="ques7" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">7.Thinking about the past month, to what extent has poor sleep troubled you in general?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex7SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">Not at all(1 level)</div>
				<div>
					<input class="sleep-ex7-bar"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
				</div>
				<div style="width: 100%;height: auto;">
					<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color:#92D050;">Not at all(level 1)</span>&nbsp;&nbsp;<span style="color:#92D050;">A little(level 2)</span></div>
					<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: #FFFF00;">Somewhat(level 3)</span>&nbsp;&nbsp;<span style="color: #FFCC00">Much(level 4)</span></div>
					<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: red;">Very much(level 5)</span></div>
				</div>
				<div class="sleep-ex7-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='sleep-report-7'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('sleep-report-7'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Sleep\",\"number\" : \"7\"" + "}";
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
                                    name:"data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name:"level",
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'sleep status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".sleep-ex7-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "Not at all(1 level)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "Not at all(1 level)";
                                break;
                            case 2:
                                value = "Little(2 level)";
                                break;
                            case 3:
                                value = "Somewhat(3 level)";
                                break;
                            case 4:
                                value = "Much(4 level)";
                                break;
                            case 5:
                                value = "Very much(5 level)";
                                break;
                        }
                        var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"7\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".sleep-ex7SliderVal").text(value);
                                var data = "{\"type\" :\"Sleep\",\"number\" : \"7\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'sleep status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name:"data",
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name:"level",
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'sleep status',
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

		<div class="ques8" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">8.How long have you had a problem with your sleep?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex8SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">0month</div>
				<div>
					<input class="sleep-ex8-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="1" data-slider-max="30" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="sleep-ex8CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='sleep-report-8'></div>
		</div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('sleep-report-8'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Sleep\",\"number\" : \"8\"" + "}";
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
                                    name:"data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name:"month",
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value} '
                                    }
                                } ],
                                series : [ {
                                    name : 'sleep status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".sleep-ex8-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        $(".sleep-ex8SliderVal").text(slideEvt.value+"month");
                        var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"8\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                var data = "{\"type\" :\"Sleep\",\"number\" : \"8\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'sleep status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name:"data",
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name:"month",
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'sleep status',
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

	</div>

	<div style="width: 100%;height: 45px;background-color: #0A64A4;text-align: center;border-radius: 5px;color: white;line-height: 45px;font-size: 24px;font-weight: bold;cursor: pointer" onclick="alert('submit success')">submit</div>

</div>
</body>
</html>
