<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>대댓글</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<style>
			@font-face {
			    font-family: 'Pretendard-Regular';
			    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
			    font-weight: 400;
			    font-style: normal;
			}
			
			body{background-color:#f5f7fa;
				 font-family:'Pretendard-Regular';}
		
			.board{border:2px solid #dbdee4;
				   border-radius:30px 30px 0 0;
			       margin:auto;
				   width:60%;
				   padding:20px;
				   background-color:white;
				   margin-top:50px;}
				   
			.comment-box{
				border:2px solid #dbdee4;
				border-top:none;
				background-color:#eff2f6;
				border-radius:0 0 30px 30px;
				margin:auto;
				width:60%;
				padding:20px; 
			}
			
			.top{height:50px;
				 position:relative;
				 margin-bottom:5px;}
				       
			.name{position:absolute;
				  left:60px;
				  top:15px;
				  font-size:18px;}
			
			#avatar{font-size:40px;
					margin-left:5px;
					position:absolute;
					color:#525b75;}
				   
			.date{position:absolute; 
				  right:15px; 
				  top:15px;
				  font-size:18px;}
			
			.content{margin:5px;
					 padding:10px;} 
			
			.line{border:2px solid lightgray}
			
			/* 댓글 달기 스타일 */
			.write-comment{
				position:relative;
			}
			
			#reply-content{
				display:inline-block;
				font-family:'Pretendard-Regular';
			 	font-weight:400;
				width:86%;
				height:25px;
				border:2px solid #ccc;
				resize:none;
				padding:7px;
				font-size:18px;}
			
			.btn-comment{
				position:absolute;
				display:inline-block;
				right:3px;
				border-radius:4px;
				border:none;
				text-align:center;
				padding:10px;
				cursor:pointer;
				margin:2px;
				width:10%;
				font-family: 'Pretendard-Regular';
				font-weight:600;
				font-size:16px;
				background-color: #3874ff;
				color:white;
			}
			
			.btn-comment:hover{background-color:#004dff;}
			
			.readhit{position:absolute;
					 right:20px;
					 padding:3px;}
		</style>
		
		<script src="resources/js/httpRequest.js"></script>
		<script>
			window.onload = function(){
				reply_list();
			}
		
			function reply_list(){
				let url = "reply_list.do";
				let param = "c_idx=${vo.c_idx}";
				
				sendRequest(url, param, reply_list_result, "POST");
			}
			
			function reply_list_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					// data = comment_list.jsp body에 포함된 내용
					let data = xhr.responseText;
					document.getElementById("replies").innerHTML = data;
				}
			}
		
			function reply(){
				let reply_content = document.getElementById("reply-content").value ;
				
				if(reply_content == ''){
					alert("내용을 입력해주세요.");
					return;
				}
				
				let url = "reply.do";
				let param = "c_idx=${vo.c_idx}&b_idx=${vo.b_idx}&content=" + reply_content;
				
				sendRequest(url, param, reply_result, "POST");
			}
			
			function reply_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText
					
					if(data == -1){
						if(confirm("로그인 회원이 아닌 경우 댓글을 작성하실 수 없습니다.\n로그인 창으로 이동하시겠습니까?")){
							location.href = "/beauty/login.do";
						}
						return;
					}
					
					if(data == 0){
						alert("댓글 작성 실패");
						return; 
					}
					document.getElementById("textbox").innerHTML = '<textarea id="reply-content" placeholder="댓글을 입력해주세요."></textarea>';
					reply_list();
				}
			}
		</script>
		
	</head>
	<body>
		<div class="board">
			<div class="top">
				<span id="avatar" class="bi bi-person-circle"></span>
				<b class="name">${vo.u_name}</b>
				<b class="date">${fn:split(vo.regdate, ' ')[0]}</b>
			</div>
			<div class="content">${vo.content}</div>
		</div>
		<div class="comment-box">
			<h2>댓글</h2>
			
			<div class="write-comment">
				<span id="textbox"><textarea id="reply-content" placeholder="댓글을 입력해주세요."></textarea></span>
				<button class="btn-comment" onclick="reply(this.form);">댓글 등록</button>
			</div>
			
			<!-- 로그인 확인 -->
			
			<br>
			<div id="replies">
			</div>
			
		</div>
	</body>
</html>