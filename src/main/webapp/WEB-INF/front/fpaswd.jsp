<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="TTUNION_verify" content="b846c3c2b85efabc496d2a2b8399cd62">
    <meta name="sogou_site_verification" content="gI1bINaJcL">
    <meta name="360-site-verification" content="37ae9186443cc6e270d8a52943cd3c5a">
    <meta name="baidu_union_verify" content="99203948fbfbb64534dbe0f030cbe817">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">

    <title>Login</title>

    <link rel="stylesheet" type="text/css" href="static/css/login.css">
    <link rel="stylesheet" type="text/css" href="static/css/login2.css">
    <script src="static/js/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="static/js/build/css/intlTelInput.css">
    <link rel="stylesheet" href="static/js/build/css/demo.css">
    <script src="static/js/build/js/intlTelInput.js"></script>

    <script src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/select_gj.min.js"></script>
    <script src="static/js/select2_1.js"></script>
</head>
<body style="margin: 0;padding: 0">
<!--头部开始-->
<div style="width: 100%;height: 50px;">
    <jsp:include page="header.jsp"></jsp:include>
</div>
<div style="background-image:url('static/images/bg.png');width: 100%;height: 667px;">
    <div style="width:100%;height:100%;">
        <div id="zhuce" style="text-decoration: none"><a href="/user/loginview.jhtml">Login &nbsp;</a>|<a href="/index.jhtml">&nbsp; home</a></div>
        <div id="login" style="width: 100%;height: 60px;"></div>

        <div class="login_bg">
            <div id="logo" style="width: 30%; margin: 0 auto;">
                <img src="static/images/InOrUp/com_logo.png" style="width: 100%;height: 100%;"/>
            </div>
            <div style="width: 100%;height: 40px;"></div>
            <div style="width: 80%;margin: 0 auto;text-align: left;">

                <script>
                    $(function () {
                        $("form").submit(function (e) {
                            var email = $("input[name=email]").val();
                            var data = {};
                            data.email = email;
                            $("div[name=btnsend]").css("display", "none");
                            $("div[name=process]").css("display", "block");
                            $.post("/user/sendpaswd.jhtml", data, function (msg) {
                                var data = "";
                                if (msg == "success") {
                                    data = "A link to reset your password has been sent to your <strong>["+$("input[name=email]").val()+"]</strong> mailbox.If you have not received the email, please check the junk bin of your email. Please check it out !"
                                    $("div[name=process]").css("display", "none");
                                } else {
                                    data = "The mailbox is not registered,Please check that the mailbox is filled in correctly.";
                                }
                                $("div[name=message]").css("display", "block").html(data);
                                $("div[name=email]").attr("readonly","readonly");

                            });
                            $("div[name=message]").css("display", "block").html(data);
                            $("div[name=email]").attr("readonly","readonly");
                            return false;
                        });
                    });
                </script>
                <form>
                    <div style="width: 100%;height: auto">
                        <div class="userName">
                            <lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                            <input type="email"  required="required" name="email" id="email" placeholder="Email" style="width: 60%">
                        </div>

                        <div name="btnsend" class="other_login" style="margin-top: 40px;">
                            <span>By clicking the button below, A link to reset your password will be sent to your email</span>
                            <input type="submit" class="login_btn" name="sendmail" value="Reset password" style="margin-top: 0px;">
                            </input>
                        </div>
                        <div name="process" style="display: none;margin:0 auto;text-align: center;">
                            <div style="width: 100%;height: 20px;"></div>
                            <img src="/static/images/process.gif" style="width: 32px;height: auto;"/>
                        </div>
                        <div name="message" style="display: none;margin:0 auto;text-align: left;">

                        </div>
                        <div style="clear: both"></div>
                    </div>
                </form>

            </div>
        </div>
        <div id="all-right"style="width: 100%;height: auto;font-family: arial;padding-top: 380px;">
            <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
                @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
            </div>
        </div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>

</html>
