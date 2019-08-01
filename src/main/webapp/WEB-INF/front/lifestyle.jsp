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
	<meta charset="UTF-8">

	<link rel="stylesheet" href="static/css/stylesheet.css" />
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
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

	<title>Life Style Questionnaire</title>
</head>
<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: auto;background-color: #EDEDED;">
	<jsp:include page="header.jsp" />
	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-food-report'));
                //初始化报表数据
                var data = '{"column": "Food","type" : "lunch" ,"uuid":"HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name : "date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name : "calories",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value}'
                                }
                            } ],
                            series : [ {
                                name : 'calories status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });

                var slider = new Slider(".lifestyle-food-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    $(".lifestyle-food-val").text(slideEvt.value+" calories/day");
                    var data = '{ "column":"Food","type" :"lunch" ,"value1" :" ' + slideEvt.value + '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var idata = '{"column": "Food","type": "lunch","uuid": "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : idata,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    var option = {
                                        legend : {
                                            data : [ 'calories status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name : "date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name : "calories/day",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value}'
                                            }
                                        } ],
                                        series : [ {
                                            name : 'calories status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>

	<div class="food" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;clear: both;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">食物摄入(卡路里/天)</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.healthline.com/nutrition/how-many-calories-per-day#section5">来源: Healthline</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong>建议: 平均来说，女性每天需要摄入大约2000卡路里的热量来维持体重，每周减掉一磅体重需要摄入1500卡路里。一个普通的男性需要2500卡路里来维持，而每周减掉一磅体重需要2000卡路里
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-food-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 calories/day</div>
			<div>
				<input id="food" class="lifestyle-food-bar" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="4000" data-slider-step="1" data-slider-value="0" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)">
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-food-report'></div>
		</div>
	</div>
	<script>
        $(function() {
            //拖动变化bmi的值
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-bmi-report'));
                //初始化报表数据

                var data = '{"column" : "Body","uuid" : "HKEPI201937192024320"}';
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name : "date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name : "bmi",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value}'
                                }
                            } ],
                            series : [ {
                                name : 'bmi status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });

                //$(".lifestyle-heigth-val");
                var _weightSlider = new Slider(".lifestyle-weight-bar");
                //拖动发送

                _weightSlider.on("slide", function(slideEvt) {
                    $(".lifestyle-weigth-val").text(slideEvt.value);
                    var _wValue = $(".lifestyle-weigth-val").text();
                    var _hValue = $(".lifestyle-heigth-val").text();
                    console.info("_weightSlider_wValue" + _wValue + "  _hValue" + _hValue);

                    if (_wValue == "0" || _hValue == "0") {
                        return;
                    }
                    //var data = '{ "column":"Body" ,"value1" :" ' + slideEvt.value + '","uuid" :"HKEPI201937192024320"}';
                    var data = '{"column": "Body","value1": "' + _wValue + '","value2" : "' + _hValue + '","uuid" : "HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            //console.info("_heightSlider---_hValue-->"+_hValue+"--_wValue--->"+_wValue);
                            //再次查询
                            //var idata = '{"column": "Body","value1": "' + _wValue + '","value2" : "'+_hValue+'","uuid" : "HKEPI201937192024320"}'

                            var _sdata = '{"column" : "Body","uuid" : "HKEPI201937192024320"}';
                            console.info("_weightSlider---->" + _sdata);
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _sdata,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    var option = {
                                        legend : {
                                            data : [ 'bmi status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name : "date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name : "BMI",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value}'
                                            }
                                        } ],
                                        series : [ {
                                            name : 'BMI status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });

                //拖动
                var _heightSlider = new Slider(".lifestyle-height-bar");
                //拖动发送
                _heightSlider.on("slide", function(slideEvt) {
                    $(".lifestyle-heigth-val").text(slideEvt.value);
                    var _wValue = $(".lifestyle-weigth-val").text();
                    var _hValue = $(".lifestyle-heigth-val").text();
                    console.info("_heightSlider_wValue" + _wValue + "  _hValue" + _hValue);
                    if (_wValue == "0" || _hValue == "0") {
                        return;
                    }
                    var data = '{"column": "Body","value1": "' + _wValue + '","value2" : "' + _hValue + '","uuid" : "HKEPI201937192024320"}';
                    console.info("_heightSlider--->" + data);
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            //console.info("_heightSlider---_hValue-->"+_hValue+"--_wValue--->"+_wValue);
                            //再次查询
                            //var idata = '{"column": "Body","value1": "' + _wValue + '","value2" : "'+_hValue+'","uuid" : "HKEPI201937192024320"}'
                            var _sdata = '{"column" : "Body","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _sdata,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    var option = {
                                        noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                        legend : {
                                            data : [ 'bmi status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name : "date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name : "BMI",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value}'
                                            }
                                        } ],
                                        series : [ {
                                            name : 'BMI status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });

            });
        });
	</script>
	<div class="weight" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">体重 & 身高</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.cdc.gov/healthyweight/index.html">来源: Centers for Disease Control and Prevention</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong>建议: </strong>
			<div>体重过轻: BMI 2</div>
			<div>正常体重: BMI 18.5 – 25 kg/m2</div>
			<div>超重: BMI 25 – 30 kg/m2</div>
			<div>肥胖: BMI > 30 kg/m2</div>
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">体重(kg)</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-weigth-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 kg</div>
			<div>
				<input class="lifestyle-weight-bar" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 20%,#92D050 80%, red 100%)" type="text" data-slider-min="20" data-slider-max="150" data-slider-step="1" data-slider-value="20">
			</div>
			<div class="ex11CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div class="height" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">身高(cm)</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-heigth-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 cm</div>
			<div>
				<input class="lifestyle-height-bar" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 20%,#92D050 80%, red 100%)" type="text" data-slider-min="50" data-slider-max="306" data-slider-step="1" data-slider-value="50">
			</div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>

	<div class="mbi" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">身体质量指数 ( BMI ): {身体质量指数 = 体重(kg) / [身高(m)]<sup>2</sup>}</div>

		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm">来源: National Heart, Lung, and Blood Institute</a>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong>
			<div>体重过轻: BMI 2<sup>2</sup></div>
			<div>正常体重: BMI 18.5 – 25 kg/m<sup>2</sup></div>
			<div>超重: BMI 25 – 30 kg/m<sup>2</sup></div>
			<div>肥胖: BMI > 30 kg/m<sup>2</sup></div>
		</div>
		<div style="width: 100%;height: 350px;" id='lifestyle-bmi-report'></div>
	</div>
	<div style="width: 100%;height: 10px;"></div>
	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-heartrate-report'));
                //初始化报表数据
                var data = '{"column" : "HeartRate","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"beats/min",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'beats status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });

                var slider = new Slider(".lifestyle-heartrate-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
					$(".lifestyle-heartrate-val").text(value+"beats/minutes");
                    var data = '{ "column":"HeartRate","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "HeartRate","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    var option = {
                                        legend : {
                                            data : [ 'beats status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"beats/minutes",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'beats status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });

                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>
	<div class="heartrate" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">心率(beats/min)</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.heart.org/en/health-topics/high-blood-pressure/the-facts-about-high-blood-pressure/all-about-heart-rate-pulse">来源: American Heart Association</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong>你的静息心率是心脏泵送你所需要的最低量的血液，因为你没有运动。如果你坐着或躺着，你很平静，放松并且没有生病，你的心率通常在60（每分钟心跳）到100（每分钟心跳）之间。
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-heartrate-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 beats/minutes</div>
			<div>
				<input class="lifestyle-heartrate-bar"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #92D050 18%,#FFC000 70%, red 100%)"   type="text" data-slider-min="40" data-slider-max="300" data-slider-step="1" data-slider-value="40">
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-heartrate-report'></div>
		</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>
	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-systolic-report'));
                //初始化报表数据
                var data = '{"column" : "BP","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"mmHg",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'BP status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });

                var slider = new Slider(".lifestyle-systolic-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    var data = '{ "column":"BP","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            $(".lifestyle-systolic-val").text(value);
                            var _data = '{"column" : "BP","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    var option = {
                                        legend : {
                                            data : [ 'Systolic BP status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"mmHg",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'Systolic BP status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });

                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });


            });
        });
	</script>
	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-diastolic-report'));
                //初始化报表数据
                var data = '{"column" : "BP","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"mmHg",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'BP status',
                                type : 'line',
                                data : data[2],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });

                var slider = new Slider(".lifestyle-diastolic-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    var data = '{ "column":"BP","value2" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            $(".lifestyle-diastolic-val").text(value);
                            var _data = '{"column" : "BP","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    var option = {
                                        legend : {
                                            data : [ 'Diastolic BP status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"mmHg",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'Diastolic BP status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });

                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>

	<div class="Systolic" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">血压(mmHG)</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.heart.org/en/health-topics/high-blood-pressure/understanding-blood-pressure-readings">来源: American Heart Association</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong血压低于120/80毫米汞柱被认为是在正常范围内。
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<div style="font-weight: bold; font-size: 16px;">收缩压</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-systolic-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
			<div>
				<input class="lifestyle-systolic-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"     type="text" data-slider-min="60" data-slider-max="270" data-slider-step="1" data-slider-value="60">
			</div>
			<div style="width: 100%;height: 350px;" id='lifestyle-systolic-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="font-weight: bold; font-size: 16px">舒张压</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-diastolic-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
			<div>
				<input class="lifestyle-diastolic-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="60" data-slider-max="180" data-slider-step="1" data-slider-value="60">
			</div>
			<div class="ex16CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-diastolic-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>
	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-cholesterol-report'));
                //初始化报表数据
                var data = '{"column" : "Cholesterol","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"mg/dl",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'Cholesterol status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".lifestyle-cholesterol-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
					$(".lifestyle-cholesterol-val").text(value+"mg/dL");
                    var data = '{ "column":"Cholesterol","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "Cholesterol","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    var option = {
                                        legend : {
                                            data : [ 'Cholesterol status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"mg/dL",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'Cholesterol status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });

                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });


            });
        });
	</script>
	<div class="cholesterol" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">胆固醇 (mg/dL)</div>

		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.heart.org/en/health-topics/cholesterol/about-cholesterol/what-your-cholesterol-levels-mean">来源: American Heart Association</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong> 所有20岁或20岁以上的成年人应每四到六年检查一次胆固醇（和其他危险因素）。
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-cholesterol-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 mg/dL</div>
			<div>
				<input class="lifestyle-cholesterol-bar"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #92D050 30%,#FFC000 70%, red 100%)" type="text" data-slider-min="100" data-slider-max="360" data-slider-step="1" data-slider-value="0">
			</div>
			<div class="ex17CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-cholesterol-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>

	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-meditation-report'));
                //初始化报表数据
                var data = '{"column" : "Meditation","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"mg/dl",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'Cholesterol status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".lifestyle-meditation-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-meditation-value").text(value+"h/day");
                    var data = '{ "column":"Meditation","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "Meditation","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    var option = {
                                        legend : {
                                            data : [ 'meditation status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"hours",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'meditation status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>
	<div class="Meditation" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">冥想</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.mayoclinic.org/tests-procedures/meditation/in-depth/meditation/art-20045858">来源: Mayo Clinic</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong> 冥想可以提供许多好处，例如帮助集中注意力，放松，内心平静，减轻压力和疲劳。
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-meditation-value" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 h/day</div>
			<div>
				<input class="lifestyle-meditation-bar"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #92D050 30%,#92D050 70%, #92D050 100%)"  type="text" data-slider-min="0" data-slider-max="24" data-slider-step="0.5" data-slider-value="0">
			</div>
			<div class="ex18CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-meditation-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>


	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-vascular-report'));
                //初始化报表数据
                var data = '{"column" : "Sport","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"minutes/week",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'Sport status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".liftstyle-vascular-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".liftstyle-vascular-val").text(value+"minutes/week");
                    var data = '{ "column":"Sport","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "Sport","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    console.info(data);
                                    var option = {
                                        legend : {
                                            data : [ 'sport status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"minutes/week",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'sport status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>
	<div class="Vascular" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">心血管健康</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.heart.org/en/healthy-living/fitness/fitness-basics/aha-recs-for-physical-activity-in-adults">来源: American Heart Association Recommendations for Physical Activity in Adults</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong>每周至少进行150分钟的中等强度有氧运动或每周75分钟的剧烈有氧运动，或两者结合，最好在一周内进行。
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="liftstyle-vascular-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 minutes/week</div>
			<div>
				<input class="liftstyle-vascular-bar"  style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#FFC000 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="200" data-slider-step="1" data-slider-value="0">
			</div>
			<div style="width: 100%;height: 350px;" id='lifestyle-vascular-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>



	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-sleep-report'));
                //初始化报表数据
                var data = '{"column" : "Sleep","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"hours",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'sleep status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".lifestyle-sleep-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".liftstyle-sleep-val").text(value+"hours/day");
                    var data = '{ "column":"Sleep","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "Sleep","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    console.info(data);
                                    var option = {
                                        legend : {
                                            data : [ 'sleep status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"hours",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'sleep status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>
	<div class="sleep" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">睡眠</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.sleepfoundation.org/">来源: National Sleep Foundation</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong>国家睡眠基金会建议在18-64年内7-9小时，不建议在6岁和11小时以上的8到25岁，不到6岁和10小时以上的26-64岁。
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-sleep-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 hours/day</div>
			<div>
				<input class="lifestyle-sleep-bar"  style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 20%, #92D050 40%,red 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="24" data-slider-step="1" data-slider-value="0">
			</div>
			<div class="ex23CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-sleep-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>

	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-activesex-report'));
                //初始化报表数据
                var data = '{"column" : "SexLife","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
							xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"years",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'SexLife status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".lifestyle-activesex-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-activesex-val").text(value+" years");
                    var data = '{ "column":"SexLife","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "SexLife","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    console.info(data);
                                    var option = {
                                        legend : {
                                            data : [ 'SexLife status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"years",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'SexLife status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>

	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-hsexlife-report'));
                //初始化报表数据
                var data = '{"column" : "SexLife","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"level",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'SexLife status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".lifestyle-hsexlife-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    switch (value) {
						case 1:
							$(".lifestyle-hsexlife-val").text("不满意");
							break;
						case 2:
							$(".lifestyle-hsexlife-val").text("一般");
							break;
						case 3:
							$(".lifestyle-hsexlife-val").text("满意");
							break;
						case 4:
							$(".lifestyle-hsexlife-val").text("非常棒");
							break;
					}

                    var data = '{ "column":"SexLife","value2" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "SexLife","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    var option = {
                                        legend : {
                                            data : [ 'SexLife status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"level",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'SexLife status',
                                            type : 'line',
                                            data : data[2],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>
	<div class="sexlife" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">性生活</div>
		<div style="width: 100%;height: 20px;"></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: 20px;text-align: center;">每年定期的性生活次数</div>
			<div class="lifestyle-activesex-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 years</div>
			<div><input class="lifestyle-activesex-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%,  #92D050 100%)" type="text" data-slider-min="0" data-slider-max="60" data-slider-step="1" data-slider-value="0"></div>
			<div class="ex4CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-activesex-report'></div>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: 20px;text-align: center;">性生活指数评分</div>
			<div class="lifestyle-hsexlife-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">不满意</div>
			<div>
				<input class="lifestyle-hsexlife-bar" style-gradient="-webkit-linear-gradient(left, red 0%,  #FFFC00 50%,#92D050 100%)"   type="text" data-slider-min="1" data-slider-max="4" data-slider-step="1" data-slider-value="0">
			</div>
			<div class="ex5CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-hsexlife-report'></div>
		</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>

	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-alcohol-report'));
                //初始化报表数据
                var data = '{"column" : "Alcohol","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"gram/day",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'alcohol status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".lifestyle-alcohol-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-alcohol-val").text(value+"gram/day");
                    var data = '{ "column":"Alcohol","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "Alcohol","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    console.info(data);
                                    var option = {
                                        legend : {
                                            data : [ 'alcohol status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"gram/day",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'alcohol status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>
	<div class="alcohol" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">酒精</div>

		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.cancer.org/"> 来源: American Cancer Society </a>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong>女性每天不超过1杯，男性每天不超过2杯。
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-alcohol-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 gram/day</div>
			<div>
				<input class="lifestyle-alcohol-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="0">
			</div>
			<div class="ex6CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-alcohol-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>
	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-smoking-report'));
                //初始化报表数据
                var data = '{"column" : "Smoking","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"sticks/day",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'smoking status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".lifestyle-smoking-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-smoking-val").text(value+"stick/day");
                    var data = '{ "column":"Smoking","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "Smoking","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    console.info(data);
                                    var option = {
                                        legend : {
                                            data : [ 'smoking status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"sticks/day",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'smoking status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>
	<div class="smoking" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">吸烟</div>

		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong>戒烟
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-smoking-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 sticks/day</div>
			<div>
				<input class="lifestyle-smoking-bar" style-gradient="-webkit-linear-gradient(left, red 0%, red 30%,red 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="200" data-slider-step="1" data-slider-value="0">
			</div>
			<div class="ex7CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-smoking-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>

	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-vitamind-report'));
                //初始化报表数据
                var data = '{"column" : "Vitamin_D","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"IU/day",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'vitaminD status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".lifestyle-vitamind-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-vitamind-val").text(value+"IU/day");
                    var data = '{ "column":"Vitamin_D","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "Vitamin_D","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    console.info(data);
                                    var option = {
                                        noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                                        legend : {
                                            data : [ 'vitamind status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"IU/day",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'vitamin status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>
	<div class="vitaminD" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">维生素 D</div>

		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.mayoclinic.org/drugs-supplements-vitamin-d/art-20363792">来源: Mayo Clinic</a>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong>  建议12个月以下儿童每日摄入400国际单位（IU），1-70岁儿童每日摄入600国际单位，70岁以上儿童每日摄入800国际单位。

		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-vitamind-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 IU/day</div>
			<div>
				<input class="lifestyle-vitamind-bar"  style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 10%, #92D050 60%, red 100%)" type="text" data-slider-min="0" data-slider-max="6000" data-slider-step="1" data-slider-value="0">
			</div>
			<div class="ex8CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-vitamind-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div style="width: 100%;height: 10px;"></div>
	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-vitaminc-report'));
                //初始化报表数据
                var data = '{"column" : "Vitamin_C","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"mg/day",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'sleep status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".lifestyle-vitaminc-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-vitaminc-val").text(value+"mg/day");
                    var data = '{ "column":"Vitamin_C","value1" :" ' +value+ '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "Vitamin_C","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    console.info(data);
                                    var option = {
                                        legend : {
                                            data : [ 'vitaminC status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name:"date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name:"mg/day",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'vitaminC status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>
	<div class="vitaminc" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">维生素 C</div>

		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.mayoclinic.org/drugs-supplements-vitamin-c/art-20363932">来源: Mayo Clinic</a>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong> 建议成年男性每日摄入维生素C 90毫克，成年女性每日摄入维生素C 75毫克。
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-vitaminc-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 mg/day</div>
			<div>
				<input class="lifestyle-vitaminc-bar"   style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 5%, #92D050 65%, red 100%)"  type="text" data-slider-min="0" data-slider-max="3000" data-slider-step="1" data-slider-value="0">
			</div>
			<div class="ex9CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-vitaminc-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>

	</div>
	<div style="width: 100%;height: 10px;"></div>
	<script>
        $(function() {
            require([ 'echarts', 'echarts/chart/line' ], function(ec) {
                var chart = ec.init(document.getElementById('lifestyle-vitamina-report'));
                //初始化报表数据
                var data = '{"column" : "Vitamin_A","uuid" : "HKEPI201937192024320"}';
                //console.info(data);
                $.ajax({
                    type : "post",
                    url : "Life/getDataOfLife.jhtml",
                    data : data,
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data) {
						if (data==""){return;}
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name : "date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name : "mcg/day",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'vitaminA status',
                                type : 'line',
                                data : data[1],
                            }, ]
                        };
                        // 为echarts对象加载数据
                        chart.setOption(option);
                    }
                });
                var slider = new Slider(".lifestyle-vitamina-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value = slideEvt.value;
                    $(".lifestyle-vitamina-val").text(value + "mcg/day");
                    var data = '{ "column":"Vitamin_A","value1" :" ' + value + '","uuid" :"HKEPI201937192024320"}';
                    $.ajax({
                        type : "post",
                        url : "Life/InsertPartOfLife.jhtml",
                        dataType : "json",
                        contentType : "application/json",
                        data : data,
                        success : function(data) {
                            var _data = '{"column" : "Vitamin_A","uuid" : "HKEPI201937192024320"}';
                            $.ajax({
                                type : "post",
                                url : "Life/getDataOfLife.jhtml",
                                data : _data,
                                dataType : "json",
                                contentType : "application/json",
                                success : function(data) {
                                    console.info(data);
                                    var option = {
                                        legend : {
                                            data : [ 'vitaminA status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name : "date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name : "mcg/day",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'vitaminA status',
                                            type : 'line',
                                            data : data[1],
                                        }, ]
                                    };
                                    // 为echarts对象加载数据
                                    chart.setOption(option);
                                }
                            });
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>
	<div class="vitaminA" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">维生素 A</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.mayoclinic.org/drugs-supplements-vitamin-a/art-20365945">来源: Mayo Clinic</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> 建议: </strong>建议成年男性每天摄入900微克维生素A，成年女性每天摄入700微克维生素A。
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-vitamina-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 mcg/day</div>
			<div>
				<input class="lifestyle-vitamina-bar" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 13%, #92D050 58%, red 100%)" type="text" data-slider-min="0" data-slider-max="5000" data-slider-step="1" data-slider-value="0">
			</div>
			<div class="ex10CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-vitamina-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div style="width: 100%;height: 60px;"></div>
	<div id="all-right" style="width: 100%;height: auto;font-family: arial;">
		<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved</div>
	</div>
	<jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
