<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/uploadFile" enctype="multipart/form-data" method="post">
		<input type="file" name="file" /> <br>
		desc:<input type="text" name="description"><br>
		type:<input type="text" name="type" value="1"><br>
		<input type="submit">
	</form>
</body>
</html>