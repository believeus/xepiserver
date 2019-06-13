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
	<!-- <link href="static/css/bootstrap-slider.min.css" rel="stylesheet"> -->
	<!-- <link href="/static/css/pain-bootstrap-slider.css" rel="stylesheet"> -->
	<link href="static/css/lifestyle-bootstrap-slider.css" rel="stylesheet">
	<script type='text/javascript' src="static/js/jquery-3.3.1.min.js"></script>
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
	<title>McGill Pain Questionnaire</title>
</head>
<body>
<div id="container" style="width: 100%;height: 100%;background-color: #DEDEDE;">
	<jsp:include page="header.jsp" />
	<div style="width: 100%;height: 20px;background-color:#FFFFFF;"></div>
	<div id="title" style="width: 100%;height: auto;">
		<div>
			<img src="static/images/pain.png" style="width: 20%;height: 16%;float: right;" />
		</div>
		<div style="width: 100%;height: auto;">
			<div style="width: 100%;height: 58px;text-align: center;font-size: 20px;font-family: arial;line-height: 46px; background-color: #FFFFFF; font-weight: 700;">The McGill Pain Questionnaire</div>
			<div style="accelerator: 100%;height: auto;background-color: #C1272D;">
				<div style="width: 90%;height: auto;margin: 0 auto;color: #FFFFFF; font-family: arial;font-size: 14px;">
					Overview: The McGill Pain Questionnaire can be used to evaluate a person experiencing significant pain. It can be used to monitor the pain over time and to determine the effectiveness of any intervention. It was developed at by Dr. Melzack at McGill University in Montreal Canada and has been translated into several languages.
					<p>Sections:</p>
					<p>1) What Does Your Pain Feel Like?</p>
					<p>2) How Does Your Pain Change with Time?</p>
					<p>3)How Strong is Your Pain?</p>

				</div>
			</div>
		</div>
	</div>
	<div id="content" style="width: 100%;height: auto;background-color: #DEDEDE">

		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-1'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"1\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    name : "data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name : "level",
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex1-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none (level 1)";
                                break;
                            case 1:
                                value = "flickering(level 1) ";
                                break;
                            case 2:
                                value = "quivering (level 2)";
                                break;
                            case 3:
                                value = "pulsing(level 3)";
                                break;
                            case 4:
                                value = "throbbing(level 4)";
                                break;
                            case 5:
                                value = "beating(level 5)";
                                break;
                            case 6:
                                value = "pounding(level 6)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"1\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex1SliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"1\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques1" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-family: arial;font-size: 20px;line-height:66px;text-align:center; font-weight: 700;">What Does Your Pain Feel Like?</div>
			<div style="width: 96%;height: auto;margin:0 auto; color:#666666">Statement: Some of the following words below describe your present pain. Circle ONLY those words that best describe it. Leave out any category that is not suitable. Use only a single word in each appropriate category - the one that applies best.</div>

			<div style="width: 96%;height: auto;font-size: 16px;margin:0 auto; font-family: airal;font-weight: 600; color: #666666;">1.temporal?</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
				<div class="pain-ex1SliderVal" style="font-size: 16px;font-family: arial;line-height: 40px; font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px">none(level 0)</div>
				<div>
					<input class="pain-ex1-bar" type="text" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" data-slider-min="0" data-slider-max="6" data-slider-step="1" data-slider-value="0">
				</div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div><span style="color: #92D050;">none(level 0)</span>&nbsp; <span style="color: #92D050;">flickering(level1)</span>&nbsp;<span style="color: #FFC000;">quivering (level 2)</span></div>
					<div><span style="color: #FFC000;">pulsing(level 3)</span>&nbsp;<span style="color: #FFFC00;">throbbing(level 4)</span></div>
					<div><span style="color: red;">beating(level 5)</span>&nbsp; <span style="color: red;">pounding(level 6)</span></div>
				</div>
				<div>
					<div style="width: 100%;height: 350px;" id='pain-report-1'></div>
				</div>
			</div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-2'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"2\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
							if (data==""){return;}
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    name : "data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name : "level",
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex2-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
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
                            type : "post",
                            url : "Questionnaire/Input.jhtml.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex2SliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"2\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques2" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">2.spatial</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 10px;"></div>
				<div class="pain-ex2SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px">none(level 0)</div>
				<div><input class="pain-ex2-bar" type="text" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0"></div>
			</div>
			<div style="width: 100%;height: auto;">
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div><span style="color: #92D050;">none(level 0)</span>&nbsp; &nbsp;<span style="color: #92D050;">jumping(level 1)</span></div>
					<div><span style="color: #FFC000;">flashing(level 2)</span>&nbsp; &nbsp;<span style="color: red;">shooting(level 3)</span></div>
				</div>
				<div style="width: 100%;height: 350px;" id='pain-report-2'></div>
			</div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('report-3'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"3\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pian-ex3-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "pricking(level 1)";
                                break;
                            case 2:
                                value = "boring(level 2)";
                                break;
                            case 3:
                                value = "drilling(level 3)";
                                break;
                            case 4:
                                value = "stabbing(level 4)";
                                break;
                            case 5:
                                value = "lancinating(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"3\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pian-ex3-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"3\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques3" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">3.punctate pressure</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pian-ex3-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pian-ex3-bar" type="text" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">pricking(level 1)</span>&nbsp;&nbsp;<span style="color: #FFC000;">boring (level 2)</span>
					</div>
					<div>
						<span style="color: #FFC000;">drilling(level 3)</span>&nbsp;<span style="color: #FFFC00;">stabbing(level 4)</span>
					</div>
					<div>
						<span style="color: red;">lancinating(level 5)</span>
					</div>
				</div>
				<div class="pian-ex3-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='report-3'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-4'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"4\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex4-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "sharp(level 1)";
                                break;
                            case 2:
                                value = "cutting(level 2)";
                                break;
                            case 3:
                                value = "lacerating(level 3)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"4\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex4-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"4\"" + "}";
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
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques4" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;font-weight: 600;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">4.incisive pressure</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex4-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex4-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0" />
				</div>
				<div class="pain-ex4-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">sharp(level 1)</span>
					</div>
					<div>
						<span style="color: #FFC000;">cutting(level 2)</span>&nbsp;<span style="color: red;">lacerating(level 3)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-4'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-5'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"5\"" + "}";
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
                                    name : "data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name : "level",
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex5-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0) ";
                                break;
                            case 1:
                                value = "pinching(level 1) ";
                                break;
                            case 2:
                                value = "pressing(level 2)";
                                break;
                            case 3:
                                value = "gnawing(level 3)";
                                break;
                            case 4:
                                value = "cramping(level 4)";
                                break;
                            case 5:
                                value = "crushing(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"5\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex5-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"5\"" + "}";
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
                                                data : [ 'pain status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name : "data",
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name : "level",
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'pain status',
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
		<div class="ques5" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">5.constrictive pressure</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex5-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex5-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp; <span style="color: #92D050;">pinching(level1)</span>&nbsp;<span style="color: #FFC000;">pressing (level 2)</span>
					</div>
					<div>
						<span style="color: #FFC000;">gnawing(level 3)</span>&nbsp;<span style="color: #FFFC00;">cramping(level 4)</span>
					</div>
					<div>
						<span style="color: red;">crushing(level 5)</span>
					</div>
				</div>
				<div class="pain-ex5-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-5'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-6'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"6\"" + "}";
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
                                    name : "data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name : "level",
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex6-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "tugging(level 1) ";
                                break;
                            case 2:
                                value = "pulling(level 2)";
                                break;
                            case 3:
                                value = "wrenching(level 3)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"6\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex6-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"6\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name : "data",
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name : "level",
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'pain status',
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
		<div class="ques6" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">6.traction pressure</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex6-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex6-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">tugging(level1)</span>
					</div>
					<div>
						<span style="color: #FFC000;">pulling(level 2)</span>&nbsp;<span style="color: red;">wrenching(level 4)</span>
					</div>
				</div>
				<div class="pain-ex6-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-6'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('bar-report-7'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"7\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex7-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "hot(level 1)";
                                break;
                            case 2:
                                value = "boring(level 2)";
                                break;
                            case 3:
                                value = "scalding(level 3)";
                                break;
                            case 4:
                                value = "searing(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"7\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex7-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"7\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques7" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">7.thermal</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex7-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex7-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex7-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">hot(level1)</span>
					</div>
					<div>
						<span style="color: #FFC000;">boring(level 2)</span>&nbsp;<span style="color: red;">scalding(level 3)</span>
					</div>
					<div>
						<span style="color: red;">searing(level 4)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='bar-report-7'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-8'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"8\"" + "}";
                    $.ajax({
                        type : "post",
                        url : "Questionnaire/GetData.jhtml",
                        data : data,
                        dataType : "json",
                        contentType : "application/json",
                        success : function(data) {
                            var option = {
                                noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                xAxis : [ {
                                    name : "data",
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name : "level",
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex8-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "tingling(level 1) ";
                                break;
                            case 2:
                                value = "itchy(level 2)";
                                break;
                            case 3:
                                value = "smarting(level 3)";
                                break;
                            case 4:
                                value = "stinging(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"8\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex8-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"8\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name : "data",
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name : "level",
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value} level'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'pain status',
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
		<div class="ques8" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">8.brightness</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex8-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex8-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex8-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">tingling(level1)</span>
					</div>
					<div>
						<span style="color: #FFC000;">itchy(level 2)</span>&nbsp;<span style="color: red;">smarting(level 3)</span>
					</div>
					<div>
						<span style="color: red;">stinging(level 4)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-8'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-9'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"9\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex9-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "dull(level 1) ";
                                break;
                            case 2:
                                value = "sore(level 2)";
                                break;
                            case 3:
                                value = "hurting(level 3)";
                                break;
                            case 4:
                                value = "aching(level 4)";
                                break;
                            case 5:
                                value = "heavy(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"9\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex9-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"9\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques9" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">9.dullness</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex9-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex9-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex9-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">dull(level1)</span>&nbsp;&nbsp;<span style="color: #FFC000;">sore(level 3)</span>
					</div>
					<div>
						<span style="color: #FFFC00;">hurting(level 4)</span>&nbsp;&nbsp;<span style="color: red;">heavy(level 5)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-9'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-10'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"10\"" + "}";
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
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex10-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "tender(level 1)";
                                break;
                            case 2:
                                value = "taut(level 2)";
                                break;
                            case 3:
                                value = "rasping(level 3)";
                                break;
                            case 4:
                                value = "splitting(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"10\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex10-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"10\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'pain status',
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
		<div class="ques10" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">10.sensory miscellaneous</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex10-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex10-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex10-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">tender(level1)</span>&nbsp;&nbsp;<span style="color: #FFC000;">taut(level 2)</span>
					</div>
					<div>
						<span style="color: #FFFC00;">rasping(level 3)</span>&nbsp;&nbsp;<span style="color: red;">splitting(level 4)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-10'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-11'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"11\"" + "}";
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
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".ex11");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
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
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"11\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".ex11SliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"11\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques11" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">11.tension</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="ex11SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="ex11" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="0">
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
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-12'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"12\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex12-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
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
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex12-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"12\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques12" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">12.autonomic</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex12-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex12-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex12-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #FFFC00;">sickening(level1)</span>
					</div>
					<div>
						<span style="color: red;">suffocating(level 2)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-12'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-13'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"13\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex13-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "fearful(level 1)";
                                break;
                            case 2:
                                value = "frightful(level 2)";
                                break;
                            case 3:
                                value = "terrifying(level 3)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"13\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex13-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"13\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'pain status',
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
		<div class="ques13" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">13.fear</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex13-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex13-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex13-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #FFFF00;">fearful(level1)</span>
					</div>
					<div>
						<span style="color: #FFFC00;">frightful(level 2)</span>&nbsp;&nbsp;<span style="color: red;">terrifying(level 3)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-13'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-14'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"14\"" + "}";
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
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex14-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "punishing(level 1)";
                                break;
                            case 2:
                                value = "gruelling(level 2)";
                                break;
                            case 3:
                                value = "cruel(level 3)";
                                break;
                            case 4:
                                value = "vicious(level 4)";
                                break;
                            case 5:
                                value = "killing(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"14\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex14-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"14\"" + "}";
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
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques14" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">14.pinishment</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex14-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex14-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex14-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">punishing(level1)</span>&nbsp;&nbsp;<span style="color: #FFC000;">gruelling(level 2)</span>
					</div>
					<div>
						<span style="color: #FFC000;">cruel(level 3)</span>&nbsp;<span style="color: #FFFC00;">vicious(level 4)</span>
					</div>
					<div>
						<span style="color: red;">killing(level 5)</span>&nbsp;
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-14'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-15'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"15\"" + "}";
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
                                    name : 'data',
                                    type : 'category',
                                    boundaryGap : false,
                                    data : data[1]
                                } ],
                                yAxis : [ {
                                    name : 'level',
                                    type : 'value',
                                    axisLabel : {
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex15-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "wretched(level 1)";
                                break;
                            case 2:
                                value = "blinding(level 2)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"15\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex15-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"15\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
                                            },
                                            calculable : true,
                                            xAxis : [ {
                                                name : 'data',
                                                type : 'category',
                                                boundaryGap : false,
                                                data : data[1]
                                            } ],
                                            yAxis : [ {
                                                name : 'level',
                                                type : 'value',
                                                axisLabel : {
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'pain status',
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
		<div class="ques15" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">15.affective-evaluative-sensory:miscellaneous</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex15-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex15-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex15-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp; <span style="color: #92D050;">wretched(level1)</span>&nbsp;<span style="color:red;">blinding(level 2)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-15'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-16'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"16\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex16-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "annoying(level 1)";
                                break;
                            case 2:
                                value = "troublesome(level 2)";
                                break;
                            case 3:
                                value = "miserable(level 3)";
                                break;
                            case 4:
                                value = "intense(level 4)";
                                break;
                            case 5:
                                value = "unbearable(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"16\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex16-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"16\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                    formatter : '{value}'
                                                }
                                            } ],
                                            series : [ {
                                                name : 'pain status',
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
		<div class="ques16" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">16.evaluative</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex16-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex16-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex16-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">annoying(level1)</span>
					</div>
					<div>
						<span style="color: #FFC000;">troublesome(level 3)</span>&nbsp;&nbsp;<span style="color: #FFFC00;">intense(level 4)</span>
					</div>
					<div>
						<span style="color: red;">unbearable(level 5)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-16'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-17'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"17\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex17-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "spreading(level 1)";
                                break;
                            case 2:
                                value = "radiating(level 2)";
                                break;
                            case 3:
                                value = "penetrating(level 3)";
                                break;
                            case 4:
                                value = "piercing(level 4)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"17\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex17-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"17\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques17" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">17.sensory: miscellaneous</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex17-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex17-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex17-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">radiating(level 1)</span>
					</div>
					<div>
						<span style="color: #FFC000;">radiating(level 2)</span>&nbsp;&nbsp;<span style="color: #FFFC00;">penetrating(level 3)</span>
					</div>
					<div>
						<span style="color: red;">piercing(level 4)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-17'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-18'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"18\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex18-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "tight(level 1)";
                                break;
                            case 2:
                                value = "numb(level 2)";
                                break;
                            case 3:
                                value = "drawing(level 3)";
                                break;
                            case 4:
                                value = "squeezing(level 4)";
                                break;
                            case 5:
                                value = "tearing(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"18\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex18-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"18\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques18" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">18.sensory: miscellaneous</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex18-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex18-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex18-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #92D050;">tight(level1)</span>&nbsp;&nbsp;<span style="color: #FFC000;">numb(level 2)</span>
					</div>
					<div>
						<span style="color: #FFFC00;">drawing(level 3)</span>&nbsp;&nbsp;<span style="color: #FFFC00;">squeezing(level 4)</span>
					</div>
					<div>
						<span style="color: red;">tearing(level 5)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-18'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-19'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"19\"" + "}";
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
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex19-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "cool(level 1)";
                                break;
                            case 2:
                                value = "cold(level 2)";
                                break;
                            case 3:
                                value = "freezing(level 3)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"19\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex19-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"19\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques19" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">19.sensory</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex19-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex19-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex19-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div>
						<span style="color: #92D050;">none(level 0)</span>&nbsp;&nbsp; <span style="color: #FFF000;">cool(level1)</span>
					</div>
					<div>
						<span style="color: #FFFC00;">cold(level 2)</span>&nbsp;&nbsp;<span style="color:red;">freezing(level 3)</span>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-19'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-20'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"20\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex20-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "nagging(level 1)";
                                break;
                            case 2:
                                value = "nauseating(level 2)";
                                break;
                            case 3:
                                value = "agonizing(level 3)";
                                break;
                            case 4:
                                value = "dreadful(level 4)";
                                break;
                            case 5:
                                value = "torturing(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"20\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex20-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"20\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques20" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius:10px;padding: 10px; ">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">20.affective-evaluative:miscellaneous</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
				<div class="pain-ex20-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex20-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex20-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div><span style="color: #92D050;">none(level 0)</span>&nbsp; &nbsp;<span style="color: #92D050;">nagging(level1)</span></div>
					<div><span style="color: #FFC000;">nauseating(level 2)</span>&nbsp;&nbsp;<span style="color: #FFFC00;">agonizing(level 3)</span></div>
					<div><span style="color: #FFFC00;">dreadful(level 4)</span>&nbsp;&nbsp;<span style="color: red;">torturing(level 5)</span></div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-20'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>

		<!-- 				<div style="width: 100%;height: auto;margin: 0 auto;line-height: 60px; font-weight: 700; font-family: airal;color: #666666;">How Does Your Pain Change with Time?</div> -->

		<!-- <div style="width: 100%;height: 10px;"></div> -->
		<!-- 		<div style="width: 96%;height: auto;margin: 0 auto;background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">Do the following items increase or decrease your pain?</div>
					<form action="" method="get">
						<div style="width: 100%;height: auto;font-size: 16px;font-family: arial;color: #666666;">
							<div>
								<input name="health" type="checkbox" value="" />liquor
							</div>
							<div>
								<input name="health" type="checkbox" value="" />stimulants such as coffee
							</div>
							<div>
								<input name="health" type="checkbox" value="" />eating
							</div>
							<div>
								<input name="health" type="checkbox" value="" />heat
							</div>
							<div>
								<input name="health" type="checkbox" value="" />cold
							</div>
							<div>
								<input name="health" type="checkbox" value="" />damp
							</div>
							<div>
								<input name="health" type="checkbox" value="" /> weather changes
							</div>
							<div>
								<input name="health" type="checkbox" value="" />massage or use of a vibrator
							</div>
							<div>
								<input name="health" type="checkbox" value="" />pressure
							</div>
							<div>
								<input name="health" type="checkbox" value="" />no movemen
							</div>
							<div>
								<input name="health" type="checkbox" value="" />movement
							</div>
							<div>
								<input name="health" type="checkbox" value="" />sleep or rest
							</div>
							<div>
								<input name="health" type="checkbox" value="" />lying down
							</div>
							<div>
								<input name="health" type="checkbox" value="" />distraction (TV reading etc.)
							</div>
							<div>
								<input name="health" type="checkbox" value="" />urination or defecation
							</div>
							<div>
								<input name="health" type="checkbox" value="" />tension
							</div>
							<div>
								<input name="health" type="checkbox" value="" />bright lights
							</div>
							<div>
								<input name="health" type="checkbox" value="" />loud noises
							</div>
							<div>
								<input name="health" type="checkbox" value="" />going to work
							</div>
							<div>
								<input name="health" type="checkbox" value="" />intercourse
							</div>
							<div>
								<input name="health" type="checkbox" value="" />mild exercise
							</div>
							<div>
								<input name="health" type="checkbox" value="" />fatigue
							</div>

						</div>
					</form>
				</div> -->
		<!-- 	<div style="width: 100%;height: auto;margin: 0 auto;line-height: 60px; font-weight: 700; font-family: airal;color: #666666;font-weight: 600;">How Strong is Your Pain?</div>
				<div style="width: 100%;height: auto;">Statement: People agree that the following 5 words (mild discomforting distressing horrible excruciating) represent pain of increasing intensity. To answer each question below write the number of the most appropriate word in the space beside the question.</div> -->

		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-21'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"21\"" + "}";
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
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex21-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild(level 1)";
                                break;
                            case 2:
                                value = "discomforting(level 2)";
                                break;
                            case 3:
                                value = "distressing(level 3)";
                                break;
                            case 4:
                                value = "horrible(level 4)";
                                break;
                            case 5:
                                value = "excruciating(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"21\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex21-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"21\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques21" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">21. Which word describes your pain right now?</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
				<div class="pain-ex21-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex21-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex21-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div><span style="color: #92D050;">none(level 0)</span>&nbsp; &nbsp;<span style="color: #92D050;">nagging(level1)</span></div>
					<div><span style="color: #FFC000;">nauseating(level 2)</span>&nbsp;&nbsp;<span style="color: #FFFC00;">agonizing(level 3)</span></div>
					<div><span style="color: #FFFC00;">dreadful(level 4)</span>&nbsp;&nbsp;<span style="color: red;">torturing(level 5)</span></div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-21'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-22'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"22\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex22-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild(level 1)";
                                break;
                            case 2:
                                value = "discomforting(level 2)";
                                break;
                            case 3:
                                value = "distressing(level 3)";
                                break;
                            case 4:
                                value = "horrible(level 4)";
                                break;
                            case 5:
                                value = "excruciating(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"22\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex22-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"22\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques22" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">22.Which word describes it at its worst?</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex22-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex22-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex22-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div><span style="color: #92D050;">none(level 0)</span>&nbsp; &nbsp;<span style="color: #92D050;">nagging(level1)</span></div>
					<div><span style="color: #FFC000;">nauseating(level 2)</span>&nbsp;&nbsp;<span style="color: #FFFC00;">agonizing(level 3)</span></div>
					<div><span style="color: #FFFC00;">dreadful(level 4)</span>&nbsp;&nbsp;<span style="color: red;">torturing(level 5)</span></div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-22'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-23'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"23\"" + "}";
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
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex23-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild(level 1)";
                                break;
                            case 2:
                                value = "discomforting(level 2)";
                                break;
                            case 3:
                                value = "distressing(level 3)";
                                break;
                            case 4:
                                value = "horrible(level 4)";
                                break;
                            case 5:
                                value = "excruciating(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"23\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex23-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"23\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques23" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">23.Which word describes it when it is least?</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex23-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex23-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex23-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div><span style="color: #92D050;">none(level 0)</span>&nbsp; &nbsp;<span style="color: #92D050;">nagging(level1)</span></div>
					<div><span style="color: #FFC000;">nauseating(level 2)</span>&nbsp;&nbsp;<span style="color: #FFFC00;">agonizing(level 3)</span></div>
					<div><span style="color: #FFFC00;">dreadful(level 4)</span>&nbsp;&nbsp;<span style="color: red;">torturing(level 5)</span></div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-23'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-24'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"24\"" + "}";
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
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex24-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild(level 1)";
                                break;
                            case 2:
                                value = "discomforting(level 2)";
                                break;
                            case 3:
                                value = "distressing(level 3)";
                                break;
                            case 4:
                                value = "horrible(level 4)";
                                break;
                            case 5:
                                value = "excruciating(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"24\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex24-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"24\"" + "}";
                                $.ajax({
                                    type : "post",
                                    url : "Questionnaire/GetData.jhtml",
                                    data : data,
                                    dataType : "json",
                                    contentType : "application/json",
                                    success : function(data) {
                                        var option = {
                                            legend : {
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques24" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">24.Which word describes the worst toothache you ever had?</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex24-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex24-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex24-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div><span style="color: #92D050;">none(level 0)</span>&nbsp; &nbsp;<span style="color: #92D050;">nagging(level1)</span></div>
					<div><span style="color: #FFC000;">nauseating(level 2)</span>&nbsp;&nbsp;<span style="color: #FFFC00;">agonizing(level 3)</span></div>
					<div><span style="color: #FFFC00;">dreadful(level 4)</span>&nbsp;&nbsp;<span style="color: red;">torturing(level 5)</span></div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-24'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-25'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"25\"" + "}";
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
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex25-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild(level 1)";
                                break;
                            case 2:
                                value = "discomforting(level 2)";
                                break;
                            case 3:
                                value = "distressing(level 3)";
                                break;
                            case 4:
                                value = "horrible(level 4)";
                                break;
                            case 5:
                                value = "excruciating(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"25\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex25-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"25\"" + "}";
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
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques25" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">25.Which word describes the worst headache you ever had?</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex25-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex25-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex25-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div><span style="color: #92D050;">none(level 0)</span>&nbsp; &nbsp;<span style="color: #92D050;">nagging(level1)</span></div>
					<div><span style="color: #FFC000;">nauseating(level 2)</span>&nbsp;&nbsp;<span style="color: #FFFC00;">agonizing(level 3)</span></div>
					<div><span style="color: #FFFC00;">dreadful(level 4)</span>&nbsp;&nbsp;<span style="color: red;">torturing(level 5)</span></div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-25'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
            $(function() {
                require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var chart = ec.init(document.getElementById('pain-report-26'));
                    //初始化报表数据
                    var data = "{\"type\" :\"Pain\",\"number\" : \"26\"" + "}";
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
                                        formatter : '{value}'
                                    }
                                } ],
                                series : [ {
                                    name : 'pain status',
                                    type : 'line',
                                    data : data[0],
                                }, ]
                            };
                            // 为echarts对象加载数据
                            chart.setOption(option);
                        }
                    });

                    var slider = new Slider(".pain-ex26-bar");
                    //拖动发送
                    slider.on("slide", function(slideEvt) {
                        var value = "none(level 0)";
                        switch (slideEvt.value) {
                            case 0:
                                value = "none(level 0)";
                                break;
                            case 1:
                                value = "mild(level 1)";
                                break;
                            case 2:
                                value = "discomforting(level 2)";
                                break;
                            case 3:
                                value = "distressing(level 3)";
                                break;
                            case 4:
                                value = "horrible(level 4)";
                                break;
                            case 5:
                                value = "excruciating(level 5)";
                                break;
                        }
                        var data = "{\"type\" : \"Pain\",\"data\" : {\"id\" : \"26\",\"value\" :\"" + slideEvt.value + "\"}}";
                        $.ajax({
                            type : "post",
                            url : "Questionnaire/Input.jhtml",
                            dataType : "json",
                            contentType : "application/json",
                            data : data,
                            success : function(data) {
                                $(".pain-ex26-barSliderVal").text(value);
                                var data = "{\"type\" :\"Pain\",\"number\" : \"26\"" + "}";
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
                                                data : [ 'pain status' ]
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
                                                name : 'pain status',
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
		<div class="ques26" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;padding: 10px;">
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">26.Which word describes the worst stomach-ache you ever had?</div>
			<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">

				<div class="pain-ex26-barSliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">none(level 0)</div>
				<div>
					<input class="pain-ex26-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="pain-ex26-barCurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="margin: 0 auto;text-align: center;width: 95%;text-align: center;">
					<div><span style="color: #92D050;">none(level 0)</span>&nbsp; &nbsp;<span style="color: #92D050;">nagging(level1)</span></div>
					<div><span style="color: #FFC000;">nauseating(level 2)</span>&nbsp;&nbsp;<span style="color: #FFFC00;">agonizing(level 3)</span></div>
					<div><span style="color: #FFFC00;">dreadful(level 4)</span>&nbsp;&nbsp;<span style="color: red;">torturing(level 5)</span></div>
				</div>
			</div>
			<div style="width: 100%;height: 350px;" id='pain-report-26'></div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<!-- <div style="width: 100%;height: auto;font-family: arial;">
				<div>Interpretation:</div>
				<ul>
					<li>minimum pain score: 0 (would not be seen in a person with true pain)</li>
					<li>maximum pain score: 78</li>
					<li>The higher the pain score the greater the pain.</li>
				</ul>
			</div> -->
		<!-- <div style="width: 100%;height: auto;">
				References:
				<p>Melzack R. The McGill Pain Questionnaire: Major properties and scoring methods. Pain. 1975;1: 277-299. Stein C Mendl G. The German counterpart to McGill Pain Questionnaire. Pain. 1988; 32: 251-255.</p>
			</div> -->
		<!-- <div class="submit" style="width: 100%;height: 30px;">
				<button type="button" style="width: 90%;height: 40px;margin-left: 18px; display: block;margin: 0 auto; text-align:center;border-radius: 10px; font-size: 18px;line-height:28px; vertical-align:middle;background-color:#C1272D; color:#FFFFFF ;">Submit</button>
			</div> -->
		<!-- <div style="width: 100%;height: 60px;"></div>
			<div id="all-right" style="width: 100%;height: auto;font-family: arial;">
				<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;">@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved</div>
			</div> -->
	</div>
</div>
</body>
</html>
