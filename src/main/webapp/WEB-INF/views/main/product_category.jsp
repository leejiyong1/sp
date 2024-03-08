<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="index.jsp"/>
	<!-- 컨테이너: 콘텐츠를 중앙에 위치시키기 위한 래퍼 -->
    <div class="container mt-4">
        <!-- 행: 컬럼을 가로로 배치하기 위한 컨테이너 -->
        <div class="row">
            <!-- JSTL forEach: 서버에서 전달된 상품 목록을 순회 -->
            <c:forEach var="product" items="${list }">
                <!-- 컬럼: 그리드 시스템에 맞게 각 상품을 6분할로 표시(분할은 바꿀수있음)짝수로는 가능한데 홀수는 더찾아봐야할것같음 -->
                <div class="col-md-2 mb-3">
                    <!-- 카드: 상품을 표시하기 위한 박스형 컨테이너 -->
                    <div class="card">
                        <!-- 카드 이미지 -->
                        <img src="resources/productimages/${product.p_image }" class="card-img-top" alt="상품 이미지">
                        <!-- 카드 본문 -->
                        <div class="card-body">
                            <!-- 카드 제목 -->
                            <h5 class="card-title">${product.p_name }</h5>
                            <!-- 카드 텍스트 -->
                            <p class="card-text">${product.p_content }</p>
                            <!-- 버튼 -->
                            <a href="product_view.do?p_idx=${product.p_idx }" class="btn btn-primary">자세히 보기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- 페이지네이션 또는 추가 정보를 중앙 정렬하여 표시 -->
        <div class="text-center">
            ${page }
        </div>
    </div>
    <!-- 부트스트랩 JS: 부트스트랩의 동적 기능을 사용하기 위한 자바스크립트 파일 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>