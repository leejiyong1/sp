<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트상품</title>
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

<jsp:include page="nav.jsp" />
    <div class="container mt-4">
        <div class="row">
            <c:forEach var="product" items="${list }">
                <div class="col-md-2 mb-3">
                    <div class="card">
                        <img src="resources/productimages/${product.p_image }" class="card-img-top" alt="상품 이미지">
                        <div class="card-body">
                            <h5 class="card-title">${product.p_name }</h5>
                            <p class="card-text">${product.p_content }</p>
								<div>
									<c:forEach begin="1" end="${product.avg_star}" var="i">
										<span class="fas fa-star text-warning"></span>
									</c:forEach>
									<c:forEach begin="${product.avg_star+1}" end="5" var="i">
										<span class="far fa-star text-warning"></span>
									</c:forEach>
									<br>
									<span class="text-body-quaternary fw-semibold ms-1">(${product.total_comments}명 리뷰)</span>
									<h3 class="text-body-emphasis mb-0">
									<fmt:formatNumber value="${product.p_price}"
										type="currency" currencySymbol="" groupingUsed="true" />
									원
								</h3>
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
		</div>
</body>
</html>