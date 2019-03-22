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
    <title>购物车</title>

    <script type="text/javascript" src="static/js/jquery-2.1.1.min.js"></script>

    <link type="text/css" rel="stylesheet" href="static/css/base.css" />
    <link type="text/css" rel="stylesheet" href="static/css/module.css" />

</head>



<body>

<!--头部开始-->
<div  style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
<div class="header">
    <h1>信息填写</h1>
    <a href="#" class=""></a>
</div>

<div style="background-color:#ffffff;padding-bottom: 40px">

    <div style="width: 100%;height: 10px;"></div>
    <div style="width:100%;height:auto;">
        <c:forEach var="item" items="${sessionScope.Cart.list}">
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
        </c:forEach>
    </div>


    <div style="width: 100%;height: 10px;"></div>

    <div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>

    <div style="width:100%;display:flex;flex-direction: row;justify-content: center;">
        <div class='part1' style='width:90%'>
            <div style='height:15px'></div>
            <div>
                <text>recipient</text>
                <input
                        style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' type="text" id="recipient" name="recipient"></input>
            </div>
            <div style='height:20px;border-bottom:1px solid #e2e2e2;'>
            </div>
            <div style='height:15px'></div>
            <div>
                <text>phone</text>
                <input
                        style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' type="text" id="phone" name="phone"></input>
            </div>
            <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>
            <div style='height:15px'></div>
            <div>
                <text>country</text>
                <input
                        style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' type="text" id="country" name="country" ></input>
            </div>
            <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>
            <div style='height:15px'></div>
            <div>
                <text>address</text>
                <input
                        style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' type="text" id="address" name="address"></input>
            </div>
            <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>
            <div style='height:15px'></div>
            <div>
                <text>postalcode</text>
                <input
                        style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)' type="text" id="postalcode" name="postalcode"></input>
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
                        placeholder="  Promo Code" type="text" id="promo_code" name="promo_code"></input>
            </div>
            <div style='height:20px'></div>
        </div>
    </div>

    <div class='br'></div>


    <div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>
</div>

<div
        style="clear:both;overflow:hidden;width:100%;height:6%;position:fixed;bottom:0;border-top:1px solid #e0e0e0;background:#fff;">
    <div style="text-align: center;height: 100%;background-color: #37475d;width: 60%;color: #f4f6f8;float: left;">
        <div style="height: 100%;font-size: 21px;line-height: 40px">
            <div class="shop-total">
                <strong>总价：<i class="total" id="AllTotal" name="total_price">${sessionScope.Cart.total_price}</i></strong>
            </div></div>
    </div>
    <div style="width: 40%;background-color: #0071b1;height: 100%;text-align: center;color: #f4f6f8;float:right;">
        <div style="height:100%;font-size: 21px;line-height: 40px" onclick="PostAddr()">提交订单</div>
    </div>
</div>

</div>
</body>

</html>
<script>
    $(function () {
        // 数量减
        $(".minus").click(function () {
            var t = $(this).parent().find('.num');
            t.text(parseInt(t.text()) - 1);
            if (t.text() <= 1) {
                t.text(1);
            }
            TotalPrice();
        });
        // 数量加
        $(".plus").click(function () {
            var t = $(this).parent().find('.num');
            t.text(parseInt(t.text()) + 1);
            if (t.text() <= 1) {
                t.text(1);
            }
            TotalPrice();
        });
        /******------------分割线-----------------******/
        // 点击商品按钮
        $(".goodsCheck").click(function () {
            var goods = $(this).closest(".shop-group-item").find(".goodsCheck"); //获取本店铺的所有商品
            var goodsC = $(this).closest(".shop-group-item").find(".goodsCheck:checked"); //获取本店铺所有被选中的商品
            var Shops = $(this).closest(".shop-group-item").find(".shopCheck"); //获取本店铺的全选按钮
            if (goods.length == goodsC.length) { //如果选中的商品等于所有商品
                Shops.prop('checked', true); //店铺全选按钮被选中
                if ($(".shopCheck").length == $(".shopCheck:checked").length) { //如果店铺被选中的数量等于所有店铺的数量
                    $("#AllCheck").prop('checked', true); //全选按钮被选中
                    TotalPrice();
                } else {

                    $("#AllCheck").prop('checked', false); //else全选按钮不被选中
                    TotalPrice();
                }
            } else { //如果选中的商品不等于所有商品
                console.log("计算单个商品开始")
                Shops.prop('checked', false); //店铺全选按钮不被选中
                $("#AllCheck").prop('checked', false); //全选按钮也不被选中
                // 计算
                TotalPrice();
                // 计算
            }
        });
        //计算
        function TotalPrice() {
            var allprice = 0; //总价
            $(".shop-group-item").each(function () { //循环每个店铺
                var oprice = 0; //店铺总价
                $(this).find(".goodsCheck").each(function () { //循环店铺里面的商品
                    if ($(this).is(":checked")) { //如果该商品被选中
                        var num = parseInt($(this).parents(".shop-info").find(".num").text()); //得到商品的数量
                        var price = parseFloat($(this).parents(".shop-info").find(".price").text()); //得到商品的单价
                        var total = price * num; //计算单个商品的总价
                        oprice += total; //计算该店铺的总价
                    }
                    $(this).closest(".shop-group-item").find(".ShopTotal").text(oprice.toFixed(2)); //显示被选中商品的店铺总价
                });
                var oneprice = parseFloat($(this).find(".ShopTotal").text()); //得到每个店铺的总价
                allprice += oneprice; //计算所有店铺的总价
            });
            $("#AllTotal").text(allprice.toFixed(2)); //输出全部总价
        }
    });
</script>


<script>
    function show() {
        var data = {}
        obj = document.getElementsByName("checkbox");
        var list = []
        var s1 = '{ "wares" : ['
        for (k = 0; k < obj.length; k++) {
            if (obj[k].checked) {
                //var wares = {}
                //wares.push(obj[k].value);
                //wares.wares_id = obj[k].value
                console.log($("#count_" + obj[k].value + "").text())
                // wares.wares_count = $("#count_" + obj[k].value + "").text()
                //console.log(wares)
                //var goods = '{"wares_id":' + obj[k].value + ',"wares_count":' + $("#count_" + obj[k].value + "").text()
                //+ '}'
                var d1 = {}
                d1.wares_id = obj[k].value
                d1.wares_count = $("#count_" + obj[k].value + "").text()

                //list.push(d1)
                var str = '{"wares_id":' + obj[k].value + ',"wares_count":' + $("#count_" + obj[k].value + "").text() + '}'
                list.push(str)
            }

        }
        console.log(list)
        data.wares = list

        for (i = 0; i < list.length; i++) {
            s1 += list[i];
            if (list.length > 1) {
                if ((i + 1) != list.length) {
                    s1 += ","
                }
            }
        }

        s1 += "],"

        console.log("list --->" + s1)

        var price = document.getElementById('AllTotal').innerHTML;
        //alert(price)
        //s1 += '"total_price":"' + price + '",'

        s1 += '"total_price":"' + price + '",'

        data.total_price = $("#AllTotal").text();

        var addr = {}
        addr.recipient = "Eestill"
        addr.phone = "13215361156"
        addr.postalcode = "123411"
        addr.country = "CN"
        addr.address = "测试地址"

        //s1 += '"addr" : {"recipient" : "Eestill" , "phone" : "13215361156" , "postalcode" : "123411" , "country" : "CN" , "address" : "测试地址" }'

        data.addr = addr

        s1 += '}'

        console.log(s1)

    }

    function PostAddr(){
        var recipient = document.getElementById("recipient").value;
        var phone = document.getElementById("phone").value;
        var postalcode = document.getElementById("postalcode").value;
        var country = document.getElementById("country").value;
        var address = document.getElementById("address").value;
        var promo_code = document.getElementById("promo_code").value;

        var s2 = '{"addr" : {' + '"recipient": "' + recipient + '",' +
            '"phone": "' + phone + '",' +
            '"postalcode": "' + postalcode + '",' +
            '"country": "' + country + '",' +
            '"address": "' + address + '"},' +
            '"promo_code": "' + promo_code + '"}'

        console.log(s2)

        $.ajax({
            url: "transaction/LoadOrder.jhtml",
            type: "post",
            contentType: 'application/json; charset=UTF-8',
            data : s2,
            success: function(data) {
                //window.location.href = 'cart/order.jhtml';
            },
            error: function() {
                alert("发送未知错误！ 无法发送验证码！")
            }
        })

    }
</script>