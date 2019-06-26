<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="date" uri="http://epidial.com/jstl/date" %>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
	<!--[if lt IE 9]>
	<script type="text/javascript" src="static/h-ui.admin/lib/html5shiv.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/lib/respond.min.js"></script>
	<![endif]--><link rel="stylesheet" type="text/css" href="static/h-ui.admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/static/h-ui.admin/css/style.css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="static/h-ui.admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
<title>添加用户 - H-ui.admin v3.1</title>
</head>
<body>
<article class="page-container">
	<form action="/admin/user/save.jhtml" method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>name：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" required="required" placeholder="" id="nickname" name="nickname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>mail status：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="valid" value="1"  required="required" type="radio" id="sex-1" checked>
					<label for="sex-1">activation</label>
				</div>
				<div class="radio-box">
					<input type="radio" name="valid" value="0" id="sex-2" name="sex">
					<label for="sex-2">not active</label>
				</div>

			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>email：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="email" class="input-text" placeholder="@"  required="required" name="mail" id="email">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">country：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
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
				</span> </div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;submit&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="static/h-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui.admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="static/h-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="static/h-ui.admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="static/h-ui.admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="static/h-ui.admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
			username:{
				required:true,
				minlength:2,
				maxlength:16
			},
			valid:{
				required:true,
			},
			email:{
				required:true,
				email:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('#btn-refresh').click();
            parent.location.reload();
			parent.layer.close(index);
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>