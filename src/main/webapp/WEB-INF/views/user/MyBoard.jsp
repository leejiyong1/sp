<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글</title>
</head>
<body>
	<h1>내 게시글</h1>
	<table border="1">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:when test="${empty boardList}">
				<tr>
					<td>작성한 글이 없습니다.</td>
				</tr>
			</c:when>
			<c:when test="${not empty boardList}">
				<c:forEach items="${boardList}" var="board">
					<tr>
						<td>${board.b_idx}</td>
						<td>${board.subject}</td>
						<td>${board.content}</td>
						<td>${board.readhit}</td>
						<td>${board.regdate}</td>
					</tr>
				</c:forEach>
			</c:when>
		</tbody>
	</table>

</body>
</html>