<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yaa
  Date: 2019/3/21
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!-- saved from url=(0065)http://www.17sucai.com/preview/1149930/2018-04-11/login/demo.html -->
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="format-detection" content="telephone=no">
	<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<title>Order</title>

	<script type="text/javascript" src="static/js/jquery-2.1.1.min.js"></script>

	<link type="text/css" rel="stylesheet" href="static/css/base.css" />
	<link type="text/css" rel="stylesheet" href="static/css/module.css" />

</head>



<body>
<!--头部开始-->
<jsp:include page="header.jsp"></jsp:include>
<div  style="width: 100%;height: auto;">
	<div id="popDiv"
		 style="z-index: 99; display: none;width: 100%;height: 100%; position: absolute;top:0;left: 0; background-color: #efefef;text-align: center;">
		<img src="static/images/loading.gif" style="width: 80px;height: 80px;margin-top: 50%"/>
	</div>

	<div style="background-color:#ffffff;padding-bottom: 70px">
<c:forEach var="item" items="${sessionScope.Cart.list}">
		<div style="width: 100%;height: 10px;"></div>
		<div style="width:100%;height:auto;">
			<div style='width:100%;display: flex;flex-direction: row;justify-content: center;'>
				<div style="width: 90%">
					<div style="width:40%;height:auto;float: left;text-align: center">
						<image src='${item.wares_img}' style="width:70%;height:auto"></image>
					</div>
					<div style="float: left;width: 15%;height: 100%;">
					</div>
					<div style="float: left;width: 40%;height: 100%;">
						<div style="width:100%;height:10%"></div>
						<div style="width:100%;height:30%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${item.wares_name}</div>
						<div style="width:100%;height:15%"></div>
						<div class="shop-price" style="width:100%;height:40%;;text-align: center">
							<div class="shop-pices" style="float:left;width: 40%;height: 100%">$<b class="price">${item.sell_price}</b>
							</div>
							<div class="shop-arithmetic" style="float: right;width: 60%;height: 100%;text-align: center">
								X ${item.wares_count}
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 100%;height: 10px;border-bottom:1px solid #e2e2e2;"></div>
		</div>
</c:forEach>

		<div style="width: 100%;height: 10px;"></div>

		<div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>

		<div style="width:100%;display:flex;flex-direction: row;justify-content: center;">
			<div class='part1' style='width:90%'>
				<div style='height:15px'></div>
				<div>
					<text>recipient</text>
					<text style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' >${sessionScope.ORDER.addr.recipient}</text>
				</div>
				<div style='height:20px;border-bottom:1px solid #e2e2e2;'>
				</div>
				<div style='height:15px'></div>
				<div>
					<text>phone</text>
					<text style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' >${sessionScope.ORDER.addr.phone}</text>
				</div>
				<div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>
				<div style='height:15px'></div>
				<div>
					<text>country</text>
					<text style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' >${sessionScope.ORDER.addr.country}</text>
				</div>
				<div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>
				<div style='height:15px'></div>
				<div>
					<text>address</text>
					<text style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' >${sessionScope.ORDER.addr.address}</text>
				</div>
				<div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>
				<div style='height:15px'></div>
				<div>
					<text>postalcode</text>
					<text style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' >${sessionScope.ORDER.addr.postalcode}</text>
				</div>
				<div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>

			</div>
		</div>

		<div class='br'></div>

		<div style="width:100%;display:flex;flex-direction: row;justify-content: center;">
			<div class='part1' style='width:90%'>
				<div style='height:20px'></div>
				<div class='context'>
					Promo Code
					<text style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' >${sessionScope.ORDER.promo_code}</text>
				</div>
				<div style='height:20px'></div>
			</div>
		</div>

		<div class='br'></div>


		<div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>
	</div>

	<div
			style="clear:both;overflow:hidden;width:100%;height:9%;position:fixed;bottom:0;border-top:1px solid #e0e0e0;background:#fff;">
		<div style="text-align: center;height: 100%;background-color: #37475d;width: 60%;color: #f4f6f8;float: left;">
			<div style="height: 100%;font-size: 21px;line-height: 40px">
				<div class="shop-total">
					<strong>About：<i class="total" id="AllTotal" name="total_price">${sessionScope.Cart.total_price}</i></strong>
				</div></div>
		</div>
		<div style="width: 40%;background-color: #0071b1;height: 100%;text-align: center;color: #f4f6f8;float:right;">
			<div style="height:100%;font-size: 21px;line-height: 40px" onclick="ToPay()">To Pay</div>
		</div>
	</div>

</div>
</body>

</html>


<script>
    function bodyScroll(event){
        event.preventDefault();
    }

    function ToPay(){
		var pop = document.getElementById("popDiv");
        document.body.addEventListener('touchmove',bodyScroll,false);
        $('body').css({'position':'fixed',"width":"100%"});
		pop.style.display = "block";

        window.location.href = 'paypal/payment.jhtml';
        // $.ajax({
        //     header:{"Access-Control-Allow-Origin":"https://localhost:8080"},
        //     type : "post",
        //     url : "http://localhost:8080/paypal/payment.jhtml",
        //     success: function (data) {
        //        // window.location.href = 'paypal/payment.jhtml';
        //     },
        //     error: function () {
        //         alert("生成支付订单失败！")
        //     }
        // })
    }
</script>