<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var message = "${message}";
	alert(message);
	alert("test2");
	window.location.href = "/beauty/login.do";
</script>
<body>
	<h1>비밀번호 변경 결과페이지</h1>

</body>
</html>