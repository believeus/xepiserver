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

<title>My JSP 'report.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="static/css/stylesheet.css" />
<link href="static/css/lifestyle-bootstrap-slider.css" rel="stylesheet">
<link href="/static/css/pain-bootstrap-slider.css" rel="stylesheet">
<script type='text/javascript' src="static/js/jquery-2.1.0.min.js"></script>
<script type='text/javascript' src="/static/js/bootstrap-slider.js"></script>
<script src="static/js/build/dist/echarts.js"></script>
<script src="static/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	// 路径配置
	require.config({
		paths : {
			echarts : 'static/js/build/dist'
		}
	});
</script>
<style>
div[name=subc]:before {
	content: "●";
	color: #207EBF;;
	font-size: 2.5rem;
	margin-right: 8px;
}

.tooltip-inner {
	color: white;
}
</style>
</head>

<body style="background-color: white;">
	<div style="width: 100%;height: 100%;background-color: white;">
		<div style="width: 90%;height: 1500px;margin:0 auto;text-align: center">
			<div style="width: 100%;height: 300px;"></div>
			<div style="font-size: 30px;">Harnessing the power of the epigenome for healthy aging</div>
			<img src="static/images/alevel.png" style="width: 100%;height: auto;">
			<div style="width: 100%;height: 50px;">
				<div style="width: 70%;height: 100%;margin: 0 auto;font-size: 32px;">
					<div style="width: 100%;height: auto;margin: 0 auto;">
						<div style="float: left;width: 35%;">YOUR TEST ID:</div>
						<div style="float: left;width: 50%;text-align: left;" id="id"></div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;margin: 0 auto;">
						<div style="float: left;width: 35%;">NAME：</div>
						<div style="float: left;width: 50%;text-align: left;" id="name"></div>
					</div>
					<div style="clear: both;"></div>
					<div style="width: 100%;height: auto;margin: 0 auto;">
						<div style="float: left;width: 35%;">DATA：</div>
						<div style="float: left;width: 50%;text-align: left;" id="data"></div>
					</div>
				</div>
			</div>
		</div>

		<script>
			$(function() {
				//CN180000000003
				var data = "{\"uuid\" : \"${tid}\"}"
				$.ajax({
					type : "post",
					url : "report/getDataForOne.jhtml",
					dataType : "json",
					contentType : "application/json",
					data : data,
					success : function(data) {
						console.info(data);
						$("div[id=id]").text(data[0]);
						$("div[id=name]").text(data[1]);
						$("div[id=chroage]").text(data[2]);
						$("div[id=bioage]").text(data[3]);
						$("div[id=data]").text(data[4]);

					}
				});
			});
		</script>

		<div style="width: 100%;height: 1550px;">
			<div style="clear: both;width: 100%;height: 500px;"></div>
			<div style="width: 100%;height: auto;">
				<div style="width: 70%;height: auto;margin: 0 auto;font-size: 60px;font-weight: bold;color: #808080">This report provides you with the results of your "epigenetic age" test as well as a summary of your life style parameters.</div>
			</div>
		</div>
		<div style="width: 100%;height: 1550px">
			<div style="clear: both;width: 100%;height: 50;"></div>
			<div style="width: 100%;height: auto;">
				<div style="width: 70%;height: auto;margin: 0 auto;font-size: 40px;font-weight: bold;color: #00b0f0;">
					How old are you? <br />Why is your "epigenetic age" important?
				</div>
			</div>
			<div style="clear: both;width: 100%;height: 50;"></div>
			<div style="width: 100%;height: auto;font-size: 24px;">
				<div name='subc' style="width: 70%;margin: 0 auto;">People age at different rates. Some "look" and "feel" older than their chronological ages while other look younger than their chronological ages.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">Our biological ages are better parameters of our health well being and life span than our chronological ages.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">If we think about our cells as minicomputers, we can look at DNA as the hard ware, genetics as the operating system and DNA methylation and other epigenetic factors as the software that programs the genome.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">A paradigm shift in the search for biological age markers occurred with the discovery of the “epigenetic clock” by Horvath, which is based on measurement of DNA methylation status at hundreds of strategic positions in DNA. This “epigenetic clock” is a measure of our biological ages.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">However in some people the “epigenetic age” is different from the “chronological age”. Sometimes the “epigenetic clock” moves faster than the “chronological clock”. We consider a difference that is larger than the standard deviation (or the normal distribution in the population) as a significant change.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">
					Studies suggest that accelerated “epigenetic clock” might be associated with increased risks for several age-related chronic diseases such as cardiovascular disease and cancer.<i style="text-decoration: underline;"> (https://www.ncbi.nlm.nih.gov/pubmed/?term=epigenetic+clock+disease)</i> This is however still an open field and more studies are needed.
				</div>
			</div>
		</div>

		<div style="width: 100%;height: 1500px">
			<div style="clear: both;width: 100%;height: 50;"></div>
			<div style="width: 100%;height: auto;">
				<div style="width: 70%;height: auto;margin: 0 auto;font-size: 40px;font-weight: bold;color: #00b0f0;">
					What is the <i>epi</i>Aging test? What does it mean?
				</div>
			</div>
			<div style="width: 100%;height: 80px;"></div>
			<div style="width: 100%;height: auto;font-size: 24px;">
				<div name='subc' style="width: 70%;margin: 0 auto;">After extensive data mining, we have discovered a single age-related CG methylation region that was sufficient to accurately predict biological age using saliva.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">We prepare DNA from your saliva and then measure the level of DNA methylation in several positions in a fragment of your genome using next generation sequencing and bisulfite mapping. Your states of DNA methylation are inserted into a mathematical equation that calculates the “epigenetic age” as a function of the level of DNA methylation.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">We consider it as a “red flag” when your “epigenetic age” deviates from your “chronological age” by one standard deviation. Standard deviation provides an idea about the distribution of difference from the mean in the normal population, which at this point of analysis is around 5 years. At this stage, if your “epigenetic age” is 5 years older than your “chronological age” you might consider the result as a “red flag”. As more tests are accumulated we will get a more accurate value of the “normal distribution”.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">Although it is still not clear how one can decelerate his “epigenetic clock”, lifestyle changes recommended by most national medical associations are perhaps a starting point. An older “epigenetic age” is a “red flag” which hints that it is time to make some lifestyle changes.</div>
				<div name='subc' style="width: 70%;margin: 0 auto;">A “red flag” might prompt you to act on your lifestyle or consult your physician for a check up.</div>
			</div>
		</div>

		<div style="width: 100%;height: 1500px">
			<div style="width:100%;height: 70px;"></div>
			<div style="width: 100%;height: auto;">
				<div style="width: 70%;height: auto;margin: 0 auto;font-size: 40px;font-weight: bold;color: #00b0f0;">What can I do if my “epigenetic age” is older?</div>
			</div>
			<div style="width: 70%;margin: 0 auto;"></div>
			<div style="width: 100%;height: auto;font-size: 24px;">
				<div name='subc' style="width: 70%;margin: 0 auto;">“Epigenetics” is different from “genetics” in a substantial way that epigenetics is potentially reversible by dietary interventions and life style changes. So, it might be possible to reverse the “epigenetic clock”.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">Preliminary studies show that dietary changes can cause deceleration of epigenetic clock in certain people, however this is still an open question. ( https://www.ncbi.nlm.nih.gov/pubmed/30350398)</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">Lifestyle changes including exercise and dietary habits have been recommended by national medical associations for some time, however, we need more data about the most advisable changes and they should be personalized.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">A way for us to learn about advisable lifestyle changes is sharing our experiences with others and analyzing the impact of differences in lifestyle in a large population. This is now possible using sharing technologies such as Apps as well as artificial intelligence that could determine how different inputs such as “lifestyle” habits affect an outcome--the “epigenetic clock”.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">Our App links you to information on recommended lifestyle behaviors by important US national medical association as well as possible nutritional supplements such as SAMe, vitamin A, D and C.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">These links are updated regularly and we suggest that you keep updating by examining the links periodically. These recommendations are based on what “science” knows today, they are not perfect. With more data and more analysis science is improving.</div>
				<div name='subc' style="width: 70%;margin: 0 auto;">Our first report is based on the lifestyle data that you have entered which shows how far your lifestyle parameters deviate from consensus recommendations. You might decide to make changes based on this first report.</div>
			</div>
		</div>

		<div style="width: 100%;height: 1500px">
			<div style="width:100%;height: 120px ;"></div>
			<div style="width: 100%;height: auto;">
				<div style="width: 70%;height: auto;margin: 0 auto;font-size: 40px;font-weight: bold;color: #00b0f0;">A dynamic long-term partnership to achieve “healthy aging”</div>
			</div>
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-size: 24px;">
				<div name='subc' style="width: 70%;margin: 0 auto;">We suggest that you keep entering your life style data.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">You will update your life style data as regularly as you wish. You might update all questions, some or none. However, we believe that accurate reporting will allow us to provide you with a better analysis.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">Your data will be anonymized. Your data and data from many other anonymous users will be analyzed by artificial intelligence to develop a “model”, which measures the impact of life style changes on “epigenetic clock”.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">Once more data is accumulated, the “model” will examine your life style data and results of the test will be shared with you.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">We suggest that in 6 months or maximally a year you submit your saliva to a second test.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">We will analyze your “epigenetic age” and report on the progress and the lifestyle changes that you have made.</div>
				<div style="width: 70%;height: 20px;"></div>
				<div name='subc' style="width: 70%;margin: 0 auto;">Possible routes for change will be offered based on our “model” and your data.</div>
				<div name='subc' style="width: 70%;margin: 0 auto;">
					We hope that together we will be able to coevolve your well being and our “<i>epi</i>Aging” learning environment.
				</div>
			</div>
		</div>

		<div style="width: 100%;height: 50px;"></div>
		<div style="width: 100%;height: 1450px;">
			<div style="width: 100%;height: 300px;"></div>
			<div style="width: 70%;height: auto;margin:0 auto;text-align: center;">
				<div style="width: 100%;height: 40px;border-top: 1px solid #5b9bd5;">
					<div style="float: left;font-weight: bold;font-size: 18px;width: 50%;height: 40px;line-height: 40px;">Your chronological age</div>
					<div style="float: left;width: 50%;height: 40px;font-weight: bold;line-height: 40px;" id="chroage"></div>
				</div>
				<div style="background-color:#DEEBF7;width: 100%;height: 40px;;border-top: 1px solid #5b9bd5;;border-bottom: 1px solid #5b9bd5;">
					<div style="float: left;width: 50%;line-height: 40px;height: 40px;font-weight: bold;font-size: 18px;">Your biological age</div>
					<div style="float: left; line-height: 40px;width: 50%;height: 40px;color: red;font-weight: bold;" id="bioage"></div>
				</div>
			</div>
			<div style="width: 900px;height: 600px;position: relative;">
				<div style="width: 100%;height: 580px;">
					<div style="width: 5%;height: 100%;float: left;text-align: center;position: relative;left:120px;font-weight: bold;">
						<div style="position:relative;left:25px; ">
							<div style="-webkit-transform: rotate(-90deg);width: 12px;height: 250px;"></div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;">e&nbsp;(years)</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -13px;">g</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -13px;">A</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;height: 5px"></div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">l</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">a</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">c</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">i</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">g</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">o</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">l</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">o</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">i</div>
							<div style="-webkit-transform: rotate(-90deg);width: 12px;margin-top: -15px;">B</div>
						</div>
					</div>
					<div style="width: 100%;height: auto;position: relative;left:70px">
						<div style="width: 92%;height: 600px;float: left;margin: 0 auto;" id="report-1"></div>
					</div>
					<script>
						$(function() {
							require(
									[ 'echarts', 'echarts/chart/scatter' ],
									function(ec) {
										var data = "{\"uuid\" : \"${tid}\"}"
										// 基于准备好的dom，初始化echarts图表
										var chart = ec.init(document.getElementById('report-1'));
										$
												.ajax({
													type : "post",
													url : "report/getData.jhtml",
													dataType : "json",
													contentType : "application/json",
													data : data,
													success : function(data) {
														//x:自然年龄,y生物学年龄
														//console.info(data[0]);//自然年龄<生物学年龄
														//console.info(data[1]);//自然年龄>生物学年龄
														//console.info(data);
														//console.info(data[2]);
														var option = {
															tooltip : {
																trigger : 'axis',
																showDelay : 0,
																formatter : function(params) {
																	if (params.value.length > 1) {
																		return params.seriesName + ' :<br/>' + params.value[0] + 'age   ' + params.value[1] + ' Age ';
																	} else {
																		return params.seriesName + ' :<br/>' + params.name + ' : ' + params.value + ' Age';
																	}
																},
																axisPointer : {
																	show : true,
																	type : 'cross',
																	lineStyle : {
																		type : 'dashed',
																		width : 1
																	}
																}
															},
															legend : {
																data : [ 'Chronological Age<Biological Age', 'Chronological Age>Biological Age' ]
															},
															xAxis : [ {
																name : '',
																type : 'value',
																nameLocation : 'end',
																scale : true,
																axisLabel : {
																	formatter : '{value}'
																}
															} ],
															yAxis : [ {
																name : ' ',
																nameLocation : 'end',
																position : 'left',
																nameGap : 60,
																nameRotate : 90,
																type : 'value',
																scale : true,
																axisLabel : {
																	formatter : '{value}'
																}
															} ],
															series : [ {
																name : 'Chronological Age<Biological Age',
										type : 'scatter',
										 itemStyle : {  
				                                normal : {  
				                                    color:'red'
				                                }  
				                          },  
										data :data[0],
										markPoint : {
											itemStyle: {
				                                normal : {  
				                                    color:'blue'
				                                }  
				                          }, 
											data : [{name: 'Biological Age', value: data[2][3], xAxis: data[2][2], yAxis: data[2][3]} ] //x:自然年龄,y生物学年龄
										},
										markLine : {
											data : [ ]
										}
									},
									{
								name : 'Chronological Age>Biological Age',
																type : 'scatter',
																data : data[1],
																itemStyle : {
																	normal : {
																		color : 'green'
																	}
																},
																markPoint : {
																	data : [ {
																		itemStyle : {
																			normal : {
																				color : 'blue'
																			}
																		},
																		name : 'Biological Age',
																		value : data[2][3],
																		xAxis : data[2][2],
																		yAxis : data[2][3]
																	} ]
																},
																markLine : {
																	itemStyle : {
																		normal : {
																			color : 'black'
																		}
																	},
																	data : [ [ {
																		name : '标线1起点',
																		xAxis : 0,
																		yAxis : 21,
																		symbol : 'circle'
																	}, {
																		name : '标线1终点',
																		xAxis : 100,
																		yAxis : 100,
																		symbol : 'circle'
																	}, ], ],
																}
															} ]
														};

														// 为echarts对象加载数据 
														chart.setOption(option);
													}
												});

									});
						});
					</script>
				</div>
				<div style="width: 100%;height: 15px;"></div>
				<div style="width: 100%;height: 20px;text-align: center;position: relative;top:-25px;font-weight: bold;left: 80px;">Chronological Age&nbsp;(years)</div>
			</div>
		</div>

		<div style="width: 100%;height: 100px;"></div>
		<div style="width: 100%;height:auto;">
			<div style="width: 100%;height: auto;font-size: 40px;font-weight: bold;text-align: center;">Health & Lifestyle</div>
		</div>
		<div style="width: 100%;height: 100px;"></div>
		<script>
			$(function() {
				new Slider(".ex1");
			});
		</script>
		<div class="weight" style="width: 70%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Weight&nbsp;(kg)</div>
			<div style="width: 70%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<a href="https://www.cdc.gov/healthyweight/index.html">Source: Centers for Disease Control and Prevention</a>
			</div>

			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong>
				<p>If your BMI is less than 18.5, it falls within the underweight range.</p>
				<p>If your BMI is 18.5 to 24.9, it falls within the normal or healthy weight range.</p>
				<p>If your BMI is 25.0 to 29.9, it falls within the overweight range.</p>
				<p>If your BMI is 30.0 or higher, it falls within the obese range.</p>
			</div>
			<div style="width: 100%;height: 20px; "></div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div class="ex1SliderVal" style="font-size: 16px;font-family: arial;font-weight: bold; margin: 0 auto;">Please download App and fill in your data</div>
				<div style="width: 100%;height: auto;">
					<input style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)" class="ex1" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 2%;float: left;height: 100%;text-align: right;font-weight: bold;text-align: left;">0</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">44</div>
					<div style="width: 55%;float: left;height: 100%;text-align: right;font-weight: bold;">104</div>
				</div>
				<div class="ex1CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>

		<script>
			$(function() {
				new Slider(".ex2");
			});
		</script>
		<div class="height" style="width: 70%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Height&nbsp;(m)</div>
			<div style="width: 100%;height: 20px; "></div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div class="ex2SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">Please download App and fill in your data</div>
				<div style="width: 100%;height: auto;">
					<input class="ex2" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 2%;float: left;height: 100%;text-align: right;font-weight: bold;text-align: left;">0</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">1.48</div>
					<div style="width: 50%;float: left;height: 100%;text-align: right;font-weight: bold;">2.04</div>
				</div>
				<div class="ex2CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			</div>
		</div>

		<script>
			$(function() {
				new Slider(".ex3");
			});
		</script>
		<div style="width: 100%;height: 50px;"></div>
		<div class="MBI" style="width: 70%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">
				BMI {Body Mass Index = Weight (kg) / [Height (m)]<sup>2</sup>}
			</div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<a href="https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm">Source: National Heart, Lung, and Blood Institute</a>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong>
				<p>
					Underweight: BMI < 18.5 kg/m<sup>2</sup>
				</p>
				<p>
					Normal weight: BMI 18.5 – 25 kg/m<sup>2</sup>
				</p>
				<p>
					Overweight: BMI 25 – 30 kg/m<sup>2</sup>
				</p>
				<p>
					Obese: BMI > 30 kg/m<sup>2</sup>
				</p>
			</div>
			<div style="width: 100%;height: 20px; "></div>

			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div class="ex3SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">Please download App and fill in your data</div>
				<div style="width: 100%;height: auto;">
					<input class="ex3" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 25%,yellow 75%, red 100%)" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 5%;float: left;height: 100%;text-align: right;font-weight: bold;text-align: left;">0</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">18.5</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">25</div>
					<div style="width: 25%;float: left;height: 100%;font-weight: bold;text-align: right;">30</div>
					<div style="width: 25%;float: left;height: 100%;"></div>
				</div>
				<div class="ex3CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>


		<script>
			$(function() {
				new Slider(".ex4");
			});
		</script>
		<div class="heartrate" style="width: 70%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Heart rate (beats/min)</div>

			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<a href="https://www.heart.org/en/health-topics/high-blood-pressure/the-facts-about-high-blood-pressure/all-about-heart-rate-pulse">Source: American Heart Association</a>
			</div>

			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong> Your resting heart rate is the heart pumping the lowest amount of blood you need because you’re not exercising. If you’re sitting or lying and you’re calm, relaxed and aren’t ill, your heart rate is normally between 60 (beats per minute) and 100 (beats per minute).
			</div>
			<div style="width: 100%;height: 20px; "></div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div class="ex4SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">Please download App and fill in your data</div>
				<div style="width: 100%;height: auto;">
					<input class="ex4" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 90%,  red 100%)" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 5%;float: left;height: 100%;text-align: right;font-weight: bold;text-align: left;">0</div>
					<div style="width: 30%;float: left;height: 100%;text-align: right;font-weight: bold;">100</div>
					<div style="width: 40%;float: left;height: 100%;text-align: right;font-weight: bold;"></div>
					<div style="width: 30%;float: left;height: 100%;"></div>
				</div>
				<div class="ex4CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>

		<script>
			$(function() {
				new Slider(".ex5");
				new Slider(".ex6");
			});
		</script>
		<div class="food" style="width: 70%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: 60px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Blood pressure (mmHG)</div>

			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<a href="https://www.heart.org/en/health-topics/high-blood-pressure/understanding-blood-pressure-readings">Source: American Heart Association</a>
			</div>

			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong>Blood pressure numbers of less than 120/80 mm Hg are considered within the normal range.
			</div>
			<div style="width: 100%;height: 20px; "></div>
			<p style="font-weight: bold; font-size: 16px;">Systolic BP</p>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">

				<div class="ex5SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">Please download App and fill in your data</div>
				<div>
					<input class="ex5" style-gradient="-webkit-linear-gradient(left, #92D050 0%,#FFF000 25% ,#FFC000 50%,  red 100%)" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 5%;float: left;height: 100%;text-align: right;font-weight: bold;text-align: left;">0</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">120</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">140</div>
					<div style="width: 25%;float: left;height: 100%;font-weight: bold;text-align: right;">180</div>
					<div style="width: 20%;float: left;height: 100%;"></div>
				</div>
				<div class="ex5CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<p style="font-weight: bold; font-size: 16px">Diastolic BP</p>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div class="ex6SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">Please download App and fill in your data</div>
				<div style="width: 100%;height: auto;">
					<input class="ex6" style-gradient="-webkit-linear-gradient(left, #92D050 0%,#FFF000 25% ,#FFC000 50%,  red 100%)" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 5%;float: left;height: 100%;text-align: right;font-weight: bold;text-align: left;">0</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">80</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">90</div>
					<div style="width: 25%;float: left;height: 100%;font-weight: bold;text-align: right;">120</div>
					<div style="width: 20%;float: left;height: 100%;"></div>
				</div>
				<div class="ex6CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>

		<script>
			$(function() {
				new Slider(".ex7");
			});
		</script>
		<div style="width: 100%;height: 30px;"></div>
		<div class="heartrate" style="width: 70%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Cholesterol (mg/dL)</div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<a href="https://www.heart.org/en/health-topics/cholesterol/about-cholesterol/what-your-cholesterol-levels-mean">Source: American Heart Association</a>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong> All adults age 20 or older should have their cholesterol (and other risk factors) checked every four to six years.
			</div>
			<div style="width: 100%;height: 20px; "></div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div class="ex7SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">Please download App and fill in your data</div>
				<div style="width: 100%;height: auto;">
					<input class="ex7" style-gradient="-webkit-linear-gradient(left, #92D050 0%,#FFC000 50%,  red 100%)" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 5%;float: left;height: 100%;text-align: right;font-weight: bold;text-align: left;">0</div>
					<div style="width: 30%;float: left;height: 100%;text-align: right;font-weight: bold;">200</div>
					<div style="width: 40%;float: left;height: 100%;text-align: right;font-weight: bold;">240</div>
					<div style="width: 5%;float: left;height: 100%;"></div>
				</div>
				<div class="ex7CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>

		<script>
			$(function() {
				new Slider(".ex8");
			});
		</script>
		<div style="width: 100%;height: 20px"></div>
		<div class="vitaminA" style="width: 70%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Vitamin A</div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<a href="https://www.mayoclinic.org/drugs-supplements-vitamin-a/art-20365945">Source: Mayo Clinic</a>
			</div>

			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong> The recommended daily amount of vitamin A is 900 micrograms (mg) for adult men and 700 mg for adult women.
			</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="ex10SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">Please download App and fill in your data</div>
				<div>
					<input class="ex8" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 5%;float: left;height: 100%;text-align: left;font-weight: bold;">0</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">700</div>
					<div style="width: 10%;float: left;height: 100%;text-align: center;font-weight: bold;">900</div>
					<div style="width: 50%;float: left;height: 100%;text-align: right;font-weight: bold;">3000</div>
					<div style="width: 5%;float: left;height: 100%;"></div>
				</div>
				<div class="ex8CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>

		<script>
			$(function() {
				new Slider(".ex9");
			});
		</script>
		<div class="vitaminC" style="width: 70%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Vitamin C</div>

			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<a href="https://www.mayoclinic.org/drugs-supplements-vitamin-c/art-20363932">Source: Mayo Clinic</a>
			</div>

			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong> The recommended daily amount of vitamin C for adult men is 90 milligrams and for adult women is 75 milligrams.

			</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="ex9SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">Please download App and fill in your data</div>
				<div>
					<input class="ex9" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 5%;float: left;height: 100%;text-align: left;font-weight: bold;">0</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">75</div>
					<div style="width: 10%;float: left;height: 100%;text-align: center;font-weight: bold;">90</div>
					<div style="width: 50%;float: left;height: 100%;text-align: right;font-weight: bold;">2000</div>
					<div style="width: 5%;float: left;height: 100%;"></div>
				</div>
				<div class="ex9CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 10px;"></div>
		<script>
			$(function() {
				new Slider(".ex10");
			});
		</script>
		<div class="vitaminD" style="width: 70%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Vitamin D</div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<a href="https://www.mayoclinic.org/drugs-supplements-vitamin-d/art-20363792">Source: Mayo Clinic</a>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong> The recommended daily amount of vitamin D is 400 international units (IU) for children up to age 12 months, 600 IU for ages 1 to 70 years, and 800 IU for people over 70 years.
			</div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="ex10SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">Please download App and fill in your data</div>
				<div>
					<input class="ex10" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 5%;float: left;height: 100%;text-align: left;font-weight: bold;">0</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">600</div>
					<div style="width: 10%;float: left;height: 100%;text-align: center;font-weight: bold;">800</div>
					<div style="width: 50%;float: left;height: 100%;text-align: right;font-weight: bold;">4000</div>
					<div style="width: 5%;float: left;height: 100%;"></div>
				</div>
				<div class="ex10CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>

		<script>
			$(function() {
				new Slider(".ex11");
			});
		</script>
		<div class="food" style="width: 70%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: 50px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Food consumption (calories/day)</div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<a href="https://www.healthline.com/nutrition/how-many-calories-per-day#section5">Source: Healthline</a>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong>An average woman needs to eat about 2000 calories per day to maintain, and 1500 calories to lose one pound of weight per week. An average man needs 2500 calories to maintain, and 2000 to lose one pound of weight per week.
			</div>
			<div style="width: 100%;height: 20px; "></div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div class="ex11SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;"></div>
				<div>
					<input id="food" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)" class="ex11" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div style="width: 100%;height: 20px;">
					<div style="width: 5%;float: left;height: 100%;text-align: left;font-weight: bold;">0</div>
					<div style="width: 25%;float: left;height: 100%;text-align: right;font-weight: bold;">1600</div>
					<div style="width: 10%;float: left;height: 100%;text-align: center;font-weight: bold;">2000</div>
					<div style="width: 40%;float: left;height: 100%;text-align: right;font-weight: bold;">2400</div>
					<div style="width: 10%;float: left;height: 100%;text-align: right;font-weight: bold;">3000</div>
					<div style="width: 5%;float: left;height: 100%"></div>
				</div>
				<div class="ex11CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
		<div style="width: 100%;height: 50px;"></div>


		<div style="width: 100%;height: auto;">
			<div style="width:100%;height: auto;margin: 0 auto;font-size: 40px; text-align: center;">Pain</div>
			<div style="width: 100%;height: 20px;"></div>
			<script>
				$(function() {

					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('pain-report-1'));
						//初始化报表数据
						var uuid = "${tid}";
						var data = '{"type" :"Pain","number" : 1 ,"uuid":"' + uuid + '"}';
						$.ajax({
							type : "post",
							url : "Questionnaire/GetData.jhtml",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
								//$(".ex12").attr("data-slider-value",data[2]); 
								//console.info($(".ex12").attr("data-slider-value"));
								var slider = new Slider(".pain-ex1", {
									value : window.parseInt(data[2])
								});
								console.info(slider.option);
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
										name : 'pain status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});
					});
				});
			</script>
			<div class="ques1" style="width: 70%;height: auto;margin: 0 auto; background-color: #FFFFFF;border-radius: 10px;">
				<div style="width: 100%;height: auto;font-family: arial;font-size: 20px;line-height:66px;text-align:center; font-weight: 700;">What Does Your Pain Feel Like?</div>
				<div style="width: 96%;height: auto;margin:0 auto; color:#666666">Statement: Some of the following words below describe your present pain. Circle ONLY those words that best describe it. Leave out any category that is not suitable. Use only a single word in each appropriate category - the one that applies best.</div>
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 96%;height: auto;font-size: 16px;margin:0 auto; font-family: airal;font-weight: 600; color: #666666;">1.temporal?</div>
				<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;text-align: center;font-weight: bold;font-size: 30px;">Last input value</div>
					<div style="width: 100%;height: 20px;"></div>
					<div class="ex1SliderVal" style="font-size: 16px;font-family: arial;line-height: 40px; font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px"></div>
					<div style="width: 100%;height: 20px;">
						<div style="width: 14%;float: left;height: 100%;text-align: left;font-weight: bold;">none</div>
						<div style="width:  14%;float: left;height: 100%;text-align: left;font-weight: bold;">mild</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">discomforting</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">distressing</div>
						<div style="width:  15%;float: left;height: 100%;text-align: left;font-weight: bold;">horrible</div>
						<div style="width:  15%;float: left;height: 100%;text-align: left;font-weight: bold;">excruciating</div>
						<div style="width:  5%;float: left;height: 100%;text-align: left;font-weight: bold;">pounding</div>
					</div>
					<div style="width: 100%;height: 5px;"></div>
					<div>
						<input class="pain-ex1" type="text" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" data-slider-min="0" data-slider-max="6" data-slider-step="1" data-slider-value="0">
					</div>
					<div style="width: 100%;height: 20px;">
						<div style="width: 15.5%;float: left;height: 100%;text-align: left;font-weight: bold;">0</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">1</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">2</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">3</div>
						<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">4</div>
						<div style="width:  5%;float: left;height: 100%;text-align: left;font-weight: bold;">5</div>
						<div style="width:  11%;float: left;height: 100%;text-align: right;font-weight: bold;">6</div>
					</div>
					<div class="ex1CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					<div style="width: 100%;height: 20px;"></div>
				</div>
				<div style="width: 100%;height: auto;">
					<div style="margin: 0 auto;text-align: center;width: 95%;">
						<div><span style="color: #92D050;">none(level 0)</span>&nbsp; <span style="color: #92D050;">flickering(level 1)</span></div>
						<div><span style="color: #FFC000;">quivering (level 2)</span>&nbsp; <span style="color: #FFC000;">pulsing(level 3)</span>&nbsp;<span style="color: #FFC000;">throbbing(level 4) </div>
						<div></span>&nbsp; <span style="color: red;">beating(level 5)</span>&nbsp; <span style="color: red;">pounding(level 6)</span></div>
					</div>
					<div style="width: 100%;height: 20px;text-align: center;font-weight: bold;font-size: 30px;">Weekly data</div>
					<div>
						<div style="width: 800px;height: 400px" id='pain-report-1'></div>
					</div>
				</div>
			</div>
			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('pain-report-2'));
						//初始化报表数据
						var uuid = "${tid}";
						var data = '{"type" :"Pain","number" : 2 ,"uuid":"' + uuid + '"}';
						$.ajax({
							type : "post",
							url : "Questionnaire/GetData.jhtml",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
								var slider = new Slider(".pain-ex2", {
									value : window.parseInt(data[2])
								});
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
										name : 'pain status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});
					});
				});
			</script>
			<div class="ques2" style="width: 70%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
				<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">2.spatial</div>
				<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 20px;text-align: center;font-weight: bold;font-size: 30px;">Last input value</div>
					<div style="width: 100%;height: 20px;"></div>
					<div class="ex2SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px"></div>
						<div style="width: 100%;height: 20px;">
						<div style="width: 25%;float: left;height: 100%;text-align: left;font-weight: bold;">none</div>
						<div style="width:  15%;float: left;height: 100%;text-align: center;font-weight: bold;">jumping</div>
						<div style="width:  30%;float: left;height: 100%;text-align: right;font-weight: bold;">flashing</div>
						<div style="width:  30%;float: left;height: 100%;text-align: right;font-weight: bold;">shooting</div>
					</div>
					<div style="width: 100%;height: 5px;"></div>
					<div>
						<input class="pain-ex2" type="text" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
					</div>
					<div class="ex2SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px"></div>
						<div style="width: 100%;height: 20px;">
						<div style="width: 25%;float: left;height: 100%;text-align: left;font-weight: bold;">0</div>
						<div style="width:  15%;float: left;height: 100%;text-align: center;font-weight: bold;">1</div>
						<div style="width:  28%;float: left;height: 100%;text-align: right;font-weight: bold;">2</div>
						<div style="width:  32%;float: left;height: 100%;text-align: right;font-weight: bold;">3</div>
					</div>
					<div class="ex2CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					<div style="width: 100%;height: 20px;"></div>
				</div>
				<div style="width: 100%;height: auto;">
					<div style="margin: 0 auto;text-align: center;width: 95%;">
						<span style="color: #92D050;">none (0 level)</span>&nbsp; <span style="color: #92D050;">jumping(1 level)</span>&nbsp; <span style="color: #FFC000;">flashing(2 level)</span>&nbsp; <span style="color: #FFC000;">shooting(3 level)</span>&nbsp;
					</div>
					<div style="width: 100%;height: 20px;text-align: center;font-weight: bold;font-size: 30px;">Weekly data</div>
					<div style="width: 800;height: 350px;" id='pain-report-2'></div>
				</div>
			</div>


			<script>
				$(function() {
					require([ 'echarts', 'echarts/chart/line' ], function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var chart = ec.init(document.getElementById('pain-report-3'));
						//初始化报表数据
						var uuid = "${tid}";
						var data = '{"type" :"Pain","number" : 3 ,"uuid":"' + uuid + '"}';
						$.ajax({
							type : "post",
							url : "Questionnaire/GetData.jhtml",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
						 		new Slider(".pain-ex3", {value : window.parseInt(data[2])});
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
										name : 'pain status',
										type : 'line',
										data : data[0],
									}, ]
								};
								// 为echarts对象加载数据 
								chart.setOption(option);
							}
						});
					});
				});
			</script>
				<div class="ques3" style="width: 70%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;font-weight: 600;padding: 10px;">3.punctate pressure</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;text-align: center;font-weight: bold;font-size: 30px;">Last input value</div>
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex3SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;"></div>
						<div style="width: 100%;height: 20px;">
							<div style="width: 16%;float: left;height: 100%;text-align: left;font-weight: bold;">none</div>
							<div style="width:  20%;float: left;height: 100%;text-align: left;font-weight: bold;">pricking</div>
							<div style="width:  20%;float: left;height: 100%;text-align: left;font-weight: bold;">boring</div>
							<div style="width:  17%;float: left;height: 100%;text-align: left;font-weight: bold;">drilling</div>
							<div style="width:  15%;float: left;height: 100%;text-align: left;font-weight: bold;">stabbing</div>
							<div style="width:  10%;float: left;height: 100%;text-align: left;font-weight: bold;">lancinating</div>
						</div>
						<div style="width: 100%;height: 5px;"></div>
						<div>
							<input class="pain-ex3"    style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"    type="text"  data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
						</div>
						<div style="width: 100%;height: 20px;">
							<div style="width: 19%;float: left;height: 100%;text-align: left;font-weight: bold;">0</div>
							<div style="width:  20%;float: left;height: 100%;text-align: left;font-weight: bold;">1</div>
							<div style="width:  20%;float: left;height: 100%;text-align: left;font-weight: bold;">2</div>
							<div style="width:  20%;float: left;height: 100%;text-align: left;font-weight: bold;">3</div>
							<div style="width:  18%;float: left;height: 100%;text-align: left;font-weight: bold;">4</div>
							<div style="width:  3%;float: left;height: 100%;text-align: right;font-weight: bold;">5</div>
						</div>
						<div class="ex3CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
					<div style="margin: 0 auto;text-align: center;width: 95%;">
						<div><span style="color: #92D050;">none(level 0)</span>&nbsp; <span style="color: #92D050;">pricking(1 level)</span></div>
						<div><span style="color: #FFC000;">boring(2 level)</span>&nbsp; <span style="color: #FFC000;">drilling(3 level)</span>&nbsp;<span style="color: #FFC000;">throbbing(level 4) </div>
						<div></span>&nbsp; <span style="color: red;">stabbing(4 level)</span>&nbsp; <span style="color: red;">lancinating(5 level)</span></div>
					</div>
					<div style="width: 100%;height: 20px;text-align: center;font-weight: bold;font-size: 30px;">Weekly data</div>
					<div>
						<div style="width: 800px;height: 350px;" id='pain-report-3'></div>
					</div>
				</div>
				
				<script>
					$(function() {
						require([ 'echarts', 'echarts/chart/line' ], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var chart = ec.init(document.getElementById('pain-report-4'));
							//初始化报表数据
							//初始化报表数据
							var uuid = "${tid}";
							var data = '{"type" :"Pain","number" : 4 ,"uuid":"' + uuid + '"}';
							$.ajax({
								type : "post",
								url : "Questionnaire/GetData.jhtml",
								data : data,
								dataType : "json",
								contentType : "application/json",
								success : function(data) {
									var slider = new Slider(".pain-ex4", {value : window.parseInt(data[2])});
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
											name : 'pain status',
											type : 'line',
											data : data[0],
										}, ]
									};
									// 为echarts对象加载数据 
									chart.setOption(option);
								}
							});
						});
					});
				</script>
				<div class="ques4" style="width: 70%;height: auto;margin: 0 auto; background-color: #FFFFFF;font-weight: 600;">
					<div style="width: 100%;height: auto;font-size: 16px; font-family: airal;color: #666666;padding: 10px;">4.incisive pressure</div>
					<div class="scroll-bar" style="width: 96%;height: auto;margin: 0 auto;">
						<div style="width: 100%;height: 20px;text-align: center;font-weight: bold;font-size: 30px;">Last input value</div>
						<div style="width: 100%;height: 20px;"></div>
						<div class="ex4SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;color: #C1272D;line-height: 40px;"></div>
							<div style="width: 100%;height: 20px;">
							<div style="width: 30%;float: left;height: 100%;text-align: left;font-weight: bold;">none</div>
							<div style="width:  32%;float: left;height: 100%;text-align: left;font-weight: bold;">sharp</div>
							<div style="width:  28%;float: left;height: 100%;text-align: left;font-weight: bold;">cutting</div>
							<div style="width:  10%;float: left;height: 100%;text-align: right;font-weight: bold;">lacerating</div>
						</div>
						<div>
							<input class="pain-ex4"    style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFC000 60%,  red 100%)"   type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
						</div>
						<div style="width: 100%;height: 20px;">
							<div style="width: 32%;float: left;height: 100%;text-align: left;font-weight: bold;">0</div>
							<div style="width:  33%;float: left;height: 100%;text-align: left;font-weight: bold;">1</div>
							<div style="width:  25%;float: left;height: 100%;text-align: left;font-weight: bold;">2</div>
							<div style="width:  10%;float: left;height: 100%;text-align: right;font-weight: bold;">3</div>
						</div>
						<div class="ex4CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
					</div>
						<div style="margin: 0 auto;text-align: center;width: 95%;">
						<div><span style="color: #92D050;">none(level 0)</span>&nbsp; <span style="color: #92D050;">sharp(1 level)</span></div>
						<div><span style="color: #FFC000;">cutting(2 level)</span>&nbsp; <span style="color: red;">lacerating(3 level)</span> </div>
					</div>
					<div style="width: 100%;height: 20px;text-align: center;font-weight: bold;font-size: 30px;">Weekly data</div>
					<div style="width:800px;height: 350px;" id='pain-report-4'></div>
				</div>

				
				
				
				
				
				
				
				
				




		</div>

	</div>
</html>
