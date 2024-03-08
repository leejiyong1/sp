<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	
		<style>
			@font-face {
			    font-family: 'Pretendard-Regular';
			    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
			    font-weight: 400;
			    font-style: normal;
			}
			
			body{font-family:'Pretendard-Regular';}
		
			.outer{
				border-bottom:2px solid #e5e8ee;
				position:relative;
			}
			
			pre{font-size:18px;
				margin-left:60px;
				font-family:'Pretendard-Regular';
				display:inline-block;}
					
			.user_profile{height:50px;
				 position:relative;
				 margin-bottom:2px;}
				       
			.name{position:absolute;
				  left:60px;
				  top:13px;
				  font-size:18px;}
			
			#avatar{font-size:40px;
					margin-left:5px;
					position:absolute;
					color:#525b75;}
					   
		</style>
	</head>
	<body>
		<c:forEach var="vo" items="${list}">
			<div class="outer">
				<div class="user_profile">
					<span id="avatar" class="bi bi-person-circle"></span>
					<b class="name">${vo.u_name}</b>
				</div>
				<pre>${vo.content}</pre>	
			</div>
			<br>
		</c:forEach>
	</body>
</html>