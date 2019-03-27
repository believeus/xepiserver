<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/24
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="static/css/stylesheet.css" />
    <!-- <link href="static/css/bootstrap-slider.min.css" rel="stylesheet"> -->
    <link href="/static/css/pain-bootstrap-slider.css" rel="stylesheet">
    <script type='text/javascript' src="static/js/jquery-3.3.1.min.js"></script>
    <script type='text/javascript' src="static/js/bootstrap-slider.js"></script>
    <script src="static/js/build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths : {
                echarts : 'static/js/build/dist'
            }
        });
    </script>
    <title>Order Record</title>

    <style>
        div[id=dot]:before{
            content:"▏";
            color: #113965;;
            font-size: 0.3rem;
            margin-right: 3px;
        }
    </style>
</head>
<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: auto;">
    <jsp:include page="header.jsp"/>
    <!-- END COVER -->
    <!-- START THE NAVBAR -->
    <div class="navbar-wrapper stuckMenu" style="z-index: 9999;">
        <div class="container" style="padding: 0px;max-width: 100%;max-height: 50px;">
            <div class="navwrapper">
                <div class="navbar navbar-inverse navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                            </button>
                            <div>
                                <div style="float: left; width: 10%;">

                                    <a class="navbar-brand" href="javascript:(void);" onclick="window.history.back()" style="font-size: 24px;font-weight: bold;">&lt;</a>

                                </div>
                                <div style="float: left; width: 70%;text-align: left;">
                                    <a class="navbar-brand" href="javascript:(void);" style="font-size: 12px;font-weight: bold;">Orderecord List</a>
                                </div>
                            </div>
                        </div>
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="menuItem"><a href="index.jhtml">Home</a></li>
                                <li class="menuItem"><a href="aboutus/index.jhtml">About Us</a></li>
                                <li class="menuItem"><a href="">MYReport</a></li>
                                <!-- <li class="menuItem"><a href="same/index.jhtml">Same</a></li>
                    <li class="menuItem"><a href="aging/index.jhtml">Biological age Detection</a></li> -->
                                <li class="menuItem"><a href="cart/index.jhtml">Health Market</a></li>
                                <li class="menuItem"><a href="#wordpress">Science team</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Navbar -->
        </div>
    </div>
    <!-- END NAVBAR -->
    <div style="width: 100%;height: auto;">


        <div style="width: 100%;height: auto;">
            <div style="width: 100%;height: auto;">

                <div style="width: 100%;height: auto; background-color: #FFFFFF;border-top: 1px solid #efefef;">
                    <div style="width: 94%;height: auto;margin: 0 auto;line-height: 60px;color: #F36602;">Paid</div>
                </div>

                <div style="width: 100%;height: auto;" id="paid"></div>
            </div>

        </div>
</body>
</html>


<script>


    $(function() {
        var paid = ""
        $.ajax({
            type: "post",
            url: "transaction/Check.jhtml",
            success: function(data) {
                //console.log(data)
                for (var i = 0; i < data.length; i++) {

                    paid += '<div style="width: 100%;height: 30px;background-color: #F4F4F4"><div style=" width:90%;margin:0 auto; line-height: 30px;font-size: 16px;font-weight: 600;">Order NO.-' +
                        data[i].order_id + "</div></div>"

                    for (var j = 0; j < data[i].list.length; j++) {
                        paid += '<div class="list" style="width: 100%;height: auto;overflow: hidden;background-color: #FFFFFF;">' +
                            '<div style="width: 90%;height: auto;overflow: hidden;margin: 0 auto;">' +
                            '<div style="width: 24%;height: auto;float: left;">' +
                            '<img src="'+ data[i].list[j].wares_img + '" style="width: 100%;height: auto;margin-top: 7px;"></div>' +
                            '<div style="width: 3%;height: 50px;float: left;"></div>' +
                            '<div style="width: 45%;height: auto;float: left;">' +
                            '<div style="width: 100%;height: auto;font-size: 14px;font-weight: 700;line-height: 28px;margin-top: 16%;">' + data[i].list[j].wares_name +'</div></div>' +
                            '<div style="width: 28%;height: auto;float: left;">' +
                            '<div style="width: 100%;height: 26px;"></div>' +
                            '<div id="dot" style="width: 100%;height: 20px;color: #F36602;line-height: 30px; font-size: 16px;">$' + data[i].list[j].sell_price  +'</div>' +
                            '<div style="width: 100%;height: 24px;"></div></div></div><div style="width:100%;height: 1px;background-color: #efefef;"></div></div>'
                    }

                }

                $("#paid").html(paid)
            }
        })
    });
</script>
