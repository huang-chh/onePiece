<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>主菜单页面</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript">
	//进行页面跳转
	function changeToPage(title,url){
		debugger;
		//window.location.replace("//www.baidu.com");
		//window.open("//www.baidu.com");
		if ($('#tt').tabs('exists', title)){
			$('#tt').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'"+" style="width:100%;height:500px;"></iframe>';
			$('#tt').tabs('add',{
				title:title,
				content:content,
				closable:true
			});
		}
	}
	function showcontent(language) {
		//$('#content').html('Introduction to ' + language + ' language');
		$('#content').html( language );
		
	}
	//$(function() {
	//	showcontent('代办事项');
	//});
</script>
</head>
<body>
	
	<div class="easyui-layout" style="width: auto; height: 620px;  ">
		<div id="webTitle" region="north" title="智能审核下载监控系统"
			style="width: auto; height: 15%;" >
			<h2 align="center">
				智能审核下载监控系统
			</h2>
		</div>
		<div region="west" split="true" title="目录" style="width: 150px;">
			<p style="padding: 5px; margin: 0;">选择查看对象:</p>
			<div style="margin-bottom:10px">
			<ul>
				<div style="margin-bottom:10px">
				<p class="easyui-linkbutton" onclick="changeToPage('就诊下载监控','pages/getInsurePay.jsp')">就诊下载监控</p>
				<br/>
				<br/>
				<p class="easyui-linkbutton" onclick="changeToPage('处方下载监控','http://wwww.baidu.com')">处方下载监控</p>
				<br/>
				<br/>
				<p class="easyui-linkbutton" onclick="changeToPage('时间戳记录监控','pages/success.jsp')">时间戳记录监控</p>
				<br/>
				<br/>
				<p class="easyui-linkbutton" onclick="changeToPage('错误日志','pages/login.jsp')">错误日志</p>
			</ul>
			</div>
		</div>
		<div id="content" region="center"  style="padding: 5px;">
			<div id="tt" class="easyui-tabs" style="height: 100%">
				<div title="首页" style="height:500px;">
					<h1>代办事项</h1>
				</div>
			</div>
		</div>
	</div>
</body>
</html>