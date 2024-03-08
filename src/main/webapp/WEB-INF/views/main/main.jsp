<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>Phoenix</title>
<script src="/beauty/resources/js/httpRequest.js"></script>
<script>
	
</script>
</head>
<body>
	<main class="main" id="top">
		<jsp:include page="nav.jsp" />
		<div class="ecommerce-homepage pt-5 mb-9">
			<!-- ============================================-->
			<!-- <section> begin ============================-->
			<section class="py-0">
				<div class="container-small">
					<div class="scrollbar">
						<div class="d-flex justify-content-between">
							<a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2 bg-warning-subtle light">
									<span class="fs-4 uil uil-star text-warning"></span>
								</div>
								<p class="nav-label">Deals</p>
							</a><a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2">
									<span class="fs-4 uil uil-shopping-bag"></span>
								</div>
								<p class="nav-label">Grocery</p>
							</a><a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2">
									<span class="fs-4 uil uil-watch-alt"></span>
								</div>
								<p class="nav-label">Fashion</p>
							</a><a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2">
									<span class="fs-4 uil uil-mobile-android"></span>
								</div>
								<p class="nav-label">Mobile</p>
							</a><a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2">
									<span class="fs-4 uil uil-monitor"></span>
								</div>
								<p class="nav-label">Electronics</p>
							</a><a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2">
									<span class="fs-4 uil uil-estate"></span>
								</div>
								<p class="nav-label">Home</p>
							</a><a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2">
									<span class="fs-4 uil uil-lamp"></span>
								</div>
								<p class="nav-label">Dining</p>
							</a><a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2">
									<span class="fs-4 uil uil-gift"></span>
								</div>
								<p class="nav-label">Gifts</p>
							</a><a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2">
									<span class="fs-4 uil uil-wrench"></span>
								</div>
								<p class="nav-label">Tools</p>
							</a><a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2">
									<span class="fs-4 uil uil-plane-departure"></span>
								</div>
								<p class="nav-label">Travel</p>
							</a><a class="icon-nav-item" href="#!">
								<div class="icon-container mb-2">
									<span class="fs-4 uil uil-palette"></span>
								</div>
								<p class="nav-label">Others</p>
							</a>
						</div>
					</div>
				</div>
				<!-- end of .container-->
			</section>
			<!-- =============================================== 네비게이션 바 끝 ================================================================-->
			<!-- =============================================== 슬라이드 시작 ================================================================-->
			<section class="py-0 px-xl-3">
				<div class="container px-xl-0 px-xxl-3">
					<div class="row g-3 mb-9">
						<div class="col-12">
							<div class="whooping-banner w-100 rounded-3 overflow-hidden">
								<div class="bg-holder z-n1 product-bg"
									style="background-image: url(resources/assets/img/e-commerce/whooping_banner_product.png); background-position: bottom right;"></div>
								<!--/.bg-holder-->
								<div class="bg-holder z-n1 shape-bg"
									style="background-image: url(resources/assets/img/e-commerce/whooping_banner_shape_2.png); background-position: bottom left;"></div>
								<!--/.bg-holder-->
								<div class="banner-text" data-bs-theme="light">
									<h2 class="text-warning-light fw-bolder fs-lg-3 fs-xxl-2">
										Whooping <span class="gradient-text">60% </span>Off
									</h2>
									<h3 class="fw-bolder fs-lg-5 fs-xxl-3 text-white">on
										everyday items</h3>
								</div>
								<a class="btn btn-lg btn-primary rounded-pill banner-button"
									href="#!">Shop Now</a>
							</div>
						</div>
					</div>
				</div>
				<!-- =============================================== 오늘의 세일 상품 시작 ================================================================-->
				<div class="row g-4 mb-6">
					<div class="col-12 col-lg-9 col-xxl-10">
						<div class="d-flex flex-between-center mb-3">
							<div class="d-flex">
								<span class="fas fa-bolt text-warning fs-6"></span>
								<h3 class="mx-2">오늘의 세일 상품</h3>
								<span class="fas fa-bolt text-warning fs-6"></span>
							</div>
							<a class="btn btn-link btn-lg p-0 d-none d-md-block" href="#!">더보기<span
								class="fas fa-chevron-right fs-9 ms-1"></span></a>
						</div>
						<div class="swiper-theme-container products-slider">
							<div class="swiper swiper theme-slider"
								data-swiper='{"slidesPerView":1,"spaceBetween":16,"breakpoints":{"450":{"slidesPerView":2,"spaceBetween":16},"768":{"slidesPerView":3,"spaceBetween":20},"1200":{"slidesPerView":4,"spaceBetween":16},"1540":{"slidesPerView":5,"spaceBetween":16}}}'>
								<div class="swiper-wrapper">
<c:forEach var="product" items="${d_list }">
										<div class="swiper-slide">
											<div
												class="position-relative text-decoration-none product-card h-100">
												<div
													class="d-flex flex-column justify-content-between h-100">
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
															href="product_view.do?p_idx=${product.p_idx }">
															<h6 class="mb-2 lh-sm line-clamp-3 product-name">${product.p_name }</h6>
														</a>
														<p class="fs-9">

															<c:forEach begin="1" end="${product.avg_star}" var="i">
																<span class="fas fa-star text-warning"></span>
															</c:forEach>
<c:forEach begin="${product.avg_star+1}" end="5" var="i">
																<span class="far fa-star text-warning"></span>
															</c:forEach>
															<span class="text-body-quaternary fw-semibold ms-1">(${product.total_comments}
명 리뷰)</span>
														</p>
</div>
<div>
														<div class="d-flex align-items-center mb-1">
															<p
																class="me-2 text-body text-decoration-line-through mb-0">
																<fmt:formatNumber value="${product.p_price}"
																	type="currency" currencySymbol="" groupingUsed="true" />
																원
															</p>
															<h3 class="text-body-emphasis mb-0">
																<fmt:formatNumber value="${product.discountprice}"
																	type="currency" currencySymbol="" groupingUsed="true" />
																원
															</h3>
														</div>
														<!-- <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p> -->
													</div>
												</div>
											</div>
										</div>
</c:forEach>
</div>
								<!-- dd -->
							</div>
							<!-- <div class="swiper-nav swiper-product-nav">
                    <div class="swiper-button-next"><span class="fas fa-chevron-right nav-icon"></span></div>
                    <div class="swiper-button-prev"><span class="fas fa-chevron-left nav-icon"></span></div>
                  </div> -->
							<!-- </div><a class="fw-bold d-md-none px-0" href="#!">더보기<span class="fas fa-chevron-right fs-9 ms-1"></span></a> -->
						</div>
						<!-- <div class="col-lg-3 d-none d-lg-block col-xxl-2">
                <div class="h-100 position-relative rounded-3 overflow-hidden">
                  <div class="bg-holder" style="background-image:url(resources/assets/img/e-commerce/4.png);"></div>
                  /.bg-holder
                </div>
              </div> -->
						<br>
						<!-- =============================================== 현재 인기 상품 시작 ================================================================-->
						<div class="col-12 d-lg-none">
							<a href="#!"><img class="w-100 rounded-3"
								src="resources/assets/img/e-commerce/6.png" alt="" /></a>
						</div>
					</div>
					<div class="mb-6" id="best_list">
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
												<div
													class="d-flex flex-column justify-content-between h-100">
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
															<c:forEach begin="1" end="${product.avg_star}" var="i">
																<span class="fas fa-star text-warning"></span>
															</c:forEach>
<c:forEach begin="${product.avg_star+1}" end="5" var="i">
																<span class="far fa-star text-warning"></span>
															</c:forEach>
															<span class="text-body-quaternary fw-semibold ms-1">(${product.total_comments}
명 리뷰)</span>
														</p>
													</div>
													<div>
														<h3 class="text-body-emphasis">
															<fmt:formatNumber value="${product.p_price}"
																type="currency" currencySymbol="" groupingUsed="true" />
															원
														</h3>
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
					</div>
					<!-- =============================================== 추천 상품 시작 ================================================================-->
					<div class="mb-6">
						<div class="d-flex flex-between-center mb-3">
							<h3>추천 상품</h3>
							<a class="fw-bold d-none d-md-block" href="#!">더보기<span
								class="fas fa-chevron-right fs-9 ms-1"></span></a>
						</div>
						<div class="swiper-theme-container products-slider">
							<div class="swiper swiper theme-slider"
								data-swiper='{"slidesPerView":1,"spaceBetween":16,"breakpoints":{"450":{"slidesPerView":2,"spaceBetween":16},"576":{"slidesPerView":3,"spaceBetween":20},"768":{"slidesPerView":4,"spaceBetween":20},"992":{"slidesPerView":5,"spaceBetween":20},"1200":{"slidesPerView":6,"spaceBetween":16}}}'>
								<div class="swiper-wrapper">
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
															src="resources/assets/img/products/25.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">RESPAWN
															200 Racing Style Gaming Chair, in Gray RSP 200 GRY</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">35% off</h6>
												</div>
											</div>
										</div>
									</div>
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
															src="resources/assets/img/products/27.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">LEVOIT
															Humidifiers for Bedroom Large Room 6L Warm and Cool Mist
															for...</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa-regular fa-star text-warning-light"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">18% off</h6>
												</div>
											</div>
										</div>
									</div>
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
															src="resources/assets/img/products/26.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">NETGEAR
															Nighthawk Pro Gaming XR500 Wi-Fi Router with 4 Ethernet
															Ports...</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">15% off</h6>
												</div>
											</div>
										</div>
									</div>
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
															src="resources/assets/img/products/18.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">Rachael
															Ray Cucina Bakeware Set Includes Nonstick Bread Baking
															Cookie Sheet...</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star-half-alt star-icon text-warning"></span><span
															class="fa-regular fa-star text-warning-light"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">20% off</h6>
												</div>
											</div>
										</div>
									</div>
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
															src="resources/assets/img/products/17.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">Xbox
															Series S</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">12% off</h6>
												</div>
											</div>
										</div>
									</div>
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
															src="resources/assets/img/products/24.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">FURINNO
															Computer Writing Desk, Walnut</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">16% off</h6>
												</div>
											</div>
										</div>
									</div>
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
															src="resources/assets/img/products/18.png" alt="" />
													</div>
													<a class="stretched-link"
														href="resources/apps/e-commerce/landing/product-details.html">
														<h6 class="mb-2 lh-sm line-clamp-3 product-name">Seagate
															Portable 2TB External Hard Drive Portable HDD</h6>
													</a>
													<p class="fs-9">
														<span class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa fa-star text-warning"></span><span
															class="fa-regular fa-star text-warning-light"></span>
													</p>
												</div>
												<div>
													<h6 class="text-success lh-1 mb-0">15% off</h6>
												</div>
											</div>
										</div>
									</div>
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
					</div>
					<div class="row flex-center mb-15 mt-11 gy-6">
						<div class="col-auto">
							<img class="d-dark-none"
								src="resources/assets/img/spot-illustrations/light_30.png"
								alt="" width="305" /><img class="d-light-none"
								src="resources/assets/img/spot-illustrations/dark_30.png" alt=""
								width="305" />
						</div>
						<div class="col-auto">
							<div class="text-center text-lg-start">
								<h3 class="text-body-highlight mb-2">
									<span class="fw-semibold">회원이 되어 </span>더 많은 <br
										class="d-md-none" />혜택을 누리고 싶으신가요?
								</h3>
								<h1 class="display-3 fw-semibold mb-4">
									지금 <span class="text-primary fw-bolder">회원가입 </span>하세요!
								</h1>
								<a class="btn btn-lg btn-primary px-7"
									href="resources/pages/authentication/simple/sign-up.html">회원가입<span
									class="fas fa-chevron-right ms-2 fs-9"></span></a>
							</div>
						</div>
					</div>
				</div>
				<!-- end of .container-->
			</section>
			<!-- <section> close ============================-->
			<!-- ============================================-->
		</div>
		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="bg-body-highlight dark__bg-gray-1100 py-9">
			<div class="container-small">
				<div class="row justify-content-between gy-4">
					<div class="col-12 col-lg-4">
						<div class="d-flex align-items-center mb-3">
							<img src="resources/assets/img/icons/logo.png" alt="phoenix"
								width="27" />
							<p class="logo-text ms-2">phoenix</p>
						</div>
						<p class="text-body-tertiary mb-1 fw-semibold lh-sm fs-9">Phoenix
							is an admin dashboard template with fascinating features and
							amazing layout. The template is responsive to all major browsers
							and is compatible with all available devices and screen sizes.</p>
					</div>
					<div class="col-6 col-md-auto">
						<h5 class="fw-bolder mb-3">About Phoenix</h5>
						<div class="d-flex flex-column">
							<a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Careers</a><a
								class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Affiliate
								Program</a><a class="text-body-tertiary fw-semibold fs-9 mb-1"
								href="#!">Privacy Policy</a><a
								class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Terms
								& Conditions</a>
						</div>
					</div>
					<div class="col-6 col-md-auto">
						<h5 class="fw-bolder mb-3">Stay Connected</h5>
						<div class="d-flex flex-column">
							<a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Blogs</a><a
								class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span
								class="fab fa-facebook-square text-primary me-2 fs-8"></span><span
								class="text-body-secondary">Facebook</span></a><a
								class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span
								class="fab fa-twitter-square text-info me-2 fs-8"></span><span
								class="text-body-secondary">Twitter</span></a>
						</div>
					</div>
					<div class="col-6 col-md-auto">
						<h5 class="fw-bolder mb-3">Customer Service</h5>
						<div class="d-flex flex-column">
							<a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Help
								Desk</a><a class="text-body-tertiary fw-semibold fs-9 mb-1"
								href="#!">Support, 24/7</a><a
								class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Community
								of Phoenix</a>
						</div>
					</div>
					<div class="col-6 col-md-auto">
						<h5 class="fw-bolder mb-3">Payment Method</h5>
						<div class="d-flex flex-column">
							<a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Cash
								on Delivery</a><a class="text-body-tertiary fw-semibold fs-9 mb-1"
								href="#!">Online Payment</a><a
								class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">PayPal</a><a
								class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Installment</a>
						</div>
					</div>
				</div>
			</div>
			<!-- end of .container-->
		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->
		<footer class="footer position-relative">
			<div class="row g-0 justify-content-between align-items-center h-100">
				<div class="col-12 col-sm-auto text-center">
					<p class="mb-0 mt-2 mt-sm-0 text-body">
						Thank you for creating with Phoenix<span
							class="d-none d-sm-inline-block"></span><span
							class="d-none d-sm-inline-block mx-1">|</span><br
							class="d-sm-none" />2024 &copy;<a class="mx-1"
							href="https://themewagon.com">Themewagon</a>
					</p>
				</div>
				<div class="col-12 col-sm-auto text-center">
					<p class="mb-0 text-body-tertiary text-opacity-85">v1.15.0</p>
				</div>
			</div>
		</footer>
	</main>
</body>
</html>


