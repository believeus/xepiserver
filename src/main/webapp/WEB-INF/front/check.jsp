<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/18
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<!-- saved from url=(0065)http://www.17sucai.com/preview/1149930/2018-04-11/login/demo.html -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>购物车</title>

    <script type="text/javascript" src="static/js/jquery-2.1.1.min.js"></script>

    <link type="text/css" rel="stylesheet" href="static/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="static/css/module.css"/>

</head>


<body>

<!--头部开始-->
<div style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
    <form action="/user/transaction/loadOrder.jhtml" method="post">
        <div style="background-color:#ffffff;padding-bottom: 70px">

            <div style="width: 100%;height: 10px;"></div>
            <div style="width:100%;height:auto;">
                <c:forEach var="item" items="${sessionScope.Cart.waresBox}">
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
                                    <div class="shop-pices" style="float:left;width: 40%;height: 100%">$<b
                                            class="price">${item.sell_price}</b>
                                    </div>
                                    <div class="shop-arithmetic"
                                         style="float: right;width: 60%;height: 100%;text-align: center">
                                        X ${item.wares_count}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="width: 100%;height: 10px;border-bottom:1px solid #e2e2e2;"></div>
                </c:forEach>
            </div>

            <div style="width: 100%;height: 10px;"></div>

            <div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>

            <div style="width: 100%;height: 30px;border-bottom: 1px solid #f4f6f8;font-size: 22px;">
                <div style="margin-left: 18px;">Delivery Address</div>
            </div>

            <div style="width:100%;display:flex;flex-direction: row;justify-content: center;">
                <div class='part1' style='width:90%'>
                    <div style='height:15px'></div>
                    <div>
                        <text>Full name</text>
                        <input
                                style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                type="text" id="recipient" required="required" name="recipient"></input>
                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'>
                    </div>
                    <div style='height:15px'></div>
                    <div>
                        <text>Phone</text>
                        <input
                                style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                type="text" id="phone" required="required" name="phone"></input>
                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>

                    <div style='height:15px'></div>
                    <div>
                        <text>Town/City</text>
                        <input
                                style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                type="text" id="address" required="required" name="address"></input>
                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>
                    <div style='height:15px'></div>
                    <div>
                        <text>Country/Region</text>
                        <input
                                style='border:0.5px solid #e2e2e2;width:68%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                type="text" id="country" required="required" name="country"></input>
                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>
                    <div style='height:15px'></div>
                    <div>
                        <text>Postalcode/ZIP</text>
                        <input
                                style='border:0.5px solid #e2e2e2;width:68%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                type="text" id="postalcode"  name="postalcode"></input>
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
                        <input
                                style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                placeholder=" Promo Code" type="text" id="promo_code" name="promo_code"></input>
                    </div>
                    <div style='height:20px'></div>
                </div>
            </div>

            <div class='br'></div>

            <div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>
        </div>
        <div style="clear:both;overflow:hidden;width:100%;height:9%;position:fixed;bottom:0;border-top:1px solid #e0e0e0;background:#fff;">
            <div style="text-align: center;height: 100%;background-color: #37475d;width: 60%;color: #f4f6f8;float: left;">
                <div style="height: 100%;font-size: 21px;line-height: 40px">
                    <div class="shop-total">
                        <strong>Total：<i class="total" id="AllTotal"
                                         name="total_price">${sessionScope.Cart.total}</i></strong>
                    </div>
                </div>
            </div>
            <div style="width: 40%;background-color: #0071b1;height: 100%;text-align: center;color: #f4f6f8;float:right;">
                <input type="submit" style="height:100%;font-size: 21px;color: white;background-color: #0071b1;border: none;" value="BUY"/>
            </div>

        </div>
    </form>
</div>
</body>

</html>


<script>


    $(function () {
        $("form").submit(function (e) {
            var recipient = document.getElementById("recipient").value;
            var phone = document.getElementById("phone").value;
            var postalcode = document.getElementById("postalcode").value;
            var country = document.getElementById("country").value;
            var address = document.getElementById("address").value;
            var promo_code = document.getElementById("promo_code").value;

            var data = '{"addr" : {' + '"recipient": "' + recipient + '",' +
                '"phone": "' + phone + '",' +
                '"postalcode": "' + postalcode + '",' +
                '"country": "' + country + '",' +
                '"address": "' + address + '"},' +
                '"promo_code": "' + promo_code + '"}'

            console.log(data)

            $.ajax({
                url: "/user/transaction/loadOrder.jhtml",
                type: "post",
                contentType: 'application/json; charset=UTF-8',
                data: data,
                success: function (data) {
                    window.location.href = '/user/cart/order.jhtml';
                },
                error: function () {
                    alert("发送未知错误！ 无法发送验证码！")
                }
            });
            return false;
        });
    });
</script>