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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/icon.css">
<script type="text/javascript"
    src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
    src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
</head>
<body>
	<div style="height:600px margin:0;"></div>
	<div class="easyui-panel" title="查询条件" style="height:200px width:auto">
		<div style="padding:10px 60px 10px 60px">
	    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
	    	<table cellpadding="5">
	    		<tr>
	    			<!-- <td>Name:</td>
	    			<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
	    			<td>Email:</td>
	    			<td><input class="easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'"></input></td>
	    			<td>Subject:</td>
	    			<td><input class="easyui-textbox" type="text" name="subject" data-options="required:true"></input></td> -->
	    			<td>统筹区:</td>
	    			<td>
	    				<select class="easyui-combobox" name="aaa027">
	    				<option value="341621">涡阳县</option>
	    				<option value="341282" selected="selected">界首市</option>
	    				<option value="341202">颍州区</option>
	    				<option value="341222">太和县</option>
	    				<option value="341881">宁国市</option>
	    				</select>
	    			</td>
	    			<td>查询日期:</td>
	    			<td><input class="easyui-datebox"></input></td>
	    			<td><p class="easyui-linkbutton" iconCls="icon-cancel" onclick="clearForm()">Cancel</p></td>
	    			<td><p class="easyui-linkbutton" iconCls="icon-search" onclick="submitForm()">Query</p></td>
	    		</tr>
	    		<!-- <tr>
	    			<td>Message:</td>
	    			<td><input class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"></input></td>
	    			<td><p class="easyui-linkbutton" iconCls="icon-cancel" onclick="clearForm()">Cancel</p></td>
	    			<td><p class="easyui-linkbutton" iconCls="icon-search" onclick="submitForm()">Query</p></td>
	    		
	    		</tr> -->
	    	</table>
	    </form>
	    </div>
	    <div>
	    	<table id="tt" class="easyui-datagrid" style="width:auto;height:370px" 
		        title="就诊信息下载列表" 
		        rownumbers="true" pagination="true">
			    <thead>
			        <tr>
			            <th field="aaa027" width="80" sortable="true">统筹区号</th>
			            <th field="jzCount" width="80" sortable="true">下载就诊数量</th>
			            <th field="cfCount" width="80" align="right" sortable="true">下载处方数量</th>
			            <th field="unitcost" width="80" align="right" sortable="true">Unit Cost</th>
			            <th field="attr1" width="150">Attribute</th>
			            <th field="status" width="60" align="center">Stauts</th>
			        </tr>
			    </thead>
			</table>
	    </div>
	</div>
	<script>
		function submitForm(){
			$('#ff').form('submit',{
				onSubmit:function(){
					return $(this).form('enableValidation').form('validate');
				}
			});
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>
</body>
</html>