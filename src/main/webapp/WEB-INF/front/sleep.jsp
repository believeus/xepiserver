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

<link href="static/css/sleep-bootstrap-slider.css" rel="stylesheet">
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
		<jsp:include page="header.jsp"></jsp:include>

		<div style="width: 100%;height: 20px;"></div>
		<div id="title" style="width: 100%;height: auto;">
			<div>
				<img src="static/images/sleep.png" style="width: 20%;height: 100%;float: right;" />
			</div>
			<div style="width: 100%;height: auto;">

				<div style="width: 100%;height: 58px;text-align: center;font-size: 20px;font-family: arial;line-height: 60px; background-color: #FFFFFF; font-weight: 700;">Sleep Self Assesment</div>
				<div style="accelerator: 100%;height: auto;background-color: #f77a78;">
					<div style="width: 90%;height: auto;margin: 0 auto;color: #FFFFFF; font-family: arial;font-size: 14px;">
						<div style="width: 100%;height: 20px;"></div>
						Most people experience problems with sleep in their life. In fact, it’s thought that a third of Brits will have episodes of insomnia at some point.
						<p>The causes can include psychological conditions (Such as depression or anxiety) or a combination of both. This short test from Sleepio will give you a’sleep score ' plus practical tips and advice for improving your sleep.</p>
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
					<div class="ex1SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">0-15 min(1 level)</div>
					<div>
						<input class="ex1" type="text" data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
					</div>
					<div class="ex1CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				</div>
				<div style="width: 100%;height: 350px;" id='report-1'></div>
			</div>
			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('report-1'));
						//初始化报表数据
						var data = "{\"type\" :\"Sleep\",\"number\" : \"1\"" + "}";
						$.ajax({
							type : "post",
							url : "http://192.168.1.126:8080/Questionnaire/GetData",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
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
										name : 'sleep status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});

						var slider = new Slider(".ex1");
						//拖动发送
						slider.on("slide", function(slideEvt) {
							var value = "0-15 min(1 level)";
							switch (slideEvt.value) {
							case 1:
								value = "0-15 min(1 level)";
								break;
							case 2:
								value = "16-30 min(2 level)";
								break;
							case 3:
								value = "31-45 min(3 level)";
								break;
							case 4:
								value = "46-60 min(4 level)";
								break;
							case 5:
								value = "more than 61 min(5 level)";
								break;
							}
							var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"1\",\"value\" :\"" + slideEvt.value + "\"}}";
							$.ajax({
								type : "post",
								url : "http://192.168.1.126:8080/Questionnaire/Input",
								dataType : "json",
								contentType : "application/json",
								data : data,
								success : function(data) {
									$(".ex1SliderVal").text(value);
									var data = "{\"type\" :\"Sleep\",\"number\" : \"1\"" + "}";
									$.ajax({
										type : "post",
										url : "http://192.168.1.126:8080/Questionnaire/GetData",
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
			<div class="ques2" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">2.Thinking about a typical night in the last month, how long does it take you to fall asleep?</div>
				<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div class="ex2SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">0-15 min(1 level)</div>
					<div>
						<input class="ex2" type="text" data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
					</div>
					<div class="ex2CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				</div>
				<div style="width: 100%;height: 350px;" id='report-2'></div>
			</div>
			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('report-2'));
						//初始化报表数据
						var data = "{\"type\" :\"Sleep\",\"number\" : \"2\"" + "}";
						$.ajax({
							type : "post",
							url : "http://192.168.1.126:8080/Questionnaire/GetData",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
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
										name : 'sleep status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});

						var slider = new Slider(".ex2");
						//拖动发送
						slider.on("slide", function(slideEvt) {
							var value = "0-15 min(1 level)";
							switch (slideEvt.value) {
							case 1:
								value = "0-15 min(1 level)";
								break;
							case 2:
								value = "16-30 min(2 level)";
								break;
							case 3:
								value = "31-45 min(3 level)";
								break;
							case 4:
								value = "46-60 min(4 level)";
								break;
							case 5:
								value = "more than 61 min(5 level)";
								break;
							}
							var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"2\",\"value\" :\"" + slideEvt.value + "\"}}";
							$.ajax({
								type : "post",
								url : "http://192.168.1.126:8080/Questionnaire/Input",
								dataType : "json",
								contentType : "application/json",
								data : data,
								success : function(data) {
									$(".ex2SliderVal").text(value);
									var data = "{\"type\" :\"Sleep\",\"number\" : \"2\"" + "}";
									$.ajax({
										type : "post",
										url : "http://192.168.1.126:8080/Questionnaire/GetData",
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


			<div class="ques3" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">3.Thinking about the last month, how many nights a week do you have a problem with your sleep?</div>
				<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div class="ex3SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">0-1 night(1 level)</div>
					<div>
						<input class="ex3" type="text" data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
					</div>
					<div class="ex3CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				</div>
				<div style="width: 100%;height: 350px;" id='report-3'></div>
			</div>
			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('report-3'));
						//初始化报表数据
						var data = "{\"type\" :\"Sleep\",\"number\" : \"3\"" + "}";
						$.ajax({
							type : "post",
							url : "http://192.168.1.126:8080/Questionnaire/GetData",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
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
										name : 'sleep status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});

						var slider = new Slider(".ex3");
						//拖动发送
						slider.on("slide", function(slideEvt) {
							var value = "0-1 night(1 level)";
							switch (slideEvt.value) {
							case 1:
								value = "0-1 night(1 level)";
								break;
							case 2:
								value = "2 nights(2 level)";
								break;
							case 3:
								value = "3 nights(3 level)";
								break;
							case 4:
								value = "4 nights(4 level)";
								break;
							case 5:
								value = "5-7 nights(5 level)";
								break;
							}
							var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"3\",\"value\" :\"" + slideEvt.value + "\"}}";
							$.ajax({
								type : "post",
								url : "http://192.168.1.126:8080/Questionnaire/Input",
								dataType : "json",
								contentType : "application/json",
								data : data,
								success : function(data) {
									$(".ex3SliderVal").text(value);
									var data = "{\"type\" :\"Sleep\",\"number\" : \"3\"" + "}";
									$.ajax({
										type : "post",
										url : "http://192.168.1.126:8080/Questionnaire/GetData",
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


			<div class="ques4" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">4.Thinking about a typical night in the last month, how would you rate your sleep quality?</div>
				<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div class="ex4SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">Very good(1 level)</div>
					<div>
						<input class="ex4" type="text" data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
					</div>
					<div class="ex4CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				</div>
				<div style="width: 100%;height: 350px;" id='report-4'></div>
			</div>
			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('report-4'));
						//初始化报表数据
						var data = "{\"type\" :\"Sleep\",\"number\" : \"4\"" + "}";
						$.ajax({
							type : "post",
							url : "http://192.168.1.126:8080/Questionnaire/GetData",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
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
										name : 'sleep status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});

						var slider = new Slider(".ex4");
						//拖动发送
						slider.on("slide", function(slideEvt) {
							var value = "Very good(1 level)";
							switch (slideEvt.value) {
							case 1:
								value = "Very good(1 level)";
								break;
							case 2:
								value = "Good(2 level)";
								break;
							case 3:
								value = "Average(3 level)";
								break;
							case 4:
								value = "Poor(4 level)";
								break;
							case 5:
								value = "Very poor(5 level) ";
								break;
							}
							var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"4\",\"value\" :\"" + slideEvt.value + "\"}}";
							$.ajax({
								type : "post",
								url : "http://192.168.1.126:8080/Questionnaire/Input",
								dataType : "json",
								contentType : "application/json",
								data : data,
								success : function(data) {
									$(".ex4SliderVal").text(value);
									var data = "{\"type\" :\"Sleep\",\"number\" : \"4\"" + "}";
									$.ajax({
										type : "post",
										url : "http://192.168.1.126:8080/Questionnaire/GetData",
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


			<div class="ques5" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">5.Thinking about the past month, to what extent has poor sleep affected your mood, energy, or relationships?</div>
				<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div class="ex5SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">Not at all(1 level)</div>
					<div>
						<input class="ex5" type="text" data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
					</div>
					<div class="ex5CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				</div>
				<div style="width: 100%;height: 350px;" id='report-5'></div>
			</div>
			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('report-5'));
						//初始化报表数据
						var data = "{\"type\" :\"Sleep\",\"number\" : \"5\"" + "}";
						$.ajax({
							type : "post",
							url : "http://192.168.1.126:8080/Questionnaire/GetData",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
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
										name : 'sleep status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});

						var slider = new Slider(".ex5");
						//拖动发送
						slider.on("slide", function(slideEvt) {
							var value = "Not at all(1 level)";
							switch (slideEvt.value) {
							case 1:
								value = "Not at all(1 level)";
								break;
							case 2:
								value = "A little(2 level)";
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
							var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"5\",\"value\" :\"" + slideEvt.value + "\"}}";
							$.ajax({
								type : "post",
								url : "http://192.168.1.126:8080/Questionnaire/Input",
								dataType : "json",
								contentType : "application/json",
								data : data,
								success : function(data) {
									$(".ex5SliderVal").text(value);
									var data = "{\"type\" :\"Sleep\",\"number\" : \"5\"" + "}";
									$.ajax({
										type : "post",
										url : "http://192.168.1.126:8080/Questionnaire/GetData",
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
					<div class="ex6SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">Not at all(1 level)</div>
					<div>
						<input class="ex6" type="text" data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
					</div>
					<div class="ex6CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				</div>
				<div style="width: 100%;height: 350px;" id='report-6'></div>
			</div>
			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('report-6'));
						//初始化报表数据
						var data = "{\"type\" :\"Sleep\",\"number\" : \"6\"" + "}";
						$.ajax({
							type : "post",
							url : "http://192.168.1.126:8080/Questionnaire/GetData",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
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
										name : 'sleep status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});

						var slider = new Slider(".ex6");
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
								url : "http://192.168.1.126:8080/Questionnaire/Input",
								dataType : "json",
								contentType : "application/json",
								data : data,
								success : function(data) {
									$(".ex6SliderVal").text(value);
									var data = "{\"type\" :\"Sleep\",\"number\" : \"6\"" + "}";
									$.ajax({
										type : "post",
										url : "http://192.168.1.126:8080/Questionnaire/GetData",
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
			<div class="ques7" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">7.Thinking about the past month, to what extent has poor sleep troubled you in general?</div>
				<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div class="ex7SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">Not at all(1 level)</div>
					<div>
						<input class="ex7" type="text" data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
					</div>
					<div class="ex7CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				</div>
				<div style="width: 100%;height: 350px;" id='report-7'></div>
			</div>
			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('report-7'));
						//初始化报表数据
						var data = "{\"type\" :\"Sleep\",\"number\" : \"7\"" + "}";
						$.ajax({
							type : "post",
							url : "http://192.168.1.126:8080/Questionnaire/GetData",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
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
										name : 'sleep status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});

						var slider = new Slider(".ex7");
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
								url : "http://192.168.1.126:8080/Questionnaire/Input",
								dataType : "json",
								contentType : "application/json",
								data : data,
								success : function(data) {
									$(".ex7SliderVal").text(value);
									var data = "{\"type\" :\"Sleep\",\"number\" : \"7\"" + "}";
									$.ajax({
										type : "post",
										url : "http://192.168.1.126:8080/Questionnaire/GetData",
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

			<div class="ques8" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">8.How long have you had a problem with your sleep?</div>
				<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div class="ex8SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #f77a78;line-height: 40px">I don't have a problem(1 level)</div>
					<div>
						<input class="ex8" type="text" data-slider-min="1" data-slider-max="5" data-slider-step="1" data-slider-value="1">
					</div>
					<div class="ex8CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				</div>
				<div style="width: 100%;height: 350px;" id='report-8'></div>
			</div>
			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('report-8'));
						//初始化报表数据
						var data = "{\"type\" :\"Sleep\",\"number\" : \"8\"" + "}";
						$.ajax({
							type : "post",
							url : "http://192.168.1.126:8080/Questionnaire/GetData",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
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
										name : 'sleep status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});

						var slider = new Slider(".ex8");
						//拖动发送
						slider.on("slide", function(slideEvt) {
							var value = "I don't have a problem(1 level)";
							switch (slideEvt.value) {
							case 1:
								value = "I don't have a problem(1 level)";
								break;
							case 2:
								value = "1-2 months(2 level)";
								break;
							case 3:
								value = "3-6 months(3 level)";
								break;
							case 4:
								value = "7-12 months(4 level)";
								break;
							case 5:
								value = "Longer than a year(5 level)";
								break;
							}
							var data = "{\"type\" : \"Sleep\",\"data\" : {\"id\" : \"8\",\"value\" :\"" + slideEvt.value + "\"}}";
							$.ajax({
								type : "post",
								url : "http://192.168.1.126:8080/Questionnaire/Input",
								dataType : "json",
								contentType : "application/json",
								data : data,
								success : function(data) {
									$(".ex8SliderVal").text(value);
									var data = "{\"type\" :\"Sleep\",\"number\" : \"8\"" + "}";
									$.ajax({
										type : "post",
										url : "http://192.168.1.126:8080/Questionnaire/GetData",
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

		</div>

		<!-- <div class="submit" style="width: 100%;height: 30px;">
			<button type="button" style="width: 90%;height: 40px;margin-left: 18px;display: block; margin: 0 auto; text-align:center;border-radius: 10px; font-size: 18px;line-height:28px; vertical-align:middle;background-color:#F77A78; color:#FFFFFF ;">Submit</button>
		</div> -->

		<div style="width: 100%;height: 60px;"></div>
		<div id="all-right" style="width: 100%;height: auto;font-family: arial;">
			<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;">@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved</div>
		</div>
	</div>
</body>
</html>
