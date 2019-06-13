<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>Illumina sequencing introduction</title>

</head>
<body style="padding: 0px;margin: 0px;">
<div id="container"style="width: 100%;height: 100%;">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="ill-pic"style="width: 100%;height: auto;">
		<img src="static/images/ill-2.png" style="width: 100%;height: auto;"/>
	</div>
	<div id="intro" style="width: 100%;height: auto;  ">
		<div style="width: 100%;height:20px;"> </div>
		<div style="width: 100%;height: auto;font-family: arial;text-align: left; font-weight: 700;">
			Illumina sequencing introduction
		</div>
		<div style="width: 100%;height:40px;"> </div>
		<div style="width: 100%;height: auto;  ">
			<div style="width: 78%;height: auto; float:left; text-align: center;line-height: 53px;font-weight: 600; font-family: arial; color: #1566B9;border:  ">
				Technical principles&nbsp;&nbsp;
			</div>
			<div style="width: 20%;height: auto; float: left;">
				<img src="static/images/ill-3.png"style="width: 100%;height: auto;"/>
			</div>

			<div style="width: 96%;height: auto;line-height: 18px;margin: 0 auto; font-family: arial; color: #666666; border:  ">
				<p>Illumina sequencing technology combines microarray technology with proprietary reversible terminator technology for large-scale parallel synthesis and sequencing.</p>


				<p>Illumina Sequencing technology ensures high accuracy and single base sequencing .</p>
			</div>
		</div>

		<div id="data-anal"style="width: 100%;height: auto; background-color: #E5E5E5;">
			<div style="width: 100%;height: 60px;line-height: 53px; color: #1566B9;font-family: arial;font-weight: 600; text-align: center;line-height: 33px; border:  ">
				Data analysis
			</div>
			<div style="width: 100%;height: auto;">
				<img src="static/images/ill-1.png"style="width: 100%;height: auto;"/>
			</div>
			<div style="width: 100%;height:40px;"> </div>
			<div style="width: 96%;height: auto;margin: 0 auto;font-family: arial;color: #666666;  ">
				<p >Combining Illumina's open source data with third-party software.</p>

			</div>
			<div style="width: 100%;height:20px;"> </div>
		</div>
		<div id="super"style="width: 100%;height: auto;">
			<div style="width: 100%;height:20px;"> </div>
			<div style="width: 100%;height: auto;font-family: arial;font-weight: 600; text-align: center;line-height: 54px; color: #1566B9; border:  ">
				Technological superiority
			</div>
			<div style="width: 96%;height: auto;margin: 0 auto; font-family: arial;color: #666666; border:  ">
				<p><strong> Wide application flexibility：</strong> At present, it is the most widely used and verified new generation sequencing platform, Applicable to genome DNA methylation,epigenome and transcriptome studies.</p>
				<p>For more info;<i> https://en.m.wikipedia.org/wiki/illumina_dye_sequencing</i> </p>
				<p><i> https://www.illumina.com/science/technology/next-generation-sequencing.html</i></p>
				<p>An unparalleled combination of reading lengths and massive reading slices： The reading length can reach 2 x 150 bp ,Each flow cell can read more than 640 million fragments.</p>
				<p>High quality data: With 2 x 50 BP reads, More than 90% of the bases can exceed Q30 X coverag.</p>
			</div>
		</div>
		<div style="width: 100%;height: 60px;"></div>
		<div id="all-right"style="width: 100%;height: auto;font-family: arial;">
			<div style="width: 100%;height: auto;font-size: 12px;text-align: center; margin: 0 auto;line-height: 50px;margin-bottom: 50px;">
				@2019 HKG epi THERAPEUTICS Ltd. All Rights Reserved
			</div>
		</div>
		<jsp:include page="footnav.jsp"></jsp:include>
	</div>
</body>
</html>
