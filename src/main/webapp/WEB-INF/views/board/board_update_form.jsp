<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새글 쓰기</title>
		
		<style>
			.outer{border:3px solid black;
				   border-radius:30px;
			       margin:auto;
				   width:75%;
				   padding:15px;
				   background-color:white;}
			
			b{font-size:16px;}
			
			input{width:50%;
				  height:30px;
				  font-size:16px;
				  padding:5px;}
			   
			textarea{resize:none;
					 width:95%;
					 height:150px;
					 font-size:16px;
					 padding:10px;}
			
			/* 드롭다운 옵션 디자인 */
			.dropdown{display:inline-block;}
						   
			select{background-color: #00A56B;
						    color: white;
						    padding: 5px;
						    font-size: 20px;
						    border: none;
						    cursor: pointer;
						    width:200px;
						    height:40px;
						    border-radius:4px;}
			
			option{background-color:#f9f9f9;
				   color:black;
				   box-border:none;
				   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
				   z-index: 1;}
			
			/* 취소 & 업로드 버튼 디자인 */
			.btn_send, .btn_back{display: inline-block;
				 border-radius: 4px;
				 color: #FFFFFF;
				 border: none;
				 text-align: center;
				 font-size: 15px;
				 padding: 10px;
				 width: 90px;
				 transition: all 0.5s;
				 cursor: pointer;
				 margin: 2px;}
				 
			.btn_send{background-color: #00A56B;}
			
			.btn_back{background-color: #f4511e;}
				 
			.send, .back {cursor: pointer;
				   display: inline-block;
				   position: relative;
				   transition: 0.5s;}
						
			.send:after {content:'\00bb';
						 position:absolute;
						 opacity:0;
						 top:0;
						 right:-20px;
						 transition:0.5s;}
						  		
			.btn_send:hover .send {padding-right: 15px;}
			
			.btn_send:hover .send:after {opacity: 1; right: 0;}
			 
			.back:after {content:'\00ab';
						 position:absolute;
						 opacity:0;
						 top:0;
						 left:-20px;
						 transition:0.5s;}
						  		
			.btn_back:hover .back {padding-left: 15px;}
			
			.btn_back:hover .back:after {opacity: 1; left: 0;}
		</style>
		
		<script src="/board/resources/js/httpRequest.js"></script>
		<script>
			function board_update(){
				let f = document.f;
				
				//necessary?
				let subject = f.subject.value;
				let content = f.content.value;
				let t_idx = f.t_idx.value;
				let p_idx = f.p_idx.value;
				
				//return해도 제목과 내용 안없어지게 하기
				if(subject == ''){
					alert("제목을 입력해주세요.");
					return;
				}
				
				if(content == ''){
					alert("내용을 입력해주세요.");
					return;
				}
				
				//Optional?
				if(t_idx == 'Choose tone'){
					alert("톤을 선택해주세요.");
					return;
				}
				
				if(p_idx == 'Choose product'){
					alert("제품을 선택해주세요.");
					return;
				}
				
				f.action = "board_update.do"
				f.submit();
				
				/* let url = "board_update.do";
				let param = "b_idx=${vo.b_idx}&subject=" + subject + "&content=" + content + 
							"&t_idx=" + t_idx + "&p_idx=" + p_idx;
				
				sendRequest(url, param, board_update_result, "POST"); */
			}
			
			/* function board_update_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					
					if(data == "Success"){
						alert("글 수정에 성공하였습니다!");
						location.href = "board_view.do?b_idx=${vo.b_idx}";
					}
					
					alert("글 수정에 실패했습니다.");
					return;
				}
			}		 */
			
		</script>
		
	</head>
	<body> 
		<h1 align="center">수정</h1>
		<form name="f" method="POST">
			<div class="outer">
				<div class="box">
					<div class="top">
						<b>제목</b> <input name="subject" value="${vo.subject}" placeholder="제목을 입력해주세요.">
					</div>
					<br>
					<div class="middle">
						<textarea name="content" placeholder="내용을 입력해주세요.">${vo.content}</textarea>
					</div>
					<br>
					<div class="dropdown">
						<select name="t_idx">
							<option disabled selected>Choose tone</option>
							<option value="1">봄 웜</option>
							<option value="2">여름 쿨</option>
							<option value="3">가을 웜</option>
							<option value="4">겨울 쿨</option>
						</select>
					</div>
					<br><br>
					<div class="dropdown">
						<select name="p_idx">
							<option disabled selected>Choose product</option>
							<option value="1">립</option>
							<option value="2">아이셰도우</option>
							<option value="3">블러셔</option>
							<option value="4">파운데이션</option>
						</select>
					</div>
				</div>
				<hr>
				<input type="hidden" name="b_idx" value="${vo.b_idx}">
				<div align="right">
					<button class="btn_back" onclick="history.go(-1)" style="vertical-align:middle" >
						<span class="back"> 이전</span></button>
					<button class="btn_send" onclick="board_update();" style="vertical-align:middle">
						<span class="send">수정 </span></button>
				</div>
				
			</div>
		</form>
		
	</body>
</html>

<%-- <table class="table" align="center">
					<tr>
						<th>제목</th>
						<td><input class="subject" name="subject" value="${vo.subject}"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="content" name="content">${vo.content}</textarea></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<div class="dropdown">
								<select name="t_idx">
									<option disabled selected>Choose tone</option>
									<option value="1">봄 웜</option>
									<option value="2">여름 쿨</option>
									<option value="3">가을 웜</option>
									<option value="4">겨울 쿨</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="dropdown">
								<select name="p_idx">
									<option disabled selected>Choose product</option>
									<option value="1">립</option>
									<option value="2">아이셰도우</option>
									<option value="3">블러셔</option>
									<option value="4">파운데이션</option>
								</select>
							</div>
						</td>
					</tr>
				</table> --%>




















