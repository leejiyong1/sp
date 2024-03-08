<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Phoenix</title>


<title>Insert title here</title>
</head>

<div class="d-flex flex-between-center mb-3">
	<h3>현재 인기 상품</h3>
	<a class="fw-bold d-none d-md-block" href="#!">더보기<span
		class="fas fa-chevron-right fs-9 ms-1"></span></a>
</div>
<div class="swiper-theme-container products-slider">
	<div class="swiper swiper theme-slider"
		data-swiper='{"slidesPerView":1,"spaceBetween":16,"breakpoints":{"450":{"slidesPerView":2,"spaceBetween":16},"576":{"slidesPerView":3,"spaceBetween":20},"768":{"slidesPerView":4,"spaceBetween":20},"992":{"slidesPerView":5,"spaceBetween":20},"1200":{"slidesPerView":6,"spaceBetween":16}}}'>
		<div class="swiper-wrapper">
			<c:forEach var="product" items="${list }">
				<div class="swiper-slide">
					<div
						class="position-relative text-decoration-none product-card h-100">
						<div class="d-flex flex-column justify-content-between h-100">
							<div>
								<div
									class="border border-1 border-translucent rounded-3 position-relative mb-3">
									<button
										class="btn btn-wish btn-wish-primary z-2 d-toggle-container"
										data-bs-toggle="tooltip" data-bs-placement="top"
										title="Add to wishlist">
										<span class="fas fa-heart d-block-hover"></span><span
											class="far fa-heart d-none-hover"></span>
									</button>
									<img class="img-fluid"
										src="resources/productimages/${product.p_image }" alt="" />
								</div>
								<a class="stretched-link"
									href="resources/apps/e-commerce/landing/product-details.html">
									<h6 class="mb-2 lh-sm line-clamp-3 product-name">${product.p_name }</h6>
								</a>
								<p class="fs-9">
									<span class="fa fa-star text-warning"></span> <span
										class="fa fa-star text-warning"></span> <span
										class="fa fa-star text-warning"></span> <span
										class="fa fa-star text-warning"></span> <span
										class="fa fa-star text-warning"></span> <span
										class="text-body-quaternary fw-semibold ms-1">(59
										people rated)</span>
								</p>
							</div>
							<div>
								<h3 class="text-body-emphasis">${product.p_price }</h3>
							</div>
						</div>
					</div>
				</div>
				<!-- 1 -->
			</c:forEach>
		</div>
	</div>
	<div class="swiper-nav">
		<div class="swiper-button-next">
			<span class="fas fa-chevron-right nav-icon"></span>
		</div>
		<div class="swiper-button-prev">
			<span class="fas fa-chevron-left nav-icon"></span>
		</div>
	</div>
</div>
<a class="fw-bold d-md-none" href="#!">Explore more<span
	class="fas fa-chevron-right fs-9 ms-1"></span></a>

</body>
</html>