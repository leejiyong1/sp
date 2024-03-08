<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="indexListAjax">
		<c:forEach items="${list}" var="item" varStatus="status">
			<div class="wrap">
				<div>${item.test1}</div>
				<div>${item.test2}</div>
				<div>${item.test3}</div>
				<div>${item.test4}</div>
			</div>
		</c:forEach>
		
	</div>
</body>
</html>