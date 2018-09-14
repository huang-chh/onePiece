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
	href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/themes/gray/easyui.css">
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
  	background-image: url('${pageContext.request.contextPath}/static/images/top.png');background-repeat: no-repeat;background-attachment: fixed;"></div>   
    <div data-options="region:'south',title:'South Title',split:true,noheader:true" style="height:50px;"></div>   
    <div data-options="region:'west',title:'导航栏',split:true,iconCls:'icon-world'" style="width:130px;">
	    <ul id="tt" data-option="animate:true">   
		</ul>  
    </div>   
    <div data-options="region:'center',title:'首页',noheader:true" style="padding:5px;background:#eee;">
    	<div id="tab" class="easyui-tabs" data-options="fit:true">   
		    <div title="首页" style="padding:20px;
		    background-image: url('${pageContext.request.contextPath}/static/images/2.jpg');background-attachment: fixed;" data-options="iconCls:'icon-house'" >   
		        <h3>欢迎使用校园后台管理系统</h3>   
		    </div>   
		</div> 
    </div>    
	<script type="text/javascript">
	$('#tt').tree({    
	    url: '<%=basePath%>login/getNavs',
	    onClick:function(node){
	    	/* node参数是easyUI框架传递过来的，其中封装了某一个节点的具体信息：节点内容、节点的图标、节点状态 */
			//添加一个选项卡
			//alert(node.href);
			//判断节点名=node.text的节点在id=tab的标签中是否存在
			var flag = $("#tab").tabs('exists',node.text);
			if(!flag){//如果不存在再创建
				if(node.href!='noUrl'){
					$("#tab").tabs('add',{
						title:node.text,/* 获取tree节点的文本内容 */
						iconCls:node.iconCls,/* 获取tree节点的图标 */
						closable:true,
						/* href属性：可以将指定页面内容加载到当前的选项卡面板中 */
						href:'<%=basePath %>/pages/'+node.href
					});
				}
			}else{//存在，则跳转到指定的选项卡
				 $("#tab").tabs('select',node.text);
			}
	    }
	});
	</script>

</body>
</html>