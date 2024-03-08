<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${vo.subject}</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<style>
			@font-face {
			    font-family: 'Pretendard-Regular';
			    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
			    font-weight: 400;
			    font-style: normal;
			}
		
			body{background-color:#f5f7fa;
				 font-family: 'Pretendard-Regular';} 
		
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
				 position:relative;}
				       
			.name{position:absolute;
				  left:53px;
				  top:20px;
				  font-size:18px;}
			
			#avatar{width:50px;
					height:50px;
					position:absolute;
					font-size:45px;
					color:#525b75;}
				   
			.date{position:absolute; 
				  right:5px; 
				  top:15px;
				  font-size:18px;}
				   
			.subject{height:60px;
				     padding:5px;
				     font-size:30px;}
			
			.content{margin:2px 0 10px 0;
					 padding:3px;
					 font-size:16px;
					 font-family:'Pretendard-Regular';
					 font-weight:400;} 
			
			#like_icon, #readhit_icon, #comment_icon{
					font-size:20px;
					color:#525b75;}
			
			.bottom{position:relative;}
			#readhit_icon{
				position:absolute;
				right:20px;}
				 	   
			#like{margin-left:7px !important;}	
			
			/* Tag Design */
			.tag-box{height:30px;
					 margin:5px;}
			
			.tag-box span{display:inline;
						 border:none;
						 border-radius:10px;
						 background-color:#EAEAEB;
						 padding:7px;}
				 
			.line{border:2px solid lightgray;}
			
			/* 댓글 달기 스타일 */
			.write-comment{
				position:relative;
			}
			
			#c_content{
				
				display:inline-block;
				font-family:'Pretendard-Regular';
			 	font-weight:400;
				width:86%;
				height:25px;
				border:2px solid #ccc;
				resize:none;
				padding:7px;
				font-size:18px;}
			
			.btn_comment{
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
			
			.btn_comment:hover{background-color:#004dff;}
			
		</style>
		
		<script src="resources/js/httpRequest.js"></script>
		<script>
			window.onload = function(){
				comment_list();
			}
			
			function comment_list(){
				let url = "comment_list.do";
				let param = "b_idx=${vo.b_idx}";
				
				sendRequest(url, param, comment_list_result, "POST");
			}
			
			function comment_list_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					// data = comment_list.jsp body에 포함된 내용
					let data = xhr.responseText;
					document.getElementById("comment").innerHTML = data;
					//document.getElementById("comment_count").innerHTML = "${vo.getComment_count()}";
				}
			}
			
			function comment_send(){
				
				let c_content = document.getElementById("c_content").value ;
				
				let url = "comment_write.do";
				let param = "b_idx=${vo.b_idx}&content=" + c_content;
				
				sendRequest(url, param, comment_send_result, "POST");
			}
			
			function comment_send_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText
					
					if(data == -1){
						if(confirm("로그인 회원이 아닌 경우 댓글을 작성하실 수 없습니다.\n로그인 창으로 이동하시겠습니까?")){
							location.href = "/beauty/login.do";
						}
						return;
					}
					
					//댓글박스 비우기
					document.getElementById("c_content").innerHTML = "";
					
					if(data == 0){
						alert("댓글 작성 실패");
						return; 
					}
					document.getElementById("textbox").innerHTML = '<textarea id="c_content" placeholder="댓글을 입력해주세요."></textarea>';
					
					comment_list();
				}
			}
			
			function like_click(){
				//u_idx 넘기기?
				
				let url = "board_like.do";
				let param = "b_idx=${vo.b_idx}";
				
				sendRequest(url, param, like_click_result, "POST");
			}
			
			function like_click_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					
					if(data == -1){
						if(confirm("로그인 회원이 아닌 경우 좋아요를 누를 수 없습니다.\n로그인 창으로 이동하시겠습니까?")){
							location.href = "/beauty/login.do";
						}
						return;
					}
					
					//like 수 증가 refresh가 맨 위 게시글 밖에 안됨
					if(data == 0){
						//좋아요 수가 0일 경우 화면에 좋아요 수 안띄움
						document.getElementById("like").innerHTML = '<i id="like_icon" class="bi bi-heart"></i>';
					}
					else if(data >= ${vo.likes_count}){
						//아이콘 스타일 변경
						document.getElementById("like").innerHTML = '<i id="like_icon" class="bi bi-heart-fill"></i>&nbsp;' 
							+ data;
						document.getElementById("like_icon").style.color = "#FF2279";
						
					}else if(data < ${vo.likes_count}){
						document.getElementById("like").innerHTML = '<i id="like_icon" class="bi bi-heart"></i>&nbsp;' 
							+ data;
						
					}
					
					
				}
			}
			
			function like_check(){
				url = "board_like_check.do";
				param = "b_idx=${vo.b_idx}";
				
				sendRequest(url, param, like_check_result, "POST");
			}
			
			function like_check_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					if(data == "like"){
						document.getElementById("like").innerHTML = '<i id="like_icon" class="bi bi-heart-fill"></i>&nbsp;'
							+ data + '&nbsp;&nbsp;';
						document.getElementById("like_icon").style.color = "#FF2279";
						
					}
				}
			}
		</script>
		
	</head>
	<body>
		<div class="board">
			<div class="subject"><strong>${vo.subject}</strong></div>
			<div class="top">
				<span id="avatar" class="bi bi-person-circle"></span>
				<b class="name">${vo.u_name}</b>
				<b class="date">${fn:split(vo.regdate, ' ')[0]}</b>
			</div>
			<div class="content"><pre>${vo.content}</pre></div>
			<div class="tag-box">
				<span>#${vo.t_name}</span>
				<span>#${vo.p_name}</span>
			</div>
			<!-- 구분선 -->
			<hr>
			<div class="bottom">
				<i id="comment_icon" class="bi bi-chat-fill"></i>&nbsp;${vo.comment_count}
				
				<c:if test="${vo.likes_count eq 0}">
					<span id="like" onclick="like_click();"><i id="like_icon" class="bi bi-heart"></i></span>
				</c:if>
				
				<c:if test="${vo.likes_count ne 0}">
					<c:if test="${check_like eq 0}">
						<span id="like" onclick="like_click();">
							<i id="like_icon" class="bi bi-heart"></i>&nbsp;${vo.likes_count}</span>
					</c:if>
					<c:if test="${check_like eq 1}">
						<span id="like" onclick="like_click();">
							<i id="like_icon" class="bi bi-heart-fill" style="color:#FF2279;"></i>&nbsp;${vo.likes_count}</span>
					</c:if>
				</c:if>
				
				<span id="readhit_icon" class="bi bi-eye-fill">&nbsp;${vo.readhit}</span>
			</div>
			</div>
			<div class="comment-box">
				<h2>댓글</h2>
				
				<div class="write-comment">
					<span id="textbox"><textarea id="c_content" placeholder="댓글을 입력해주세요."></textarea></span>
					<button class="btn_comment" onclick="comment_send();">
						<span class="cmt">댓글 등록</span></button>
				</div>
				
				<!-- 로그인 확인 -->
				
				<br>
				<br>
				<div id="comment">
				</div>
			</div>
		
	</body>
</html>

<!-- 삭제 & 수정 기능
			<input type="button" value="삭제" onclick="board_delete(${vo.b_idx});">
			<input type="button" value="수정" onclick="location.href='board_update_form.do?b_idx=${vo.b_idx}'"> -->

<!-- ========================삭제 기능==============================
function board_delete(b_idx){
	if(!confirm("정말로 삭제하시겠습니까?")){
		return;
	}
	
	url = "board_delete.do";
	param = "b_idx=" + b_idx;
	sendRequest(url, param, board_delete_result, "POST");
}

function board_delete_result(){
	if(xhr.readyState == 4 && xhr.status == 200){
		let data = xhr.responseText;
		
		if(data == 0){
			alert("삭제에 실패했습니다. 관리자에게 문의해주세요.");
			return;
		}
		
		alert("삭제에 성공했습니다.");
		location.href = "board_list.do";
	}
} -->









































