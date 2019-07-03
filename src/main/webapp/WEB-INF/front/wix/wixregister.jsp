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
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1,shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">--%>
    <meta name="format-detection" content="telephone=no">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="static/css/login.css">
    <link rel="stylesheet" type="text/css" href="static/css/login2.css">
    <link rel="stylesheet" href="static/js/build/css/intlTelInput.css">
    <link rel="stylesheet" href="static/js/build/css/demo.css">
    <script src="static/js/jquery-2.1.0.min.js"></script>
</head>
<body style="margin: 0;padding: 0">
<div id="container" style="width: 100%;height: 100%;">
    <div style="width: 50%; margin: 0 auto; height:667px;">
        <div style="width: 100%;height: auto;margin: 0 auto;">
            <div style="width: 80%;height: auto;font-family: arial;font-size: 20px;margin: 0 auto; font-weight: 500;line-height: 80px;font-weight:600;">
                Register
            </div>
            <div style="width: 100%;height: 20px;"></div>
            <form action="App/register.jhtml" method="post">
                <div style="width: 80%;height: 40px;margin: 0 auto;">
                    <input type="text" required="required" placeholder="First name" name="firstname" id="firstname"
                           style="width: 90%;height: 40px;margin: 0 auto; border: 1px solid #C0C0C0;border-radius: 3px;font-size: 16px;font-family: arial;font-weight: 500; padding-left: 12px;"/>
                </div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 80%;height: 40px;margin: 0 auto;">
                    <input type="text" required="required" placeholder="Last name" name="lastname" id="lastname"
                           style="width: 90%;height: 40px;margin: 0 auto; border: 1px solid #C0C0C0;border-radius: 3px;font-size: 16px;font-family: arial;font-weight: 500; padding-left: 12px;"/>
                </div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 80%;height: 40px;margin: 0 auto;">
                    <input type="email" required="required" type="email" placeholder="Email" name="mail" id="mail"
                           style="width: 90%;height: 40px;margin: 0 auto; border: 1px solid #C0C0C0;border-radius: 3px;font-size: 16px;font-family: arial;font-weight: 500; padding-left: 12px;"/>
                </div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 80%;height: 40px;margin: 0 auto;">
                    <input type="password" required="required" placeholder="Create a password" name="password"
                           id="password"
                           style="width: 90%;height: 40px;margin: 0 auto; border: 1px solid #C0C0C0;border-radius: 3px;font-size: 16px;font-family: arial;font-weight: 500; padding-left: 12px;"/>
                </div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 80%;height: 40px;margin: 0 auto;">
                    <input type="password" required="required" placeholder="Confirm password"
                           onblur="if(this.value!=$('#password').val()){alert('The password is different. Please confirm the password.')}"
                           style="width: 90%;height: 40px;margin: 0 auto; border: 1px solid #C0C0C0;border-radius: 3px;font-size: 16px;font-family: arial;font-weight: 500; padding-left: 12px;"/>
                </div>
                <div style="width: 100%;height: 15px;"></div>
                <div style="width: 80%;height: 50px;margin: 0 auto;">
                    <div style="padding:3% 0 3% 3%;height: 50px;">
                        <div style="float:left;width: 20%;height: 100%">
                            Your Region:
                        </div>
                        <div style="float:left;width: 60%">
                            <select name="country" class="fastbannerform__country" style="width: 100%;height: 35px;"
                                    id="country">
                                <option value="AND" title="AD">Andorra</option>
                                <option value="AFG" title="AF">Afghanistan</option>
                                <option value="ATG" title="AG">Antigua and Barbuda</option>
                                <option value="ALB" title="AL">Albania</option>
                                <option value="ARM" title="AM">Armenia</option>
                                <option value="AGO" title="AO">Angola</option>
                                <option value="ARG" title="AR">Argentina</option>
                                <option value="AUT" title="AT">Austria</option>
                                <option value="AUS" title="AU">Australia</option>
                                <option value="ABW" title="AW">Aruba</option>
                                <option value="AZE" title="AZ">Azerbaijan</option>
                                <option value="DZA" title="DZ">Algeria</option>
                                <option value="BIH" title="BA">Bosnia and Herzegovina</option>
                                <option value="VGB" title="VG">British Virgin Islands</option>
                                <option value="BRB" title="BB">Barbados</option>
                                <option value="BGD" title="BD">Bangladesh</option>
                                <option value="BEL" title="BE">Belgium</option>
                                <option value="BFA" title="BF">Burkina Faso</option>
                                <option value="BGR" title="BG">Bulgaria</option>
                                <option value="BHR" title="BH">Bahrain</option>
                                <option value="BDI" title="BI">Burundi</option>
                                <option value="BEN" title="BJ">Benin</option>
                                <option value="BMU" title="BM">Bermuda</option>
                                <option value="BRN" title="BN">Brunei</option>
                                <option value="BOL" title="BO">Bolivia</option>
                                <option value="BRA" title="BR">Brazil</option>
                                <option value="BHS" title="BS">Bahamas</option>
                                <option value="BTN" title="BT">Bhutan</option>
                                <option value="BWA" title="BW">Botswana</option>
                                <option value="BLR" title="BY">Belarus</option>
                                <option value="BLZ" title="BZ">Belize</option>
                                <option value="HRV" title="HR">Croatia</option>
                                <option value="CAF" title="CF">Central African Republic</option>
                                <option value="TCD" title="TD">Chad</option>
                                <option value="COM" title="KM">Comoros</option>
                                <option value="CAN" title="CA">Canada</option>
                                <option value="CHL" title="CL">Chile</option>
                                <option value="CMR" title="CM">Cameroon</option>
                                <option value="CYM" title="KY">Cayman Islands</option>
                                <option value="CHN" title="CN">China</option>
                                <option value="KHM" title="KH">Cambodia</option>
                                <option value="COL" title="CO">Colombia</option>
                                <option value="CRI" title="CR">Costa Rica</option>
                                <option value="CUB" title="CU">Cuba</option>
                                <option value="CPV" title="CV">Cape Verde</option>
                                <option value="CYP" title="CY">Cyprus</option>
                                <option value="CZE" title="CZ">Czech Republic</option>
                                <option value="DJI" title="DJ">Djibouti</option>
                                <option value="DNK" title="DK">Denmark</option>
                                <option value="DMA" title="DM">Dominica</option>
                                <option value="DOM" title="DO">Dominican Republic</option>
                                <option value="COD" title="CD">Democratic Republic of the Congo</option>
                                <option value="SLV" title="SV">El Salvador</option>
                                <option value="ECU" title="EC">Ecuador</option>
                                <option value="EST" title="EE">Estonia</option>
                                <option value="GNQ" title="GQ">Equatorial Guinea</option>
                                <option value="EGY" title="EG">Egypt</option>
                                <option value="ERI" title="ER">Eritrea</option>
                                <option value="ETH" title="ET">Ethiopia</option>
                                <option value="FIN" title="FI">Finland</option>
                                <option value="FJI" title="FJ">Fiji</option>
                                <option value="FLK" title="FK">Falkland Islands</option>
                                <option value="FRO" title="FO">Faroe Islands</option>
                                <option value="FRA" title="FR">France</option>
                                <option value="GAB" title="GA">Gabon</option>
                                <option value="DEU" title="DE">Germany</option>
                                <option value="GRD" title="GD">Grenada</option>
                                <option value="GEO" title="GE">Georgia</option>
                                <option value="GHA" title="GH">Ghana</option>
                                <option value="GIB" title="GI">Gibraltar</option>
                                <option value="GMB" title="GM">Gambia</option>
                                <option value="GIN" title="GN">Guinea</option>
                                <option value="GRC" title="GR">Greece</option>
                                <option value="GTM" title="GT">Guatemala</option>
                                <option value="GNB" title="GW">Guinea-Bissau</option>
                                <option value="GUY" title="GY">Guyana</option>
                                <option value="HKG" title="HK">Hong Kong</option>
                                <option value="HND" title="HN">Honduras</option>
                                <option value="HTI" title="HT">Haiti</option>
                                <option value="HUN" title="HU">Hungary</option>
                                <option value="IDN" title="ID">Indonesia</option>
                                <option value="IRL" title="IE">Ireland</option>
                                <option value="ISR" title="IL">Israel</option>
                                <option value="IND" title="IN">India</option>
                                <option value="IRQ" title="IQ">Iraq</option>
                                <option value="IRN" title="IR">Iran</option>
                                <option value="ISL" title="IS">Iceland</option>
                                <option value="ITA" title="IT">Italy</option>
                                <option value="JAM" title="JM">Jamaica</option>
                                <option value="JOR" title="JO">Jordan</option>
                                <option value="JPN" title="JP">Japan</option>
                                <option value="KEN" title="KE">Kenya</option>
                                <option value="KGZ" title="KG">Kyrgyzstan</option>
                                <option value="KIR" title="KI">Kiribati</option>
                                <option value="KWT" title="KW">Kuwait</option>
                                <option value="KAZ" title="KZ">Kazakhstan</option>
                                <option value="LAO" title="LA">Laos</option>
                                <option value="LBN" title="LB">Lebanon</option>
                                <option value="LIE" title="LI">Liechtenstein</option>
                                <option value="LBR" title="LR">Liberia</option>
                                <option value="LSO" title="LS">Lesotho</option>
                                <option value="LTU" title="LT">Lithuania</option>
                                <option value="LUX" title="LU">Luxembourg</option>
                                <option value="LVA" title="LV">Latvia</option>
                                <option value="LBY" title="LY">Libya</option>
                                <option value="MAR" title="MA">Morocco</option>
                                <option value="MCO" title="MC">Monaco</option>
                                <option value="MDA" title="MD">Moldova</option>
                                <option value="MNE" title="ME">Montenegro</option>
                                <option value="MDG" title="MG">Madagascar</option>
                                <option value="MKD" title="MK">Macedonia</option>
                                <option value="MLI" title="ML">Mali</option>
                                <option value="MMR" title="MM">Myanmar</option>
                                <option value="MNG" title="MN">Mongolia</option>
                                <option value="MAC" title="MO">Macao</option>
                                <option value="MRT" title="MR">Mauritania</option>
                                <option value="FSM" title="FM">Micronesia</option>
                                <option value="MLT" title="MT">Malta</option>
                                <option value="MUS" title="MU">Mauritius</option>
                                <option value="MDV" title="MV">Maldives</option>
                                <option value="MWI" title="MW">Malawi</option>
                                <option value="MEX" title="MX">Mexico</option>
                                <option value="MYS" title="MY">Malaysia</option>
                                <option value="MOZ" title="MZ">Mozambique</option>
                                <option value="NAM" title="NA">Namibia</option>
                                <option value="PRK" title="KP">North Korea</option>
                                <option value="NER" title="NE">Niger</option>
                                <option value="NGA" title="NG">Nigeria</option>
                                <option value="NIC" title="NI">Nicaragua</option>
                                <option value="NLD" title="NL">Netherlands</option>
                                <option value="NOR" title="NO">Norway</option>
                                <option value="NPL" title="NP">Nepal</option>
                                <option value="NRU" title="NR">Nauru</option>
                                <option value="NZL" title="NZ">New Zealand</option>
                                <option value="OMN" title="OM">Oman</option>
                                <option value="PAN" title="PA">Panama</option>
                                <option value="PER" title="PE">Peru</option>
                                <option value="PNG" title="PG">Papua New Guinea</option>
                                <option value="PHL" title="PH">Philippines</option>
                                <option value="PAK" title="PK">Pakistan</option>
                                <option value="POL" title="PL">Poland</option>
                                <option value="PRI" title="PR">Puerto Rico</option>
                                <option value="PSE" title="PS">Palestine</option>
                                <option value="PRT" title="PT">Portugal</option>
                                <option value="PLW" title="PW">Palau</option>
                                <option value="PRY" title="PY">Paraguay</option>
                                <option value="QAT" title="QA">Qatar</option>
                                <option value="ROU" title="RO">Romania</option>
                                <option value="RUS" title="RU">Russia</option>
                                <option value="RWA" title="RW">Rwanda</option>
                                <option value="SRB" title="RS">Serbia</option>
                                <option value="LCA" title="LC">Saint Lucia</option>
                                <option value="LKA" title="LK">Sri Lanka</option>
                                <option value="SAU" title="SA">Saudi Arabia</option>
                                <option value="SLB" title="SB">Solomon Islands</option>
                                <option value="SYC" title="SC">Seychelles</option>
                                <option value="SDN" title="SD">Sudan</option>
                                <option value="ESP" title="ES">Spain</option>
                                <option value="SWE" title="SE">Sweden</option>
                                <option value="SGP" title="SG">Singapore</option>
                                <option value="CHE" title="CH">Switzerland</option>
                                <option value="SVN" title="SI">Slovenia</option>
                                <option value="KNA" title="KN">Saint Kitts and Nevis</option>
                                <option value="SVK" title="SK">Slovak Republic</option>
                                <option value="SLE" title="SL">Sierra Leone</option>
                                <option value="SMR" title="SM">San Marino</option>
                                <option value="SEN" title="SN">Senegal</option>
                                <option value="SOM" title="SO">Somalia</option>
                                <option value="KOR" title="KR">South Korea</option>
                                <option value="SUR" title="SR">Suriname</option>
                                <option value="STP" title="ST">Sao Tome and Principe</option>
                                <option value="ZAF" title="ZA">South Africa</option>
                                <option value="SYR" title="SY">Syria</option>
                                <option value="SWZ" title="SZ">Swaziland</option>
                                <option value="VCT" title="VC">Saint Vincent And The Grenadine</option>
                                <option value="TGO" title="TG">Togo</option>
                                <option value="THA" title="TH">Thailand</option>
                                <option value="TJK" title="TJ">Tajikistan</option>
                                <option value="TKM" title="TM">Turkmenistan</option>
                                <option value="TUN" title="TN">Tunisia</option>
                                <option value="TON" title="TO">Tonga</option>
                                <option value="TUR" title="TR">Turkey</option>
                                <option value="TTO" title="TT">Trinidad and Tobago</option>
                                <option value="TUV" title="TV">Tuvalu</option>
                                <option value="TWN" title="TW">Taiwan</option>
                                <option value="TZA" title="TZ">Tanzania</option>
                                <option value="ASA" title="AA" selected="selected">United States</option>
                                <option value="ARE" title="AE">United Arab Emirates</option>
                                <option value="UKR" title="UA">Ukraine</option>
                                <option value="GBR" title="GB">United Kingdom</option>
                                <option value="UGA" title="UG">Uganda</option>
                                <option value="URY" title="UY">Uruguay</option>
                                <option value="UZB" title="UZ">Uzbekistan</option>
                                <option value="VEN" title="VE">Venezuela</option>
                                <option value="VNM" title="VN">Vietnam</option>
                                <option value="VUT" title="VU">Vanuatu</option>
                                <option value="WLF" title="WF">Wallis and Futuna</option>
                                <option value="WSM" title="WS">Western Samoa</option>
                                <option value="YEM" title="YE">Yemen</option>
                                <option value="ZMB" title="ZM">Zambia</option>
                                <option value="ZWE" title="ZW">Zimbabwe</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div style="width: 100%;height: 50px;"></div>
                <div name="concent" style="width: 80%;height: auto;color: #666666;margin: 0 auto;">
                    <input type="checkbox" name="checkbox" required="required" id="checkbox" value="checkbox"
                           style="width:15px;height: 12px;">
                    I have read and agree to the
                    <a href="concent/index.jhtml" style="text-decoration: none;"><i style="color: #E6BF73;">Terms of
                        Service and Privacy Statement</i></a>.
                </div>
                <div style="width: 100%;height: 5px;"></div>

                <div style="width: 80%;height: 45px;text-align: center;margin: 0 auto;">
                    <input type="submit" class="login_btn" value="Register">
                </div>
                <div name="process" style="width: 90%;height: 50px;margin: 0 auto;display: none;text-align: center;">
                    <div style="width: 100%;height: 20px;"></div>
                    <img src="/static/images/process.gif" style="width: 32px;height: auto;"/>
                </div>
            </form>
        </div>

        <div id="all-right" style="width: 90%;height: auto;font-family: arial;margin: 0 auto;">
            <div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;padding-top: 78px;">
                @2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
            </div>
        </div>
    </div>
</div>
</body>

</html>

<script>
    $("form").submit(function (e) {
        if ($('#checkbox').is(':checked')) {
            $("input").attr("disabled", "disabled");
            $("input[type=submit]").css("display","none");
            $("div[name=concent]").css("display","none");
            $("div[name=process]").css("display","block");
            var mail = $("input[name=mail]").val();
            var password = $("input[name=password]").val();
            var nickname = $("#firstname").val() + "." + $("#lastname").val();
            var country = $("#country").find("option:selected").text();
            var data = {};
            data.nickname = nickname;
            data.password = password;
            data.mail = mail;
            data.country = country;
            $.post("/user/register.jhtml", data, function (data) {
                if (data != "success") {
                    window.alert(data);
                    $("div[name=process]").css("display","none");
                    $("input").removeAttr("disabled");
                    $("input[type=submit]").css("display","block");
                    $("div[name=concent]").css("display","block");
                } else {
                    window.location.href = 'http://user.epi-age.com/wix/register/success.jhtml';
                }
            });
        } else {
            alert("Please accept the user Agreement , before sign in!")
            return false;
        }
        return false;
    });
</script>
