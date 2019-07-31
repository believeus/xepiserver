<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap & Snippet plugin core CSS -->
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="static/css/stickup.css" rel="stylesheet">
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/stickUp.min.js"></script>
<link href="static/css/diet.bootstrap.min.css" rel="stylesheet"/>
<link href="static/css/diet.bootstrap-select.min.css" rel="stylesheet"/>
<script src="static/js/diet.bootstrap-select.js"></script>
<%--lang-switch--%>
<link rel="stylesheet" href="static/css/lang-switch.css">
<script type="text/javascript" src="static/js/lang-jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="static/js/lang-switch.js"></script>

<script>
    $(function () {
        $(document).ready(function () {
            // $('.navbar-wrapper').stickUp();
        });

    });
</script>
<!-- END COVER -->
<!-- START THE NAVBAR -->
<div style="width: 100%;height: 55px; background-color: #0071BC;position: fixed;z-index: 90000">
    <div class="navbar-wrapper" style="z-index: 9999;width: 80%;float: left;">
        <div class="container" style="padding: 0px;max-width: 100%;max-height: 50px;">
            <div class="navwrapper">
                <div class="navbar navbar-inverse navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse"
                                    data-target=".navbar-collapse">
                                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                                    class="icon-bar"></span>
                            </button>
                            <div>
                                <div style="float: left; width: 10%;">
                                    <c:if test="${canback eq true }">
                                        <a class="navbar-brand" href="javascript:(void);"
                                           onclick="window.history.back()"
                                           style="font-size: 24px;font-weight: bold;">&lt;</a>
                                    </c:if>
                                </div>
                                <div style="float: left; width: 65%;text-align: left;">
                                    <a class="navbar-brand" href="javascript:(void);"
                                       style="width: 100%;font-size: 12px;font-weight: bold;line-height: 22px;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${title}</a>
                                </div>
                            </div>
                        </div>

                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="menuItem"><a href="index.jhtml">Home</a></li>
                                <li class="menuItem"><a href="aboutus/index.jhtml">About Us</a></li>
                                <c:if test="${sessionuser!=null}">
                                    <li class="menuItem"><a href="user/bioreport/index.jhtml">My Report</a></li>
                                </c:if>
                                <c:if test="${sessionuser!=null}">
                                    <li class="menuItem"><a href="user/cart/check.jhtml">My Cart</a></li>
                                </c:if>
                                <c:if test="${sessionuser!=null}">
                                    <li class="menuItem"><a href="user/taskrecord/index.jhtml">Order List</a></li>
                                </c:if>
                                <li class="menuItem"><a href="user/cart/index.jhtml">Health Market</a></li>
                                <li class="menuItem"><a href="scienceteam/index.jhtml">Science Team</a></li>
                                <c:if test="${sessionuser!=null}">
                                    <li class="menuItem"><a href="user/logout.jhtml">Log Out</a></li>
                                </c:if>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END NAVBAR -->
        </div>
    </div>
    <!-- End Navbar -->
    <!-- Start lang-->
    <div style="width:20%;height: 53px; float: left;background-color: #0071BC;padding-top: 8px;z-index: 999999;">
        <div class="translate_wrapper" style="z-index: 999999;">
            <div name="cur-lang" class="current_lang">
                <div name="us-lang"  class="lang" data-value='en'>
                    <img src="static/images/flag/usa-flag.png">
                    <span class="lang-txt">EN</span>
                </div>
            </div>
            <div class="more_lang">
                <div name="ru-lang" class="lang" data-value='ru'>
                    <img src="static/images/flag/ru-flag.png">
                    <span class="lang-txt">RU</span>
                </div>
                <div name="por-lang" class="lang" data-value='pg'>
                    <img src="static/images/flag/por-flag.jpg">
                    <span class="lang-txt">PT</span>
                </div>
                <div name="sp-lang" class="lang" data-value='sp'>
                    <img src="static/images/flag/sp-flag.jpg">
                    <span class="lang-txt">ES</span>
                </div>
            </div>
        </div>
        <div class="content"></div>
    </div>
    <!-- End lang-->
</div>

