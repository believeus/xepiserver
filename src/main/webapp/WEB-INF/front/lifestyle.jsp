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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<title>Life Style Questionnaire</title>
</head>
<body style="padding: 0;margin: 0;">
	<div id="container" style="width: 100%;height: auto;background-color: #EDEDED;">
		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex1");
				slider
						.on(
								"slide",
								function(slideEvt) {
									var value = "0 ";
									switch (slideEvt.value) {
									case 0:
										value = "< 1000 calorie/day";
		break;
		case 1:
			value="2000 calorie/day";
		break;
		case 2:
			value="2500 calorie/day";
		break;
		case 3:
			value="3000 calorie/day";
		break;
		case 4:
			value="> 4000 calorie/day";
										break;

									}
									$(".ex1SliderVal").text(value);
								});
			});
		</script>
	<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex2");
				slider
						.on(
								"slide",
								function(slideEvt) {
									var value = "0 ";
									switch (slideEvt.value) {
									case 0:
										value = "< 1000 calorie/day";
		break;
		case 1:
			value="1600 calorie/day";
		break;
		case 2:
			value="2000 calorie/day";
		break;
		case 3:
			value="2400 calorie/day";
		break;
		case 4:
			value="> 2400 calorie/day";
										break;

									}
									$(".ex2SliderVal").text(value);
								});
			});
		</script> 


		<div class="food" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">

			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Food consumption (calorie/day)</div>

			<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
				<a href="https://www.healthline.com/nutrition/how-many-calories-per-day#section5">Source: Healthline</a>
			</div>

			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong>An average woman needs to eat about 2000 calories per day to maintain, and 1500 calories to lose one pound of weight per week. An average man needs 2500 calories to maintain, and 2000 to lose one pound of weight per week.
			</div>
			<div style="width: 100%;height: 20px; "></div>
			<p style="font-weight: bold; font-size: 16px;">Male</p>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">

				<div class="ex1SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input id="food" class="ex1" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="3"  style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)">
				</div>
				<div class="ex1CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<p style="font-weight: bold; font-size: 16px">Female</p>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">

				<div class="ex2SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex2" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0"    style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)">
				</div>
				<div class="ex2CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>

		</div>
		<div style="width: 100%;height: 40px;"></div>




		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex11");
				slider
						.on(
								"slide",
								function(slideEvt) {
									var value = "0 ";
									switch (slideEvt.value) {
									case 0:
										value = "< 44 kg";
		break;
		case 1:
			value="44-50 kg";
		break;
		case 2:
			value="51-80 kg";
		break;
		case 3:
			value="81-104 kg";
		break;
		case 4:
			value="> 104 kg";
										break;

									}
									$(".ex11SliderVal").text(value);
								});
			});
		</script>
		<div class="weight" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Weight</div>

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
				<div class="ex11SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex11" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0" style-gradient="-webkit-linear-gradient(left, red 0%, #92D050 30%,#92D050 70%, red 100%)">
				</div>
				<div class="ex11CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>

		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex12");
				slider
						.on(
								"slide",
								function(slideEvt) {
									var value = "0 ";
									switch (slideEvt.value) {
									case 0:
										value = "< 1.48 m";
		break;
		case 1:
			value="1.48-1.60 m";
		break;
		case 2:
			value="1.61-1.70 m";
		break;
		case 3:
			value="1.71-2.04 m";
		break;
		case 4:
			value="> 2.04 m";
										break;

									}
									$(".ex12SliderVal").text(value);
								});
			});
		</script>
		<div class="height" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Height</div>

			<div style="width: 100%;height: 20px; "></div>

			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div class="ex12SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex12" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex12CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>

		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex13");
				slider
						.on(
								"slide",
								function(slideEvt) {
									var value = "0 ";
									switch (slideEvt.value) {
									case 0:
										value = "< 18.5 kg/m2";
		break;
		case 1:
			value="18.5 – 25 kg/m2";
		break;
		case 2:
			value="25 – 30 kg/m2";
		break;
		case 3:
			value="> 30 kg/m2";
										break;

									}
									$(".ex13SliderVal").text(value);
								});
			});
		</script>
		<div class="MBI" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">BMI {Body Mass Index = Weight (kg) / [Height (m)]2}</div>

			<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
				<a href="https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm">Source: National Heart, Lung, and Blood Institute</a>
			</div>

			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong>
				<p>Underweight: BMI < 18.5 kg/m2</p>
				<p>Normal weight: BMI 18.5 – 25 kg/m2</p>
				<p>Overweight: BMI 25 – 30 kg/m2</p>
				<p>Obese: BMI > 30 kg/m2</p>
			</div>
			<div style="width: 100%;height: 20px; "></div>

			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div class="ex13SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex13" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex13CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>

		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex14");
				slider
						.on(
								"slide",
								function(slideEvt) {
									var value = "0 ";
									switch (slideEvt.value) {
									case 0:
										value = "< 60  beats/min";
		break;
		case 1:
			value="60-80 beats/min";
		break;
		case 2:
			value="81-100 beats/min";
		break;
		case 3:
			value="100-120 beats/min";
		break;
		case 4:
			value="> 120 beats/min";
										break;
									}
									$(".ex14SliderVal").text(value);
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
				<div class="ex14SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex14" style="background: -webkit-linear-gradient(left, #92D050, #FFC000, red);	background: -moz-linear-gradient(left, #92D050, #FFC000, red);background: -ms-linear-gradient(left, #92D050, #FFC000, red);background: -o-linear-gradient(left, #92D050, #FFC000, red);background: linear-gradient(left, #92D050, #FFC000, red);" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex14CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>

		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex15");
				slider
						.on(
								"slide",
								function(slideEvt) {
									var value = "0 ";
									switch (slideEvt.value) {
									case 0:
										value = "< 60 mmHG";
		break;
		case 1:
			value="60-120 mmHG";
		break;
		case 2:
			value="120-140 mmHG";
		break;
		case 3:
			value="140-180 mmHG";
		break;
		case 4:
			value="> 180 mmHG";
										break;
									}
									$(".ex15SliderVal").text(value);
								});
			});
		</script>
		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex16");
				slider
						.on(
								"slide",
								function(slideEvt) {
									var value = "0 ";
									switch (slideEvt.value) {
									case 0:
										value = "< 80 mmHG";
		break;
		case 1:
			value="81-100 mmHG";
		break;
		case 2:
			value="101-120 mmHG";
		break;
		case 3:
			value="121-140 mmHG";
		break;
		case 4:
			value="> 140 mmHG";
										break;
									}
									$(".ex16SliderVal").text(value);
								});
			});
		</script>
		<div class="food" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
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

				<div class="ex15SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex15" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex15CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<p style="font-weight: bold; font-size: 16px">Diastolic BP</p>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">

				<div class="ex16SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex16" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex16CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>

		</div>
		<div style="width: 100%;height: 40px;"></div>



		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex17");
				slider
						.on(
								"slide",
								function(slideEvt) {
									var value = "0 ";
									switch (slideEvt.value) {
									case 0:
										value = "< 60 mg/dL";
		break;
		case 1:
			value="61-150 mg/dL";
		break;
		case 2:
			value="151-200 mg/dL";
		break;
		case 3:
			value="201-240 mg/dL";
		break;
		case 4:
			value="> 240 mg/dL";
										break;
									}
									$(".ex17SliderVal").text(value);
								});
			});
		</script>
		<div class="heartrate" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Cholesterol (mg/dL)</div>

			<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
				<a href="https://www.heart.org/en/health-topics/cholesterol/about-cholesterol/what-your-cholesterol-levels-mean">Source: American Heart Association</a>
			</div>

			<div style="width: 100%;height: 20px;"></div>
			<div style="width: 100%;height: auto;font-size: 12px; font-family: airal;color: #666666;">
				<strong> Recommendation: </strong> All adults age 20 or older should have their cholesterol (and other risk factors) checked every four to six years.
			</div>
			<div style="width: 100%;height: 20px; "></div>

			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div class="ex17SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex17" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex17CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>

		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex18");
				slider
						.on(
								"slide",
								function(slideEvt) {
									var value = "0 ";
									switch (slideEvt.value) {
									case 0:
										value = "< 60 mg/dL";
		break;
		case 1:
			value="61-150 mg/dL";
		break;
		case 2:
			value="151-200 mg/dL";
		break;
		case 3:
			value="201-240 mg/dL";
		break;
		case 4:
			value="> 240 mg/dL";
										break;
									}
									$(".ex18SliderVal").text(value);
								});
			});
		</script>
		<div class="heartrate" style="width: 96%;margin: 0 auto;height: auto;background-color: #FFFFFF;">
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
				<div class="ex18SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex18" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex18CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>




		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex3");
				slider.on("slide", function(slideEvt) {
					var value = "0 ";
					switch (slideEvt.value) {
					case 0:
						value = "10 minutes per day";
						break;
					case 1:
						value = "20 minutes per day";
						break;
					case 2:
						value = "30 minutes per day";
						break;
					case 3:
						value = "40 minutes per day";
						break;
					case 4:
						value = "60 minutes per day";
						break;
					case 5:
						value = "more than 60 minutes per day";
						break;
					}
					$(".ex3SliderVal").text(value);
				});
			});
		</script>
		<div class="cardio" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
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
				<div class="ex3SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex3" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex3CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>
		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex23");
				slider.on("slide", function(slideEvt) {
					var value = "0 ";
					switch (slideEvt.value) {
					case 0:
						value = "4 hours per day";
						break;
					case 1:
						value = "6 hours per day";
						break;
					case 2:
						value = "8 hours per day";
						break;
					case 3:
						value = "10 hours per day";
						break;
					case 4:
						value = "12 hours per day";
						break;
					case 5:
						value = "more than 12 hours per day";
						break;
					}
					$(".ex23SliderVal").text(value);
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
				<div class="ex23SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex23" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex23CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>

		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex4");
				slider.on("slide", function(slideEvt) {
					var value = "0 ";
					switch (slideEvt.value) {
					case 0:
						value = "0 times";
						break;
					case 1:
						break;
					value = "1-10 times";
				case 2:
					value = "11-20 times";
					break;
				case 3:
					value = "21-30 times";
					break;
				case 4:
					value = "31-40 times";
					break;
				case 5:
					value = "41-50 times";
					break;
				case 6:
					value = "6 days a week";
					break;
				case 7:
					value = "everyday";
				}
				$(".ex4SliderVal").text(value);
			}	);
			});
		</script>
		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex5");
				slider.on("slide", function(slideEvt) {
					var value = "0 ";
					switch (slideEvt.value) {
					case 0:
						value = "0";
						break;
					case 1:
						value = "1";
						break;
					case 2:
						value = "2";
						break;
					case 3:
						value = "3";
						break;
					case 4:
						value = "4";
						break;
					case 5:
						value = "5";
						break;
					}
					$(".ex5SliderVal").text(value);
				});
			});
		</script>
		<div class="sexlife" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
			<div style="width: 100%;height: 30px;"></div>
			<div style="width: 100%;height: auto;font-weight: 700;color: #666666; font-size: 18px;font-family: arial; ">Sex Life</div>

			<div style="width: 100%;height: 20px;"></div>

			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="ex4SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex4" type="text" data-slider-min="0" data-slider-max="7" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex4CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;text-align: center;">Years of active sex life</div>
			</div>
			<div style="width: 100%;height: 20px;"></div>
			<div class="scroll-bar" style="width: 90%;height: auto;margin: 0 auto;">
				<div style="width: 100%;height: 20px;"></div>
				<div class="ex5SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex5" type="text" data-slider-min="0" data-slider-max="5" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex5CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;text-align: center;">How is your sex life</div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>
		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex6");
				slider.on("slide", function(slideEvt) {
					var value = "0 ";
					switch (slideEvt.value) {
					case 0:
						value = "Non drinker";
						break;
					case 1:
						value = "Light <1 year";
						break;
					case 2:
						value = "Moderate(1-2) years";
						break;
					case 3:
						value = "Heavy (3-4) years";
						break;
					case 4:
						value = "Very Heavy 5+ years";
						break;

					}
					$(".ex6SliderVal").text(value);
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
				<div class="ex6SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex6" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex6CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>
		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex7");
				slider.on("slide", function(slideEvt) {
					var value = "0 ";
					switch (slideEvt.value) {
					case 0:
						value = "Non smoker";
						break;
					case 1:
						value = "Light smoker (1-7) years";
						break;
					case 2:
						value = "Moderate smoker (8-14) years";
						break;
					case 3:
						value = "Heavy smoker (5-24) years";
						break;
					case 4:
						value = "Very Heavy smoker (25+) years";
						break;

					}
					$(".ex7SliderVal").text(value);
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
				<div class="ex7SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex7" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex7CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>
		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex8");
				slider.on("slide", function(slideEvt) {
					var value = "0 ";
					switch (slideEvt.value) {
					case 0:
						value = "100 international units (IU)";
						break;
					case 1:
						value = "200 international units (IU)";
						break;
					case 2:
						value = "300 international units (IU)";
						break;
					case 3:
						value = "400 international units (IU)";
						break;
					case 4:
						value = "500 international units (IU)";
						break;
					case 5:
						value = "600 international units (IU)";
						break;
					case 6:
						value = "700 international units (IU)";
						break;
					}
					$(".ex8SliderVal").text(value);
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
				<div class="ex8SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex8" type="text" data-slider-min="0" data-slider-max="4" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex8CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;"></div>
		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex9");
				slider.on("slide", function(slideEvt) {
					var value = "0 ";
					switch (slideEvt.value) {
					case 0:
						value = "less than 50 mg";
						break;
					case 1:
						value = "51-70 mg";
						break;
					case 2:
						value = "71-90 mg";
						break;
					case 3:
						value = "more than 90 mg";
						break;

					}
					$(".ex9SliderVal").text(value);
				});
			});
		</script>
		<div class="vitaminC" style="width: 96%;height: auto;margin: 0 auto; background-color: #FFFFFF;">
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
				<div class="ex9SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex9" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex9CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
				<div style="width: 100%;height: 20px;"></div>
			</div>

		</div>
		<div style="width: 100%;height: 40px;"></div>
		<script>
			$(function() {
				// Without JQuery
				var slider = new Slider(".ex10");
				slider.on("slide", function(slideEvt) {
					var value = "0 ";
					switch (slideEvt.value) {
					case 0:
						value = "less than 500 mcg";
						break;
					case 1:
						value = "501-700 mcg";
						break;
					case 2:
						value = "701-900 mcg";
						break;
					case 3:
						value = "more than 900 mcg";
						break;

					}
					$(".ex10SliderVal").text(value);
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
				<div class="ex10SliderVal" style="font-size: 16px;font-family: arial;font-weight: 700; margin: 0 auto;">0</div>
				<div>
					<input class="ex10" type="text" data-slider-min="0" data-slider-max="3" data-slider-step="1" data-slider-value="0">
				</div>
				<div class="ex10CurrentSliderValLabel" style="font-size: 16px;font-family: arial;"></div>
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
