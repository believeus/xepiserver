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
<link href="/static/css/pain-bootstrap-slider.css" rel="stylesheet">
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
						<div style="width: 100%;height: 20px;"></div>
						Overview: The McGill Pain Questionnaire can be used to evaluate a person experiencing significant pain. It can be used to monitor the pain over time and to determine the effectiveness of any intervention. It was developed at by Dr. Melzack at McGill University in Montreal Canada and has been translated into several languages.
						<div style="width: 100%;height: 20px;"></div>
						<p>Sections:</p>
						<p>1) What Does Your Pain Feel Like?</p>
						<p>2) How Does Your Pain Change with Time?</p>
						<p>3)How Strong is Your Pain?</p>
						<div style="width: 100%;height: 20px;"></div>
					</div>
				</div>
			</div>
		</div>
		<div id="content" style="width: 100%;height: auto;background-color: #DEDEDE">
			<div style="width: 100%;height: 20px;"></div>
			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('report-1'));
						//初始化报表数据
						var data = "{\"type\" :\"Pain\",\"number\" : \"1\"" + "}";
						$.ajax({
							type : "post",
							url : "Questionnaire/GetData.jhtml.jhtml",
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
										name : 'pain status',
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
							var value = "not at all(0 level)";
							switch (slideEvt.value) {
							case 0:
								value = "not at all (0 level)";
								break;
							case 1:
								value = "flickering(1 level) ";
								break;
							case 2:
								value = "quivering (2 level)";
								break;
							case 3:
								value = "pulsing(3 level)";
								break;
							case 4:
								value = "throbbing(4 level)";
								break;
							case 5:
								value = "beating(5 level)";
								break;
							case 6:
								value = "pounding(6 level)";
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
									$(".ex1SliderVal").text(value);
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
			<div class="ques1" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
				<div style="width: 100%;height: auto;font-family: arial;font-size: 20px;line-height:66px;text-align:center; font-weight: 700;">What Does Your Pain Feel Like?</div>
				<div style="width: 96%;height: auto;margin:0 auto; color:#666666">Statement: Some of the following words below describe your present pain. Circle ONLY those words that best describe it. Leave out any category that is not suitable. Use only a single word in each appropriate category - the one that applies best.</div>
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 96%;height: auto;font-size: 16px;margin:0 auto; font-family: airal;font-weight: 600; color: #666666;">1.temporal?</div>
				<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;"></div>
					<div class="ex1SliderVal" style="font-size: 16px;font-family: arial;line-height: 40px; font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px">not at all(0 level)</div>
					<!-- 	<div style="width: 100%;height: 20px;">
						<div style="width: 16%;float: left;height: 100%;text-align: left;font-weight: bold;">0</div>
						<div style="width:  14%;float: left;height: 100%;text-align: left;font-weight: bold;">mild</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">discomforting</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">distressing</div>
						<div style="width:  15%;float: left;height: 100%;text-align: left;font-weight: bold;">horrible</div>
						<div style="width:  15%;float: left;height: 100%;text-align: left;font-weight: bold;">excruciating</div>
					</div> -->
					<div>
						<input class="ex1" type="text" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" data-slider-min="0" data-slider-max="6" data-slider-step="1" data-slider-value="0">
					</div>
					<!-- <div style="width: 100%;height: 20px;">
						<div style="width: 14.3%;float: left;height: 100%;text-align: left;font-weight: bold;">0</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">1</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">2</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">3</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">4</div>
						<div style="width:  5%;float: left;height: 100%;text-align: left;font-weight: bold;">5</div>
						<div style="width:  12%;float: left;height: 100%;text-align: right;font-weight: bold;">6</div>
					</div> -->
					<div class="ex1CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					<div style="width: 100%;height: 20px;"></div>
				</div>
				<div style="width: 100%;height: auto;">
					<div style="margin: 0 auto;text-align: center;width: 95%;">
						<span style="color: #92D050;">not at all(0 level)</span>&nbsp; <span style="color: #92D050;">flickering(1 level)</span>&nbsp; <span style="color: #FFC000;">quivering (2 level)</span>&nbsp; <span style="color: #FFC000;">pulsing(3 level)</span>&nbsp; <span style="color: #FFC000;">throbbing(4 level)</span>&nbsp; <span style="color: red;">beating(5 level)</span>&nbsp; <span style="color: red;">pounding(6 level)</span>&nbsp;
					</div>
					<div>
						<div style="width: 100%;height: 350px;" id='report-1'></div>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 20px;"></div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-2'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"2\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml.jhtml",
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
											name : 'pain status',
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
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "jumping0(1 level)";
									break;
								case 2:
									value = "flashing0(2 level)";
									break;
								case 3:
									value = "shooting0(3 level)";
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
										$(".ex2SliderVal").text(value);
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
				<div class="ques2" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">2.spatial</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex2SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px">not at all(0 level)</div>
						<div>
							<input class="ex2" type="text" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex2CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
						<div style="width: 100%;height: 20px;"></div>
					</div>
					<div style="width: 100%;height: auto;">
						<div style="margin: 0 auto;text-align: center;width: 95%;">
							<span style="color: #92D050;">not at all(0 level)</span>&nbsp; <span style="color: #92D050;">jumping(1 level)</span>&nbsp; <span style="color: #FFC000;">flashing(2 level)</span>&nbsp; <span style="color: #FFC000;">shooting(3 level)</span>&nbsp;
						</div>
						<div style="width: 100%;height: 350px;" id='report-2'></div>
					</div>
				</div>
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
											name : 'pain status',
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
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "pricking(1 level)";
									break;
								case 2:
									value = "boring(2 level)";
									break;
								case 3:
									value = "drilling(3 level)";
									break;
								case 4:
									value = "stabbing(4 level)";
									break;
								case 5:
									value = "lancinating(5 level)";
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
										$(".ex3SliderVal").text(value);
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
				<div class="ques3" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">3.punctate pressure</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex3SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex3" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex3CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-3'></div>
				</div>

				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-4'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"4\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
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
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "none ";
									break;
								case 1:
									value = "sharp ";
									break;
								case 2:
									value = "cutting";
									break;
								case 3:
									value = "lacerating";
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
										$(".ex4SliderVal").text(value);
										var data = "{\"type\" :\"Pain\",\"number\" : \"4\"" + "}";
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
				<div class="ques4" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;font-weight: 600;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">4.incisive pressure</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex4SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex4" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex4CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-4'></div>
				</div>


				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-5'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"5\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
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
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level) ";
									break;
								case 1:
									value = "pinching(1 level) ";
									break;
								case 2:
									value = "pressing(2 level)";
									break;
								case 3:
									value = "gnawing(3 level)";
									break;
								case 4:
									value = "cramping(4 level)";
									break;
								case 5:
									value = "crushing(5 level)";
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
										$(".ex5SliderVal").text(value);
										var data = "{\"type\" :\"Pain\",\"number\" : \"5\"" + "}";
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
				<div class="ques5" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">5.constrictive pressure</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex5SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex5" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex5CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-5'></div>
				</div>

				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-6'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"6\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
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
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "tugging(1 level) ";
									break;
								case 2:
									value = "pulling(2 level)";
									break;
								case 3:
									value = "wrenching(3 level)";
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
										$(".ex6SliderVal").text(value);
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
				<div class="ques6" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">6.traction pressure</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex6SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex6" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex6CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-6'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-7'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"7\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
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
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "hot(1 level)";
									break;
								case 2:
									value = "boring(2 level)";
									break;
								case 3:
									value = "scalding(3 level)";
									break;
								case 4:
									value = "searing(4 level)";
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
										$(".ex7SliderVal").text(value);
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
				<div class="ques7" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">7.thermal</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex7SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex7" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex7CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-7'></div>
				</div>

				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-8'));
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

							var slider = new Slider(".ex8");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "tingling(1 level) ";
									break;
								case 2:
									value = "itchy(2 level)";
									break;
								case 3:
									value = "smarting(3 level)";
									break;
								case 4:
									value = "stinging(4 level)";
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
										$(".ex8SliderVal").text(value);
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
				<div class="ques8" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">8.brightness</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex8SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex8" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex8CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-8'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-9'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"9\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex9");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "dull(1 level) ";
									break;
								case 2:
									value = "sore(2 level)";
									break;
								case 3:
									value = "hurting(3 level)";
									break;
								case 4:
									value = "aching(4 level)";
									break;
								case 5:
									value = "heavy(5 level)";
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
										$(".ex9SliderVal").text(value);
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
				<div class="ques9" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">9.dullness</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex9SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex9" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex9CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-9'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-10'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"10\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex10");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "tender(1 level)";
									break;
								case 2:
									value = "taut(2 level)";
									break;
								case 3:
									value = "rasping(3 level)";
									break;
								case 4:
									value = "splitting(4 level)";
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
										$(".ex10SliderVal").text(value);
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
				<div class="ques10" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">10.sensory miscellaneous</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex10SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex10" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex10CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-10'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-11'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"11\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "sickening(1 level)";
									break;
								case 2:
									value = "suffocating(2 level)";
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
				<div class="ques11" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">11.tension</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex11SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex11" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex11CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-11'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-12'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"12\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex12");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "sickening(1 level)";
									break;
								case 2:
									value = "suffocating(2 level)";
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
										$(".ex12SliderVal").text(value);
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
				<div class="ques12" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">12.autonomic</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex12SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex12" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex12CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-12'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-13'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"13\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex13");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "fearful(1 level)";
									break;
								case 2:
									value = "frightful(2 level)";
									break;
								case 3:
									value = "terrifying(3 level)";
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
										$(".ex13SliderVal").text(value);
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
				<div class="ques13" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">13.fear</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex13SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex13" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex13CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-13'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-14'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"14\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex14");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "punishing(1 level)";
									break;
								case 2:
									value = "gruelling(2 level)";
									break;
								case 3:
									value = "cruel(3 level)";
									break;
								case 4:
									value = "vicious(4 level)";
									break;
								case 5:
									value = "killing(5 level)";
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
										$(".ex14SliderVal").text(value);
										var data = "{\"type\" :\"Pain\",\"number\" : \"14\"" + "}";
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
				<div class="ques14" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">14.pinishment</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex14SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex14" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex14CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-14'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-15'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"15\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex15");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "wretched(0 level)";
									break;
								case 2:
									value = "blinding(0 level)";
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
										$(".ex15SliderVal").text(value);
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
				<div class="ques15" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">15.affective-evaluative-sensory:miscellaneous</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex15SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex15" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex15CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-15'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-16'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"16\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
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
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "annoying(1 level)";
									break;
								case 2:
									value = "troublesome(2 level)";
									break;
								case 3:
									value = "miserable(3 level)";
									break;
								case 4:
									value = "intense(4 level)";
									break;
								case 5:
									value = "unbearable(5 level)";
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
										$(".ex16SliderVal").text(value);
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
				<div class="ques16" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">16.evaluative</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex16SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex16" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex16CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-16'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-17'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"17\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex17");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "spreading(1 level)";
									break;
								case 2:
									value = "radiating(2 level)";
									break;
								case 3:
									value = "penetrating(3 level)";
									break;
								case 4:
									value = "piercing(4 level)";
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
										$(".ex17SliderVal").text(value);
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
				<div class="ques17" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">17.sensory: miscellaneous</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex17SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex17" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex17CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-17'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-18'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"18\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex18");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "tight(1 level)";
									break;
								case 2:
									value = "numb(2 level)";
									break;
								case 3:
									value = "drawing(3 level)";
									break;
								case 4:
									value = "squeezing(4 level)";
									break;
								case 5:
									value = "tearing(5 level)";
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
										$(".ex18SliderVal").text(value);
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
				<div class="ques18" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">18.sensory: miscellaneous</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex18SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex18" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex18CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-18'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-19'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"19\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex19");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "cool(1 level)";
									break;
								case 2:
									value = "cold(2 level)";
									break;
								case 3:
									value = "freezing(3 level)";
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
										$(".ex19SliderVal").text(value);
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
				<div class="ques19" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">19.sensory</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex19SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex19" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex19CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-19'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-20'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"20\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex20");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "nagging(1 level)";
									break;
								case 2:
									value = "nauseating(2 level)";
									break;
								case 3:
									value = "agonizing(3 level)";
									break;
								case 4:
									value = "dreadful(4 level)";
									break;
								case 5:
									value = "torturing(5 level)";
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
										$(".ex20SliderVal").text(value);
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

				<div class="ques20" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">20.affective-evaluative:miscellaneous</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex20SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex20" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex20CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-20'></div>
				</div>


				<div style="width: 100%;height: auto;margin: 0 auto;line-height: 60px; font-weight: 700; font-family: airal;color: #666666;">How Does Your Pain Change with Time?</div>

				<div style="width: 100%;height: 15px;"></div>
				<div style="width: 96%;height: auto;margin: 0 auto;background-color: #FFFFFF;">
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
				</div>
				<div style="width: 100%;height: auto;margin: 0 auto;line-height: 60px; font-weight: 700; font-family: airal;color: #666666;font-weight: 600;">How Strong is Your Pain?</div>
				<div style="width: 100%;height: auto;">Statement: People agree that the following 5 words (mild discomforting distressing horrible excruciating) represent pain of increasing intensity. To answer each question below write the number of the most appropriate word in the space beside the question.</div>

				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-21'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"21\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex21");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "mild(1 level)";
									break;
								case 2:
									value = "discomforting(2 level)";
									break;
								case 3:
									value = "distressing(3 level)";
									break;
								case 4:
									value = "horrible(4 level)";
									break;
								case 5:
									value = "excruciating(5 level)";
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
										$(".ex21SliderVal").text(value);
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
				<div class="ques21" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">21. Which word describes your pain right now?</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex21SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex21" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex21CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-21'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-22'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"22\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex22");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "mild(1 level)";
									break;
								case 2:
									value = "discomforting(2 level)";
									break;
								case 3:
									value = "distressing(3 level)";
									break;
								case 4:
									value = "horrible(4 level)";
									break;
								case 5:
									value = "excruciating(5 level)";
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
										$(".ex22SliderVal").text(value);
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
				<div class="ques22" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">22.Which word describes it at its worst?</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex22SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex22" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex22CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-22'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-23'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"23\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex23");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "mild(1 level)";
									break;
								case 2:
									value = "discomforting(2 level)";
									break;
								case 3:
									value = "distressing(3 level)";
									break;
								case 4:
									value = "horrible(4 level)";
									break;
								case 5:
									value = "excruciating(5 level)";
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
										$(".ex23SliderVal").text(value);
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
				<div class="ques23" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">23.Which word describes it when it is least?</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex23SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex23" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex23CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-23'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-24'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"24\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex24");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 1:
									value = "mild(1 level)";
									break;
								case 2:
									value = "discomforting(2 level)";
									break;
								case 3:
									value = "horrible(3 level)";
									break;
								case 4:
									value = "excruciating(4 level)";
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
										$(".ex24SliderVal").text(value);
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
				<div class="ques24" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">24.Which word describes the worst toothache you ever had?</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex24SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex24" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex24CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
				</div>
				<div style="width: 100%;height: 350px;" id='report-24'></div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-25'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"25\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex25");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "mild(1 level)";
									break;
								case 2:
									value = "discomforting(2 level)";
									break;
								case 3:
									value = "distressing(3 level)";
									break;
								case 4:
									value = "horrible(4 level)";
									break;
								case 5:
									value = "excruciating(5 level)";
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
										$(".ex25SliderVal").text(value);
										var data = "{\"type\" :\"Pain\",\"number\" : \"25\"" + "}";
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
				<div class="ques25" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">25.Which word describes the worst headache you ever had?</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex25SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex25" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex25CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="width: 100%;height: 350px;" id='report-25'></div>
				</div>
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('report-26'));
							//初始化报表数据
							var data = "{\"type\" :\"Pain\",\"number\" : \"26\"" + "}";
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});

							var slider = new Slider(".ex26");
							//拖动发送
							slider.on("slide", function(slideEvt) {
								var value = "not at all(0 level)";
								switch (slideEvt.value) {
								case 0:
									value = "not at all(0 level)";
									break;
								case 1:
									value = "mild(1 level)";
									break;
								case 2:
									value = "discomforting(2 level)";
									break;
								case 3:
									value = "horrible(3 level)";
									break;
								case 4:
									value = "excruciating(4 level)";
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
										$(".ex26SliderVal").text(value);
										var data = "{\"type\" :\"Pain\",\"number\" : \"26\"" + "}";
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
				<div class="ques26" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;">26.Which word describes the worst stomach-ache you ever had?</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex26SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;">not at all(0 level)</div>
						<div>
							<input class="ex26" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div class="ex26CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
				</div>
				<div style="width: 100%;height: 350px;" id='report-26'></div>

				<div style="width: 100%;height: auto;font-family: arial;">
					<div>Interpretation:</div>
					<ul>
						<li>minimum pain score: 0 (would not be seen in a person with true pain)</li>
						<li>maximum pain score: 78</li>
						<li>The higher the pain score the greater the pain.</li>
					</ul>
				</div>
				<div style="width: 100%;height: auto;">
					References:
					<p>Melzack R. The McGill Pain Questionnaire: Major properties and scoring methods. Pain. 1975;1: 277-299. Stein C Mendl G. The German counterpart to McGill Pain Questionnaire. Pain. 1988; 32: 251-255.</p>
				</div>

				<div class="submit" style="width: 100%;height: 30px;">
					<button type="button" style="width: 90%;height: 40px;margin-left: 18px; display: block;margin: 0 auto; text-align:center;border-radius: 10px; font-size: 18px;line-height:28px; vertical-align:middle;background-color:#C1272D; color:#FFFFFF ;">Submit</button>
				</div>

				<div style="width: 100%;height: 60px;"></div>
				<div id="all-right" style="width: 100%;height: auto;font-family: arial;">
					<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;">@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved</div>
				</div>
</body>
</html>
