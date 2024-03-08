<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
			
			a{font-family: 'Pretendard-Regular';
				font-weight:600;
				display:inline-block;
			   color:#004dff;
			   text-decoration:none;
			   margin:10px;}
			
			h1{display:inline-block;
			   color:black;
			   font-size:50px;
			   font-family: 'Pretendard-Regular';
			   font-weight:900;}
			
			.top{margin:auto;
				 width:60%;
				 border-bottom:2px solid #dbdee4;
				 position:relative;}
				 
			h1, .dropdown, .new-post-btn{
				/* position:absolute; */
			}
			
			.top-element{
				display:inline-block;
				position:absolute;
				right:0;
				top:10%; 
			}
			
			.new-post-btn, .dropdown-btn{
				font-family: 'Pretendard-Regular';
				font-weight:600;
				background-color:#3874ff;
				color:white;
				border-radius:5px;
				border:none;
				padding:10px;
				text-align:center;
				font-size:15px;
				cursor:pointer;
				margin-top:35px;}
				
			.new-post-btn{
				padding-left:45px;
				padding-right:45px;
			}
						  
			.new-post-btn:hover{background-color:#004dff;}
			.dropdown-btn:hover{background-color:#004dff;}
			
			/* 드롭다운 옵션 디자인 */
			.dropdown-container{
				margin:auto;
				width:50%;
			}
			
			.dropdown-btn{
				padding-left:35px;
				padding-right:35px;
			}
			
			.dropdown{display:inline-block;}
						   
			select{font-family: 'Pretendard-Regular';
					font-weight:400;
					background-color: white;
				    color:black;
				    padding:5px;
				    font-size:16px;
				    border:2px solid #e5e8ee; 
				    cursor:pointer;
				    width:200px;
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

			.middle{cursor:pointer;}
			
			.board-top{height:50px;
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
				  right:5px;
				  top:15px;}
				   
			.subject{font-size:20px;
				     padding:3px;}
			
			.content{margin:2px 0 10px 40px;
					 height:30px;
					 padding:3px;
					 width:350px;
					 overflow:hidden;
					 text-overflow:ellipsis;
					 white-space:nowrap;
					 vertical-align:middle;} 
					 
			/* Icons style */
			#comment_btn, .readhit_icon{display: inline-block;
									 	  border-radius:30%;
									 	  background-color:white;
									 	  font-size:20px;
									 	  text-align: center;
									 	  padding: 5px;
										  height:40px;
									 	  margin: 2px;}
									 	  
			#comment_btn{border: none;
						 cursor: pointer;}
				 	  
			.comment_icon{cursor: pointer;
				 	   	display: inline-block;
				 	   	color:#525b75;}
			
			.tag-box{height:30px;}
			
			.tag{display:inline;
				 border:none;
				 border-radius:10px;
				 background-color:#EAEAEB;
				 padding:5px;}
			
			.readhit_icon{position:absolute;
					 	  right:20px;
					 	  padding:3px;
					 	  color:#525b75;}
		</style>
		
		<script src="/board/resources/js/httpRequest.js"></script>
		<script>
			function send_dropdown(){
				let t_order = document.getElementById("t_order").value;
				let p_order = document.getElementById("p_order").value;
				
				location.href = "board_order_by.do?tone=" + t_order + "&product=" + p_order;
			}	
		
			function view(b_idx){
				location.href = "board_view.do?b_idx=" + b_idx +"&page=${empty param.page ? 1 : param.page}";
			}
		</script>
		
	</head>
	<body>
		<%-- <jsp:include page="/WEB-INF/views/main/top_not_user.jsp" /> --%>
		<%-- <jsp:include page="/WEB-INF/views/board/board_sidebar.jsp" /> --%>
		<a href="/beauty/">&lt 홈으로 돌아가기</a>
		<div class="top">
			<h1>게시판</h1>
			<div class="top-element">
				<button class="new-post-btn" onclick="location.href='board_write.do'">+ 새 글 쓰기</button>
			</div>
		</div>
		<br>
		<div class="dropdown-container">
			<div class="dropdown">
				<select id="t_order">
					<option value="0" disabled selected>톤 별 정렬</option>
					<option value="1">봄 웜</option>
					<option value="2">여름 쿨</option>
					<option value="3">가을 웜</option>
					<option value="4">겨울 쿨</option>
				</select>
			</div>
			<div class="dropdown">
				<select id="p_order">
					<option value="0" disabled selected>제품 별 정렬</option>
					<option value="1">립</option>
					<option value="2">아이셰도우</option>
					<option value="3">블러셔</option>
					<option value="4">파운데이션</option>
				</select>
			</div>
			<button class="dropdown-btn" onclick="send_dropdown();">적용하기</button>
		</div>
		<br>
		<c:forEach var="vo" items="${list}">
			<div class="board" onclick="location.href='board_view.do?b_idx=${vo.b_idx}
													&page=${empty param.page ? 1 : param.page}'">
			<!-- <div class="board"> -->
				<div class="middle" onclick="view(${vo.b_idx});">
					<div class="board-top">
						<span id="avatar" class="bi bi-person-circle"></span>
						<b class="name">${vo.u_name}</b>
						<b class="date">${fn:split(vo.regdate, ' ')[0]}</b>
					</div>
					<div class="subject">
						<strong>${vo.subject}</strong>
					</div>
					<div class="content">${vo.content}</div>
					<div class="tag-box">
						<span class="tag">#${vo.t_name}</span>
						<span class="tag">#${vo.p_name}</span>
					</div>
				</div>
				<hr>
				<div id="bottom">
					<button id="comment_btn" onclick="view(${vo.b_idx});">
							<span class="comment_icon"><i class="bi bi-chat-fill"></i>&nbsp;${vo.comment_count}</span></button>
					<span class="readhit_icon"><i class="bi bi-eye-fill"></i>&nbsp;${vo.readhit}</span>
				</div>
			</div>
			<br>
		</c:forEach>
		
		<div align="center">${pageMenu}</div>

		
		<!-- </div> -->
	</body>
</html>

<!-- .btn{text-align:right;
				 margin-right:90px;
				 vertical-align:middle;}
				 
			.btn_write{display: inline-block;
				 border-radius: 4px;
				 color: #FFFFFF;
				 background-color: #00A56B;
				 border: none;
				 text-align: center;
				 font-size: 15px;
				 padding: 10px;
				 width: 110px;
				 transition: all 0.5s;
				 cursor: pointer;
				 margin: 2px;}
				 
			.write{cursor: pointer;
				      display: inline-block;
				      position: relative;
				      transition: 0.5s;}
						
			.write:after {content:'\00bb';
						 position:absolute;
						 opacity:0;
						 top:0;
						 right:-20px;
						 transition:0.5s;}
						  		
			.btn_write:hover .write {padding-right: 15px;}
			
			.btn_write:hover .write:after {opacity: 1; right: 0;} -->