<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="util" uri="http://epidial.com/jstl/stringUtil" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
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
    <script>
        $(function(){
            //删除购物车
            $("body").on("click", "div[name=cartdel]", function (event) {
                if (window.confirm("are you sure delete?")) {
                    var data = {};
                    var _oThis = $(event.currentTarget);
                    data.id = _oThis.attr("id");
                    $.post("/user/cart/del.jhtml", data, function (data) {
                        _oThis.parents("div[name=cart]").remove();
                        $.post("/user/cart/sumprice.jhtml", function (data) {
                            console.info(data);
                            $("[name=sumprice]").text(data);
                        });
                    });
                }
            });
        });
    </script>
</head>
<body>
<!--头部开始-->
<div style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
    <form action="/user/transaction/loadOrder.jhtml" method="post">
        <div style="background-color:#ffffff;padding-bottom: 70px">

            <div style="width: 100%;height: 10px;"></div>
            <div name="cartbox" style="width:100%;height:auto;">
                <script>
                    $(function () {
                        $.post("/user/cart/unPayGoodslist.jhtml", function (data) {
                            data.forEach(function (v) {
                                var div = "<div style='clear: both' name='cart'>" +
                                    "<div  style='background-color:crimson;color: white;width: 20%;height: 25px;cursor: pointer;text-align: center;border-radius: 5px;line-height: 25px;'>unpay</div>" +
                                    "<div style='width:100%;display: flex;flex-direction: row;justify-content: center;float: left;'>" +
                                    "<div style='width: 100%;float: left;height: 60px;'>" +
                                    "   <div style='width:30%;height:auto;float: left;text-align: center'><image src=" + v.imgpath + " style='width:50%;height:auto'></image></div>" +
                                    "   <div style='float: left;width: 5%;height: 100%;'></div>" +
                                    "   <div style='float: left;width: 40%;height: 100%;'>" +
                                    "          <div style='width:100%;height:10%'></div>" +
                                    "           <div style='width:100%;height:30%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>" + v.name + "</div>" +
                                    "           <div style='width:100%;height:15%'></div>" +
                                    "            <div class='shop-sumprice' style='width:100%;height:40%;;text-align: center'>" +
                                    "                <div class='shop-pices' style='float:left;width: 40%;height: 100%'>$<b>" + v.price + "</b></div>" +
                                    "                <div class='shop-arithmetic' style='float: right;width: 60%;height: 100%;text-align: center'>X" + v.count + "</div>" +
                                    "            </div>" +
                                    "   </div>" +
                                    "   <div style='float: left;width: 20%;height: 100%'>" +
                                    "         <div style='width: 100%;height: 5px;clear: both;'></div>"+
                                    "         <div name='cartdel' id='" + v.id + "' style='background-color:#37475d;color: white;width: 100%;height: 25px;cursor: pointer;text-align: center;border-radius: 5px;line-height: 25px;'>delete</div>" +
                                    "    </div>"
                                "      </div>" +
                                "   </div>" +
                                "   <div style='width: 100%;height: 10px;border-bottom:1px solid #e2e2e2;clear: both;'></div>";
                                $("div[name=cartbox]").append(div);
                            });
                        });
                    });
                </script>
            </div>

            <div style="clear: both;height: 10px;width: 100%;;border-bottom:1px solid #e2e2e2"></div>
            <div name="taskrecode" style="width:100%;height:auto;">
                <script>
                    $(function () {
                        $.post("/user/cart/paygoodslist.jhtml", function (data) {
                            data.forEach(function (v) {
                                var div = "<div style='clear: both' name='cart'>" +
                                    "<div  style='background-color:green;color: white;width: 20%;height: 25px;cursor: pointer;text-align: center;border-radius: 5px;line-height: 25px;'>pay</div>" +
                                    "<div style='width:100%;display: flex;flex-direction: row;justify-content: center;float: left;'>" +
                                    "<div style='width: 100%;float: left;height: 60px;'>" +
                                    "   <div style='width:30%;height:auto;float: left;text-align: center'><image src=" + v.imgpath + " style='width:50%;height:auto'></image></div>" +
                                    "   <div style='float: left;width: 5%;height: 100%;'></div>" +
                                    "   <div style='float: left;width: 40%;height: 100%;'>" +
                                    "          <div style='width:100%;height:10%'></div>" +
                                    "           <div style='width:100%;height:30%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>" + v.name + "</div>" +
                                    "           <div style='width:100%;height:15%'></div>" +
                                    "            <div class='shop-sumprice' style='width:100%;height:40%;;text-align: center'>" +
                                    "                <div class='shop-pices' style='float:left;width: 40%;height: 100%'>$<b>" + v.price + "</b></div>" +
                                    "                <div class='shop-arithmetic' style='float: right;width: 60%;height: 100%;text-align: center'>X" + v.count + "</div>" +
                                    "            </div>" +
                                    "   </div>" +
                                    "   <div style='float: left;width: 20%;height: 100%'>" +
                                    "         <div style='width: 100%;height: 5px;clear: both;'></div>"+
                                    "         <div name='cartdel' id='" + v.id + "' style='background-color:#37475d;color: white;width: 100%;height: 25px;cursor: pointer;text-align: center;border-radius: 5px;line-height: 25px;'>delete</div>" +
                                    "    </div>"
                                "      </div>" +
                                "   </div>" +
                                "   <div style='width: 100%;height: 10px;border-bottom:1px solid #e2e2e2;clear: both;'></div>";
                                $("div[name=taskrecode]").append(div);
                            });
                        });
                    });
                </script>
            </div>
            <div style="width: 100%;height: 10px;"></div>

            <div style="clear: both;"></div>
            <div style="font-weight: bold">Used addresses:</div>
            <div name="addressbox">
                <script>
                    $(function () {
                        $.post("/user/address/list.jhtml", function (data) {
                            data.forEach(function (v) {
                                console.info(v);
                                var div = " <div name='iaddress'  data-id='" + v.id + "'  style='border: 1px solid grey;width: 90%;height: auto;margin: 0 auto;border: 1px dashed orange;cursor: pointer;'>" +
                                    "                    <div  style='width: 100%;height: 50px;'>" +
                                    "                        <div name='item' data-id='" + v.id + "' style='float: left;width: 80%;height:  50px;'>" +
                                    "                            <div>" + v.recipient + "&nbsp;" + v.phone + "</div>" +
                                    "                            <div>" + v.detail + "&nbsp;" + v.city + "&nbsp;" + v.country + "</div>" +
                                    "                        </div>" +
                                    "                        <div name='delAddr' id='" + v.id + "' style='width: 20%;font-weight:bold;background-color: darkorange;color: white;float: left;height:  50px;line-height:  50px;text-align: center'>delete</div>" +
                                    "                       " +
                                    "                    </div>" +
                                    "                </div>" +
                                    "                <div style='width: 100%;height: 5px'></div>"
                                $("div[name=addressbox]").append(div);
                            });
                        });
                        //删除地址
                        $("body").on("click", "[name=delAddr]", function (event) {
                            if (!window.confirm("Are you sure delete?")) return;
                            var data = {};
                            var _oThis = $(event.currentTarget);
                            data.id = _oThis.attr("id");
                            $.post("/user/address/del.jhtml", data, function () {
                                _oThis.parents("div[name=iaddress]").remove();
                            });
                        });
                        //点击地址跳转到确认购买页面
                        $("body").on("click", "[name=item]", function (event) {

                            $.post("/user/cart/unPayGoodslist.jhtml", function (msg) {
                                if (msg.length != 0) {
                                    var data = {};
                                    var _oThis = $(event.currentTarget);
                                    window.location.href = "/user/cart/watchagain.jhtml?addrid=" + _oThis.attr("data-id");
                                } else {
                                    window.alert("Please buy goods");
                                    window.location.href = "/user/cart/index.jhtml";
                                }

                            });


                        });

                    });

                </script>
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
                    <div style="width: 100%;height: 120px;border: 1px dashed grey;">
                        <text>&nbsp;</text>
                        <div style="width: 100%;height: 35px">
                            <text style="font-size: 12px;">Addr.line1</text>
                            <input
                                    style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                    type="text" required="required" name="detail-1"/>
                        </div>

                        <div style="width: 100%;height: 35px;">
                            <div>
                                <text style="font-size: 12px;">Addr. line2</text>
                                <input
                                        style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                        type="text" name="detail-2"/></div>
                        </div>
                        <div style="width: 100%;height: 35px">
                            <text style="font-size: 12px;">Addr.line3</text>
                            <input
                                    style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                    type="text" name="detail-3"/>
                        </div>

                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>

                    <div style='height:15px'></div>
                    <div>
                        <text>Town/City</text>
                        <input
                                style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                type="text" id="city" required="required" name="city"></input>
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
                                type="text" id="postalcode" name="postalcode"></input>
                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>

                </div>
            </div>


            <div class='br'></div>

            <div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>
        </div>
        <div style="clear:both;overflow:hidden;width:100%;height:9%;position:fixed;bottom:0;border-top:1px solid #e0e0e0;background:#fff;">
            <div style="text-align: center;height: 100%;background-color: #37475d;width: 60%;color: #f4f6f8;float: left;">
                <div style="height: 100%;font-size: 21px;line-height: 40px">
                    <div class="shop-total">
                        <script>
                            $(function () {
                                $.post("/user/cart/sumprice.jhtml", function (data) {
                                    console.info(data);
                                    $("[name=sumprice]").text(data);
                                });
                            });
                        </script>
                        <strong>Total：$<i class="total" id="AllTotal"
                                          name="sumprice"></i></strong>
                    </div>
                </div>
            </div>
            <div style="width: 40%;background-color: #0071b1;height: 100%;text-align: center;color: #f4f6f8;float:right;">
                <input type="submit"
                       style="height:100%;font-size: 21px;color: white;background-color: #0071b1;border: none;"
                       value="BUY"/>
            </div>

        </div>
    </form>
</div>
</body>

</html>

<script>
    $(function () {
        $("form").submit(function (e) {
            $.post("/user/cart/unPayGoodslist.jhtml", function (msg) {
                console.info(msg.length);
                if (msg.length != 0) {
                    var data = {};
                    data.recipient = $("#recipient").val();
                    data.phone = $("#phone").val();
                    data.postalcode = $("#postalcode").val();
                    data.country = $("#country").val();
                    data.city = $("#city").val();
                    data.detail = $("[name=detail-1]").val() + $("[name=detail-2]").val() + $("[name=detail-3]").val();
                    $.post("/user/address/save.jhtml", data, function (data) {
                        window.location.href = "/user/cart/watchagain.jhtml?addrid=" + data.id;
                    });
                } else {
                    window.alert("Please buy goods");
                    window.location.href = "/user/cart/index.jhtml";
                }
            });

            return false;
        });
    });
</script>