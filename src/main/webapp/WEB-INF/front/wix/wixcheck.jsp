<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="util" uri="http://epidial.com/jstl/stringUtil" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Confirm order</title>

    <script type="text/javascript" src="static/js/jquery-2.1.1.min.js"></script>

    <link type="text/css" rel="stylesheet" href="static/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="static/css/module.css"/>

</head>
<body >
<!--头部开始-->
<div style="width: 90%;height: 100%;margin: 0 auto;">
    <form action="/user/transaction/loadOrder.jhtml" method="post">
        <div style="background-color:#ffffff;padding-bottom: 10px">

            <div style="width: 100%;height: 10px;"></div>
            <div name="cartbox" style="width:100%;height:auto;">
                <script>
                    $(function () {
                        $.post("/user/cart/unPayGoodslist.jhtml", function (data) {
                            data.forEach(function (v) {
                                var div = "<div name='cart' style='width: 100%;height: 60px;'><div style='width:100%;display: flex;flex-direction: row;justify-content: center;float: left;'>" +
                                    "                        <div style=\"width: 100%\">" +
                                    "                            <div style=\"width:40%;height:auto;float: left;text-align: center\">" +
                                    "                                <image src=" + v.imgpath + " style=\"width:39%;height:auto\"></image>" +
                                    "                            </div>\n" +
                                    "                            <div style=\"float: left;width: 50%;height: 100%;\">" +
                                    "                                <div style=\"width:100%;height:10%\"></div>" +
                                    "                                <div style=\"width:100%;height:30%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;\">" + v.name + "</div>" +
                                    "                                <div class=\"shop-sumprice\" style=\"width:100%;height:25%;;text-align: center;border: 1px dashed grey;\">" +
                                    "<div style='float: left'>:</div>"+
                                    "                                    <div class=\"shop-pices\" style=\"float:left;width: 35%;height: 100%\">&nbsp;&nbsp;$<b>" + v.price + "</b>&nbsp;&nbsp;&nbsp;&nbsp;X"+v.count+"</div>" +
                                    "                                </div>" +
                                    "<div class=\"shop-sumprice\" style=\"width:100%;height:25%;;text-align: center;border: 1px dashed grey;\">" +
                                    "<div style='float: left;color: red;'>discount:</div>"+
                                    "<div class=\"shop-pices\" style=\"float:left;width: 35%;height: 100%\">&nbsp;&nbsp;$<b>" + v.disprice + "</b>&nbsp;&nbsp;&nbsp;&nbsp;X"+v.count+"</div>" +
                                    "</div>" +
                                    "                            </div>" +
                                    "                        </div>" +
                                    "                    </div><div name='cartdel' id='" + v.id + "' style='clear:both;float: left;background-color:#0071bc;color: white;width: 18%;height: 20px;cursor: pointer;border-radius:5px;text-align: center;font-weight: bold; '>Remove</div></div>" +
                                    "                    <div style=\"width: 100%;height: 10px;border-bottom:1px solid #e2e2e2;clear: both;\"></div>";
                                $("div[name=cartbox]").append(div);

                            });
                            //删除购物车
                            $("body").on("click", "div[name=cartdel]", function (event) {
                                if (window.confirm("Do you want to delete this item?")) {
                                    var data = {};
                                    var _oThis = $(event.currentTarget);
                                    data.id = _oThis.attr("id");
                                    $.post("/user/cart/del.jhtml", data, function (data) {
                                        _oThis.parents("div[name=cart]").remove();
                                        $.post("/user/cart/sumprice.jhtml", function (data) {
                                            $("[name=sumprice]").text(data);
                                        });
                                    });
                                }
                            });
                        });
                    });
                </script>
            </div>

            <div style="font-weight: bold">Used addresses:</div>
            <div name="addressbox">
                <script>
                    $(function () {
                        $.post("/user/address/list.jhtml", function (data) {
                            data.forEach(function (v) {
                                console.info(v);
                                var div = " <div name=\"iaddress\"  data-id='" + v.id + "'  style=\"border: 1px solid grey;width: 90%;height: auto;margin: 0 auto;border: 1px dashed grey;cursor: pointer;border-radius: 5px;\">\n" +
                                    "                    <div  style=\"width: 100%;height: 50px;\">\n" +
                                    "                        <div name=\"item\" data-id='" + v.id + "' style=\"float: left;width: 80%;height:  50px;\">\n" +
                                    "                            <div>" + v.recipient + "&nbsp;" + v.phone + "</div>\n" +
                                    "                            <div>" + v.detail + "&nbsp;" + v.city + "&nbsp;" + v.country + "</div>\n" +
                                    "                        </div>\n" +
                                    "                        <div name=\"delAddr\" id='" + v.id + "' style=\"width: 20%;font-weight:bold;background-color: #0071bc;color: white;float: left;height:  50px;line-height:  50px;text-align: center\">Remove</div>\n" +
                                    "                       \n" +
                                    "                    </div>\n" +
                                    "                </div>\n" +
                                    "                <div style=\"width: 100%;height: 5px\"></div>"
                                $("div[name=addressbox]").append(div);
                            });
                        });
                        //删除地址
                        $("body").on("click", "[name=delAddr]", function (event) {
                            if (!window.confirm("Do you want to delete this item?")) return;
                            var data = {};
                            var _oThis = $(event.currentTarget);
                            data.id = _oThis.attr("id");
                            $.post("/user/address/del.jhtml", data, function () {
                                _oThis.parents("div[name=iaddress]").remove();
                            });
                        });
                        //点击地址跳转到确认购买页面
                        $("body").on("click", "[name=item]", function (event) {

                            $.post("/user/cart/unPayGoodslist.jhtml", function (msg) {
                                if (msg.length != 0) {
                                    var data = {};
                                    var _oThis = $(event.currentTarget);
                                    data.addrid=_oThis.attr("data-id");
                                    $.post("/user/cart/selectAddr.jhtml",data,function(){
                                        window.location.href = "/wix/cart/review.jhtml";
                                    });

                                } else {
                                    window.alert("Please buy goods");
                                    window.location.href = "/wix/cart/index.jhtml";
                                }
                            });

                        });
                    });

                </script>
            </div>


            <div style="width: 100%;height: 10px;"></div>

            <div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>

            <div style="width: 100%;height: 30px;border-bottom: 1px solid #f4f6f8;font-size: 22px;">
                <div style="margin-left: 18px;">Delivery Address</div>
            </div>

            <div style="width:100%;display:flex;flex-direction: row;justify-content: center;">
                <div class='part1' style='width:90%'>
                    <div style='height:15px'></div>
                    <div>
                        <text>Full name</text>
                        <input
                                style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                type="text" id="recipient" required="required" name="recipient"></input>
                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'>
                    </div>
                    <div style='height:15px'></div>
                    <div>
                        <text>Phone</text>
                        <input
                                style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                type="text" id="phone" required="required" name="phone"></input>
                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>


                    <div style='height:15px'></div>
                    <div style="width: 100%;height: 120px;border: 1px dashed grey;">
                        <text>&nbsp;</text>
                        <div style="width: 100%;height: 35px">
                            <text style="font-size: 12px;">Addr.line1</text>
                            <input
                                    style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                    type="text" required="required" name="detail-1"/>
                        </div>

                        <div style="width: 100%;height: 35px;">
                            <div>
                                <text style="font-size: 12px;">Addr. line2</text>
                                <input
                                        style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                        type="text" name="detail-2"/></div>
                        </div>
                        <div style="width: 100%;height: 35px">
                            <text style="font-size: 12px;">Addr.line3</text>
                            <input
                                    style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                    type="text" name="detail-3"/>
                        </div>

                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>

                    <div style='height:15px'></div>
                    <div>
                        <text>Town/City</text>
                        <input
                                style='border:0.5px solid #e2e2e2;width:75%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                type="text" id="city" required="required" name="city"></input>
                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>
                    <div style='height:15px'></div>
                    <div>
                        <div style="width: 40%;float: left;">Country/Region</div>
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
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;clear: both'></div>


                    <div style='height:15px'></div>
                    <div>
                        <text>Postalcode/ZIP</text>
                        <input
                                style='border:0.5px solid #e2e2e2;width:68%;display:inline-block;float: right;height:30px;transform: translateY(-5px)'
                                type="text" id="postalcode" name="postalcode"></input>
                    </div>
                    <div style='height:20px;border-bottom:1px solid #e2e2e2;'></div>

                </div>
            </div>


            <div class='br'></div>

            <div style="width: 100%;height: 10px;background-color: #f4f6f8;"></div>
        </div>
        <div style="clear:both;overflow:hidden;width:100%;height:60px;bottom:60px;border-top:1px solid #e0e0e0;background:#fff;">
            <div style="text-align: center;height: 100%;background-color: #37475d;width: 60%;color: #f4f6f8;float: left;">
                <div style="height: 100%;font-size: 21px;line-height: 60px">
                    <div class="shop-">
                        <script>
                            $(function () {
                                $.post("/user/cart/sumprice.jhtml", function (data) {
                                    console.info(data);
                                    $("[name=sumprice]").text(data);
                                });
                            });
                        </script>
                        <strong>Total：$<i class="total" id="AllTotal"
                                          name="sumprice"></i></strong>
                    </div>
                </div>
            </div>
            <div style="width: 40%;background-color: #0071b1;height: 100%;text-align: center;color: #f4f6f8;float:right;">
                <input type="submit"
                       style="height:100%;font-size: 21px;color: white;background-color: #0071b1;border: none;"
                       value="BUY"/>
            </div>

        </div>
    </form>
</div>
</body>

</html>

<script>
    $(function () {
        $("form").submit(function (e) {
            $.post("/user/cart/unPayGoodslist.jhtml", function (msg) {
                console.info(msg.length);
                if (msg.length != 0) {
                    var data = {};
                    data.recipient = $("#recipient").val();
                    data.phone = $("#phone").val();
                    data.postalcode = $("#postalcode").val();
                    data.country = $("#country").val();
                    data.city = $("#city").val();
                    data.detail = $("[name=detail-1]").val() + $("[name=detail-2]").val() + $("[name=detail-3]").val();
                    $.post("/user/address/save.jhtml", data, function (data) {
                        window.location.href = "/wix/cart/review.jhtml" ;
                    });
                } else {
                    window.alert("Please select a product.");
                    window.location.href = "/wix/cart/index.jhtml";
                }
            });

            return false;
        });
    });
</script>