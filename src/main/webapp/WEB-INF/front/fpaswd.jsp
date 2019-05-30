<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/15
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <div id="zhuce"><a href="/login.jhtml">Login</a>|<a href="/index.jhtml">home</a></div>
    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="static/images/InOrUp/com_logo.png" style="width: 100%;height: 100%"/>
        </div>
        <div style="    width: 80%;
            margin: 0 auto;
            text-align: left;">

            <script>
                $(function(){
                    $("[name=sendmail]").click(function () {
                        var email=$("input[name=email]").val();
                         var data={};
                         data.email=email;
                        $.post("/user/sendpaswd.jhtml",data,function(msg){
                            var data="";
                            $("div[name=message]").css("display","block");
                            if(msg=="success"){
                                data="The password has been sent to the mailbox!<a href='login.jhtml'>login</a> the system!"
                                $("div[name=btnsend]").css("display","none");
                            }else {
                                data="The mailbox is not registered,Please check that the mailbox is filled in correctly.";
                            }
                            $("div[name=message]").html(data);
                        });
                    });
                });
            </script>
            <div id="PWDSignIn" style="display:block">
                <div class="userName">
                    <lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                    <input type="text" name="email" id="email" placeholder="Email" style="width: 60%" >
                </div>

                <div name="btnsend" class="other_login" style="margin-top: 40px;">
                    <span>By clicking the button below,your password will send to your email</span>
                    <button class="login_btn" name="sendmail" style="margin-top: 0px;">password send to email</button>
                </div>
                <div style="clear: both"></div>
                <div style="display: none;font-size: 14px;" name="message"></div>
            </div>


        </div>
    </div>
</div>
    </div>
</body>

</html>


<script>
    function ToReg() {
        window.location.href = 'register.jhtml';
    }
</script>