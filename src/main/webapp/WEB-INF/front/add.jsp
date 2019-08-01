<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>添加购物车</title>

    <script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>

    <link type="text/css" rel="stylesheet" href="static/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="static/css/module.css"/>

</head>
<body>
<div style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
    <!--Head start-->
    <div class="header">
        <h1>添加购物车</h1>
        <a href="#" class=""></a>
    </div>
    <!--End of head-->
    <div class="shopping">

        <div class="shop-group-item">
            <div class="shop-name">
                <input type="checkbox" class="check goods-check shopCheck">
                <h4><a href="#">产品信息</a></h4>
            </div>
            <ul id="test">
            </ul>
            <div class="shopPrice">此栏总价：$<span class="shop-total-amount ShopTotal">0.00</span></div>
        </div>
    </div>
    <div class="payment-bar">
        <div class="all-checkbox"><input type="checkbox" class="check goods-check" id="AllCheck">全选</div>
        <div class="shop-total">
            <strong>总价：<i class="total" id="AllTotal">0.00</i></strong>
        </div>
        <a href="#" class="settlement">结算</a>
    </div>

    <div style="width: 100%;height: 60px;"></div>
    <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
        <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 70px">
            @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
        </div>
        <jsp:include page="footnav.jsp"></jsp:include>
    </div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $.ajax({
            type: "GET",
            url: 'http://localhost:8080/transaction/checkCart?uuid=HKGEPI2019311111628',
            dataType: "json",
            crossDomain: true,
            async: false,
            success: function (res) {
                console.log(res);
                var str = ''
                // Note: Output I and obj are subscripts and individual objects, respectively
                for (var i = 0; i < res.CartList.length; i++) {
                    // console.log(i);
                    // console.log(obj);
                    str +=
                        "<li>" +
                        "<div class=\"shop-info\">" +
                        "<input type=\"checkbox\" class=\"check goods-check goodsCheck\">\n" +
                        "<div class=\"shop-info-img\"><a href=\"#\"><img src='" + res.CartList[i].wares_img + "' /></a></div>" +
                        "<div class=\"shop-info-text\">" +
                        "<h4>" + res.CartList[i].wares_name + "</h4>" +
                        "<div class=\"shop-brief\"><span>" + res.CartList[i].wares_info + "</span></div>" +
                        "<div class=\"shop-sumprice\">" +
                        "<div class=\"shop-pices\">￥<b class=\"sumprice\">" + res.CartList[i].sell_price + "</b></div>" +
                        "<div class=\"shop-arithmetic\">" +
                        "<a href=\"javascript:;\" class=\"minus\">-</a>" +
                        "<span class=\"num\" >1</span>" +
                        "<a href=\"javascript:;\" class=\"plus\">+</a>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</li>";
                }
                //str += '<div style="position: fixed;width:100%;"><input type="button" id="dosubmit" value="提交" style="width:200px;height:50px;font-size:34px;float:right" onclick="dosubmit()"/></div>';
                console.log(str)
                $("#test").append(str);
            }
        });
    });
</script>
<script>

    $(function () {
        // Quantity reduction
        $(".minus").click(function () {
            var t = $(this).parent().find('.num');
            t.text(parseInt(t.text()) - 1);
            if (t.text() <= 1) {
                t.text(1);
            }
            TotalPrice();
        });
        // Quantity plus
        $(".plus").click(function () {
            var t = $(this).parent().find('.num');
            t.text(parseInt(t.text()) + 1);
            if (t.text() <= 1) {
                t.text(1);
            }
            TotalPrice();
        });
        /******------------Dividing line-----------------******/
        //Click on the commodity button
        $(".goodsCheck").click(function () {
            var goods = $(this).closest(".shop-group-item").find(".goodsCheck"); //Get all the goods in our shop
            var goodsC = $(this).closest(".shop-group-item").find(".goodsCheck:checked"); //Get all the selected goods in our shop
            var Shops = $(this).closest(".shop-group-item").find(".shopCheck"); //Get the full selection button for our store
            if (goods.length == goodsC.length) { //If the selected item equals all the items
                Shops.prop('checked', true); //Shop Full Selection Button Selected
                if ($(".shopCheck").length == $(".shopCheck:checked").length) { // If the number of shops selected equals the number of all shops
                    $("#AllCheck").prop('checked', true); //Full-selection button selected
                    TotalPrice();
                } else {

                    $("#AllCheck").prop('checked', false); //elseFull Selection Button Not Selected
                    TotalPrice();
                }
            } else { //If the selected item is not equal to all the items
                console.log("Calculate the start of a single commodity")
                Shops.prop('checked', false); //Shop Full Selection Button Not Selected
                $("#AllCheck").prop('checked', false); //The full selection button is not selected either.
                // Calculation
                TotalPrice();
                // Calculation
            }
        });
        // Click on the store button
        $(".shopCheck").click(function () {
            if ($(this).prop("checked") == true) { //If the store button is selected
                $(this).parents(".shop-group-item").find(".goods-check").prop('checked', true); //All the commodity buttons in the store were also selected.
                if ($(".shopCheck").length == $(".shopCheck:checked").length) { //If the number of shops selected equals the number of all shops
                    $("#AllCheck").prop('checked', true); //Full-selection button selected
                    TotalPrice();
                } else {
                    $("#AllCheck").prop('checked', false); //elseFull Selection Button Not Selected
                    TotalPrice();
                }
            } else { //If the store button is not selected
                $(this).parents(".shop-group-item").find(".goods-check").prop('checked', false); //All goods in the shop are not selected.
                $("#AllCheck").prop('checked', false); //The full selection button is not selected either.
                TotalPrice();
            }
        });
        // Click on the all-select button
        $("#AllCheck").click(function () {
            if ($(this).prop("checked") == true) { //If the full selection button is selected
                $(".goods-check").prop('checked', true); //All buttons are selected
                TotalPrice();
            } else {
                $(".goods-check").prop('checked', false); //else Not all buttons are selected
                TotalPrice();
            }
            $(".shopCheck").change(); //Perform shop selection
        });

        //Calculation
        function TotalPrice() {
            var allprice = 0; //Total sumprice
            $(".shop-group-item").each(function () { //Cycle each store
                var oprice = 0; //Total store sumprice
                $(this).find(".goodsCheck").each(function () { //Goods in a recycling shop
                    if ($(this).is(":checked")) { //If the item is selected
                        var num = parseInt($(this).parents(".shop-info").find(".num").text()); //Quantity of Goods Obtained
                        var price = parseFloat($(this).parents(".shop-info").find(".sumprice").text()); //Unit Price of Goods Obtained
                        var total = price * num; //Calculate the total sumprice of a single commodity
                        oprice += total; //Calculate the total sumprice of the store
                    }
                    $(this).closest(".shop-group-item").find(".ShopTotal").text(oprice.toFixed(2)); //Shop prices showing selected items
                });
                var oneprice = parseFloat($(this).find(".ShopTotal").text()); //Get the total sumprice of each store
                allprice += oneprice; //Calculate the total sumprice of all stores
            });
            $("#AllTotal").text(allprice.toFixed(2)); //Total Output Price
        }
    });

</script>