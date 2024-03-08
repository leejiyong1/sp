<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.no-results {
	padding: 20px;
	background-color: #f8f9fa;
	border: 1px solid #e9ecef;
	border-radius: .25rem;
	margin-top: 20px;
}

/* 카드 크기 조정 */
.card {
	margin: 10px; /* 바깥쪽 여백을 줄임 */
	padding: 10px; /* 안쪽 패딩을 줄임 */
	border-radius: 10px; /* 모서리 둥글기 */
}
/* 카드 내용 크기 조정 */
.card-body {
	padding: 5px; /* 카드 본문의 패딩 조정 */
}

.card-title, .card-text {
	font-size: 14px; /* 제목과 텍스트의 글꼴 크기 조정 */
}
</style>
</head>
<body>
	<jsp:include page="../main/nav.jsp" />
	<c:if test="${!empty list }">
		<div class="container mt-4">
			<div class="row">
				<c:forEach var="product" items="${list }">
					<div class="col-sm-4 mb-3">
						<div class="thumbnail">
							<img src="resources/productimages/${product.p_image }"
								 class="img-fluid" alt="Responsive image" alt="상품 이미지">
							<div class="caption">
								<h3>${product.p_name }</h3>
								<p>${product.p_content }</p>
								<div>
									<c:forEach begin="1" end="${product.avg_star}" var="i">
										<span class="fas fa-star text-warning"></span>
									</c:forEach>
									<c:forEach begin="${product.avg_star+1}" end="5" var="i">
										<span class="far fa-star text-warning"></span>
									</c:forEach>
									<span class="text-body-quaternary fw-semibold ms-1">(${product.total_comments}
										people rated)</span>
								</div>
								<p>
									<a href="product_view.do?p_idx=${product.p_idx }"
										class="btn btn-primary" role="button">자세히 보기</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="text-center">${page_menu }</div>
		</div>
	</c:if>
	<c:if test="${empty list }">
		<div class="container text-center">
			<div class="no-results">
				<h5>검색 결과가 없습니다.</h5>
				<p>다른 검색어로 시도해보세요.</p>
			</div>
		</div>
	</c:if>
</body>
</html>