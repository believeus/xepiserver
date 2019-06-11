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


<body>
<!--头部开始-->
<jsp:include page="header.jsp"></jsp:include>
<div style="width: 100%;height: auto;">
    <div id="popDiv"
         style="z-index: 99; display: none;width: 100%;height: 100%; position: absolute;top:0;left: 0; background-color: #efefef;text-align: center;">
        <img src="static/images/loading.gif" style="width: 80px;height: 80px;margin-top: 50%"/>
    </div>

    <div style="background-color:#ffffff;padding-bottom: 70px">
        <div style="width: 100%;height: 10px;"></div>
        <div name="cartbox" style="width:100%;height:auto;">
            <script>
                $(function () {
                    $.post("/user/cart/unPayGoodslist.jhtml", function (data) {
                        data.forEach(function (v) {
                            var div = "<div name='cart'><div style='width:80%;display: flex;flex-direction: row;justify-content: center;float: left;'>\n" +
                                "                        <div style=\"width: 90%\">\n" +
                                "                            <div style=\"width:40%;height:auto;float: left;text-align: center\">\n" +
                                "                                <image src=" + v.imgpath + " style=\"width:70%;height:auto\"></image>\n" +
                                "                            </div>\n" +
                                "                            <div style=\"float: left;width: 15%;height: 100%;\">\n" +
                                "                            </div>\n" +
                                "                            <div style=\"float: left;width: 40%;height: 100%;\">\n" +
                                "                                <div style=\"width:100%;height:10%\"></div>\n" +
                                "                                <div style=\"width:100%;height:30%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;\">" + v.name +
                                "</div>\n" +
                                "                                <div style=\"width:100%;height:15%\"></div>\n" +
                                "                                <div class=\"shop-sumprice\" style=\"width:100%;height:40%;;text-align: center\">\n" +
                                "                                    <div class=\"shop-pices\" style=\"float:left;width: 40%;height: 100%\">$<b\n" +
                                "                                            class=\"sumprice\"> " + v.price + "</b>\n" +
                                "                                    </div>\n" +
                                "                                    <div class=\"shop-arithmetic\"\n" +
                                "                                         style=\"float: right;width: 60%;height: 100%;text-align: center\">\n" +
                                "                                        X " + v.count +
                                "                                    </div>\n" +
                                "                                </div>\n" +
                                "                            </div>\n" +
                                "                        </div>\n" +
                                "                    </div><div name='cartdel' id='" + v.id + "' style='float: left;background-color:saddlebrown;color: white;width: 18%;height: 100%;cursor: pointer'>delete</div></div>" +
                                "                    <div style=\"width: 100%;height: 10px;border-bottom:1px solid #e2e2e2;clear: both;\"></div>";
                            $("div[name=cartbox]").append(div);

                        });
                        //删除购物车
                        $("body").on("click", "div[name=cartdel]", function (event) {
                            if (window.confirm("are you sure delete?")) {
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

        <div style="width: 100%;height: 10px;"></div>

        <div name="addressbox">
            <script>
                $(function () {
                    $.post("/user/address/addrValid.jhtml", function (v) {
                            console.info(v);
                            var div = " <div data-id='"+v.id+"' name=\"iaddress\" style=\"border: 1px solid grey;width: 90%;height: auto;margin: 0 auto;border: 1px dashed orange;cursor: pointer;\">\n" +
                                "                    <div style=\"width: 100%;height: 50px;\">" +
                                "                        <div style=\"float: left;width: 80%;height:  50px;\">" +
                                "                            <div>" + v.recipient + "&nbsp;" + v.phone + "</div>\n" +
                                "                            <div>" + v.detail + "&nbsp;" + v.city + "&nbsp;" + v.country + "</div>" +
                                "                        </div>" +
                                "                        <div  onclick='window.location.href=\"/user/cart/check.jhtml\"' name=\"delAddr\" id='" + v.id + "' style=\"width: 20%;font-weight:bold;background-color: darkorange;color: white;float: left;height:  50px;line-height:  50px;text-align: center\">edit</div>\n" +
                                "                    </div>" +
                                "                </div>" +
                                "                <div style=\"width: 100%;height: 5px\"></div>"
                            $("div[name=addressbox]").append(div);
                    });
                });

            </script>
        </div>

        <div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>
    </div>

    <div
            style="clear:both;overflow:hidden;width:100%;height:9%;position:fixed;bottom:0;border-top:1px solid #e0e0e0;background:#fff;">
        <div style="text-align: center;height: 100%;background-color: #37475d;width: 60%;color: #f4f6f8;float: left;">
            <div style="height: 100%;font-size: 21px;line-height: 40px">
                <div class="shop-total">
                    <strong>Total：$<i class="total" id="AllTotal" name="total_price"></i></strong>
                </div>
                <script>
                    $(function(){
                        $.post("/user/cart/sumprice.jhtml", function (data) {
                            console.info(data);
                            $("[id=AllTotal]").text(data);
                        });
                    });
                </script>
            </div>
        </div>
        <div style="width: 40%;background-color: #0071b1;height: 100%;text-align: center;color: #f4f6f8;float:right;">
            <div name="paypal" style="height:100%;font-size: 21px;line-height: 40px;cursor: pointer;" >To Pay</div>
        </div>
    </div>

</div>
</body>

</html>


<script>
    $(function(){
        $("div[name=paypal]").click(function(){
            $.post("/user/cart/unPayGoodslist.jhtml", function (msg) {
                if(msg.length!=0){
                    var pop = document.getElementById("popDiv");
                    document.body.addEventListener('touchmove', function(event){
                        event.preventDefault();
                    }, false);
                    $('body').css({'position': 'fixed', "width": "100%"});
                    pop.style.display = "block";
                    window.location.href = '/user/paypal/payment.jhtml';
                }else{
                    window.alert("Please buy goods");
                    window.location.href = "/user/cart/index.jhtml";
                }

            });

        });
    });

</script>