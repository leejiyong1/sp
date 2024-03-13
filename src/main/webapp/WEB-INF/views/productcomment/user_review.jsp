<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 리스트</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<style>
.fas.fa-star {
	color: gold;
}
</style>

<script src="/beauty/resources/js/httpRequest.js"></script>
<script>

	function deleteFunction(pc_idx) {
		let url = "product_comment_delete.do";
		let param = "pc_idx="+pc_idx;
		sendRequest(url,param,deleteresult,"post");
	}
	function deleteresult() {
		if(xhr.readyState == 4 && xhr.status ==200){
			let data = xhr.responseText;
			if(data == "yes"){
			location.href = "my_product_comment.do";
			}else{
				location.href = "main.do";
			}
		}
	}
</script>
<body>
	<div class="container py-5">
		<h2 class="mb-4">내가 쓴 리뷰</h2>
		<div class="row">
			<!-- 리뷰 아이템 -->
			<c:forEach var="pc" items="${list }">
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">${pc.p_name }</h5>
							<h6 class="card-subtitle mb-2 text-muted">${pc.pc_regidate }</h6>
							<p class="card-text">${pc.pc_content }</p>
							<div class="rating">
								<c:set var="pc_star" value="${pc.pc_star }" />
								<c:forEach begin="1" end="${pc_star}" var="i">
									<i class="fas fa-star"></i>
								</c:forEach>
								<c:forEach begin="${pc_star + 1}" end="5" var="i">
									<i class="far fa-star"></i>
								</c:forEach>
							</div>
							<button onclick="location.href = ''" class="btn btn-primary">수정</button>
							<button onclick="deleteFunction(${pc.pc_idx})"
								class="btn btn-danger me-2">삭제</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>