<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 보기</title>
<style>
.review-card {
	margin-bottom: 20px;
}

.review-image {
	max-height: 200px;
	object-fit: cover;
}

.like-count {
	color: #f00;
}

.rating {
	color: #ffc107; /* 별의 색상 */
	font-size: 24px; /* 별의 크기 */
}

.rating i {
	margin-right: 4px; /* 별 사이의 간격 */
}
.img-responsive2 {
  width: 10%;
  height: auto;
}
</style>
</head>
<body>
	<div class="container mt-3">
		<h2 align="center">리뷰 목록</h2>
		<c:if test="${!empty list }">
		<c:forEach var="pc" items="${list }">
			<div class="row">
				<!-- 리뷰 카드 예시 -->
				<div class="col-md">
					<div class="card review-card">
					<h5 class="card-title">${pc.u_id }</h5>
					<div class="rating">
								<c:set var="pc_star" value="${pc.pc_star }" />
								<c:forEach begin="1" end="${pc_star}" var="i">
									<i class="fas fa-star"></i>
								</c:forEach>
								<c:forEach begin="${pc_star + 1}" end="5" var="i">
									<i class="far fa-star"></i>
								</c:forEach>
								<span style="color: black;">${fn:split( pc.pc_regidate, ' ' )[0] }</span>
					</div>
					
						<img src="resources/productcomment/${pc.pc_image}" class="img-responsive2" alt="리뷰 이미지">
						<div class="card-body">
							
							<p class="card-text">${pc.pc_content }</p>
							
							<button class="btn btn-light" onclick="send(${pc.pc_idx})">
							<c:if test="${pc.check eq false }">
								<i class="far fa-thumbs-up" ></i> 좋아요${pc.pc_good }
							</c:if>
							<c:if test="${pc.check eq true }">
								<i class="fas fa-thumbs-up" ></i> 좋아요${pc.pc_good }
							</c:if>
							</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="text-center">
            ${page }
        </div>
        </c:if>
        <c:if test="${empty list }">
        	<h1 align="center">리뷰가 없습니다.</h1>
        </c:if>
	</div>
	</body>
	</html>