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

</head>
<body style="margin: 0;padding: 0">
<!--头部开始-->
<div style="width: 100%;height: 50px;">
    <jsp:include page="header.jsp"></jsp:include>
</div>
    <div style="background-image:url('static/images/bg.png');width: 100%;height: 667px;">
<div style="width:100%;height:100%;">
    <div id="zhuce" onclick="ToReg()">Register</div>
    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="static/images/InOrUp/com_logo.png" style="width: 100%;height: 100%"/>
        </div>
        <div style="    width: 80%;
            margin: 0 auto;
            text-align: left;">
            <div id="CodeSignIn" style="display:block">
                <div class="userName">
                    <input type="text" name="username1"  id="username1" style="width:92%" placeholder="Telephone" pattern="[0-9]{8,13}"  style="width: 48%" oninvalid="setCustomValidity('Please enter the correct mobile phone number!');"
                           oninput="setCustomValidity('');">
                    <button
                            style="width:23%;height:100%;border-radius: 5px;border:none;background-color: #6d83f8;color: #ffffff" onclick="time(this)">SMS</button>
                </div>
                <div class="passWord">
                    <lable style="color:#808080">&nbsp;&nbsp;&nbsp;&nbsp;<img src="static/images/InOrUp/scode.png" style="width: 16px;height: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                    <input type="text" name="SMSCode" id="SMSCode" placeholder="Verification Code" >
                </div>
                <div class="choose_box">
                    <div>
                        <lable style="color:#696969"  onclick="Pwd()">Sign in By account</lable>
                    </div>
                    <a href="javascript:void(0);" style="text-decoration:none;color: #696969">Forget it</a>
                </div>
                <div class="other_login" style="margin-top: 40px;">
                    <span>By clicking the button below, I agree to the User Agreement and Privacy Policy.</span>
                    <button class="login_btn" onclick="login_1()" style="margin-top: 0px;">Login</button>
                </div>
            </div>

            <div id="PWDSignIn" style="display:none">
                <div class="userName">
                    <lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                    <input type="text" name="username2" id="username2" placeholder="Telephone / Mail" style="width: 60%" >
                </div>
                <div class="passWord">
                    <lable style="color:#808080">&nbsp;&nbsp;&nbsp;&nbsp;<img src="static/images/InOrUp/pwd.png" style="width: 16px;height: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                    <input type="password" name="password" id="password" placeholder="Password" style="width:60%">
                </div>
                <div class="choose_box">
                    <div>
                        <lable style="color:#696969" onclick="SMS()">Sign in By Code</lable>
                    </div>
                    <a href="javascript:void(0);" style="text-decoration:none;color: #808080">Forget it</a>
                </div>
                <div class="other_login" style="margin-top: 40px;">
                    <span>By clicking the button below, I agree to the User Agreement and Privacy Policy.</span>
                    <button class="login_btn" onclick="login_2()" style="margin-top: 0px;">Login</button>
                </div>

            </div>

            <div class="other_choose">

            </div>
        </div>
    </div>
</div>
    </div>
</body>

</html>

<script>
    function Pwd() {
        document.getElementById("PWDSignIn").style.display = "block";
        document.getElementById("CodeSignIn").style.display = "none";
    }

    function SMS() {
        document.getElementById("PWDSignIn").style.display = "none";
        document.getElementById("CodeSignIn").style.display = "block";
    }
</script>

<script>
    //60秒之后获取验证码
    var wait = 60;

    function time(obj) {
        if (wait == 60) {
            var phone = $("#username1").val()

            var numberType = iti.getSelectedCountryData();
            var AreaCode = numberType.dialCode

            console.log(AreaCode)

            var data = "{\"type\" : \"Phone\" , \"purpose\" : \"login\" , \"username\" : \"" + phone +
                "\" , \"AreaCode\" : \"" + AreaCode + "\"}"
            $.ajax({
                url: "App/getCode.jhtml",
                type: "post",
                contentType: 'application/json; charset=UTF-8',
                data: data,
                success: function(data) {
                    alert("Send Successful!")
                    if (data != null) {
                        code = data
                    }
                },
                error: function() {
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
            setTimeout(function() {
                    time(obj)
                },
                1000)
        }
    }
</script>

<script>
    var input = document.querySelector("#username1");
    var iti = window.intlTelInput(input, {
        // allowDropdown: false,
        // autoHideDialCode: false,
        // autoPlaceholder: "off",
        // dropdownContainer: document.body,
        // excludeCountries: ["us"],
        // formatOnDisplay: false,
        // geoIpLookup: function(callback) {
        //   $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
        //     var countryCode = (resp && resp.country) ? resp.country : "";
        //     callback(countryCode);
        //   });
        // },
        // hiddenInput: "full_number",
        // initialCountry: "auto",
        // localizedCountries: { 'de': 'Deutschland' },
        // nationalMode: false,
        // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
        // placeholderNumberType: "MOBILE",
        preferredCountries: ['hk' , 'us'],
        // separateDialCode: true,
        utilsScript: "static/js/build/js/utils.js",
    });

</script>


<script>
    function login_1() {
        var numberType = iti.getSelectedCountryData();
        console.log(numberType.dialCode)

        var numberType = iti.getSelectedCountryData();
        var AreaCode = numberType.dialCode
        console.log(AreaCode)
        var phone = $("#username1").val()
        console.log(phone)
        var SMSCode = $("#SMSCode").val()
        console.log(SMSCode)
        if (SMSCode == code) {
            var data = "{\"type\" : \"Phone\" , \"verification\" : \"2\" , \"username\" : \"" + phone +
                "\" , \"code\" : \"" + SMSCode + "\"}"
            console.log(data)
            $.ajax({
                url: "App/Userlogin.jhtml",
                type: "post",
                contentType: 'application/json; charset=UTF-8',
                data: data,
                success: function(data) {
                    if(data == "error"){
                        alert("验证码不正确")
                    }else{
                        window.location.href = 'index.jhtml';
                    }
                },
                error: function() {
                    alert("Log In Error！")
                }
            });
        }
    }

    function login_2() {
        var phone = $("#username2").val()
        console.log(phone)
        var pwd = $("#password").val()
        console.log(pwd)
        if (pwd != null) {
            var data = "{\"type\" : \"Phone\" , \"verification\" : \"1\" , \"username\" : \"" + phone +
                "\" , \"pwd\" : \"" + pwd + "\"}"
            $.ajax({
                url: "App/Userlogin.jhtml",
                type: "post",
                contentType: 'application/json; charset=UTF-8',
                data: data,
                success: function(data) {
                    console.log(data)
                    if(data == "error"){
                        alert("Please check the account status.")
                    }else{
                        window.location.href = 'index.jhtml';
                    }
                },
                error: function() {
                    alert("Log In Error！")
                }
            });
        }
    }
</script>

<script>
    function ToReg() {
        window.location.href = 'register.jhtml';
    }
</script>