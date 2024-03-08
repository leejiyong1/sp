<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Phoenix</title>
<script src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
function total_price(index,cart_idx) {
	let quantity = document.getElementById("quantity_" + index).value;
	let p_price = document.getElementById("p_price_" + index).value;
	let total = quantity * p_price;
	let formatter = new Intl.NumberFormat('ko-KR', {
	    style: 'decimal',
	    currency: 'KRW',
	    minimumFractionDigits: 0,
	});
	document.getElementById("total_" + index).innerText = formatter.format(total);
	let url = "updatecart.do";
	let param = "totalprice="+total + "&quantity="+quantity+"&cart_idx="+cart_idx;
	sendRequest(url, param, updatecart, 'POST');
	
}
function updatecart() {
	if(xhr.readyState == 4 && xhr.status ==200){
		let data = xhr.responseText;
		if(data == "no"){
			alert('업데이트x');
			return;
			
		}else{
			let formatter = new Intl.NumberFormat('ko-KR', {
			    style: 'decimal',
			    currency: 'KRW',
			    minimumFractionDigits: 0,
			});
			document.getElementById("totalup").innerText = formatter.format(data)+"원";
			document.getElementById("totalup2").innerText = formatter.format(data)+"원";
			return;
		}
	}
}

function deletecart(cart_idx) {
	if(!confirm('정말로 삭제하시겠습니까?')){
		return;
	}
	let url = "deletecart.do";
	let param = "cart_idx="+cart_idx;
	sendRequest(url, param, deleteresult, 'POST');
}
function deleteresult() {
	if(xhr.readyState == 4 && xhr.status ==200){
		let data = xhr.responseText;
		if(data == "yes"){
			location.href= "cart_list.do";
			return;
		}else{
			alert('실패');
			return;
		}
	}
}
</script>

</head>
<body>
	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<main class="main" id="top">
		<jsp:include page="../main/nav.jsp"></jsp:include>

		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="pt-5 pb-9">
			<div class="container-small cart">
				<h2 class="mb-6">장바구니</h2>
				<div class="row g-5">
					<div class="col-12 col-lg-8">
						<div id="cartTable"
							data-list='{"valueNames":["products","color","size","price","quantity","total"],"page":10}'>
							<div class="table-responsive scrollbar mx-n1 px-1">
								<table class="table fs-9 mb-0 border-top border-translucent">
									<thead>
										<tr>
											<th class="sort white-space-nowrap align-middle fs-10"
												scope="col"></th>
											<th class="sort white-space-nowrap align-middle" scope="col"
												style="min-width: 250px;">상품</th>
											<!--    <th class="sort align-middle" scope="col" style="width:80px;">COLOR</th>
                        <th class="sort align-middle" scope="col" style="width:150px;">SIZE</th> -->
											<th class="sort align-middle text-end" scope="col"
												style="width: 300px;">가격</th>
											<th class="sort align-middle ps-5" scope="col"
												style="width: 200px;">수량</th>
											<th class="sort align-middle text-end" scope="col"
												style="width: 250px;">총가격</th>
											<th class="sort text-end align-middle pe-0" scope="col"></th>
										</tr>
									</thead>
									<tbody class="list" id="cart-table-body">
										<c:forEach var="cart" items="${list}" varStatus="status">
											<tr class="cart-table-row btn-reveal-trigger">
												<td class="align-middle white-space-nowrap py-0"><a
													class="d-block border border-translucent rounded-2"
													href="resources/apps/e-commerce/landing/product-details.html"><img
														src="resources/productimages/${cart.p_image}" alt=""
														width="53" /></a></td>
												<td class="products align-middle"><a
													class="fw-semibold mb-0 line-clamp-2"
													href="resources/apps/e-commerce/landing/product-details.html">${cart.p_name}</a></td>
												<td
													class="price align-middle text-body fs-9 fw-semibold text-end">
													<input id="p_price_${status.index}" value="${cart.p_price}"
													readonly type="hidden"><fmt:formatNumber value="${cart.p_price}"
																type="currency" currencySymbol="" groupingUsed="true" /></td>
												<td class="quantity align-middle fs-8 ps-5">
													<div class="input-group input-group-sm flex-nowrap"
														data-quantity="data-quantity">
														<input id="quantity_${status.index}" type="number"
															class="form-control" value="${cart.quantity}" min="1"
															onchange="total_price(${status.index},${cart.cart_idx })">
													</div>
												</td>
												<td id="total_${status.index}">
												<fmt:formatNumber value="${cart.totalprice }"
																type="currency" currencySymbol="" groupingUsed="true" /></td>
												<td
													class="align-middle white-space-nowrap text-end pe-0 ps-3"><button
														class="btn btn-sm text-body-tertiary text-opacity-85 text-body-tertiary-hover me-2"
														onclick="deletecart(${cart.cart_idx})">
														<span class="fas fa-trash"></span>
													</button></td>
											</tr>
										</c:forEach>
										<tr class="cart-table-row btn-reveal-trigger">
											<td class="text-body-emphasis fw-semibold ps-0 fs-8"
												colspan="6">상품 총가격 :</td>
											<td id="totalup" class="text-body-emphasis fw-bold text-end fs-8">
											<fmt:formatNumber value="${total }"
																type="currency" currencySymbol="" groupingUsed="true"/>원</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex flex-between-center mb-3">
									<h3 class="card-title mb-0">Summary</h3>
									<a class="btn btn-link p-0" href="#!">Edit cart </a>
								</div>
								<!-- <select class="form-select mb-3" aria-label="delivery type">
									<option value="cod">Cash on Delivery</option>
									<option value="card">Card</option>
									<option value="paypal">Paypal</option>
								</select> -->
								<div
									class="d-flex justify-content-between border-y border-dashed py-3 mb-4">
									<h4 class="mb-0">총가격 :</h4>
									<h4 id="totalup2" class="mb-"><fmt:formatNumber value="${total }"
																type="currency" currencySymbol="" groupingUsed="true"/>원</h4>
								</div>
								<button class="btn btn-primary w-100">
									구매<span
										class="fas fa-chevron-right ms-1 fs-10"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end of .container-->
		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->

		<div class="support-chat-container">
			<div class="container-fluid support-chat">
				<div class="card bg-body-emphasis">
					<div
						class="card-header d-flex flex-between-center px-4 py-3 border-bottom border-translucent">
						<h5 class="mb-0 d-flex align-items-center gap-2">
							Demo widget<span class="fa-solid fa-circle text-success fs-11"></span>
						</h5>
						<div class="btn-reveal-trigger">
							<button
								class="btn btn-link p-0 dropdown-toggle dropdown-caret-none transition-none d-flex"
								type="button" id="support-chat-dropdown"
								data-bs-toggle="dropdown" data-boundary="window"
								aria-haspopup="true" aria-expanded="false"
								data-bs-reference="parent">
								<span class="fas fa-ellipsis-h text-body"></span>
							</button>
							<div class="dropdown-menu dropdown-menu-end py-2"
								aria-labelledby="support-chat-dropdown">
								<a class="dropdown-item" href="#!">Request a callback</a><a
									class="dropdown-item" href="#!">Search in chat</a><a
									class="dropdown-item" href="#!">Show history</a><a
									class="dropdown-item" href="#!">Report to Admin</a><a
									class="dropdown-item btn-support-chat" href="#!">Close
									Support</a>
							</div>
						</div>
					</div>
					<div class="card-body chat p-0">
						<div class="d-flex flex-column-reverse scrollbar h-100 p-3">
							<div class="text-end mt-6">
								<a
									class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
									href="#!">
									<p class="mb-0 fw-semibold fs-9">I need help with something</p>
									<span class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
								</a><a
									class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
									href="#!">
									<p class="mb-0 fw-semibold fs-9">I can’t reorder a product
										I previously ordered</p> <span
									class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
								</a><a
									class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
									href="#!">
									<p class="mb-0 fw-semibold fs-9">How do I place an order?</p> <span
									class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
								</a><a
									class="false d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
									href="#!">
									<p class="mb-0 fw-semibold fs-9">My payment method not
										working</p> <span
									class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
								</a>
							</div>
							<div class="text-center mt-auto">
								<div class="avatar avatar-3xl status-online">
									<img class="rounded-circle border border-3 border-light-subtle"
										src="resources/assets/img/team/30.webp" alt="" />
								</div>
								<h5 class="mt-2 mb-3">Eric</h5>
								<p class="text-center text-body-emphasis mb-0">Ask us
									anything – we’ll get back to you here or by email within 24
									hours.</p>
							</div>
						</div>
					</div>
					<div
						class="card-footer d-flex align-items-center gap-2 border-top border-translucent ps-3 pe-4 py-3">
						<div
							class="d-flex align-items-center flex-1 gap-3 border border-translucent rounded-pill px-4">
							<input
								class="form-control outline-none border-0 flex-1 fs-9 px-0"
								type="text" placeholder="Write message" /><label
								class="btn btn-link d-flex p-0 text-body-quaternary fs-9 border-0"
								for="supportChatPhotos"><span class="fa-solid fa-image"></span></label><input
								class="d-none" type="file" accept="image/*"
								id="supportChatPhotos" /><label
								class="btn btn-link d-flex p-0 text-body-quaternary fs-9 border-0"
								for="supportChatAttachment"> <span
								class="fa-solid fa-paperclip"></span></label><input class="d-none"
								type="file" id="supportChatAttachment" />
						</div>
						<button class="btn p-0 border-0 send-btn">
							<span class="fa-solid fa-paper-plane fs-9"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- ===============================================-->
	<!--    End of Main Content-->
	<!-- ===============================================-->



</body>

</html>