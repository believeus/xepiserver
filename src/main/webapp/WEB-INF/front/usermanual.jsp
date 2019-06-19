<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/17
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>User manual</title>
</head>
<body>
<div id="container" style="width: 100%;height: 100%;">
    <jsp:include page="header.jsp"></jsp:include>
    <div style="width: 85%;height: auto;margin: 0 auto;">
        <div>
            <h3 style="margin-top: 30px;text-align: center;">
                EpiAging App User Manual
            </h3>
            <h4>1.Download the IOS App from Apple Store or Android App from Google Play Store</h4>
            <h4>2.Register accounts by your e-mail and accept the customer data consent</h4>
        </div>
        <div style="width: 100%;height: auto;">
            <img src="static/images/usermanual/m1.png" style="width: 90%;height: auto;">
        </div>
        <div style="width: 100%;height: auto;padding-top: 20px">
            <img src="static/images/usermanual/m2.png" style="width: 90%;height: auto;">
        </div>
        <p> 2.1 Click the Agree to accept Customer Consent.</p>
        <div style="width: 100%;height: auto">
            <img src="static/images/usermanual/m4.png" style="width: 90%;height: auto;">
        </div>
        <p>2.2You can use your registered email address & password that you create to Login to the App next time.</p>
        <div style="width: 100%;height: auto;">
            <img src="static/images/usermanual/m3.png" style="width: 90%;height: auto;">
        </div>
        <h4>3. Purchase the epiAging test kit by clicking epiAging test nitriduction page or SHOP.</h4>
        <div>
            <img src="static/images/usermanual/m6.png" style="width: 90%;height: auto;">
        </div>
        <div style="width: 100%;height: auto;padding-top: 20px">
            <img src="static/images/usermanual/m7.png" style="width: 90%;height: auto;">
        </div>
        <h5>3.1 Fill in the receipt information</h5>
        <div style="width: 100%;height: auto;">
            <img src="static/images/usermanual/m8.png" style="width: 90%;height: auto;">
        </div>
        <h5>3.2 Confirm the information On the screenshot below, Confirm your address and payment.</h5>
        <div style="width: 100%;height: auto;">
            <img src="static/images/usermanual/m9.png" style="width: 90%;height: auto;">
        </div>
        <h5>3.3 Settle down the payment by Paypal or credit card.On the screenshot, replace 1 and by with “Using Paypal
            step 1: type in your email, Using Paypal step 2: click Next”.</h5>
        <div style="width: 100%;height: auto;">
            <img src="static/images/usermanual/m90.png" style="width: 90%;height: auto;">
        </div>
        <h4> 4. We will send you the saliva collection kit. When you receive the kit please follow the instructions to
            collect your saliva and send it back to our lab in pay on delivery.</h4>
        <h5>4.1 When you receive the saliva collection kit, click here to enter the bar code on the saliva collection
            tube.</h5>
        <div style="width: 100%;height: auto;">
            <img src="static/images/usermanual/m91.png" style="width: 90%;height: auto;">
        </div>
        <div style="width: 100%;height: auto;;padding-top: 20px;">
            <img src="static/images/usermanual/m92.png" style="width: 90%;height: auto;">
        </div>
        <h4>5. Fill in the questionnaire (optional)</h4>
        <div style="width: 100%;height: auto;">
            <img src="static/images/usermanual/m93.png" style="width: 90%;height: auto;">
        </div>
        <div style="width: 100%;height: auto;padding-top: 20px;">
            <img src="static/images/usermanual/m94.png" style="width: 90%;height: auto;">
        </div>
        <h5>5.1For example: click into Life Style Questionnaire and what you need to do is to simply slide the slider to
            enter your data.</h5>
        <div style="width: 100%;height: auto;padding-top: 20px;">
            <img src="static/images/usermanual/m95.png" style="width: 90%;height: auto;">
        </div>
        <h4>6. We will update your epiAging test report to your App and you can check it by clicking “My Report” at the
            Home page.</h4>
        <div style="width: 100%;height: auto;">
            <img src="static/images/usermanual/m96.png" style="width: 90%;height: auto;">
        </div>
        <h5>6.1 when the report comes out, you can get your report by typing in your barcode and clicking “Get Your
            Report”; Here is a sample report.</h5>
        <div style="width: 100%;height: auto;">
            <img src="static/images/usermanual/m97.png" style="width: 90%;height: auto;">
        </div>
        <h4>7.Make Lifestyle changes & improve your health</h4>
        <h5>7.1 We will also analyze your lifestyle data. You keep making changes in lifestyle and report. You get
            personalized reports on your progress.You can also get free report by fill in the Lifestyle
            questionnaire.</h5>
        <div style="width: 100%;height: auto;">
            <img src="static/images/usermanual/m98.png" style="width: 90%;height: auto;">
        </div>
    </div>

    <div id="all-right" style="width: 100%;height: auto;font-family: arial;">
        <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
            @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
        </div>
    </div>
    <jsp:include page="footnav.jsp"></jsp:include>
</div>
</body>
</html>
