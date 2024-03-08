<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Main</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
	</head>

	<style>
		/* Header Style */
		.header .brand{font-size:35px;
					   color:black;
					   text-decoration:none;
					   margin-left:90px;}
		.navbar-navbar-inverse{background-color:white;
								color:black;
								margin-left:60px;}
		#frg{width:500px;}
		.form-control{border-radius:50px;
					  width:85% !important} 
		#search_btn{cursor:pointer;
					font-size:18px;}
					
		#login-bar{margin-right:80px;}
		
		li{color:black;}
		/* .container-fluid{position:relative;} */	
		.search-dropdown .dropdown-menu {
    		width: 84.5%; /* 드롭다운 메뉴의 너비를 부모 요소의 100%로 설정 */
    		margin-top: 0.5rem; /* 드롭다운 메뉴와 검색창 사이의 간격 조정 */
		}
	</style>
	<script src="/beauty/resources/js/httpRequest.js"></script>
    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        let searchInput = document.getElementById('searchInput');
        let dropdownMenu = document.getElementById('searchResultsDropdown');

        // 검색창에 포커스가 있을 때 드롭다운 메뉴를 표시
        searchInput.addEventListener('focus', function() {
            if (this.value.trim().length > 0) {
                $(dropdownMenu).addClass('show');
            }
        });

        // 검색창에서 포커스를 잃었을 때 드롭다운 메뉴를 숨김
        // setTimeout을 사용하여 드롭다운 메뉴의 클릭 이벤트가 먼저 처리될 수 있도록 함
        searchInput.addEventListener('blur', function() {
            setTimeout(function() {
                $(dropdownMenu).removeClass('show');
            }, 100);
        });

        // 검색창에 입력이 있을 때만 검색 함수 호출
        searchInput.addEventListener('input', function() {
            let inputVal = this.value.trim();
            
            // 입력값이 비어있는 경우, 드롭다운 목록을 비우고 숨김
            if (inputVal === '') {
                dropdownMenu.innerHTML = '';
                $(dropdownMenu).removeClass('show');
            } else {
                // 입력값이 있는 경우, 검색 키워드 함수를 호출
                searchkeyword(inputVal);
            }
        });
    });
		
		function searchkeyword(keyword) {
		        // 키워드가 있을 때만 검색을 수행
		        let url = "search_keyword.do";
		        let param = "keyword=" + keyword;
		        sendRequest(url, param, resultKeyword, 'post');
		}
		
		
		function resultKeyword() {
			 if (xhr.readyState == 4 && xhr.status == 200) {
			        let data = xhr.responseText;
			        let productNames = JSON.parse(data); // JSON 문자열을 문자열 배열로 변환
			        // 드롭다운 메뉴를 찾고 기존 항목을 지움
			        let dropdownMenu = document.querySelector('#searchResultsDropdown');
			        dropdownMenu.innerHTML = '';
			        if (productNames.length > 0) {
			            productNames.forEach(function(productName) {
			            	let listItem = document.createElement('li'); // li 요소 생성
			                let dropdownItem = document.createElement('a');
			                dropdownItem.classList.add('dropdown-item');
			                dropdownItem.href = 'search_list.do?keyword=' + productName;
			                dropdownItem.textContent = productName;
			                listItem.appendChild(dropdownItem); // li 요소 안에 a 요소 추가
			                dropdownMenu.appendChild(listItem); // 드롭다운 메뉴에 li 요소 추가
			            });
		
			            // 드롭다운 메뉴를 보이도록
			            $(dropdownMenu).addClass('show');
			        } else {
			            // 검색 결과가 없을 경우 드롭다운 메뉴를 숨김
			            $(dropdownMenu).removeClass('show');
			        }
			    }
		}
		function search_list(f) {
			let keyword = f.keyword.value.trim();
			if(keyword == ''){
				alert('검색어를 입력하세요');
				return;
			}
			f.submit();
		}
	</script>
	
	<body>
		<!--  -->
		<div class="header">
			<a class="brand" href="main.do">Logo</a>
		</div>
		<nav class="navbar-navbar-inverse">
		  <div class="container-fluid">
		    <ul class="nav navbar-nav">
		      <!-- <li class="active"><a href="#">Home</a></li> -->
		      <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown"  id="navbardrop" href="#">카테고리별 <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a class="dropdown-item" href="#">립스틱</a></li>
		          <li><a class="dropdown-item" href="#">파운데이션</a></li>
		          <li><a class="dropdown-item" href="#">아이셰도우</a></li>
		        </ul>
		      </li>
		      
		      <li><a href="#">랭킹</a></li> 
		      <li><a href="#">세일</a></li>
		      <li><a href="#">신상품</a></li>
		      <li><a href="#">브랜드별</a></li>
		      <li><a href="#">🎉이벤트</a></li>
		      <li><a href="board_list.do">게시판</a></li>
		      <li><a href="admin.do">관리자페이지</a></li>
		    </ul>
		    
		    <!-- 검색 -->
		    <form class="navbar-form navbar-left" action="search_list.do" method="get">
		     <div class="dropdown search-dropdown" id="frg">
		        <input type="text" class="form-control dropdown-toggle" placeholder="Search" id="searchInput" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="keyword">
		        <div class="dropdown-menu" id="searchResultsDropdown" aria-labelledby="searchInput">
		        
		        </div>
		        <i class="bi bi-search" id="search_btn" onclick="search_list(this.form)"></i >
		      </div>
		    </form>
				    
		    <ul id="login-bar" class="nav navbar-nav navbar-right">
		      <li><a href="regist.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
		      <li><a href="login.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
		    </ul>
		  </div>
		</nav>
		
   
	</body>
</html>

<%-- <div class="container">
		  <!-- 로그인과 회원가입 링크 -->
				<div align="right">
		      	 <c:if test="${empty mem}">  <!-- 로그인 세션이 null이면 로그인 회원가입 -->
		        <a href="#">로그인</a> /
		        <a href="#">회원가입</a>
		       </c:if>
		       <c:if test="${!empty mem }"> <!-- 로그인 세션이 null이 아니면 마이페이지,장바구니 -->
		       <a href="#">마이페이지</a>
		       <a href="#">장바구니</a>
		       </c:if>
		    </div>
				<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		    <!-- 내비게이션 링크 -->
		    <div class="collapse navbar-collapse" id="collapsibleNavbar">
		      <ul class="navbar-nav">
		       <li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			        카테고리
			      </a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="#">카테고리</a>
			        <a class="dropdown-item" href="#">카테고리</a>
			        <a class="dropdown-item" href="#">카테고리</a><!-- 카테고리 미정 -->
			      </div>
			 
			    </li>
		        <li class="nav-item">
		          <a class="nav-link" href="temp.do">홈</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">추천</a><!-- 로그인시에는 회원의 어울리는 퍼스널컬러 상품,비로그인시에는 무난?한 상품 -->
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="product_best_list.do">베스트</a><!-- 잘팔린 상품 -->
		        </li>
		      </ul>
		
		      <!-- 검색폼 -->
		      <form class="form-inline ml-auto" action="search_list.do" method="get">
		    <div class="dropdown">
		        <input type="text" class="form-control dropdown-toggle" placeholder="Search" id="searchInput" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="keyword">
		        <div class="dropdown-menu" id="searchResultsDropdown" aria-labelledby="searchInput">
		        
		        </div>
		    </div>
		    <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="search_list(this.form)">검색</button>
		</form>
		    </div>
		  </nav>
		</div> --%>
		<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->