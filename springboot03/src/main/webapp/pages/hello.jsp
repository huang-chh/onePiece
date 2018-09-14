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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/themes/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<title>主页</title>
</head>
<body class="easyui-layout">
  	<div data-options="region:'north',title:'North Title',split:true,noheader:true" style="height:100px;
  	background-image: url('${pageContext.request.contextPath}/static/images/top.png') no-repeat 100% auto center scroll"></div>   
    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>   
    <div data-options="region:'west',title:'导航栏',split:true,iconCls:'icon-world'" style="width:130px;">
	   
    </div>   
    <div data-options="region:'center',title:'首页',noheader:true" style="padding:5px;background:#eee;">
    	<div id="tt" class="easyui-tabs" style="background-color:red; width:500px;height:250px;">
		    <div title="Tab1" style="padding:20px;display:none;">
				tab1
		    </div>
		</div> 
    </div>    


</body>
</html>