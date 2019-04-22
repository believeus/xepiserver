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
<!-- saved from url=(0065)http://www.17sucai.com/preview/1149930/2018-04-11/login/demo.html -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1,shrink-to-fit=no">

    <meta name="TTUNION_verify" content="b846c3c2b85efabc496d2a2b8399cd62">
    <meta name="sogou_site_verification" content="gI1bINaJcL">
    <meta name="360-site-verification" content="37ae9186443cc6e270d8a52943cd3c5a">
    <meta name="baidu_union_verify" content="99203948fbfbb64534dbe0f030cbe817">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">--%>
    <meta name="format-detection" content="telephone=no">

    <title>登录页面</title>

    <link rel="stylesheet" type="text/css" href="static/css/login.css">
    <link rel="stylesheet" type="text/css" href="static/css/login2.css">
    <link rel="stylesheet" href="static/js/build/css/intlTelInput.css">
    <link rel="stylesheet" href="static/js/build/css/demo.css">
    <link rel="stylesheet" href="static/js/flag/js/dependancies/bootstrap-select-1.12.4/dist/css/bootstrap-select.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/flag/js/countrypicker.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/flag/js/dependancies/bootstrap-select-1.12.4/dist/js/bootstrap-select.js"></script>
    <script src="static/js/build/js/intlTelInput.js"></script>
    <script src="static/js/bootstrap.min.js"></script>


</head>
<body style="margin: 0;padding: 0">
<div  style="width: 100%;height: 50px;">
    <jsp:include page="header.jsp"></jsp:include>
</div>
<div style="background-image:url('static/images/bg.png');width:100%;height:667px;">
    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="static/images/InOrUp/com_logo.png" style="width: 100%;height: 100%"/>
        </div>

        <div id="PhonePart" style="width:100%">
            <div style="width: 80%;height: 50px;margin: 0 auto;text-align: left;">
                <div style="width: 30%;height:100%;background-color: #abb8fc;border-left: 1px solid #abb8fc;border-top: 1px solid #abb8fc;border-right: 1px solid #abb8fc;float: left;border-radius:7px 0 0 0">
                    <div style="width: 100%;height: 5%;text-align: center"></div>
                    <div style="width: 100%;height: 55%;text-align: center">
                        <img src="static/images/InOrUp/shouji-2.png" style="width: 20px;height: 26px"/>
                    </div>
                    <div style="width: 100%;height: 40%;text-align: center;color: #ffffff;">Phone</div>
                </div>
                <div onclick="Mail()" style="width: 30%;height:100%;float: left;border-top: 1px solid #778899;border-right: 1px solid #778899;float: left;border-radius:0 7px 0 0">
                    <div style="width: 100%;height: 5%;text-align: center"></div>
                    <div style="width: 100%;height: 55%;text-align: center">
                        <img src="static/images/InOrUp/mail778899.png" style="width: 20px;height: 20px"/>
                    </div>
                    <div style="width: 100%;height: 40%;text-align: center;color: #778899;">Mail</div>
                </div>
                <%--<div id="zhuce" onclick="ToLogin()" style="float:right;">Login</div>--%>
            </div>
            <div style=" width: 80%;
                margin: 0 auto;
                text-align: left;border: 1px solid #abb8fc; ">
                <div id="CodeSignIn" style="display:block;height: auto;">
                    <div class="userName" style="padding:3% 0 3% 3%">
                        <input type="text" name="username1" id="username1" placeholder="Telephone"
                               pattern="[0-9]{8,13}" style="width: 92%"
                               oninvalid="setCustomValidity('Please enter the correct mobile phone number!');"
                               oninput="setCustomValidity('');">
                        <button
                                style="width:23%;height:100%;border-radius: 5px;border:none;background-color: #abb8fc;color: #ffffff"
                                onclick="time(this)">SMS</button>
                    </div>
                    <div class="passWord" style="padding:3% 0 3% 3%">
                        <lable style="color:#808080">&nbsp;&nbsp;&nbsp;&nbsp;<img src="static/images/InOrUp/scode.png" style="width: 16px;height: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                        <input type="text" name="SMSCode" id="SMSCode" placeholder="Verification Code">
                    </div>
                    <div class="passWord" style="padding:3% 0 3% 3%">
                        <lable style="color:#808080">&nbsp;&nbsp;&nbsp;&nbsp;<img src="static/images/InOrUp/pwd.png" style="width: 16px;height: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                        <input type="text" name="Password" id="Password" placeholder="Password">
                    </div>
                    <div class="passWord" style="padding:3% 0 3% 3%">
                        <lable style="color:#808080">&nbsp;&nbsp;&nbsp;&nbsp;<img src="static/images/InOrUp/pwd.png" style="width: 16px;height: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                        <input type="text" name="Password" id="RePassword" placeholder="Re-Type Password">
                    </div>
                    <div style="padding:3% 0 3% 3%;height: 50px;">
                        <div style="float:left;width: 20%;height: 100%">
                            Your region:
                        </div>
                        <div style="float:left;width: 60%">
                        <select class="selectpicker countrypicker" data-live-search="true" data-default="Hong Kong" data-flag="true" id="country1" style="float: right;display: block"></select>
                        </div>
                        <div onclick="flash()" style="float:left;width: 20%;height: 100%;border:1px solid #000;color:#abb8fc;border:1px solid #abb8fc; border-radius: 7px;text-align: center;line-height: 30px">
                            Refresh
                        </div>
                    </div>
                    <div class="other_login" style="margin-top: 40px;">
                        <span>By clicking the button below, I agree to the User Agreement and Privacy Policy.</span>
                        <button class="login_btn" onclick="Register()" style="margin-top: 0px;">Register</button>
                    </div>

                </div>
                </form>
                <div class="other_choose">

                </div>
            </div>
        </div>

        <div id="MailPart" style="width:375px;display: none">
            <div style="width: 80%;height: 50px;margin: 0 auto;text-align: left;">
                <div onclick="Phone()" style="width: 30%;height:100%;background-color: #ffffff;border-left: 1px solid #abb8fc;border-top: 1px solid #abb8fc;border-right: 1px solid #abb8fc;float: left;border-radius:7px 0 0 0">
                    <div style="width: 100%;height: 5%;text-align: center"></div>
                    <div style="width: 100%;height: 55%;text-align: center">
                        <img src="static/images/InOrUp/shouji.png" style="width: 20px;height: 26px"/>
                    </div>
                    <div style="width: 100%;height: 40%;text-align: center;color: #abb8fc;">Phone</div>
                </div>
                <div style="width: 30%;height:100%;float: left;background-color:#778899;border-left: 1px solid #778899;border-top: 1px solid #778899;border-right: 1px solid #778899;float: left;border-radius:0 7px 0 0">
                    <div style="width: 100%;height: 5%;text-align: center"></div>
                    <div style="width: 100%;height: 55%;text-align: center">
                        <img src="static/images/InOrUp/mail-2.png" style="width: 20px;height: 20px"/>
                    </div>
                    <div style="width: 100%;height: 40%;text-align: center;color: #ffffff;">Mail</div>
                </div>
                <%--<div id="zhuce" onclick="ToLogin()" style="float:right;">Login</div>--%>
            </div>
            <div style=" width: 80%;
                margin: 0 auto;
                text-align: left;border: 1px solid #778899; ">
                <div id="CodeSignIn" style="display:block">
                    <div class="passWord" style="padding:3% 0 3% 3%">
                        <lable style="color:#808080">&nbsp;&nbsp;&nbsp;&nbsp;<img src="static/images/InOrUp/mail778899.png" style="width: 16px;height: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                        <input type="text" name="username1" id="mail" placeholder="Your Mail" style="width: 55.5%">
                    </div>
                    <div class="passWord" style="padding:3% 0 3% 3%">
                        <lable style="color:#808080">&nbsp;&nbsp;&nbsp;&nbsp;<img src="static/images/InOrUp/pwd778899.png" style="width: 16px;height: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                        <input type="text" name="Password" id="Epwd" placeholder="Password">
                    </div>
                    <div class="passWord" style="padding:3% 0 3% 3%">
                        <lable style="color:#808080">&nbsp;&nbsp;&nbsp;&nbsp;<img src="static/images/InOrUp/pwd778899.png" style="width: 16px;height: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                        <input type="text" name="Password" id="ReEpwd" placeholder="Re-Type Password">
                    </div>
                    <div style="padding:3% 0 3% 3%;height: 50px;">
                        <div style="float:left;width: 20%;height: 100%">
                            Your region:
                        </div>
                        <div style="float:left;width: 60%">
                            <select class="selectpicker countrypicker" data-live-search="true" data-default="Hong Kong" data-flag="true" id="country1" style="float: right;display: block"></select>
                        </div>
                        <div onclick="flash()" style="float:left;width: 20%;height: 100%;border:1px solid #000;color:#abb8fc;border:1px solid #abb8fc; border-radius: 7px;text-align: center;line-height: 30px">
                            Refresh
                        </div>
                    </div>
                    <div class="other_login" style="margin-top: 40px;">
                        <span>By clicking the button below, I agree to the User Agreement and Privacy Policy.</span>
                        <button class="login_btn" onclick="Register2()" style="margin-top: 0px;background-color: #778899;background-image:none">Register</button>
                    </div>

                </div>

                </form>
                <div class="other_choose">

                </div>
            </div>
        </div>

    </div>
</div>
</body>

</html>


<script>
    function Phone() {
        document.getElementById("PhonePart").style.display = "block";
        document.getElementById("MailPart").style.display = "none";
    }
    function Mail() {
        document.getElementById("PhonePart").style.display = "none";
        document.getElementById("MailPart").style.display = "block";
    }
    function flash(){
        window.location.reload()
    }
</script>

<script>
    // window.onload = function(){
    //     var url=document.location.href;  //获取浏览器访问栏里的地址
    //     alert(url)
    //     if( url.indexOf("r=")==-1 ){    //判断地址后面是否多了某些值，没有就进方法里进行刷新
    //         var t = new Date();
    //         window.location.href = url + "?r="+t.getTime();
    //         // if( url.indexOf("a=")==-1 ){    //判断地址后面是否多了某些值，没有就进方法里进行刷新
    //         //     var t = new Date();
    //         //     window.location.href = url + "?a="+t.getTime();
    //         // }
    //     }
    // }
    var input = document.querySelector("#username1");
    var iti = window.intlTelInput(input, {
        preferredCountries: ['hk', 'us'],
        // separateDialCode: true,
        utilsScript: "static/js/build/js/utils.js",
    });

</script>

<script>
    //60秒之后获取验证码
    var wait = 60;

    function time(obj) {
        if (wait == 60) {
            var phone = $("#username1").val()
            var numberType = iti.getSelectedCountryData();
            var AreaCode = numberType.dialCode

            var data = "{\"type\" : \"Phone\" , \"purpose\" : \"register\" , \"username\" : \"" + phone +
                "\" , \"AreaCode\" : \"" + AreaCode + "\"}"
            $.ajax({
                url: "App/getCode.jhtml",
                type: "post",
                contentType: 'application/json; charset=UTF-8',
                data: data,
                success: function (data) {
                    if (data != "error"){
                        code = data
                    }else{
                        alert("The mobile phone number has been used.")
                }
                },
                error: function () {
                    alert("发送未知错误！ 无法发送验证码！")
                }
            });
        }
        if (wait == 0) {
            obj.removeAttribute("disabled");
            obj.innerHTML = "SMS";

            wait = 60;
        } else {
            obj.setAttribute("disabled", true);
            obj.innerHTML = wait + "s";
            wait--;
            setTimeout(function () {
                    time(obj)
                },
                1000)
        }
    }

    function time2(obj) {
        if (wait == 60) {
            var mail = $("#mail").val()
            var numberType = iti.getSelectedCountryData();
            var AreaCode = numberType.dialCode

            var data = "{\"type\" : \"Mail\" , \"purpose\" : \"register\" , \"username\" : \"" + mail +
                "\" , \"AreaCode\" : \"" + AreaCode + "\"}"
            console.log("正在发送验证码")
            $.ajax({
                url: "App/getCode.jhtml",
                type: "post",
                contentType: 'application/json; charset=UTF-8',
                data: data,
                success: function (data) {
                    if (data != "error"){
                        code = data
                        console.log("发送成功")
                        alert("Sending Success!\nIf you don't see the email, check other places it might be, like your junk, spam, social, or other folders.")
                    }else{
                        alert("The mail has been used.")
                    }
                },
                error: function () {
                    alert("发送未知错误！ 无法发送验证码！")
                }
            });
        }
        if (wait == 0) {
            obj.removeAttribute("disabled");
            obj.innerHTML = "SMS";

            wait = 60;
        } else {
            obj.setAttribute("disabled", true);
            obj.innerHTML = wait + "s";
            wait--;
            setTimeout(function () {
                    time(obj)
                },
                1000)
        }
    }
</script>


<script>
    function Register() {
        var phone = $("#username1").val()
        console.log(phone)
        var SMSCode = $("#SMSCode").val()
        console.log(SMSCode)
        var pwd = $("#Password").val()

        var country = $("#country1").val()
        console.log(country)
        if (SMSCode == code) {
            var data = "{\"type\" : \"Phone\" , \"username\" : \"" + phone +
                "\" , \"code\" : \"" + SMSCode + "\" , \"pwd\" : \"" + pwd + "\" , \"country\" : \"" + country + "\"}"
            console.log(data)
            $.ajax({
                url: "App/Userregister.jhtml",
                type: "post",
                contentType: 'application/json; charset=UTF-8',
                data: data,
                success: function (data) {
                    window.location.href = 'login.jhtml';
                },
                error: function () {
                    alert("注册失败！")
                }
            });
        }
    }

    function Register2() {
        var mail = $("#mail").val()
        console.log(mail)
        var Epwd = $("#Epwd").val()

        var ReEpwd = $("#ReEpwd").val()

        var country = $("#country1").val()
        console.log(country)
        var data = "{\"type\" : \"Mail\" , \"username\" : \"" + mail +
            "\" , \"pwd\" : \"" + Epwd + "\" , \"country\" : \"" + country + "\"}"
        console.log(data)
        $.ajax({
            url: "App/Userregister.jhtml",
            type: "post",
            contentType: 'application/json; charset=UTF-8',
            data: data,
            success: function (data) {
                window.location.href = 'App/LastRegister.jhtml';
            },
            error: function () {
                alert("注册失败！")
            }
        });
    }
</script>

<script>
    function ToLogin() {
        window.location.href = 'login.jhtml';
    }
</script>