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
	<link rel="stylesheet" href="static/css/stylesheet.css" />

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
	<title>睡眠自我评估问卷</title>
</head>
<body>
<div id="container" style="width: 100%;height: 100%;background-color: #FFFFFF;">
	<jsp:include page="header.jsp"/>
	<div style="width: 100%;height: 20px;clear: both;"></div>
	<div id="title" style="width: 100%;height: auto;">
		<div>
			<img src="static/images/sleep.png" style="width: 20%;height: 16%;float: right;" />
		</div>
		<div style="width: 100%;height: auto;">
			<div style="width: 100%;height: 90px;text-align: center;font-size: 20px;font-family: arial;line-height: 60px; background-color: #FFFFFF; font-weight: 700;">睡眠自我评估问卷</div>
			<div style="height: auto;background-color: #f77a78;">
				<div style="width: 90%;height: auto;margin: 0 auto;color: #FFFFFF; font-family: arial;font-size: 14px;">
					<div style="width: 100%;height: 20px;"></div>
					大多数人在生活中都会遇到睡眠问题。事实上，有人认为三分之一的英国人在某些时候会失眠。
原因可能包括心理状况（如抑郁或焦虑）或两者的结合。这个来自Sleepio的简短测试将给你一个“睡眠分数”加上改善睡眠的实用提示和建议。</div>
					<div style="width: 100%;height: 20px;"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="content" style="width: 100%;height: auto;background-color: #EDEDED">
		<div style="width: 100%;height: 20px;"></div>
		<div class="ques1" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">1.想想上个月的一个典型夜晚，如果你醒了，你总共醒了多长时间？</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex1SliderVal" style="font-size: 16px;font-family: arial;font-weight: bold; margin: 0 auto;color: #f77a78;line-height: 40px;">0 分钟</div>
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
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">2.想想上个月的一个典型夜晚，你需要多长时间才能入睡?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex2SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">0 分钟</div>
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
                                            type : '正常',
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
                                                        type : '正常',
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
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">3.想想上个月，你每周有多少个晚上睡眠有问题?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex3SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">0 晚</div>
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
                                                        type : '正常',
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
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">4.想想上个月的一个典型夜晚，你会如何评价你的睡眠质量?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="ex4SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">非常好(1 level)</div>
				<div>
					<input class="sleep-ex4-bar" type="text"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"   data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="sleep-ex4CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color:#92D050;">非常好(level 1)</span>&nbsp;&nbsp;<span style="color:#92D050;">很好(level 2)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: #FFFF00;">正常(level 3)</span>&nbsp;&nbsp;<span style="color: #FFCC00">很差(level 4)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: red;">极差(level 5)</span></div>
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
                        var value = "非常好(1 level)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "非常好(level 1)";
                                break;
                            case 2:
                                value = "很好(level 2)";
                                break;
                            case 3:
                                value = "正常(level 3)";
                                break;
                            case 4:
                                value = "很差(level 4)";
                                break;
                            case 5:
                                value = "极差(level 5) ";
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
                                                        type : '正常',
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
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">5.想想过去一个月，睡眠质量差在多大程度上影响了你的情绪、精力或人际关系?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex5SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">没影响(1 level)</div>
				<div>
					<input class="sleep-ex5-bar" type="text"    style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="sleep-ex5CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color:#92D050;">没影响(level 1)</span>&nbsp;&nbsp;<span style="color:#92D050;">轻微影响(level 2)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: #FFFF00;">有时影响(level 3)</span>&nbsp;&nbsp;<span style="color: #FFCC00">经常影响(level 4)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: red;">严重影响(level 5)</span></div>
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
                        var value = "没影响(level 1)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "没影响(level 2)";
                                break;
                            case 2:
                                value = "轻微影响(level 3)";
                                break;
                            case 3:
                                value = "有时影响(level 4)";
                                break;
                            case 4:
                                value = "经常影响(level 5)";
                                break;
                            case 5:
                                value = "严重影响(5 level)";
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
                                                        type : '正常',
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
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">6..想想过去一个月，睡眠质量差在多大程度上影响了你的注意力，工作效率或保持清醒的能力?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex6SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">没影响(1 level)</div>
				<div>
					<input class="sleep-ex6-bar" type="text"    style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
				</div>
				<div class="sleep-ex6CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color:#92D050;">没影响(level 1)</span>&nbsp;&nbsp;<span style="color:#92D050;">轻微影响(level 2)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: #FFFF00;">有时影响(level 3)</span>&nbsp;&nbsp;<span style="color: #FFCC00">经常影响(level 4)</span></div>
				<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: red;">严重影响(level 5)</span></div>
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
                        var value = "没影响(1 level)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "没影响(1 level)";
                                break;
                            case 2:
                                value = "Little(2 level)";
                                break;
                            case 3:
                                value = "有时影响(3 level)";
                                break;
                            case 4:
                                value = "经常影响(4 level)";
                                break;
                            case 5:
                                value = "严重影响(5 level)";
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
                                                        type : '正常',
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
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">7.想想过去的一个月，睡眠不好在多大程度上困扰着你?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex7SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">没影响(1 level)</div>
				<div>
					<input class="sleep-ex7-bar"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
				</div>
				<div style="width: 100%;height: auto;">
					<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color:#92D050;">没影响(level 1)</span>&nbsp;&nbsp;<span style="color:#92D050;">轻微影响(level 2)</span></div>
					<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: #FFFF00;">有时影响(level 3)</span>&nbsp;&nbsp;<span style="color: #FFCC00">经常影响(level 4)</span></div>
					<div style="width: 80%;margin: 0 auto;text-align: center;"><span style="color: red;">严重影响(level 5)</span></div>
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
                        var value = "没影响(1 level)";
                        switch (slideEvt.value) {
                            case 1:
                                value = "没影响(1 level)";
                                break;
                            case 2:
                                value = "Little(2 level)";
                                break;
                            case 3:
                                value = "有时影响(3 level)";
                                break;
                            case 4:
                                value = "经常影响(4 level)";
                                break;
                            case 5:
                                value = "严重影响(5 level)";
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
                                                        type : '正常',
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
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">8.你的睡眠问题有多久了?</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="sleep-ex8SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">0 晚</div>
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
                                                        type : '正常',
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

	<!-- <div class="submit" style="width: 100%;height: 30px;">
        <button type="button" style="width: 90%;height: 40px;margin-left: 18px;display: block; margin: 0 auto; text-align:center;border-radius: 10px; font-size: 18px;line-height:28px; vertical-align:middle;background-color:#F77A78; color:#FFFFFF ;">Submit</button>
    </div> -->

	<div style="width: 100%;height: 60px;"></div>
	<div id="all-right" style="width: 100%;height: auto;font-family: arial;">
		<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved</div>
	</div>
	<jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
