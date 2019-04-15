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

    <title>登录页面</title>

    <link rel="stylesheet" type="text/css" href="static/css/login.css">
    <link rel="stylesheet" type="text/css" href="static/css/login2.css">
    <script src="static/js/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="static/js/build/css/intlTelInput.css">
    <link rel="stylesheet" href="static/js/build/css/demo.css">
    <script src="static/js/build/js/intlTelInput.js"></script>

</head>
<body style="background-image:url('static/images/bg.png');height: auto;width:100%;margin: 0;padding: 0">
<div  style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
</div>
<div style="width:100%;height:100%;">
    <div id="zhuce" onclick="ToLogin()">Login</div>
    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">

        </div>
        <div style="    width: 80%;
            margin: 0 auto;
            text-align: left;">
            <div id="CodeSignIn" style="display:block">
                <div class="userName">
                    <input type="text" name="username1" id="username1" placeholder="Telephone"
                           pattern="[0-9]{8,13}" style="width: 92%"
                           oninvalid="setCustomValidity('Please enter the correct mobile phone number!');"
                           oninput="setCustomValidity('');">
                    <button
                            style="width:23%;height:100%;border-radius: 5px;border:none;background-color: #6d83f8;color: #ffffff"
                            onclick="time(this)">SMS</button>
                </div>
                <div class="passWord">
                    <lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                    <input type="text" name="SMSCode" id="SMSCode" placeholder="Verification Code">
                </div>
                <div class="passWord">
                    <lable style="color:#808080">Pwd:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                    <input type="text" name="Password" id="Password" placeholder="Password">
                </div>
                <button class="login_btn" onclick="Register()">Register</button>
            </div>

            </form>
            <div class="other_login">
                <span>By clicking the button below, I agree to the User Agreement and Privacy Policy.</span>
            </div>
            <div class="other_choose">

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
        preferredCountries: ['cn', 'us'],
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
</script>


<script>
    function Register() {
        var phone = $("#username1").val()
        console.log(phone)
        var SMSCode = $("#SMSCode").val()
        console.log(SMSCode)
        var pwd = $("#Password").val()
        if (SMSCode == code) {
            var data = "{\"type\" : \"Phone\" , \"username\" : \"" + phone +
                "\" , \"code\" : \"" + SMSCode + "\" , \"pwd\" : \"" + pwd + "\"}"
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
</script>

<script>
    function ToLogin() {
        window.location.href = 'login.jhtml';
    }
</script>