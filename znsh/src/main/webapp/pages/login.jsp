<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>登录页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
</head>

<body
	background="${pageContext.request.contextPath}/jquery-easyui-1.4.3/images/timg.jpg">
	<div
		style="width: 400px; height: 280px; position: absolute; left: 50%; top: 50%; margin-left: -200px; margin-top: -140px; border: 1px;
	/* background-color:red;	 */ align: center;">
		<div
			style="width: 300px; height: 160px; position: relative; left: 50%; top: 50%;
	/* background-color:black;	 */ margin-left: -150px; margin-top: -80px;">
			<div class="easyui-panel" title="请登录">
				<form id="ff" class="easyui-form" method="post"
					data-options="novalidate:true">
					<table cellpadding="5">
						<tr>
							<td>用户名</td>
							<td><input class="easyui-textbox" type="text" id="account"
								data-options="required:true"></input></td>
						</tr>
						<tr>
							<td>密码</td>
							<td><input class="easyui-textbox" type="text" id="password"
								data-options="required:true"></input></td>
						</tr>
						<tr>
							<td>验证码</td>
							<td><input type="text" id="in1" style="width: 90px" value=""
								placeholder="请输入验证码"><span id="yzm"><input
									id="l1" type="text"></input></span><span id="tip"></span>
							</td>
						</tr>
					</table>
					<div style="text-align: center; padding: 5px">
						<a href="pages/register.jsp" class="easyui-linkbutton">注册</a> <a
							href="javascript:void(0)" id="loginButton"
							class="easyui-linkbutton" onclick="submitForm()">登录</a> <a
							href="javascript:void(0)" class="easyui-linkbutton"
							onclick="clearForm()">清除</a>
					</div>
				</form>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		function submitForm() {
			$('#ff').form(
					'submit',
					{
						onSubmit : function() {
							var flag = $(this).form('enableValidation').form(
									'validate');
							if (!flag) {
								return;
							} else {
								login();
							}

						}
					});
		}

		//$('#loginButton').click(function(){
		function login() {
			debugger;
			var check_yzm = $("#in1").val();
			if(check_yzm==null ||check_yzm==""){
				$("#in1").focus();
				return;
			}
			var yzm =$("#yzm").text();
			if(yzm!=check_yzm){
				alert("请输入正确的验证码");
				//$("#tip").text("ahahh");
				return;
			}
			$.ajax({
				type : 'post',
				url : 'login/login',
				dataType : 'json',
				data : {
					"account" : $('#account').val(),
					"password" : $('#password').val()
				},
				success : function(data) {
					if (data.isLogin == "YES") {
						window.location.href = "pages/menu.jsp";
					} else {
						alert("用户名或密码错误！");
					}

				},
				error : function() {
					//alert("用户名或密码不正确");
				}
			});
		}
		//	});

		$(document)
				.ready(
						function() {
							//我写的验证码 
							//验证码 
							var code;
							function createCode() {
								code = '';//首先默认code为空字符串 
								var codeLength = 4;//设置长度，这里看需求，我这里设置了4 
								var codeV = $("#yzm");
								//设置随机字符 
								var random = new Array(0, 1, 2, 3, 4, 5, 6, 7,
										8, 9, 'A', 'B', 'C', 'D', 'E', 'F',
										'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
										'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
										'W', 'X', 'Y', 'Z');
								for (var i = 0; i < codeLength; i++) { //循环codeLength 我设置的4就是循环4次   
									var index = Math.floor(Math.random() * 36); //设置随机数范围,这设置为0 ~ 36  
									code += random[index]; //字符串拼接 将每次随机的字符 进行拼接 
								}
								codeV.text(code);//将拼接好的字符串赋值给展示的Value 
							}
							//页面开始加载验证码 
							createCode();
							//验证码Div加载点击事件 
							$("#yzm").bind('click', function() {
								createCode();
							});
							//下面就是判断是否==的代码，无需解释 
							$("#b1")
									.bind(
											'click',
											function() {
												var oValue = $("#in1").val()
														.toUpperCase();
												$("#l1").html("");
												if (oValue == "") {
													$("#l1")
															.html(
																	"<font color='red'>请输入验证码</font>");
												} else if (oValue != code) {
													$("#l1")
															.html(
																	"<font color='red'>验证码不正确，请重新输入</font>");
													oValue = "";
													createCode();
												} else {
													$("#l1")
															.html(
																	"<font color='blue'>验证码正确</font>");
												}
											});
						});
	</script>
</body>
</html>
