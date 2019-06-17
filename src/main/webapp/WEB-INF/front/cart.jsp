<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Cart</title>

    <script type="text/javascript" src="static/js/jquery-2.1.1.min.js"></script>

    <link type="text/css" rel="stylesheet" href="static/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="static/css/module.css"/>

</head>

<body>
<div style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
    <div class="shopping">

        <div class="shop-group-item">
            <div class="shop-name">
                <input type="checkbox" class="check goods-check shopCheck" style="border:0px solid #000">
                <h4><a href="javascript:;">Select All</a></h4>
            </div>
            <ul>
                <li>
                    <div class="shop-info">
                        <input type="checkbox" name="checkbox" class="check goods-check goodsCheck" value="1001"
                               style="border:0px solid #000">
                        <div class="shop-info-img" style="text-align: center;">
                            <a href="aging/index.jhtml">
                                <img src="static/images/DNA.png"
                                     style="width: 90%;height:auto;transform: translateY(10px);"/>
                            </a>
                        </div>
                        <div class="shop-info-text">
                            <h4><a href="aging/index.jhtml">Biological age detection 2.0</a></h4>
                            <div class="shop-brief"></div>
                            <div class="shop-price">
                                <div class="shop-pices">$<b class="price">99</b></div>
                                <div class="shop-arithmetic">
                                    <a href="javascript:;" class="minus"
                                       style="background-image:url('static/images/minus.png'); background-repeat: no-repeat;background-size: 100% 100%;"></a>
                                    <span class="num" name="count" id="count_1001">1</span>
                                    <a href="javascript:;" class="plus"
                                       style="background-image:url('static/images/plus.png'); background-repeat: no-repeat;background-size: 100% 100%;"></a>
                                </div>
                            </div>
                        </div>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="shop-info">
                        <input type="checkbox" name="checkbox" class="check goods-check goodsCheck" value="2001"
                               style="border:0px solid #000">
                        <div class="shop-info-img" style="text-align: center;">
                            <a href="same/index.jhtml">
                                <img src="static/images/SAM-e.png" style="width: 100%;height:auto;"/>
                            </a>
                        </div>
                        <div class="shop-info-text">
                            <h4><a href="same/index.jhtml">SAM-e</a></h4>
                            <div class="shop-brief"><span>S-adenosyl methionine supplement</span></div>
                            <div class="shop-price">
                                <div class="shop-pices">$<b class="price">35</b></div>
                                <div class="shop-arithmetic">
                                    <a href="javascript:;" class="minus"
                                       style="background-image:url('static/images/minus.png'); background-repeat: no-repeat;background-size: 100% 100%;"></a>
                                    <span class="num" name="count" id="count_2001">1</span>
                                    <a href="javascript:;" class="plus"
                                       style="background-image:url('static/images/plus.png'); background-repeat: no-repeat;background-size: 100% 100%;"></a>
                                </div>
                            </div>
                        </div>
                        </a>

                    </div>
                </li>
                <%--<li>
                    <div class="shop-info">
                        <input type="checkbox" name="checkbox" class="check goods-check goodsCheck" value="3001"
                               style="border:0px solid #000">
                        <div class="shop-info-img" style="text-align: center;">
                            <a href="vitaminA/index.jhtml">
                                <img src="static/images/VitaminA.png" style="width: 60%;height:auto;"/></a></div>
                        <div class="shop-info-text">
                            <h4><a href="vitaminA/index.jhtml">Vitamin A</a></h4>
                            <div class="shop-brief" style="line-height: 12px;">Fast Dissolve , Maximum Strength,<br>Strawberry,5000
                                mcg ,
                                100 Tablets
                            </div>
                            <div class="shop-price">
                                <div class="shop-pices">$<b class="price">30</b></div>
                                <div class="shop-arithmetic">
                                    <a href="javascript:;" class="minus"
                                       style="background-image:url('static/images/minus.png'); background-repeat: no-repeat;background-size: 100% 100%;"></a>
                                    <span class="num" name="count" id="count_3001">1</span>
                                    <a href="javascript:;" class="plus"
                                       style="background-image:url('static/images/plus.png'); background-repeat: no-repeat;background-size: 100% 100%;"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="shop-info">
                        <input type="checkbox" name="checkbox" class="check goods-check goodsCheck" value="3002"
                               style="border:0px solid #000">
                        <div class="shop-info-img" style="text-align: center;">
                            <a href="vitaminC/index.jhtml">
                                <img src="static/images/VitaminC.png" style="width: 60%;height:auto;"/></a></div>
                        <div class="shop-info-text">
                            <h4><a href="vitaminC/index.jhtml">Vitamin C</a></h4>
                            <div class="shop-brief" style="line-height: 12px;">Fast Dissolve , Maximum Strength,<br>Strawberry,5000
                                mcg ,
                                100 Tablets
                            </div>
                            <div class="shop-price">
                                <div class="shop-pices">$<b class="price">30</b></div>
                                <div class="shop-arithmetic">
                                    <a href="javascript:;" class="minus"
                                       style="background-image:url('static/images/minus.png'); background-repeat: no-repeat;background-size: 100% 100%;"></a>
                                    <span class="num" name="count" id="count_3002">1</span>
                                    <a href="javascript:;" class="plus"
                                       style="background-image:url('static/images/plus.png'); background-repeat: no-repeat;background-size: 100% 100%;"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="shop-info">
                        <input type="checkbox" name="checkbox" class="check goods-check goodsCheck" value="3003"
                               style="border:0px solid #000">
                        <div class="shop-info-img" style="text-align: center;">
                            <a href="vitaminD/index.jhtml">
                                <img src="static/images/VitaminD.png" style="width: 60%;height:auto;"/></a></div>
                        <div class="shop-info-text">
                            <h4><a href="vitaminD/index.jhtml">Vitamin D</a></h4>
                            <div class="shop-brief" style="line-height: 12px;">Fast Dissolve , Maximum Strength,<br>Strawberry,5000
                                mcg ,
                                100 Tablets
                            </div>
                            <div class="shop-price">
                                <div class="shop-pices">$<b class="price">30</b></div>
                                <div class="shop-arithmetic">
                                    <a href="javascript:;" class="minus"
                                       style="background-image:url('static/images/minus.png'); background-repeat: no-repeat;background-size: 100% 100%;"></a>
                                    <span class="num" name="count" id="count_3003">1</span>
                                    <a href="javascript:;" class="plus"
                                       style="background-image:url('static/images/plus.png'); background-repeat: no-repeat;background-size: 100% 100%;"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>--%>
            </ul>
            <div class="shopPrice">Invitation Code:<input type="text" id="invite" name="nvite"
                                                          style="height: 25px;width: 40%;border: 1px solid blue;">
                TOTAL：$<span
                        class="shop-total-amount ShopTotal">0.00</span></div>
        </div>
    </div>
    <div class="payment-bar" style="height: 82px">
        <div class="all-checkbox" style="float: left;height: 100%;width: 5%;"><input type="checkbox"
                                                                                     class="check goods-check"
                                                                                     id="AllCheck"
                                                                                     style="top:30%;border:0px solid #000">
        </div>
        <div class="shop-total" style="float: left;width: 30%">
            <strong>TOTAL：$<i class="total" id="AllTotal" name="total_price">0.00</i></strong>
        </div>
        <div class="settlement" name="mycart" style="float: left;background-color: #0e90d2;width: 20%;cursor: pointer;">
            MyCart
        </div>
        <div class="settlement" onclick="show()" href="javascript:;" style="float: left;width: 20%;cursor: pointer;">
            Next
        </div>
    </div>

    <script>
        //当用户没有购买任何产品时,不允许跳转到商品确定页面
        $(function () {
            $("div[name=mycart]").click(function () {
                if ("${sessionuser==null}" == "true") {
                    if (window.confirm("user no login!please login")) {
                        window.location.href = "/user/loginview.jhtml";
                    }
                    return;
                }
                $.post("/user/cart/unPayGoodslist.jhtml", function (msg) {
                    if (msg.length != 0) {
                        window.location.href = "/user/cart/check.jhtml";
                    } else {
                        window.alert("Please buy goods");
                    }

                });
            });

        });
    </script>
    <jsp:include page="footnav.jsp"></jsp:include>
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
                Shops.prop('checked', false); //店铺全选按钮不被选中
                $("#AllCheck").prop('checked', false); //全选按钮也不被选中
                // 计算
                TotalPrice();
                // 计算
            }
        });
        // 点击店铺按钮
        $(".shopCheck").click(function () {
            if ($(this).prop("checked") == true) { //如果店铺按钮被选中
                $(this).parents(".shop-group-item").find(".goods-check").prop('checked', true); //店铺内的所有商品按钮也被选中
                if ($(".shopCheck").length == $(".shopCheck:checked").length) { //如果店铺被选中的数量等于所有店铺的数量
                    $("#AllCheck").prop('checked', true); //全选按钮被选中
                    TotalPrice();
                } else {
                    $("#AllCheck").prop('checked', false); //else全选按钮不被选中
                    TotalPrice();
                }
            } else { //如果店铺按钮不被选中
                $(this).parents(".shop-group-item").find(".goods-check").prop('checked', false); //店铺内的所有商品也不被全选
                $("#AllCheck").prop('checked', false); //全选按钮也不被选中
                TotalPrice();
            }
        });
        // 点击全选按钮
        $("#AllCheck").click(function () {
            if ($(this).prop("checked") == true) { //如果全选按钮被选中
                $(".goods-check").prop('checked', true); //所有按钮都被选中
                TotalPrice();
            } else {
                $(".goods-check").prop('checked', false); //else所有按钮不全选
                TotalPrice();
            }
            $(".shopCheck").change(); //执行店铺全选的操作
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
     if ("${sessionuser==null}" == "true") {
            if (window.confirm("user no login!please login")) {
                window.location.href = "/user/loginview.jhtml";
            }
            return;
        }
        var data = {}
        obj = document.getElementsByName("checkbox");
        var list = []
        var s1 = '{ "wares" : ['

        var count = 0
        console.log(obj)
        console.log(obj.length)
        for (k = 0; k < obj.length; k++) {
            if (obj[k].checked) {
                count = count + 1;
                console.log($("#count_" + obj[k].value + "").text())
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

        if (count > 0) {
            for (i = 0; i < list.length; i++) {
                s1 += list[i];
                if (list.length > 1) {
                    if ((i + 1) != list.length) {
                        s1 += ","
                    }
                }
            }

            s1 += "],"

            var price = document.getElementById('AllTotal').innerHTML;
            //alert(sumprice)
            s1 += '"total_price":"' + price + '",';
            s1 += '"invite":"' + $("#invite").val() + '"';
            data.total_price = $("#AllTotal").text();


            s1 += '}'

            console.log(s1)
            $.ajax({
                url: "/user/transaction/postCar.jhtml",
                type: "post",
                contentType: 'application/json; charset=UTF-8',
                data: s1,
                success: function (data) {
                    window.location.href = data;
                }
            });
        }
        else {
            alert("Please Choice Some Thing!")
        }
    }
</script>

