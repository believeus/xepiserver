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
<base href="<%=basePath%>">

<title>bioagereport</title>

</head>
<body style="padding: 0px;margin: 0px;background-color: #ffffff;">
	<jsp:include page="header.jsp"></jsp:include>
	<div style="width: 100%;height: auto;">
		<div style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 150px;"></div>
			<div style="width: 100%;height: auto;">
				<div style="width: 90%;height: auto;margin:0 auto;text-align: center;">
					<div style="width: 100%;height: 40px;border-top: 1px solid #5b9bd5;">
						<div style="float: left;font-weight: bold;font-size: 18px;width: 50%;height: 40px;line-height: 40px;">Your chronological age</div>
						<div style="float: left;width: 50%;height: 40px;font-weight: bold;line-height: 40px;" id="chroage"></div>
					</div>
					<div style="background-color:#DEEBF7;width: 100%;height: 40px;;border-top: 1px solid #5b9bd5;;border-bottom: 1px solid #5b9bd5;">
						<div style="float: left;width: 50%;line-height: 40px;height: 40px;font-weight: bold;font-size: 18px;">Your biological age</div>
						<div style="float: left; line-height: 40px;width: 50%;height: 40px;color: red;font-weight: bold;" id="bioage"></div>
					</div>
				</div>
				<div style="width: 100%;height: 20px;"></div>
				<div style="width: 90%;height: 600px;position: relative;">
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
							<div style="width: 92%;height: 600px;float: left;margin: 0 auto;" id="biological-age-report"></div>
						</div>
						<script>
							$(function() {
								//CN180000000003
								var data = "{\"uuid\" : \"HKEPI201937192024320\"}"
								$.ajax({
									type : "post",
									url : "http://192.168.1.117:8080/report/getDataForOne.jhtml",
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
						<script>
							$(function() {
								require(
										[ 'echarts', 'echarts/chart/scatter' ],
										function(ec) {
											var data = "{\"uuid\" : \"HKEPI201937192024320\"}"
											// 基于准备好的dom，初始化echarts图表
											var chart = ec.init(document.getElementById('biological-age-report'));
											$
													.ajax({
														type : "post",
														url : "http://192.168.1.117:8080/report/getData.jhtml",
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
		</div>
	</div>
</body>
</html>
