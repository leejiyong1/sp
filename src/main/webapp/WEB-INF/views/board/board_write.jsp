<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새글 쓰기</title>
		
		<script src="/board/resources/js/httpRequest.js"></script>
		<!-- <script src="/resources/js/httpRequest.js"></script> -->
		
		<style>
			@font-face {
			    font-family: 'Pretendard-Regular';
			    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
			    font-weight: 400;
			    font-style: normal;
			}
		
			body{background-color:#f5f7fa;}
			
			h1{font-size:50px;
			   font-family:'Pretendard-Regular';
			   font-weight:900;}
			
			/* .outer{border:2px solid #e5e8ee;
				   border-radius:30px;
				   border-right:6px solid #ff66c4;
				   border-left:6px solid #ff66c4;
			       margin:auto;
				   width:50%;
				   padding:20px;
				   background-color:white;} */
				   
			.outer{
				margin:auto;
				width:40%;
			}
			
			.tag{
				font-family: 'Pretendard-Regular';
				font-weight:400;
				margin-bottom:5px;
			}
			
			input, textarea{
				font-size:16px;
				font-family: 'Pretendard-Regular';
				font-weight:400;
				outline:none;
				border:1px solid #ccc;
				border-radius:5px;
			}
			
			input{width:100%;
				  height:30px;
				  padding:5px;}
			   
			textarea{resize:none;
					 width:100%;
					 height:150px;
					 padding:10px;}
					 
			input:focus{
				border:1px solid #3874ff;
				box-shadow: 0px 2px 8px 0px #3874ff;
			}
			
			textarea:focus{
				border:1px solid #3874ff;
				box-shadow: 0px 2px 8px 0px #3874ff;
			}
			
			/* 드롭다운 옵션 디자인 */
			.dropdown-container{width:109%;}
			.dropdown{display:inline-block;
					  width:47%;
					  }
						   
			select{font-family: 'Pretendard-Regular';
					font-weight:400;
					background-color: white;
				    color: black;
				    padding: 5px;
				    font-size: 16px;
				    border:2px solid #e5e8ee; 
				    cursor: pointer;
				    width:100%;
				    height:40px;
				    border-radius:5px;}
			
			option{background-color:#f9f9f9;
				   color:black;
				   box-border:black;
				   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);} 
			
			select:focus{border:1px solid #3874ff;}
				   
			.board{position:relative;
				   /* box-shadow:5px 5px 3px #ff66c4; */
				   border:2px solid #e5e8ee;
				   border-radius:30px;
			       margin:auto;
				   width:50%;
				   padding:15px;
				   background-color:white;}
			
			/* 취소 & 업로드 버튼 디자인 */
			.btn_send, .btn_back{display:block;
				 border-radius: 4px;
				 border: none;
				 text-align: center;
				 padding: 10px;
				 transition: all 0.5s;
				 cursor: pointer;
				 margin: 2px;
				width:103%;
				font-family: 'Pretendard-Regular';
				font-weight:600;
				font-size:16px;}
			
			.btn_send{background-color: #3874ff;
					  color:white;}
			
			.btn_back{background-color:#f5f7fa;
					  color:#f4511e;} 
				 
			.send, .back {cursor: pointer;
				   display: inline-block;
				   position: relative;}
			
			.btn_send:hover{background-color:#004dff;}
						
			/* .send:after {content:'\00bb';
						 position:absolute;
						 opacity:0;
						 top:0;
						 right:-20px;
						 transition:0.5s;}
						  		
			.btn_send:hover .send {padding-right: 15px;}
			
			.btn_send:hover .send:after {opacity: 1; right: 0;}
			  */
			/* .back {cursor: pointer;
				   display: inline-block;
				   position: relative;
				   transition: 0.5s;} */
			 
			/* .back:after {content:'\00ab';
						 position:absolute;
						 opacity:0;
						 top:0;
						 left:-20px;
						 transition:0.5s;}
						  		
			.btn_back:hover .back {padding-left: 15px;}
			
			.btn_back:hover .back:after {opacity: 1; left: 0;} */
			
			/* TEST================================================================= */
			/* details {
			    display: inline-block;
			    width: 250px;
			    background-color: white;
			    cursor: pointer;
			}
			
			summary {
			    border:none;
			    border-collapse:collapse;
			    border-radius:4px;
			    padding:4px;
			    padding-left:10px;
			    width:189px;
			    height:30px;
			    font-size: 20px;
			    background-color:#00A56B;
			    color:white;
			    cursor: pointer;
			}
			details[open] > summary::marker {
			    color: var(--blue);
			}
			
			summary:focus,
			summary:active {
			    box-shadow: 0 0 5px 1px var(--blue);
			}
			/* background-color:#f9f9f9;
				   color:black;
				   box-border:none;
				   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
				   z-index: 1; */
			/* ul {
			    list-style: none;
			    margin: 0px;
			    padding: 5px;
			    margin-top: 2px;
			  border: 1px solid #ccc;
			    box-shadow: 0px 8px 10px 0px rgba(0,0,0,0.2);
			}
			li {
			    margin: 0px;
			    padding: 0px;
			}
			li > label {
			    cursor: pointer;
			    display: inline-block;
			    width: 100%;
			}
			li > label:hover,
			li > label:has(input:checked) {
			    background-color: var(--dk-gray);
			    color: black;
			} */
		</style>
		
		<script>
			function onCheck(checkbox, name){
			    let checkboxes = document.getElementsByName(name);
			    for(let i = 0; i < checkboxes.length; i++){
			    	if(checkboxes[i].value != checkbox) {
			    		checkboxes[i].checked = false;
			    	}
			    }
			}
			function send(f){
				//necessary?
				let subject = f.subject.value;
				let content = f.content.value;
				let t_idx = f.t_idx.value;
				let p_idx = f.p_idx.value;
				/* let t_checkboxes = document.getElementsByName('tone');
				let p_checkboxes = document.getElementsByName('product');
				let t_idx = 0;
				let p_idx = 0; */
				
				/* for(let i = 0; i < t_checkboxes.length; i++){
					if(t_checkboxes[i].checked == true){
						alert("i: " + i + " t_cb: " + t_checkboxes[i].value);
						t_idx = t_checkboxes[i].value;
					}
				}
				
				for(let i = 0; i < p_checkboxes.length; i++){
					if(p_checkboxes[i].checked == true){
						alert("i: " + i + " p_cb: " + p_checkboxes[i].value);
						p_idx = p_checkboxes[i].value;
					}
				} */
				
				//return해도 제목과 내용 안없어지게 하기
				if(subject == ''){
					alert("제목을 입력해주세요.");
					return;
				}
				
				if(content == ''){
					alert("내용을 입력해주세요.");
					return;
				}
				if(t_idx == '톤을 선택해주세요'){
					alert("톤을 선택해주세요.");
					return;
				}
				
				if(p_idx == '제품을 선택해주세요'){
					alert("제품을 선택해주세요.");
					return;
				}
				
				f.action = "board_upload.do";
				f.method = "POST"; 
				f.submit();
				
				//Ajax 안됨
				//let url = "board_upload.do";
				//let param = "subject=" + subject + "&content=" + content;
				
				//sendRequest(url, param, send_result, "POST");
			}
			
			function send_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					alert("in?")
					if(data == "Fail"){
						alert("글 업로드에 실패하였습니다. 관리자에게 문위해 주십시오.");
						return;
					}else{
						document.write("in else?");
						alert("글 업로드에 성공하였습니다!");
						location.href = "/board_list.do";
					}
				}
			}			
			
			function back(){
				document.write("hi");
				location.href='board_list.do';
			}
		</script>
		
	</head>
	<body> 
		<!-- 로그인 여부 확인 -->
		<%-- <c:if test=${login eq 0}>
			<jsp:include page="/WEB-INF/views/login/login.jsp">
		</c:if> --%>
		
		<h1 align="center">새 글 쓰기</h1>
		<form>
			<div class="outer">
				<div class="box">
					<div class="tag">제목</div> 
					<input class="subject-input" name="subject" placeholder="제목을 입력해주세요.">
					<!-- <div class="top">
						<div>제목</div> <input class="subject-input" name="subject" placeholder="제목을 입력해주세요.">
					</div> -->
					<br>
					<br>
					<div class="tag">내용</div>
					<textarea name="content" placeholder="내용을 입력해주세요."></textarea>
					<br><br>
					<div class="dropdown-container">
						<div class="dropdown">
							<select name="t_idx">
								<option disabled selected>톤을 선택해주세요</option>
								<option value="1">봄 웜</option>
								<option value="2">여름 쿨</option>
								<option value="3">가을 웜</option>
								<option value="4">겨울 쿨</option>
							</select>
						</div>
						<div class="dropdown">
							<select name="p_idx">
								<option disabled selected>제품을 선택해주세요</option>
								<option value="1">립</option>
								<option value="2">아이셰도우</option>
								<option value="3">블러셔</option>
								<option value="4">파운데이션</option>
							</select>
						</div>
					</div>
					<br>
				</div>
				
				<button class="btn_send" onclick="send(this.form);" style="vertical-align:middle">
						<span class="send">업로드 </span></button>
				<button class="btn_back" onclick="back();" style="vertical-align:middle" >
						<span class="back"> 뒤로</span></button>
				
				<!-- <div align="right">
					<button class="btn_back" onclick="back();" style="vertical-align:middle" >
						<span class="back"> 뒤로</span></button>
					<button class="btn_send" onclick="send(this.form);" style="vertical-align:middle">
						<span class="send">업로드 </span></button>
				</div> -->
				
			</div>
		</form>
		
	</body>
</html>

<!-- <div class="table" align="center">
				<div class="subject">
					<b>제목</b>
					<input id="subject">
				</div>
				
				<div class="content">
					<b>내용</b>
					<textarea id="content"></textarea>
				</div>
				
				<div class="tone">
					<div class="dropdown">
						<button class="dropdown_btn">Tone</button>
						<div class="dropdown_tone">
							<a href="#">봄 웜톤</a>
							<a href="#">여름 쿨톤</a>
							<a href="#">가을 웜톤</a>
							<a href="#">겨울 쿨톤</a>
						</div>
					</div>
				</div>
				
				<div class="product">
					<div class="dropdown">
						<button class="dropdown_btn">Product</button>
						<div class="dropdown_tone">
							<a href="#">립</a>
							<a href="#">아이셰도우</a>
							<a href="#">블러셔</a>
							<a href="#">파운데이션</a>
						</div>
					</div>
				</div>
			</div> -->





















