<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
body {
	background-color: #595959;
}

#outer {
	position: relative;
}

.to-join {
	display: inline-block;
	background-color: #ff66c4;
	width: 20%;
	z-index: 0;
	position: absolute;
	right: 15%;
	top: 23%;
	height: 70%;
}

.to-join * {
	text-align: center;
}

.to-join-content {
	margin-top: 60px;
	margin-bottom: 10px;
	font-size: 30px;
	color: white;
}

.to-join-content div {
	font-size: 15px;
}

.join-btn {
	padding: 5px;
	border: 2px solid white;
	color: white;
	background-color: #ff66c4;
	border-radius: 10px;
	width: 40%;
}

.join-btn:hover {
	background-color: #595959;
}

.border {
	width: 30%;
	border-color: aqua;
	border-radius: 4px;
	padding: 30px;
	margin-top: 50px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	z-index: 1;
}

/* ID/pwd Styling */
.id-div, .pwd-div {
	border: 1px solid #595959;
	width: 80%;
	padding: 10px;
	display: flex;
	align-items: left;
	border-radius: 4px;
	margin-bottom: 5px;
}

.id-div span, .pwd-div span {
	width: 30px;
	color: #595959;
}

#id, #pwd {
	border: none;
}

input:focus {
	outline: none;
}

/* Login button Style */
#login-btn {
	width: 80%;
	height: 20%;
	background-color: #ff66c4;
	border: none;
	font-size: 20px;
	margin-bottom: 5px;
}

#login-btn:hover {
	background-color: #1c5838;
}

/* Checkbox Style */
#form-check {
	display: flex;
	align-items: left;
	width: 80%;
	paddint: 10px;
}

.join-find * {
	color: #595959;
	font-size: 14px;
}

.join-find *:hover {
	text-decoration: none;
	color: #ff66c4;
}
</style>
<script type="text/javascript">
	function send(f) {
		let id = document.getElementById("id").value;
		let pwd = document.getElementById("pwd").value;
		let yuji = document.querySelector('#yuji').checked;
		if (id.trim() == "" || id == null) {
			alert('아이디를 입력하세요');
			return;
		} else if (pwd.trim() == "" || pwd == null) {
			alert('패스워드를 입력하세요');
			return;
		}

		let url = "login.do";
		let param = "id=" + id + "&pwd=" + pwd + "&yuji=" + yuji;
		setTimeout(function() {
		}, 1000);//클라이언트단 지연
		sendRequest(url, param, resultFn, "POST");
	}

	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let data = xhr.responseText;
			if (data == "bad") {
				alert("로그인 실패");
			} else {
				alert("로그인 성공");

			}
			location.href = "/beauty/main.do";
		}
	}
</script>
</head>
<body>

	<!-- 로고이미지 위치 -->
	<jsp:include page="../comp/top.jsp"></jsp:include>
	<form action="" method="post">
		<!-- <div align="center">
				<img src="resources/images/logo.png" class="rounded" width="200px"
					alt="로고">
			</div> -->
		<h1 align="center">Logo</h1>
		<div id="outer" class="d-flex justify-content-center">
			<div align="center" class="border">
				<div class="id-div">
					<span class="bi bi-person"></span> <input id="id" placeholder="아이디">
				</div>
				<div class="pwd-div">
					<span class="bi bi-lock"></span> <input type="text" id="pwd"
						placeholder="비밀번호">
				</div>
				<div class="form-check form-switch" id="form-check">
					<input class="form-check-input" type="checkbox" role="switch"
						id="yuji"> <label for="flexSwitchCheckDefault">로그인
						상태 유지</label>
				</div>
				<br>
				<button type="button" id="login-btn" class="btn btn-primary"
					onclick="send(this.form);">로그인</button>
				<div class="join-find">
					<a href="findid.do">아이디 찾기</a>&nbsp;|&nbsp; <a href="findpwd.do">비밀번호
						찾기</a>
				</div>
			</div>
			<div class="to-join">
				<div class="to-join-content">
					아직 회원이 아니신가요?
					<div>회원가입 후</div>
					<div>더 다양한 서비스를 만나보세요!</div>
				</div>
				<div>
					<a href="regist.do" class="join-btn"> 회원가입</a>
				</div>
			</div>
		</div>
	</form>
	<hr style="margin-top: 30px;">
	<table style="text-align: center;">
		<tr>
			<td><a href="#">미니로고</a></td>
			<td><a href="#">문의하기</a></td>
		</tr>
	</table>
</body>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</html>

<!-- <table border="1">
						<tr>
							<td>
								<div class="input-group">
									<span class="input-group-text" style="width: 100px;">아이디</span>
									<input class="form-control" id="id" type="text">
								</div>
							</td>
							<td rowspan="2">
								<button type="button" style="height: 80px;"
									class="btn btn-primary" onclick="send(this.form);">로그인하기</button>
							</td>
						</tr>
						<tr>
							<td>
								<div class="input-group">
									<span class="input-group-text" style="width: 100px;">패스워드</span>
									<input class="form-control" id="pwd" type="text">
								</div>
							</td>
						</tr>
						<tr>
							<td align="left">
								<div style="margin-top: 20px;"></div>
								<div class="form-check form-switch">
									<input class="form-check-input" type="checkbox" role="switch"
										id="yuji"> <label for="flexSwitchCheckDefault">로그인
										상태 유지</label>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<button type="button" style="height: 80px;"
									class="btn btn-primary" onclick="send(this.form);">로그인하기</button>
							</td>
						</tr>
					</table> -->
<!-- <div style="margin-top: 20px;"></div>
					<input class="btn btn-primary" type="button" value="회원가입하기"
						onclick="location.href='regist.do'"> 
					<input class="btn btn-primary" type="button" value="아이디 찾기"
						onclick="location.href='findid.do'"> 
					<input class="btn btn-primary" type="button" value="비밀번호 찾기"
						onclick="location.href='findpwd.do'"> -->