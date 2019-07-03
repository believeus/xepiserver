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
<script src="/static/js/stickUp.min.js"></script>
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
<div>
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
                                <div style="float: left; width: 70%;text-align: left;">
                                    <a class="navbar-brand" href="javascript:(void);"
                                       style="font-size: 12px;font-weight: bold;line-height: 22px;">${title}</a>
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
        <div class="translate_wrapper"style="z-index: 999999;padding-right: 5px;">
            <div class="current_lang">
                <div class="lang">
                    <a href="index.jhtml">
                    <img src="static/images/flag/usa-flag.png">
                    <span class="lang-txt">EN</span></span>
                    <span class="fa fa-chevron-down chevron"></span>
                    </a>
                </div>
            </div>
            <div class="more_lang">

                <%--<div class="lang" data-value='cn'>
                    <img src="https://image.flaticon.com/icons/svg/299/299914.svg">
                    <span class="lang-txt">简体中文</span>
                </div>--%>

                <div class="lang selected" data-value='en'>
                   <a href="index.jhtml">
                    <img src="static/images/flag/usa-flag.png">
                    <span class="lang-txt">English<span> (US)</span></span>
                   </a>
                </div>

                    <div class="lang" data-value='ru'>
                        <a href="russian/index.jhtml"><img src="static/images/flag/ru-flag.png">
                        <span class="lang-txt">Рия</span>
                        </a>
                    </div>

                <%--<div class="lang" data-value='de'>
                    <img src="https://image.flaticon.com/icons/svg/299/299786.svg">
                    <span class="lang-txt">Deutsch</span>
                </div>

                <div class="lang" data-value='es'>
                    <img src="https://image.flaticon.com/icons/svg/299/299820.svg">
                    <span class="lang-txt">Español</span>
                </div>


                <div class="lang" data-value='fr'>
                    <img src="https://image.flaticon.com/icons/svg/299/299753.svg">
                    <span class="lang-txt">Français</span>
                </div>


                <div class="lang" data-value="pt">
                    <img src="https://image.flaticon.com/icons/svg/299/299693.svg">
                    <span class="lang-txt">Português<span> (BR)</span></span>
                </div>

                <div class="lang" data-value="ar">
                    <img src="https://image.flaticon.com/icons/svg/299/299815.svg">
                    <span class="lang-txt">العربية <span> (SA)</span></span>
                </div>--%>
            </div>
        </div>
        <div class="content">
            <%-- <div class="ct-txt">
                 <h1></h1>
                 <p></p>
                 <a href="#"><span>Link</span></a>
             </div>--%>
        </div>
    </div>
</div>
<!-- End lang-->



