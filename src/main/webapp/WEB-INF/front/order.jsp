<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title></title>
	</head>
	<script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>
	<link type="text/css" rel="stylesheet" href="static/css/base.css" />
	<link type="text/css" rel="stylesheet" href="static/css/module.css" />


	<body style="padding: 0px;margin: 0px;">
		<div style="width:100%;height:auto;border:1px solid #000">
		<jsp:include page="header.jsp"></jsp:include>
			<h1 style="text-align: center;height: 100px;line-height: 100px;font-size: 40px;background-color: #0068B7;color: #ffffff;">Order information</h1>

			<div style="clear: both;" />

			<!--订单单号 以及创建信息-->
			<div style="width:100%;height:200px;background-color: #70CFFA;">
				<div style="width:18%;height: 100%;float: left;text-align: center;margin-left: 10%;padding:12px 0 ">
					<img src="img/Order/order_icon.png" style="width:150px;height: 165px;" />
				</div>
				<div style="width:63%;height: 100%;float: left;font-size: 34px;margin-left:20px;font-weight: 800;color:#F2F2F2">
					<div style="width:100%;height: 16%;margin-top: 20px;">
						<div id="Mess left" style="width: 40%;height: 100%;float: left;"> ORDER NO. :</div>
						<div id="Mess right" style="width:60%;height: 100%;float: right;">
							201903111354
						</div>
					</div>

					<div style="width:100%;height: 16%;margin-top: 20px;">
						<div id="Mess left" style="width: 40%;height: 100%;float: left;">ORDER DATE :</div>
						<div id="Mess right" style="width:60%;height: 100%;float: right;">
							2019-05-07 19:33
						</div>
					</div>

					<div style="width:100%;height: 16%;margin-top: 20px;">
						<div id="Mess left" style="width: 40%;height: 100%;float: left;">REMARKS :</div>
						<div id="Mess right" style="width:60%;height: 100%;float: right;font-size:30px">
							Send as soon as possible

						</div>
					</div>

				</div>
			</div>

			<div style="width: 100%;height: 20px;background-color: #E5E5E5;"></div>
			
			<!--订单商品信息-->
			<div style="width: 100%;height: 40px;background-color: #ffffff;"></div>
			<div style="width:100%;height:240px;border:1px solid #000;display: flex;background-color: #ffffff;">
				<div style="width:10%;height: 100%;;border:1px solid #000;"></div>
				<div style="width:90%;height: 100%;border:1px solid #000;border-radius: 15px;">
					<ul>
						<li>
							<div style="height: 220px;padding: 16px 15px;">
								<div style="width: 27%;height: 90%;border: 1px solid #000;float: left;">
									<a href="#">
										<img src='"+ res.CartList[i].wares_img +"'></a>
								</div>
								<div style="width: 70%;height: 90%;border: 1px solid #000;float: right;">
									<div style="width: 100%;height: 70%;border: 1px solid #000;font-size: 32px;">
										<div style="width: 100%;height: 60%;border: 1px solid #000;  word-break:break-all;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;overflow:hidden;">
											Biological age detection2.0 Biological age detection2.0Biological age detectio
										</div>
										<div style="width: 100%;height: 30%;border: 1px solid #000;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
											Saliva DNA Collection Kit
										</div>

									</div>
									<div style="width: 100%;height: 30%;border: 1px solid #000;font-size: 36px;">
										<span style="float: left;margin-left: 20px;">$ 785.00</span>
										<span style="float: right;margin-right: 20px;">Total: 0 piece</span>
									</div>
								</div>
							</div>
						</li>
						<!-- 						<li>
							<input type="button" value="-">
							<span>0</span>piece
							<input type="button" value="+">
							Unit price：<span>$68</span>
							Subtotal：<span>$136/span>
						</li> -->
					</ul>

				</div>
				<div style="width:10%;height: 100%;border:1px solid #000"></div>
			</div>

			<div style="width: 100%;height: 40px;background-color: #ffffff;"></div>


			<div style="width: 100%;height: 20px;background-color: #E5E5E5;"></div>

			<div style="width: 100%;height: auto;background-color: #ffffff;border: 1px solid #000">
				<div style="width:100%;height:auto;border:1px solid #000;display: flex;margin-top: 20px;margin-bottom:20px">
					<div style="width:5%;height: 100%;;border:1px solid #000;"></div>
					<div style="width:90%;height: 100%;border:1px solid #000;border-radius: 17px;background-color: #ffffff;z-index: 20;">
						<!--信息填写栏目-->
						<div style="width:100%;height:85px;border:1px solid #000;display: flex;line-height: 85px;;align-items: center;">
							<img src="img/Order/user_icon.png" style="width:60px;height: 55px;margin-left:3%;align-items: center;">
							<div style="width: 70%;height: 100%;font-size: 40px;margin-left: 35px;font-weight: 800;">Confirm contact information</div>
						</div>

						<div style="width: 100%;height:80px;border-bottom:1px solid #808080;margin-top:20px;">
							<div style="width:27%;height: 100%;border:1px solid #000;float:left;text-align: center;font-size: 40px;line-height: 80px;">Addressee:</div>
							<div style="width:70%;height: 100%;border:1px solid #000;float:right;font-size: 40px;line-height: 80px;">
								Eestill
							</div>
						</div>

						<div style="width: 100%;height:80px;border-bottom:1px solid #808080;margin-top:20px;">
							<div style="width:27%;height: 100%;border:1px solid #000;float:left;text-align: center;font-size: 40px;line-height: 80px;">Contact information:</div>
							<div style="width:70%;height: 100%;border:1px solid #000;float:right;font-size: 40px;line-height: 80px;">
								13213212231
							</div>
						</div>

						<div style="clear: both;"></div>

						<div style="width: 100%;border-bottom:1px solid #808080;margin-top:20px;">
							<div style="width:27%;height: 80px;border:1px solid #000;float:left;text-align: center;font-size: 40px;line-height: 80px;">
								Receiving address:</div>
							<div style="width:70%;height: auto;border:1px solid #000;float:right;font-size: 40px;margin-bottom: 20px;">
								US MA Cambridge 3922 Fannie Street US MA Cambridge 3922 Fannie Street US MA Cambridge 3922 Fannie Street
							</div>
						</div>

					</div>
					<div style="width:5%;height: 100%;border:1px solid #000"></div>
				</div>
			</div>

			<div style=" position:fixed; left:0px; bottom:0px; width:100%; height:100px; border:1px solid #000; z-index:9999;">

				<div style="width:75%;height: 100%;background-color: #0068B7;float: left;font-size: 48px;color: #F2F2F2;line-height: 100px;text-align: center;">
					Altogether：$<strong>0</strong>
				</div>
				<div style="width:25%;height: 100%;background-color: #FF6900;float: right;font-size: 48px;color: #F2F2F2;line-height: 100px;text-align: center;">
					ToPay
				</div>
			</div>
			<div style="width: 100%;height: 60px;"></div>
				<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
					<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;">
						@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
					</div>
				</div>
		</div>
	</body>
</html>
