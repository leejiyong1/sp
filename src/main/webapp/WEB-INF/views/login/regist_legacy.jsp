<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	보완해야하는부분
	
	이메일 검증
	회원가입 실패 예외처리
	 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 페이지</title>
		<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<style>
			.outer{border:1px solid gray;
				   width:30%;
				   border-color:#595959;
				   align-items:center; 
				   border-radius: 5px; 
				   padding: 30px; 
				   margin-top: 40px;
				   box-shadow:0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
				   height:auto;}
					
			.id-div, .pwd-div, .name-div, .pnum-div, .email-div
				 {border:1px solid #595959;
				  width:80%;
		  		  padding:10px;
		   	 	  display:flex;
		   		  align-items:left;
		   		  border-radius:4px;
		   		  margin-bottom:5px;}
		   		  
			.id-div{display:inline-block;}
			
			#id-icon{margin-right:7px;}		
			   		  
			.pwd-div span, .name-div span, .pnum-div span, .email-div span
				{margin-right:10px;
				 color:#595959;}
			input{border:none;
				  width:80%;}
			
			input:focus{outline:none;}
			
			/* 중복확인 버튼 */
			.duplicate-btn{border-radius:50px;
						   font-size:15px;
						   padding:10px;
						   background-color:#ff66c4;
						   color:white;
						   border:none;}
			
			/* 회원가입 버튼 */
			#join-btn{width:100%;
					   height:10%;
					   border-radius:4px;
					   background-color:#ff66c4;
					   color:white;
					   border:none;
					   font-size:20px;
					   margin-bottom:5px;}
			
			#join-btn:hover{background-color:#1c5838;}
			
			.gender-check{width:80%;}
			
			.gender-container {
				  /* display: block; */
				  position: relative;
				  padding-left: 35px;
				  margin-bottom: 12px;
				  margin-right:20px;
				  margin:8px 20px 12px 0;
				  cursor: pointer;
				  font-size: 15px;
				  -webkit-user-select: none;
				  -moz-user-select: none;
				  -ms-user-select: none;
				  user-select: none;
				}
				
				/* Hide the browser's default checkbox */
				.gender-container input {
				  position: absolute;
				  opacity: 0;
				  cursor: pointer;
				  height: 0;
				  width: 0;
				}
				
				/* Create a custom checkbox */
				.checkmark {
				  position: absolute;
				  top: 0;
				  left: 0;
				  height: 25px;
				  width: 25px;
				  background-color: #eee;
				}
				
				/* On mouse-over, add a grey background color */
				.gender-container:hover input ~ .checkmark {
				  background-color: #ccc;
				}
				
				/* When the checkbox is checked, add a blue background */
				.gender-container input:checked ~ .checkmark {
				  background-color: #ff66c4;
				}
				
				/* Create the checkmark/indicator (hidden when not checked) */
				.checkmark:after {
				  content: "";
				  position: absolute;
				  display: none;
				}
				
				/* Show the checkmark when checked */
				.gender-container input:checked ~ .checkmark:after {
				  display: block;
				}
				
				/* Style the checkmark/indicator */
				.gender-container .checkmark:after {
				  left: 9px;
				  top: 5px;
				  width: 5px;
				  height: 10px;
				  border: solid white;
				  border-width: 0 3px 3px 0;
				  -webkit-transform: rotate(45deg);
				  -ms-transform: rotate(45deg);
				  transform: rotate(45deg);
				}
			
		</style>
		<script type="text/javascript">
			function check() {
				let joinForm = document.joinForm;
				let id = joinForm.id.value;
				let button = document.getElementById("idDuplication");
				//아이디정규식
				let regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
		
				if (id.length == 0 || id == "") {
					alert("아이디를 입력해주세요.");
					joinForm.id.focus();
					return;
				} else if (id.length < 5) {
					alert("아이디는 5글자 이상이여야 합니다");
					return;
				} else if (regExp.test(id)) {
					alert("특수문자는 입력할 수 없습니다.");
					return;
				} else {
					let url = "checkid.do";
					let param = "id=" + id;
					sendRequest(url, param, resultCheck, "POST");
					document.getElementById("id").readOnly = true;
					button.disabled = true;
					/* window.open("/beauty/checkid.do?id=" + id, "",
							"width=500,height=300"); 
					${contextPath}
					 */
		
				}
			}
			function resultCheck() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					let result = decodeURI(decodeURIComponent(xhr.responseText));
					if (result == "can") {
						alert("사용하실수 있는 아이디입니다");
						button.disabled = true;
					}
					if (result == "cant") {
						alert("중복된 아이디 입니다");
						document.getElementById("id").readOnly = false;
						button.disabled = false;
					}
				}
		
			}
			function join(f) {
				let joinForm = document.joinForm;
				let id = joinForm.id.value;
				let name = joinForm.name.value;
				let pwd = joinForm.pwd.value;
				let rePwd = joinForm.rePwd.value;
				let pnum = joinForm.pnum.value;
				let email = joinForm.email.value;
				//아직 미완성
				let button_state = document.getElementById("idDuplication").value;
				let idCheck = true;
				let selectedGenderElement = document
						.querySelector('input[name="gender"]:checked');
				//비밀번호 정규식
				let regpwd = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
				//이메일 정규식
				//let regex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
				//유효성 검증로직
				if (document.getElementById("id").readOnly != true) {
					alert("아이디 중복체크를 해주세요.");
					return;
				} else if (name.length == 0 || name == "") {
					alert("닉네임을 입력해주세요");
					joinForm.name.focus();
					return;
				} else if (pwd.length == 0 || pwd == "") {
					alert("비밀번호를 입력해주세요");
					joinForm.pwd.focus();
					return;
				} else if (!regpwd.test(pwd)) {
					alert("비밀번호는 영문 숫자 조합 8자리 이상이여야 합니다");
					return;
				} else if (rePwd.length == 0 || rePwd == "") {
					alert("비밀번호를 다시 입력해주세요.");
					joinForm.rePwd.focus();
					return;
				} else if (pnum.length == 0 || pnum == "") {
					alert("전화번호를 입력하세요");
					return;
				} else if (rePwd != pwd) {
					alert("입력하신 비밀번호가 다릅니다.");
					return;
				} else if (email.length == 0 || email == "") {
					alert("이메일을 입력해주세요");
					joinForm.email.focus();
					return;
				} 
			/* else if (regex.test(email)) {
						alert("이메일을 제대로 입력해주세요");
					}  */else if (selectedGenderElement == null) {
					alert("성별을 선택하세요.");
					return;
				} else {
					let gender = selectedGenderElement.value;
					url = "/beauty/joinuser.do";
					let param = "id=" + id + "&name=" + name + "&pwd=" + pwd
							+ "&email=" + email + "&gender=" + gender + "&pnum=" + pnum;
					sendRequest(url, param, resultFn, "post");
				}
			}
			function resultFn() {
				//회원가입 결과
				if (xhr.readyState == 4 && xhr.status == 200) {
					let result = decodeURI(decodeURIComponent(xhr.responseText));
					// encodeURIComponent();
					alert(result);
					if (result == "성공") {
						alert("가입을 환영합니다!");
						//	회원가입에 성공했습니다. 윈도우 호출
						location.href = "/beauty/login.do";
						/* window.open(link); */
					} else {
						alert("서비스 문제로 회원가입에 실패했습니다 \n 처음부터 다시 해주시길바랍니다.");
						location.href = "beauty/regist.do";
					}
				}
			}
		</script>
	</head>
	<body>
		<jsp:include page="../comp/top.jsp"></jsp:include>
		<h1 align="center">회원가입</h1>
		<form name="joinForm" class="nav justify-content-center">
			<div class="outer">
				<div class="id-div">
					<span id="id-icon" class="bi bi-person"></span>
					<input id="id" type="text" placeholder="아이디">
				</div> &nbsp;
				<button class="duplicate-btn" type="button" id="idDuplication"
							onclick="check();">중복확인</button>
				<div class="pwd-div">
					<span class="bi bi-lock"></span>
					<input type="password" id="pwd" placeholder="비밀번호">
				</div>
				<div class="pwd-div">
					<span class="bi bi-lock"></span>
					<input type="password" id="rePwd" placeholder="비밀번호 확인">
				</div>
				<br><hr><br>
				<div class="name-div">
					<span class="bi bi-person"></span>
					<input id="name" type="text" placeholder="이름">
				</div>
				<div class="pnum-div">
					<span class="bi bi-phone"></span>
					<input id="pnum" type="text" placeholder="전화번호">
				</div>
				<div class="email-div">
					<span class="bi bi-envelope"></span>
					<input id="email" type="text" placeholder="이메일">
				</div>
				<!-- <div class="toggleContainer">
					<input type="checkbox" class="toggleCheckbox1" id="choice1" name="choice" value="creative">
		            <label for="choice1">Speed</label>
		
		            <input type="checkbox" class="toggleCheckbox2" id="choice2" name="choice" value="productive">
		            <label for="choice2">Quality</label>
	            </div> -->
	            
	           <!--  <input type="checkbox" id="toggle" class="toggleCheckbox" />
				<label for="toggle" class='toggleContainer'>
					<div>여성</div> 
					<div>남성</div>
				</label> -->
								
				<div class="gender-check">
					<label for="gen1" class="gender-container">남성
					  <input type="checkbox" id="gen1" name="gender" value="남성">
					  <span class="checkmark"></span>
					</label>
					<label for="gen2" class="gender-container">여성
					  <input type="checkbox" id="gen2" name="gender" value="여성">
					  <span class="checkmark"></span>
					</label>
				</div>
		
				<button type="button" id="join-btn" onclick="join(this.form);">회원가입</button>	
			</div>
			<!-- <div style="width: 400px; border-color: aqua; border-radius: 40px; padding: 20px;"
				class="nav-item border">
				<div class="col">
					<div class="col">
						<label for="id">아이디</label> <input class="form-control" type="text"
							id="id">
						<div style="margin-top: 10px;"></div>
						<button class="btn btn-primary" type="button" id="idDuplication"
							onclick="check();">중복확인</button>
						<div style="margin-bottom: 10px;"></div>
					</div>
					<div class="col">
						<label for="name">닉네임</label>
						<div>
							<input class="form-control" type="text" id="name">
						</div>
					</div>
					<div class="col">
						<label for="pwd">비밀번호</label>
						<div>
							<input class="form-control" type="password" id="pwd">
						</div>
					</div>
	
					<div class="col">
						<label for="repwd">비밀번호 확인</label>
						<div>
							<input class="form-control" type="password" id="rePwd">
						</div>
					</div>
					<div class="col">
						<label for="pnum">전화번호</label>
						<div>
							<input class="form-control" id="pnum" type="text">
						</div>
					</div>
					<div class="col">
						<label for="email">이메일</label>
						<div>
							<input class="form-control" id="email">
						</div>
					</div>
					<div class="col">
						<div style="margin-top: 10px; margin-bottom: 10px;">성별</div>
						<div class="row" style="margin-left: 10px;">
							<div>
								<input type="radio" name="gender" id="gen1" value="남성"><label
									for="gen1">남성</label>
							</div>
							<div style="width: 100px"></div>
							<div>
								<input type="radio" name="gender" id="gen2" value="여성"><label
									for="gen2">여성</label>
							</div>
						</div>
						<div class="col" style="margin: 10px;">
							<div class="mb-4">
								<input class="btn btn-primary btn-lg btn-block" type="button"
									value="가입하기" onclick="join(this.form);">
							</div>
						</div>
					</div>
				</div>
			</div> -->
			<!-- 간편한 로그인을 위해 주소,전화번호는 나중에 결제페이지에서 추가적으로 넣는게 어떤가 싶음-->
		</form>
		<br>
		<jsp:include page="../comp/footer.jsp" flush="false" />
	</body>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>