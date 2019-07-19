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
	<script type="text/javascript" src="static/h-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>

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
<title>Order manager</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> index <span class="c-gray en">&gt;</span> user center <span class="c-gray en">&gt;</span> user manager <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

<%--
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="member_add('添加用户','/admin/task/addview.jhtml','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> Add Order</a></span> </div>
--%>

	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="100">No</th>
				<th width="80">item</th>
				<th width="50">image</th>
				<th width="30">pay</th>
				<th width="60">barcode</th>
				<th width="45">status</th>
				<th width="40">total</th>
				<th width="100">createTime</th>
				<th width="100">paymentTime</th>
				<th width="50">address</th>
				<th width="80">delivered</th>
				<th width="20">edit</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${taskbox}" var="task">
				<tr class="text-c">
					<td>${task.orderno}</td>
					<td>${task.name}</td>
					<td><img src="${task.imgpath}" width="50px" height="50px"></td>
					<c:choose>
						<c:when test="${task.pay ==1}">	<td class="td-status"><span class="label label-success radius">paid</span></td></c:when>
						<c:otherwise><td class="td-status"></td></c:otherwise>
					</c:choose>
					<td>${task.barcode}</td>
					<c:choose>
						<c:when test="${task.valid ==0}"><td class="td-status"><span class="label  label-error radius">Not Used</span></td></c:when>
						<c:otherwise><td class="td-status"><span class="label label-success radius">Used</span></td></c:otherwise>
					</c:choose>
					<td>${task.total}</td>
					<td><date:date value="${task.createTime}" pattern="yyyy-MM-dd hh:mm:ss"></date:date></td>
					<c:choose>
						<c:when test="${task.payTime eq 0}"><td></td></c:when>
						<c:otherwise><td><date:date value="${task.payTime}" pattern="yyyy-MM-dd hh:mm:ss"></date:date></td></c:otherwise>
					</c:choose>


					<td class="td-manage"><a title="edit" href="javascript:;" onclick="member_edit('edit','/admin/task/edit.jhtml?id=${task.addrid}','4','','510')" class="ml-5" style="text-decoration:none">check</a>  </td>
					<td>
						<select>
							<c:choose>
								<c:when test="${task.delivery eq 'Unfilled'}">
									<option task-id="${task.id}" selected="selected" value="Unfilled" >Unfilled</option>
									<option  task-id="${task.id}"  value="deliveried">deliveried</option>
								</c:when>
								<c:otherwise>
									<option task-id="${task.id}"  value="Unfilled" >Unfilled</option>
									<option  task-id="${task.id}" selected="selected" value="deliveried">deliveried</option>
								</c:otherwise>
							</c:choose>

						</select>
					</td>
					<td class="td-manage"><a title="删除" href="javascript:;" onclick="member_del(this,'${task.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>


				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->

<script type="text/javascript" src="static/h-ui.admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui.admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="static/h-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<%--<script type="text/javascript" src="static/h-ui.admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>--%>
<script type="text/javascript" src="static/h-ui.admin/lib/laypage/1.2/laypage.js"></script>
<script>
	$(function(){
		$("select").change(function(event){
			var id=$(this).find("option:selected").attr("task-id");
			var status=$(this).find("option:selected").text();
			var data={};
			data.id=id;
			data.status=status;
			$.post("/admin/task/update.jhtml",data);
		});
	});
</script>
<script type="text/javascript">
/*$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});

});*/

/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.post("/admin/task/del.jhtml?id="+id,function(msg){
			$(obj).parents("tr").remove();
			layer.msg('已删除!',{icon:1,time:1000});
		});
	});
}
</script>
</body>
</html>