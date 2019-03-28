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
                    $(".lifestyle-food-val").text(slideEvt.value+" calories");
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
                        },
                        error : function(jqXHR) {
                            console.info(jqXHR);
                        }
                    });
                });
            });
        });
	</script>

	<div class="food" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Food consumption (calories/day)</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.healthline.com/nutrition/how-many-calories-per-day#section5">Source: Healthline</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong>An average woman needs to eat about 2000 calories per day to maintain, and 1500 calories to lose one pound of weight per week. An average man needs 2500 calories to maintain, and 2000 to lose one pound of weight per week.
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-food-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
			<div>
				<input id="food" class="lifestyle-food-bar" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="10000" data-slider-step="1" data-slider-value="0" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)">
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Weight(kg)</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.cdc.gov/healthyweight/index.html">Source: Centers for Disease Control and Prevention</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong>
			<p>If your BMI is less than 18.5, it falls within the underweight range.</p>
			<p>If your BMI is 18.5 to 24.9, it falls within the normal or Healthy Weight range.</p>
			<p>If your BMI is 25.0 to 29.9, it falls within the overweight range.</p>
			<p>If your BMI is 30.0 or higher, it falls within the obese range.</p>
		</div>
		<div style="width: 100%;height: 20px; "></div>

		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-weigth-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
			<div>
				<input class="lifestyle-weight-bar" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)" type="text" data-slider-min="20" data-slider-max="150" data-slider-step="1" data-slider-value="20">
			</div>
			<div class="ex11CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div class="height" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Height(cm)</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-heigth-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
			<div>
				<input class="lifestyle-height-bar" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)" type="text" data-slider-min="50" data-slider-max="250" data-slider-step="50" data-slider-value="50">
			</div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>

	<div class="mbi" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
		<div style="width: 100%;height: 30px;"></div>
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">BMI {Body Mass Index = Weight (kg) / [Height (m)]<sup>2</sup>}</div>

		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm">Source: National Heart, Lung, and Blood Institute</a>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong>
			<p>Underweight: BMI < 18.5 kg/m<sup>2</sup></p>
			<p>Normal weight: BMI 18.5 – 25 kg/m<sup>2</sup></p>
			<p>Overweight: BMI 25 – 30 kg/m<sup>2</sup></p>
			<p>Obese: BMI > 30 kg/m<sup>2</sup></p>
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
                                            name:"beat",
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Heart rate (beats/min)</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.heart.org/en/health-topics/high-blood-pressure/the-facts-about-high-blood-pressure/all-about-heart-rate-pulse">Source: American Heart Association</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong> Your resting heart rate is the heart pumping the lowest amount of blood you need because you’re not exercising. If you’re sitting or lying and you’re calm, relaxed and aren’t ill, your heart rate is normally between 60 (beats per minute) and 100 (beats per minute).
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-heartrate-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
			<div>
				<input class="lifestyle-heartrate-bar"   style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)"   type="text" data-slider-min="40" data-slider-max="180" data-slider-step="1" data-slider-value="40">
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Blood pressure (mmHG)</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.heart.org/en/health-topics/high-blood-pressure/understanding-blood-pressure-readings">Source: American Heart Association</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong>Blood pressure numbers of less than 120/80 mm Hg are considered within the normal range.
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<p style="font-weight: bold; font-size: 16px;">Systolic BP</p>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-systolic-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
			<div>
				<input class="lifestyle-systolic-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"     type="text" data-slider-min="60" data-slider-max="180" data-slider-step="1" data-slider-value="60">
			</div>
			<div style="width: 100%;height: 350px;" id='lifestyle-systolic-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<p style="font-weight: bold; font-size: 16px">Diastolic BP</p>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-diastolic-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
			<div>
				<input class="lifestyle-diastolic-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="60" data-slider-max="130" data-slider-step="1" data-slider-value="60">
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
                                            name:"mmol/L",
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Cholesterol (mmol/L)</div>

		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.heart.org/en/health-topics/cholesterol/about-cholesterol/what-your-cholesterol-levels-mean">Source: American Heart Association</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong> All adults age 20 or older should have their cholesterol (and other risk factors) checked every four to six years.
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-cholesterol-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;"></div>
			<div>
				<input class="lifestyle-cholesterol-bar"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)" type="text" data-slider-min="100" data-slider-max="300" data-slider-step="1" data-slider-value="0">
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
                    $(".lifestyle-meditation-value").text(value+"h");
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
                                    console.info(data);
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Meditation</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.mayoclinic.org/tests-procedures/meditation/in-depth/meditation/art-20045858">Source: Mayo Clinic</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong> All adults age 20 or older should have their cholesterol (and other risk factors) checked every four to six years.
		</div>
		<div style="width: 100%;height: 20px; "></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div class="lifestyle-meditation-value" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0h</div>
			<div>
				<input class="lifestyle-meditation-bar"   style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="0" data-slider-max="24" data-slider-step="1" data-slider-value="0">
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
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"min",
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
                    $(".liftstyle-vascular-val").text(value+"min");
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
                                            name:"min",
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Cardio Vascular Health</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.heart.org/en/healthy-living/fitness/fitness-basics/aha-recs-for-physical-activity-in-adults">Source: American Heart Association Recommendations for Physical Activity in Adults</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong>Get at least 150 minutes per week of moderate-intensity aerobic activity or 75 minutes per week of vigorous aerobic activity, or a combination of both, preferably spread throughout the week
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="liftstyle-vascular-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0min</div>
			<div>
				<input class="liftstyle-vascular-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="240" data-slider-step="1" data-slider-value="0">
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
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"min",
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
                    $(".liftstyle-sleep-val").text(value+"min");
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
                                            name:"min",
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Sleep</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.sleepfoundation.org/">Source: National Sleep Foundation</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong>NATIONAL SLEEP FOUNDATION recommonds 7-9 hours for 18-64 years, and doesn't recommend less than 6 and more than 11 hours for 8-25 years and less than 6 and more than 10 hours for 26-64 years.
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-sleep-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0h</div>
			<div>
				<input class="lifestyle-sleep-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
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
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"min",
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
                var slider = new Slider(".lifestyle-activesex-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-activesex-val").text(value+" times");
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
                                            name:"times",
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
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"min",
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
                var slider = new Slider(".lifestyle-hsexlife-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-hsexlife-val").text("level "+value);
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
                                    noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
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
                                            name:"times",
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Sex Life</div>
		<div style="width: 100%;height: 20px;"></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: 20px;text-align: center;">Years of active sex life</div>
			<div class="lifestyle-activesex-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0 times</div>
			<div><input class="lifestyle-activesex-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%,  #92D050 100%)" type="text" data-slider-min="0" data-slider-max="60" data-slider-step="1" data-slider-value="0"></div>
			<div class="ex4CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-activesex-report'></div>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: 20px;text-align: center;">How is your sex life</div>
			<div class="lifestyle-hsexlife-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">level 1</div>
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
                        noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                        var option = {
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"gram",
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
                var slider = new Slider(".lifestyle-alcohol-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-alcohol-val").text(value+"gram");
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
                                            name:"gram",
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Alcohol</div>

		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.cancer.org/"> Source: American Cancer Society </a>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong>Drink no more than 1 drink per day for women or 2 per day for men.
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-alcohol-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0gram</div>
			<div>
				<input class="lifestyle-alcohol-bar"  style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)"  type="text" data-slider-min="0" data-slider-max="50" data-slider-step="1" data-slider-value="0">
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
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"gram",
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
                var slider = new Slider(".lifestyle-smoking-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-smoking-val").text(value+"stick");
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
                                            name:"stick",
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Smoking</div>

		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong>Stop Smoking
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-smoking-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0stick</div>
			<div>
				<input class="lifestyle-smoking-bar" style-gradient="-webkit-linear-gradient(left, #92D050 0%, #FFFF00 30%,#FFC000 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="30" data-slider-step="1" data-slider-value="0">
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
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"gram",
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
                var slider = new Slider(".lifestyle-vitamind-bar");
                //拖动发送
                slider.on("slide", function(slideEvt) {
                    var value=slideEvt.value;
                    $(".lifestyle-vitamind-val").text(value+"IU");
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
                                            name:"IU",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'vitamind status',
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Vitamin D</div>

		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.mayoclinic.org/drugs-supplements-vitamin-d/art-20363792">Source: Mayo Clinic</a>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong> The recommended daily amount of vitamin D is 400 international units (IU) for children up to age 12 months, 600 IU for ages 1 to 70 years, and 800 IU for people over 70 years.

		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-vitamind-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0IU</div>
			<div>
				<input class="lifestyle-vitamind-bar"  style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="6000" data-slider-step="1" data-slider-value="0">
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
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name:"date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name:"gram",
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
                    $(".lifestyle-vitaminc-val").text(value+"mg");
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
                                            data : [ 'vitaminc status' ]
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
                                            name : 'vitaminc status',
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Vitamin C</div>

		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.mayoclinic.org/drugs-supplements-vitamin-c/art-20363932">Source: Mayo Clinic</a>
		</div>

		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong> The recommended daily amount of vitamin C for adult men is 90 milligrams and for adult women is 75 milligrams.
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-vitaminc-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0mg</div>
			<div>
				<input class="lifestyle-vitaminc-bar"   style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 70%, red 100%)"  type="text" data-slider-min="0" data-slider-max="5000" data-slider-step="1" data-slider-value="0">
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
                        var option = {
                            noDataLoadingOption: { text: 'You have not filled  the data yet \n Please fill in the data in app \n in order to give you a more \n accurate biological age report', effect: 'whirling', effectOption: { effect: { n: 0 } } },
                            xAxis : [ {
                                name : "date",
                                type : 'category',
                                boundaryGap : false,
                                data : data[0]
                            } ],
                            yAxis : [ {
                                name : "mg/day",
                                type : 'value',
                                axisLabel : {
                                    formatter : '{value} '
                                }
                            } ],
                            series : [ {
                                name : 'vitamina status',
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
                    $(".lifestyle-vitamina-val").text(value + "mg");
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
                                            data : [ 'vitamina status' ]
                                        },
                                        calculable : true,
                                        xAxis : [ {
                                            name : "date",
                                            type : 'category',
                                            boundaryGap : false,
                                            data : data[0]
                                        } ],
                                        yAxis : [ {
                                            name : "mg/day",
                                            type : 'value',
                                            axisLabel : {
                                                formatter : '{value} '
                                            }
                                        } ],
                                        series : [ {
                                            name : 'vitamina status',
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
		<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Vitamin A</div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<a href="https://www.mayoclinic.org/drugs-supplements-vitamin-a/art-20365945">Source: Mayo Clinic</a>
		</div>
		<div style="width: 100%;height: 20px;"></div>
		<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
			<strong> Recommendation: </strong> The recommended daily amount of vitamin A is 900 micrograms (mcg) for adult men and 700 mcg for adult women.
		</div>
		<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
			<div style="width: 100%;height: 20px;"></div>
			<div class="lifestyle-vitamina-val" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0mg</div>
			<div>
				<input class="lifestyle-vitamina-bar" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 70%, red 100%)" type="text" data-slider-min="0" data-slider-max="5000" data-slider-step="1" data-slider-value="0">
			</div>
			<div class="ex10CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
			<div style="width: 100%;height: 350px;" id='lifestyle-vitamina-report'></div>
			<div style="width: 100%;height: 20px;"></div>
		</div>
	</div>
	<div style="width: 100%;height: 60px;"></div>
	<div id="all-right" style="width: 100%;height: auto;font-family: arial;">
		<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;">@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved</div>
	</div>
</div>
</body>
</html>
