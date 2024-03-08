<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function save() {
		let email = let id = document.getElementById("email").value;
		alert("버튼 클릭" + email);
		let url = "searchemail.do";
		let param = email;
		sendRequest(url, param, resultFn, "POST");
	}
	function resultFn(){
		if(xhr.status==4 xhr.readyState==200){
			//뒤에 2글자가 * 처리된 아이디를 반환받아 출력
		}
	}
</script>
<body>
	<jsp:include page="../comp/top.jsp" flush="false" />
	<div class="container">
		<div class="">
			<div>아이디 찾기</div>
			<div class="col">찾고싶은 아이디의 이메일을 입력해주세요</div>
			<input type="text" id="useremail">
			<button type="button" class="btn btn-primary" onclick="save();">입력완료</button>
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"></div>
			<div class="col">문의하기</div>
		</div>
	</div>
</body>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>