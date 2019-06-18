<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" href="static/css/stylesheet.css" />
	<!-- <link href="static/css/bootstrap-slider.min.css" rel="stylesheet"> -->
	<link href="/static/css/pain-bootstrap-slider.css" rel="stylesheet">
	<script type='text/javascript' src="static/js/jquery-3.3.1.min.js"></script>
	<script type='text/javascript' src="static/js/bootstrap-slider.js"></script>
	<script src="static/js/build/dist/echarts.js"></script>

</head>
<body style="padding: 0;margin: 0;">
<div id="container" style="width: 100%;height: auto;">
	<jsp:include page="header.jsp"/>

	<!-- END COVER -->
	</div>
	<!-- END NAVBAR -->
	<div style="width: 100%;height: auto;">


		<div style="width: 100%;height: auto;">
			<div style="width: 100%;height: auto">
				<div style="width: 100%;height: auto;" id="paid"></div>
			</div>

		</div>
		<jsp:include page="footnav.jsp"></jsp:include>
	</div>
</body>
</html>


<script>
	function toindex(){
	    window.location.href = "index.jhtml"
	}


    $(function() {
        var paid = ""
        $.ajax({
            type: "post",
            url: "http://localhost:8080/transaction/Check.jhtml",
            success: function(data) {
                //console.log(data)
                for (var i = 0; i < data.length; i++) {
					paid += '<div style="width: 100%;height: auto; background-color: #FFFFFF;border-top: 1px solid #efefef;">' +
                        '<div style="width: 94%;height: auto;margin: 0 auto;line-height: 60px;color: #F36602;">Paid</div>' +
                        '</div>'
                    paid += '<div style="width: 100%;height: 30px;background-color: #F4F4F4"><div style=" width:90%;margin:0 auto; line-height: 30px;font-size: 16px;font-weight: 600;">Order NO.-' +
                        data[i].order_id + "</div></div>"

                    for (var j = 0; j < data[i].list.length; j++) {
                        paid += '<div class="list" style="width: 100%;height: auto;overflow: hidden;background-color: #FFFFFF;">' +
                            '<div style="width: 90%;height: auto;overflow: hidden;margin: 0 auto;">' +
                            '<div style="width: 24%;height: auto;float: left;">' +
                            '<img src="'+ data[i].list[j].wares_img + '" style="width: 100%;height: auto;margin-top: 7px;"></div>' +
                            '<div style="width: 3%;height: 50px;float: left;"></div>' +
                            '<div style="width: 45%;height: auto;float: left;">' +
                            '<div style="width: 100%;height: auto;font-size: 14px;font-weight: 700;line-height: 28px;margin-top: 16%;">' + data[i].list[j].wares_name +'</div></div>' +
                            '<div style="width: 28%;height: auto;float: left;">' +
                            '<div style="width: 100%;height: 26px;"></div>' +
                            '<div id="dot" style="width: 100%;height: 20px;color: #F36602;line-height: 30px; font-size: 16px;">$' + data[i].list[j].sell_price  +'</div>' +
                            '<div style="width: 100%;height: 24px;"></div></div></div><div style="width:100%;height: 1px;background-color: #efefef;"></div></div>'
                    }

                }
				if (data.length <= 0){
                    paid = '<div style="width:100%;height:auto"><img src="static/images/order_empty.png" style="width:100%;height: auto"/> </div>' +
						'<div style="width:50%;height: 30px;border-radius:7px;background-color: #1C4372;text-align: center;margin: 0 auto;font-size: 22px;color:#fff" onclick="toindex()">Go shopping</div>';
				}
                $("#paid").html(paid)
            }
        })
    });
</script>
