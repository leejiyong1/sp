<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    .input-group .dropdown-menu {
        width: 100%; /* 드롭다운의 넓이를 input-group의 넓이와 동일하게 설정 */
    }
</style>
<script src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    let searchInput = document.getElementById('searchInput');

    searchInput.addEventListener('input', function() {
        let inputVal = this.value;
        // 사용자 정의 함수 호출
        searchkeyword(inputVal);
    });
});

function searchkeyword(keyword) {
	let url = "search_keyword.do";
	let param = "keyword="+keyword;
	sendRequest(url,param,resultKeyword,'post');
}

function resultKeyword() {
	 if (xhr.readyState == 4 && xhr.status == 200) {
	        let data = xhr.responseText;
	        let productNames = JSON.parse(data); // JSON 문자열을 문자열 배열로 변환

	        // 드롭다운 메뉴를 찾고 기존 항목을 지움
	        let dropdownMenu = document.querySelector('.dropdown-menu');
	        dropdownMenu.innerHTML = '';

	        // 받은 JSON 데이터(제품 이름 목록)를 사용하여 드롭다운 항목을 생성
	        productNames.forEach(function(productName) {
	            // 새로운 드롭다운 항목 생성
	            let dropdownItem = document.createElement('a');
	            dropdownItem.classList.add('dropdown-item');
	            dropdownItem.href = '#'; // 여기에 실제 제품 페이지나 기능을 연결 가능
	            dropdownItem.textContent = productName; // 직접 문자열을 사용

	            // 드롭다운 메뉴에 항목을 추가
	            dropdownMenu.appendChild(dropdownItem);
	        });
	    }
}
</script>
<body>
<div class="container mt-3">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <!-- Search input group with dropdown and search button -->
            <div class="input-group">
                <input type="text" class="form-control dropdown-toggle" data-toggle="dropdown" placeholder="Search" id="searchInput">
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#"></a>
                </div>
                <div class="input-group-append">
                    <button class="btn btn-outline-primary" type="button" id="button-search">Search</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>