<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function send() {
		let id = document.getElementById("id").value;
		alert("버튼 클릭" + id);
		let url = "searchid.do";
		let param = "id=" + id;
		//해당아이디가 존재하는지 확인
		sendRequest(url, param, resultFn, "POST");
	}
	function resultFn() {
		if (xhr.status == 4 && xhr.readyState == 200) {
			let json = xhr.responseText;
			let jsondata = JSON.parse(json);
			if (temp) {
				//존재한다면 해당 아이디 세션에 넣고 이메일 확인하러 갑시다
				location.href = "email";
			} else {
				//존재하지 않는다면 redirect
				location.href = "findpw.do";
			}
		}
	}
</script>
<body>
	<jsp:include page="../comp/top.jsp" flush="false" />
	<div class="container">
		<div class="">비밀번호 찾기</div>
		<div class="">비밀번호를 찾고자하는 아이디를 입력해주세요</div>
		<div class="">
			<input id="id" type="text">
			<button class="btn btn-primary" type="button" onclick="send();">입력완료</button>
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