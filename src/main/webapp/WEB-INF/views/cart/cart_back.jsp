<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	 function total_price(index) {
    	let quantity = document.getElementById("quantity_" + index).value;
    	let p_price = document.getElementById("p_price_" + index).value;
    	let total = quantity * p_price;
    	document.getElementById("total_" + index).innerText = total;
	}
	/* window.onload = function() {
	   	 let rows = document.querySelectorAll('[id^="quantity_"]');
	     rows.forEach(function(row, index) {
	         total_price(index);
	     });
	}   */
   	
   </script>
</head>
<body>
	<div class="container mt-5">
		<h2 class="mb-4">장바구니</h2>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">사진</th>
						<th scope="col">상품</th>
						<th scope="col">가격</th>
						<th scope="col">수량</th>
						<th scope="col">합계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cart" items="${list}" varStatus="status">
						<tr>
							<td><img src="resources/productimages/${cart.p_image}"
								class="img-thumbnail" alt="${cart.p_name}" style="width: 100px;"></td>
							<td>${cart.p_name}</td>
							<td><input id="p_price_${status.index}"
								value="${cart.p_price}" readonly type="hidden">${cart.p_price}</td>
							<td><input id="quantity_${status.index}" type="number"
								class="form-control" value="${cart.quantity}" min="1"
								onchange="total_price(${status.index})"></td>
							<td id="total_${status.index}">${cart.totalprice }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="d-flex justify-content-end">
			<h4>총 합계: ₩50,000</h4>
		</div>
		<div class="d-flex justify-content-end mt-3">
			<button type="button" class="btn btn-primary">결제하기</button>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>