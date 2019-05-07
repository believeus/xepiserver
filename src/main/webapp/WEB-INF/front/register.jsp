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
    <link rel="stylesheet" href="static/css/select_gj.css">

    <script src="static/js/jquery-2.1.0.min.js"></script>
    <script src="static/js/build/js/intlTelInput.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/select_gj.min.js"></script>
    <script src="static/js/select2_1.js"></script>



</head>
<body style="margin: 0;padding: 0">
<div  style="width: 100%;height: 50px;">
    <jsp:include page="header.jsp"></jsp:include>
    <div id="popDiv"
         style="z-index: 99; display: none;width: 100%;height: 100%; position: absolute;top:0;left: 0; background-color: #efefef;text-align: center;">
        <img src="static/images/loading.gif" style="width: 80px;height: 80px;margin-top: 50%"/>
    </div>
</div>
<div style="background-image:url('static/images/bg.png');width:100%;height:667px;">
    <div style="width: 90%;height: auto;margin: 0 auto;">
            <div style="width: 100%;height: auto;font-family: arial;font-size: 20px;font-weight: 500;line-height: 80px;font-weight:600;">Register your kit</div>
            <div style="width: 100%;height: auto;font-family: arial;font-size: 16px;color: #666666;">Create an account ot register and link your kit.</div>
            <div style="width: 100%;height: 20px;"></div>
            <div style="width: 90%;height: 40px;margin: 0 auto;">
                <input type="text"placeholder="First name"value=""  name="firstname" id="firstname" style="width: 90%;height: 40px;margin: 0 auto; border: 1px solid #C0C0C0;border-radius: 3px;font-size: 16px;font-family: arial;font-weight: 500; padding-left: 12px;" />
            </div>
            <div style="width: 100%;height: 15px;"></div>
            <div style="width: 90%;height: 40px;margin: 0 auto;">
                <input type="text" placeholder="Last name" name="lastname" id="lastname" style="width: 90%;height: 40px;margin: 0 auto; border: 1px solid #C0C0C0;border-radius: 3px;font-size: 16px;font-family: arial;font-weight: 500; padding-left: 12px;" />
            </div>
            <div style="width: 100%;height: 15px;"></div>
            <div style="width: 90%;height: 40px;margin: 0 auto;">
                <input type="email" placeholder="Email" name="mail" id="mail" style="width: 90%;height: 40px;margin: 0 auto; border: 1px solid #C0C0C0;border-radius: 3px;font-size: 16px;font-family: arial;font-weight: 500; padding-left: 12px;" />
            </div>
            <div style="width: 100%;height: 15px;"></div>
            <div style="width: 90%;height: 40px;margin: 0 auto;">
                <input type="password" placeholder="Create a password" name="Epwd" id="Epwd" style="width: 90%;height: 40px;margin: 0 auto; border: 1px solid #C0C0C0;border-radius: 3px;font-size: 16px;font-family: arial;font-weight: 500; padding-left: 12px;" />
            </div>
            <div style="width: 100%;height: 15px;"></div>
            <div style="width: 90%;height: 40px;margin: 0 auto;">
                <input type="password" placeholder="Confirm password" name="ReEpwd" id="ReEpwd" style="width: 90%;height: 40px;margin: 0 auto; border: 1px solid #C0C0C0;border-radius: 3px;font-size: 16px;font-family: arial;font-weight: 500; padding-left: 12px;" />
            </div>
            <div style="width: 100%;height: 15px;"></div>
            <div style="width: 90%;height: 50px;margin: 0 auto;">
                <div style="padding:3% 0 3% 3%;height: 50px;">
                    <div style="float:left;width: 20%;height: 100%">
                        Your region:
                    </div>
                    <div style="float:left;width: 60%">
                        <select name="country" class="fastbannerform__country" style="width: 100%;height: 35px;" id="country2">
                            <option value="ASA" title="AA" selected="selected">America</option>
                            <option value="CAN" title="CA" >Canada</option>
                            <option value="HKG" title="HK" >Hong Kong</option>
                            <option value="AND" title="AD" >Andorra</option>
                            <option value="ARE" title="AE" >United Arab Emirates</option>
                            <option value="AFG" title="AF" >Afghanistan</option>
                            <option value="ATG" title="AG" >Antigua and Barbuda</option>
                            <option value="ALB" title="AL" >Albania</option>
                            <option value="ARM" title="AM" >Armenia</option>
                            <option value="AGO" title="AO" >Angola</option>
                            <option value="ARG" title="AR" >Argentina</option>
                            <option value="AUT" title="AT" >Austria</option>
                            <option value="AUS" title="AU" >Australia</option>
                            <option value="ABW" title="AW" >Aruba</option>
                            <option value="AZE" title="AZ" >Azerbaijan</option>
                            <option value="BIH" title="BA" >Bosnia and Herzegovina</option>
                            <option value="BRB" title="BB" >Barbados</option>
                            <option value="BGD" title="BD" >Bangladesh</option>
                            <option value="BEL" title="BE" >Belgium</option>
                            <option value="BFA" title="BF" >Burkina Faso</option>
                            <option value="BGR" title="BG" >Bulgaria</option>
                            <option value="BHR" title="BH" >Bahrain</option>
                            <option value="BDI" title="BI" >Burundi</option>
                            <option value="BEN" title="BJ" >Benin</option>
                            <option value="BMU" title="BM" >Bermuda</option>
                            <option value="BRN" title="BN" >Brunei</option>
                            <option value="BOL" title="BO" >Bolivia</option>
                            <option value="BRA" title="BR" >Brazil</option>
                            <option value="BHS" title="BS" >Bahamas</option>
                            <option value="BTN" title="BT" >Bhutan</option>
                            <option value="BWA" title="BW" >Botswana</option>
                            <option value="BLR" title="BY" >Belarus</option>
                            <option value="BLZ" title="BZ" >Belize</option>
                            <option value="COD" title="CD" >Democratic Republic of the Congo</option>
                            <option value="CAF" title="CF" >Central African Republic</option>
                            <option value="COG" title="CG" >Democratic Republic of the Congo</option>
                            <option value="CHE" title="CH" >Switzerland</option>
                            <option value="CHL" title="CL" >Chile</option>
                            <option value="CMR" title="CM" >Cameroon</option>
                            <option value="CHN" title="CN" >China</option>
                            <option value="COL" title="CO" >Colombia</option>
                            <option value="CRI" title="CR" >Costa Rica</option>
                            <option value="CUB" title="CU" >Cuba</option>
                            <option value="CPV" title="CV" >Cape Verde</option>
                            <option value="CYP" title="CY" >Cyprus</option>
                            <option value="CZE" title="CZ" >Czech Republic</option>
                            <option value="DEU" title="DE" >Germany</option>
                            <option value="DJI" title="DJ" >Djibouti</option>
                            <option value="DNK" title="DK" >Denmark</option>
                            <option value="DMA" title="DM" >Dominica</option>
                            <option value="DOM" title="DO" >Dominican Republic</option>
                            <option value="DZA" title="DZ" >Algeria</option>
                            <option value="ECU" title="EC" >Ecuador</option>
                            <option value="EST" title="EE" >Estonia</option>
                            <option value="EGY" title="EG" >Egypt</option>
                            <option value="ERI" title="ER" >Eritrea</option>
                            <option value="ESP" title="ES" >Spain</option>
                            <option value="ETH" title="ET" >Ethiopia</option>
                            <option value="FIN" title="FI" >Finland</option>
                            <option value="FJI" title="FJ" >Fiji</option>
                            <option value="FLK" title="FK" >Falkland Islands</option>
                            <option value="FSM" title="FM" >Micronesia</option>
                            <option value="FRO" title="FO" >Faroe Islands</option>
                            <option value="FRA" title="FR" >France</option>
                            <option value="GAB" title="GA" >Gabon</option>
                            <option value="GBR" title="GB" >United Kingdom</option>
                            <option value="GRD" title="GD" >Grenada</option>
                            <option value="GEO" title="GE" >Georgia</option>
                            <option value="GHA" title="GH" >Ghana</option>
                            <option value="GIB" title="GI" >Gibraltar</option>
                            <option value="GMB" title="GM" >Gambia</option>
                            <option value="GIN" title="GN" >Guinea</option>
                            <option value="GNQ" title="GQ" >Equatorial Guinea</option>
                            <option value="GRC" title="GR" >Greece</option>
                            <option value="GTM" title="GT" >Guatemala</option>
                            <option value="GNB" title="GW" >Guinea-Bissau</option>
                            <option value="GUY" title="GY" >Guyana</option>
                            <option value="HND" title="HN" >Honduras</option>
                            <option value="HRV" title="HR" >Croatia</option>
                            <option value="HTI" title="HT" >Haiti</option>
                            <option value="HUN" title="HU" >Hungary</option>
                            <option value="IDN" title="ID" >Indonesia</option>
                            <option value="IRL" title="IE" >Ireland</option>
                            <option value="ISR" title="IL" >Israel</option>
                            <option value="IND" title="IN" >India</option>
                            <option value="IRQ" title="IQ" >Iraq</option>
                            <option value="IRN" title="IR" >Iran</option>
                            <option value="ISL" title="IS" >Iceland</option>
                            <option value="ITA" title="IT" >Italy</option>
                            <option value="JAM" title="JM" >Jamaica</option>
                            <option value="JOR" title="JO" >Jordan</option>
                            <option value="JPN" title="JP" >Japan</option>
                            <option value="KEN" title="KE" >Kenya</option>
                            <option value="KGZ" title="KG" >Kyrgyzstan</option>
                            <option value="KHM" title="KH" >Cambodia</option>
                            <option value="KIR" title="KI" >Kiribati</option>
                            <option value="COM" title="KM" >Comoros</option>
                            <option value="KNA" title="KN" >Saint Kitts and Nevis</option>
                            <option value="PRK" title="KP" >North Korea</option>
                            <option value="KOR" title="KR" >South Korea</option>
                            <option value="KWT" title="KW" >Kuwait</option>
                            <option value="CYM" title="KY" >Cayman Islands</option>
                            <option value="KAZ" title="KZ" >Kazakhstan</option>
                            <option value="LAO" title="LA" >Laos</option>
                            <option value="LBN" title="LB" >Lebanon</option>
                            <option value="LCA" title="LC" >Saint Lucia</option>
                            <option value="LIE" title="LI" >Liechtenstein</option>
                            <option value="LKA" title="LK" >Sri Lanka</option>
                            <option value="LBR" title="LR" >Liberia</option>
                            <option value="LSO" title="LS" >Lesotho</option>
                            <option value="LTU" title="LT" >Lithuania</option>
                            <option value="LUX" title="LU" >Luxembourg</option>
                            <option value="LVA" title="LV" >Latvia</option>
                            <option value="LBY" title="LY" >Libya</option>
                            <option value="MAR" title="MA" >Morocco</option>
                            <option value="MCO" title="MC" >Monaco</option>
                            <option value="MDA" title="MD" >Moldova</option>
                            <option value="MNE" title="ME" >Montenegro</option>
                            <option value="MDG" title="MG" >Madagascar</option>
                            <option value="MKD" title="MK" >Macedonia</option>
                            <option value="MLI" title="ML" >Mali</option>
                            <option value="MMR" title="MM" >Myanmar</option>
                            <option value="MNG" title="MN" >Mongolia</option>
                            <option value="MAC" title="MO" >Macao</option>
                            <option value="MRT" title="MR" >Mauritania</option>
                            <option value="MLT" title="MT" >Malta</option>
                            <option value="MUS" title="MU" >Mauritius</option>
                            <option value="MDV" title="MV" >Maldives</option>
                            <option value="MWI" title="MW" >Malawi</option>
                            <option value="MEX" title="MX" >Mexico</option>
                            <option value="MYS" title="MY" >Malaysia</option>
                            <option value="MOZ" title="MZ" >Mozambique</option>
                            <option value="NAM" title="NA" >Namibia</option>
                            <option value="NER" title="NE" >Niger</option>
                            <option value="NGA" title="NG" >Nigeria</option>
                            <option value="NIC" title="NI" >Nicaragua</option>
                            <option value="NLD" title="NL" >Netherlands</option>
                            <option value="NOR" title="NO" >Norway</option>
                            <option value="NPL" title="NP" >Nepal</option>
                            <option value="NRU" title="NR" >Nauru</option>
                            <option value="NZL" title="NZ" >New Zealand</option>
                            <option value="OMN" title="OM" >Oman</option>
                            <option value="PAN" title="PA" >Panama</option>
                            <option value="PER" title="PE" >Peru</option>
                            <option value="PNG" title="PG" >Papua New Guinea</option>
                            <option value="PHL" title="PH" >Philippines</option>
                            <option value="PAK" title="PK" >Pakistan</option>
                            <option value="POL" title="PL" >Poland</option>
                            <option value="PRI" title="PR" >Puerto Rico</option>
                            <option value="PSE" title="PS" >Palestine</option>
                            <option value="PRT" title="PT" >Portugal</option>
                            <option value="PLW" title="PW" >Palau</option>
                            <option value="PRY" title="PY" >Paraguay</option>
                            <option value="QAT" title="QA" >Qatar</option>
                            <option value="ROU" title="RO" >Romania</option>
                            <option value="SRB" title="RS" >Serbia</option>
                            <option value="RUS" title="RU" >Russia</option>
                            <option value="RWA" title="RW" >Rwanda</option>
                            <option value="SAU" title="SA" >Saudi Arabia</option>
                            <option value="SLB" title="SB" >Solomon Islands</option>
                            <option value="SYC" title="SC" >Seychelles</option>
                            <option value="SDN" title="SD" >Sudan</option>
                            <option value="SWE" title="SE" >Sweden</option>
                            <option value="SGP" title="SG" >Singapore</option>
                            <option value="SVN" title="SI" >Slovenia</option>
                            <option value="SVK" title="SK" >Slovak Republic</option>
                            <option value="SLE" title="SL" >Sierra Leone</option>
                            <option value="SMR" title="SM" >San Marino</option>
                            <option value="SEN" title="SN" >Senegal</option>
                            <option value="SOM" title="SO" >Somalia</option>
                            <option value="SUR" title="SR" >Suriname</option>
                            <option value="STP" title="ST" >Sao Tome and Principe</option>
                            <option value="SLV" title="SV" >El Salvador</option>
                            <option value="SYR" title="SY" >Syria</option>
                            <option value="SWZ" title="SZ" >Swaziland</option>
                            <option value="TCD" title="TD" >Chad</option>
                            <option value="TGO" title="TG" >Togo</option>
                            <option value="THA" title="TH" >Thailand</option>
                            <option value="TJK" title="TJ" >Tajikistan</option>
                            <option value="TKM" title="TM" >Turkmenistan</option>
                            <option value="TUN" title="TN" >Tunisia</option>
                            <option value="TON" title="TO" >Tonga</option>
                            <option value="TUR" title="TR" >Turkey</option>
                            <option value="TTO" title="TT" >Trinidad and Tobago</option>
                            <option value="TUV" title="TV" >Tuvalu</option>
                            <option value="TWN" title="TW" >Taiwan</option>
                            <option value="TZA" title="TZ" >Tanzania</option>
                            <option value="UKR" title="UA" >Ukraine</option>
                            <option value="UGA" title="UG" >Uganda</option>
                            <option value="URY" title="UY" >Uruguay</option>
                            <option value="UZB" title="UZ" >Uzbekistan</option>
                            <option value="VCT" title="VC" >Saint Vincent And The Grenadine</option>
                            <option value="VEN" title="VE" >Venezuela</option>
                            <option value="VGB" title="VG" >British Virgin Islands</option>
                            <option value="VNM" title="VN" >Vietnam</option>
                            <option value="VUT" title="VU" >Vanuatu</option>
                            <option value="WLF" title="WF" >Wallis and Futuna</option>
                            <option value="WSM" title="WS" >Western Samoa</option>
                            <option value="YEM" title="YE" >Yemen</option>
                            <option value="ZAF" title="ZA" >South Africa</option>
                            <option value="ZMB" title="ZM" >Zambia</option>
                            <option value="ZWE" title="ZW" >Zimbabwe</option>
                        </select>
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 30px;"></div>
            <div style="width: 90%;height: auto;color: #666666;margin: 0 auto;">
                <input type="checkbox" name="checkbox" id="checkbox" value="checkbox" style="width:17px;height:auto">I have read and agree to the <a href="index.html"style="text-decoration: none;"><i style="color: #E6BF73;">Terms of Service </a> </i >and <a><i style="color: #E6BF73;"> Privacy Statement</i></a>.
            </div>
            <div style="width: 100%;height: 5px;"></div>
            <div style="width: 90%;height: 50px;margin: 0 auto;">
            <div class="other_login" style="height: 40px;margin: 0 auto;">
                <button class="login_btn" onclick="Register2()" style="margin: 0">Register</button>
            </div>
            </div>
        </div>

        <div id="all-right"style="width: 90%;height: auto;font-family: arial;margin: 0 auto;">
            <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;">
                @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
            </div>
        </div>
    </div>
</div>
</div>
</body>

</html>


<script>
    function Register2() {
        if($('#checkbox').is(':checked')) {

        var mail = $("#mail").val()
        if (mail == null || mail == 0){
            alert("Mail cannot be empty!")
            return false
        }


        console.log(mail)
        var Epwd = $("#Epwd").val()

        var ReEpwd = $("#ReEpwd").val()

        var Fname = $("#firstname").val()

        var Lname = $("#lastname").val()

        var name = Fname + "-" + Lname

        if (Epwd != ReEpwd){
            alert("Entered passwords differ!")
            return false;
        }


        var country = $("#country2").find("option:selected").text();
        console.log(country)
        var data = "{\"type\" : \"Mail\" , \"username\" : \"" + mail +
            "\" , \"pwd\" : \"" + Epwd + "\" , \"country\" : \"" + country + "\" , \"nickname\" : \"" + name  + "\"}"
        console.log(data)
        $.ajax({
            url: "App/Userregister.jhtml",
            type: "post",
            contentType: 'application/json; charset=UTF-8',
            data: data,
            beforeSend: function () {
                show();
            },
            complete: function () {
                show();
            },
            success: function (data) {
                //console.log(data)
                if (data.msg == 501){
                    alert("The account has been verified.")
                    return false
                }
                else {
                    window.location.href = 'App/LastRegister.jhtml';
                }
            },
            error: function () {
                alert("Register error！")
            }
        });
        }else {
            alert("Please accept the user Agreement , before sign in!")
            return false
        }
    }
</script>

<script>
    function ToLogin() {
        window.location.href = 'login.jhtml';
    }
    function show() {
        var pop = document.getElementById("popDiv");

        if (pop.style.display == "block"){
            pop.style.display = "none";
        }else
            pop.style.display = "block";
    }
</script>