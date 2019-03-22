<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap & Snippet plugin core CSS -->
<link href="/static/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="static/css/stickup.css" rel="stylesheet">
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/stickUp.min.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		$(document).ready(function() { //enabling stickUp on the '.navbar-wrapper' class
			$('.navbar-wrapper').stickUp();
		});
	});
</script>
<style>
@media screen and (min-width:300px){
				html{font-size: 12px;}
}
@media screen and (min-width: 320px) {
    html {font-size: 12px;}
}
 
@media screen and (min-width: 375px) {
    html {font-size: 14px;}
}
 
@media screen and (min-width: 400px) {
    html {font-size: 14px;}
}
 
@media screen and (min-width: 440px) {
    html {font-size: 14px;}
}
 
@media screen and (min-width: 768px) {
    html {font-size: 22px;}
}
 
@media screen and (min-width: 1024px) {
    html {font-size: 24px;}
}
</style>
<!-- END COVER -->
<!-- START THE NAVBAR -->
<div class="navbar-wrapper" style="z-index: 9999;">
	<div class="container"
		style="padding: 0px;max-width: 100%;max-height: 50px;">
		<div class="navwrapper">
			<div class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<div>
							<div style="float: left; width: 10%;">
								<c:if test="${canback eq true }">
									<a class="navbar-brand" href="javascript:(void);"
										onclick="window.history.back()"
										style="font-size: 24px;font-weight: bold;">&lt;</a>
								</c:if>
							</div>
							<div style="float: left; width: 70%;text-align: left;">
								<a class="navbar-brand" href="javascript:(void);"
									style="font-size: 12px;font-weight: bold;">${title}</a>
							</div>
						</div>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">                                                                               
							<li class="menuItem"><a href="index.jhtml">Home</a></li>
							<li class="menuItem"><a href="aboutus/index.jhtml">About Us</a></li>
							<li class="menuItem"><a href="">MYReport</a></li>
							<!-- <li class="menuItem"><a href="same/index.jhtml">Same</a></li>
							<li class="menuItem"><a href="aging/index.jhtml">Biological age Detection</a></li> -->
							<li class="menuItem"><a href="cart/index.jhtml">Health Market</a></li>
							<li class="menuItem"><a href="#wordpress">Science team</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- End Navbar -->
	</div>
</div>
<!-- END NAVBAR -->