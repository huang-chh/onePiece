<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>智能审核下载监控</title>
</head>
<body>
	<h2 align="center">智能审核下载监控</h2>
	<br/>
	<a href="user/hello">springmvc test</a>
	<br/>
	<a href="user/helloParams/12">test paramters</a>
	<br/>
	<a href="rest/testGet/12">获取资源</a>
	<br/>
	<form action="rest/testPost" method="post">
		<input type="text" name="id" value="1001"/>
		<input type="submit" value="新建资源" />
	</form>
	<br/>
	<form action="rest/testDelete" method="post">
		<input type="hidden" name="_method" value="delete"/>
		<input type="text" name="id" value="1001"/>
		<input type="submit" value="删除资源" />
	</form>
	<br/>
	<form action="rest/testPut" method="post">
		<input type="hidden" name="_method" value="put"/>
		<input type="text" name="id" value="1001"/>
		<input type="submit" value="更新资源" />
	</form>
</body>
</html>