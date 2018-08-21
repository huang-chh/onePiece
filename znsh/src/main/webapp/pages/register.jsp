<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/default/easyui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
  	<script>
		$("#pwd_check").blur(function(){
			debugger;
			var pwd1=$('#password').val();
			var pwd2=$('#pwd_check').val();
			alert(pwd1+'---------'+pwd2);
		});
		
		
		/* function checkPwd(){
			debugger;
			var pwd1=$('#password').val();
			var pwd2=$('#pwd_check').val();
			alert(pwd1+'---------'+pwd2);
		} */
		/* function submitForm(){
			$('#ff').form('submit');
		}
		function clearForm(){
			$('#ff').form('clear');
		} */
		
		/* $(document).read(function(){
			$('#pwd_check').onblur(function(){
				$.ajax({
					type:'post',
					url:'login/checkPwd',
					dataType : 'json',
	                data : {
	                    "password":$('#password').val(),
	                    "pwd_check":$('#pwd_check').val(),
	                },
	                success : function(data) {
	                	if(data.passwordFlag!="YES"){
	                		$('span').Text("两次密码不一致");
	                		$('#pwd_check').val("");
	                	}
	                	
	                },
	                error : function(){
	                	//alert("密码格式不正确");
	                }
				});	
			});
			
		}); */
 	
	</script>
  </head>
<body>
	
	<div  style="height:800px; width:800px;margin: 0 auto">
		<div class="easyui-panel" title="注册信息" style="padding:10px 60px 200px  ">
		    <form id="ff" method="post">
		    	<table cellpadding="5">
		    		<tr>
		    			<td>用户名:</td>
		    			<td><input class="easyui-textbox" type="text" id="name" data-options="required:true"></input></td>
		    		</tr>
		    		<tr>
		    			<td>密码:</td>
		    			<td><input class="easyui-textbox" type="text" id="password" data-options="required:true"></input></td>
		    		</tr>
		    		<tr>
		    			<td>确认密码:</td>
		    			<td><input class="easyui-textbox" type="text" id="pwd_check" data-options="required:true" ></input>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>邮箱:</td>
		    			<td><input class="easyui-textbox" type="text" id="email" data-options="required:true,validType:'email'"></input></td>
		    		</tr>
		    		<tr>
		    			<td>年龄:</td>
		    			<td><input class="easyui-textbox" type="text" id="age" data-options="required:true"></input></td>
		    		</tr>
		    		<tr>
		    			<td>备注:</td>
		    			<td><input class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"></input></td>
		    		</tr>
		    	
		    	</table>
		    </form>
		    <div style="text-align:center;padding:5px">
		    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
		    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
		    </div>
	    </div>
	</div>
	
</body>
</html>