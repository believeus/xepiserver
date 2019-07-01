<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Order</title>
    <script type="text/javascript" src="static/js/jquery-2.1.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="static/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="static/css/module.css"/>
</head>


<body style="background-color: white;">
<!--头部开始-->
<jsp:include page="header.jsp"></jsp:include>
<div style="width: 100%;height: auto;background-color:#ffffff">
    <div name="waiting" style="display: none;margin:0 auto;text-align: center;background-color:#ffffff">
        <div style="width: 100%;height: 100px;"></div>
        <img src="/static/images/process.gif" style="width: 32px;height: auto;"/>
    </div>

    <div name="shopcart" style="background-color:#ffffff;padding-bottom: 100px">
        <div style="width: 100%;height: 10px;"></div>
        <div name="cartbox" style="width:100%;height:auto;">
            <script>
                $(function () {
                    $.post("/user/cart/unPayGoodslist.jhtml", function (data) {
                        data.forEach(function (v) {
                            var div = "<div style='clear: both' name='cart'>" +
                                "<div style='width:100%;display: flex;flex-direction: row;justify-content: center;float: left;'>" +
                                "<div style='width: 100%;float: left;height: 90px;'>" +
                                "   <div style='width:30%;height:auto;float: left;text-align: center'><image src=" + v.imgpath + " style='width:70%;height:auto'></image></div>" +
                                "   <div style='float: left;width: 2%;height: 100%;'></div>" +
                                "   <div style='float: left;width: 30%;height: 100%;'>" +
                                "          <div style='width:100%;height:10%'></div>" +
                                "           <div style='width:100%;height:30%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;font-size: 14px'>" + v.name + "</div>" +
                                "            <div class='shop-sumprice' style='width:100%;height:40%;;text-align: center'>" +
                                "                <div class='shop-pices' style='float:left;width: 40%;height: 100%'>$<b>" + v.disprice + "</b></div>" +
                                "                <div class='shop-arithmetic' style='float: right;width: 60%;height: 100%;text-align: center'>X" + v.count + "</div>" +
                                "            </div>" +
                                "   </div>" +
                                "   <div style='float: left;width: 32%;height: 100%;'>" +
                                "         <div style='width: 100%;height: 5px;clear: both;'></div>" +
                                "         <div name='cartdel' id='" + v.id + "' style='background-color:#37475d;color: white;width: 100%;height: 25px;cursor: pointer;text-align: center;border-radius: 5px;line-height: 25px;'>Remove</div>" +
                                "         <div style='width: 100%;height: 5px;clear: both;'></div>"+
                                "    </div>"
                            "      </div>" +
                            "   </div>" +
                            "   <div style='width: 100%;height: 10px;border-bottom:1px solid #e2e2e2;clear: both;'></div>";
                            $("div[name=cartbox]").append(div);

                        });
                        //删除购物车
                        $("body").on("click", "div[name=cartdel]", function (event) {
                            if (window.confirm("Do you want to delete this item?")) {
                                var data = {};
                                var _oThis = $(event.currentTarget);
                                data.id = _oThis.attr("id");
                                $.post("/user/cart/del.jhtml", data, function (data) {
                                    _oThis.parents("div[name=cart]").remove();
                                    $.post("/user/cart/sumprice.jhtml", function (data) {
                                        $("[name=total_price]").text(data);
                                    });
                                });
                            }
                        });
                    });
                });
            </script>
        </div>

        <div style="width: 100%;height: 10px;background-color: #f4f6f8;clear: both"></div>

        <div name="addressbox">
            <script>
                $(function () {
                    $.post("/user/address/addrValid.jhtml", function (v) {
                        console.info(v);
                        var div = " <div data-id='" + v.id + "' name=\"iaddress\" style=\"border: 1px solid grey;width: 95%;height: auto;margin: 0 auto;border: 1px dashed #0071b1;cursor: pointer;clear: both;\">\n" +
                            "                    <div style=\"width: 100%;height: 70px;\">" +
                            "                        <div style=\"float: left;width: 80%;height:  50px;\">" +
                            "                            <div>" + v.recipient + "&nbsp;" + v.phone + "</div>\n" +
                            "                            <div>" + v.detail + "&nbsp;" + v.city + "&nbsp;" + v.country + "</div>" +
                            "                        </div>" +
                            "                        <div  onclick='window.location.href=\"/user/cart/check.jhtml\"' name=\"delAddr\" id='" + v.id + "' style=\"width: 20%;font-weight:bold;background-color: #0071b1;color: white;float: left;height:  25px;line-height:  25px;text-align: center;border-radius: 5px;\">edit</div>\n" +
                            "                    </div>" +
                            "                </div>" +
                            "                <div style=\"width: 100%;height: 5px\"></div>"
                        $("div[name=addressbox]").append(div);
                    });
                });

            </script>
        </div>

    </div>

    <div style="clear:both;overflow:hidden;width:100%;height:120px;position:fixed;bottom:0;border-top:1px solid #e0e0e0;background:#fff;">
        <div style="text-align: center;height: 60px;background-color: #37475d;width: 40%;color: #f4f6f8;float: left;">
            <div style="height: 100%;font-size: 21px;line-height: 60px">
                <div class="shop-total">
                    <strong>$<i class="total" id="AllTotal" name="total_price"></i></strong>
                </div>
                <script>
                    $(function () {
                        $.post("/user/cart/sumprice.jhtml", function (data) {
                            $("[id=AllTotal]").text(data);
                        });
                    });
                </script>
            </div>
        </div>
        <div style="width: 60%;background-color: #0071b1;height: 100%;text-align: center;color: #f4f6f8;float:right;">
            <div name="paypal" style="height:100%;font-size: 14px;line-height: 60px;cursor: pointer;font-weight: bold">Confirm & proceed to payment</div>
        </div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>

</html>


<script>
    $(function () {
        $("div[name=paypal]").click(function () {
            $.post("/user/cart/unPayGoodslist.jhtml", function (msg) {
                if (msg.length != 0) {
                    $("div[name=waiting]").css("display","block");
                    $("div[name=shopcart]").remove();
                    window.location.href = '/user/paypal/payment.jhtml?mobile=true';
                } else {
                    window.alert("Please select a product.");
                    window.location.href = "/user/cart/index.jhtml";
                }

            });

        });
    });

</script>