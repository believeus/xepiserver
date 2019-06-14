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
        $(function () {
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
                                    "         <div style='width: 100%;height: 5px;clear: both;'></div>" +
                                    "         <div name='cartdel' id='" + v.id + "' style='background-color:#37475d;color: white;width: 100%;height: 25px;cursor: pointer;text-align: center;border-radius: 5px;line-height: 25px;'>delete</div>" +
                                    "         <div style='width: 100%;height: 5px;clear: both;'></div>"+
                                    "          <div onclick='window.location.href=\"/user/cart/check.jhtml\"'  style='background-color:#0071bc;color: white;width: 100%;height: 25px;cursor: pointer;text-align: center;border-radius: 5px;line-height: 25px;' >pay it</div>"+
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
                                    "         <div style='width: 100%;height: 5px;clear: both;'></div>" +
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

            <div style="width: 100%;height: 10px;"></div>

            <div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>

        </div>
    </form>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>

</html>
