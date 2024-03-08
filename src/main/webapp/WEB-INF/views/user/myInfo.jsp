<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html data-navigation-type="default"
	data-navbar-horizontal-shape="default" lang="en-US" dir="ltr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>Phoenix</title>

<!-- ===============================================-->
<!--    Favicons-->
<!-- ===============================================-->
<link rel="apple-touch-icon" sizes="180x180"
	href="resources/assets/img/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="resources/assets/img/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/assets/img/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/assets/img/favicons/favicon.ico">
<link rel="manifest" href="resources/assets/img/favicons/manifest.json">
<meta name="msapplication-TileImage"
	content="resources/assets/img/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">
<script src="resources/vendors/simplebar/simplebar.min.js"></script>
<script src="resources/assets/js/config.js"></script>
<script src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	//계정삭제하기
	function deleteAccount() {
		//let pwd = document.getElementById("input_DeleteAccount").value;
		let email = '${email}';
		let url = "deleteAccount.do";
		//let param = "pwd=" + pwd;
		alert(email);
		sendRequest(url, resultDeleteAccount, "POST");

	}
	function resultDeleteAccount() {
		alert("case4");
		if (xhr.status == 4 && xhr.readyState == 200) {
			alert("case3");
			let result = xhr.responseText;
			//let result = decodeURI(decodeURIComponent(xhr.responseText));
			alert("asd " + result);
			if (result == "fail") {
				alert("fail");
				alert("탈퇴에에 실패했습니다.\n다시시도해주시길바랍니다.");
				return;
			}
			if (result == "success") {
				alert("success");
				alert("탈퇴에 성공했습니다.\n이용해주셔서 감사합니다");
				location.href = "logout.do";
				return;
			}
		}
	}
</script>

<!-- ===============================================-->
<!--    Stylesheets-->
<!-- ===============================================-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link href="resources/vendors/simplebar/simplebar.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
<link href="resources/assets/css/theme-rtl.min.css" type="text/css"
	rel="stylesheet" id="style-rtl">
<link href="resources/assets/css/theme.min.css" type="text/css"
	rel="stylesheet" id="style-default">
<link href="resources/assets/css/user-rtl.min.css" type="text/css"
	rel="stylesheet" id="user-style-rtl">
<link href="resources/assets/css/user.min.css" type="text/css"
	rel="stylesheet" id="user-style-default">
<script>
	var phoenixIsRTL = window.config.config.phoenixIsRTL;
	if (phoenixIsRTL) {
		var linkDefault = document.getElementById('style-default');
		var userLinkDefault = document.getElementById('user-style-default');
		linkDefault.setAttribute('disabled', true);
		userLinkDefault.setAttribute('disabled', true);
		document.querySelector('html').setAttribute('dir', 'rtl');
	} else {
		var linkRTL = document.getElementById('style-rtl');
		var userLinkRTL = document.getElementById('user-style-rtl');
		linkRTL.setAttribute('disabled', true);
		userLinkRTL.setAttribute('disabled', true);
	}
</script>
</head>

<body>
	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<main class="main" id="top">

		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="py-0">
			<div class="container-small">
				<div class="ecommerce-topbar">
					<nav class="navbar navbar-expand-lg navbar-light px-0">
						<div class="row gx-0 gy-2 w-100 flex-between-center">
							<div class="col-auto">
								<a class="text-decoration-none" href="resources/index.html">
									<div class="d-flex align-items-center">
										<img src="resources/assets/img/icons/logo.png" alt="phoenix"
											width="27" />
										<p class="logo-text ms-2">phoenix</p>
									</div>
								</a>
							</div>
							<div class="col-auto order-md-1">
								<ul class="navbar-nav navbar-nav-icons flex-row me-n2">
									<li class="nav-item d-flex align-items-center">
										<div class="theme-control-toggle fa-icon-wait px-2">
											<input
												class="form-check-input ms-0 theme-control-toggle-input"
												type="checkbox" data-theme-control="phoenixTheme"
												value="dark" id="themeControlToggle" /><label
												class="mb-0 theme-control-toggle-label theme-control-toggle-light"
												for="themeControlToggle" data-bs-toggle="tooltip"
												data-bs-placement="left" title="Switch theme"><span
												class="icon" data-feather="moon"></span></label><label
												class="mb-0 theme-control-toggle-label theme-control-toggle-dark"
												for="themeControlToggle" data-bs-toggle="tooltip"
												data-bs-placement="left" title="Switch theme"><span
												class="icon" data-feather="sun"></span></label>
										</div>
									</li>
									<li class="nav-item"><a
										class="nav-link px-2 icon-indicator icon-indicator-primary"
										href="resources/apps/e-commerce/landing/cart.html"
										role="button"><span class="text-body-tertiary"
											data-feather="shopping-cart"
											style="height: 20px; width: 20px;"></span><span
											class="icon-indicator-number">3</span></a></li>
									<li class="nav-item dropdown"><a
										class="nav-link px-2 icon-indicator icon-indicator-sm icon-indicator-danger"
										id="navbarTopDropdownNotification" href="#" role="button"
										data-bs-toggle="dropdown" data-bs-auto-close="outside"
										aria-haspopup="true" aria-expanded="false"><span
											class="text-body-tertiary" data-feather="bell"
											style="height: 20px; width: 20px;"></span></a>
										<div
											class="dropdown-menu dropdown-menu-end notification-dropdown-menu py-0 shadow border navbar-dropdown-caret mt-2"
											id="navbarDropdownNotfication"
											aria-labelledby="navbarDropdownNotfication">
											<div class="card position-relative border-0">
												<div class="card-header p-2">
													<div class="d-flex justify-content-between">
														<h5 class="text-body-emphasis mb-0">Notificatons</h5>
														<button class="btn btn-link p-0 fs-9 fw-normal"
															type="button">Mark all as read</button>
													</div>
												</div>
												<div class="card-body p-0">
													<div class="scrollbar-overlay" style="height: 27rem;">
														<div
															class="px-2 px-sm-3 py-3 notification-card position-relative read border-bottom">
															<div
																class="d-flex align-items-center justify-content-between position-relative">
																<div class="d-flex">
																	<div class="avatar avatar-m status-online me-3">
																		<img class="rounded-circle"
																			src="resources/assets/img/team/40x40/30.webp" alt="" />
																	</div>
																	<div class="flex-1 me-sm-3">
																		<h4 class="fs-9 text-body-emphasis">Jessie Samson</h4>
																		<p
																			class="fs-9 text-body-highlight mb-2 mb-sm-3 fw-normal">
																			<span class='me-1 fs-10'>💬</span>Mentioned you in a
																			comment.<span
																				class="ms-2 text-body-quaternary text-opacity-75 fw-bold fs-10">10m</span>
																		</p>
																		<p class="text-body-secondary fs-9 mb-0">
																			<span class="me-1 fas fa-clock"></span><span
																				class="fw-bold">10:41 AM </span>August 7,2021
																		</p>
																	</div>
																</div>
																<div class="d-none d-sm-block">
																	<button
																		class="btn fs-10 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle"
																		type="button" data-bs-toggle="dropdown"
																		data-boundary="window" aria-haspopup="true"
																		aria-expanded="false" data-bs-reference="parent">
																		<span class="fas fa-ellipsis-h fs-10 text-body"></span>
																	</button>
																	<div class="dropdown-menu dropdown-menu-end py-2">
																		<a class="dropdown-item" href="#!">Mark as unread</a>
																	</div>
																</div>
															</div>
														</div>
														<div
															class="px-2 px-sm-3 py-3 notification-card position-relative unread border-bottom">
															<div
																class="d-flex align-items-center justify-content-between position-relative">
																<div class="d-flex">
																	<div class="avatar avatar-m status-online me-3">
																		<div class="avatar-name rounded-circle">
																			<span>J</span>
																		</div>
																	</div>
																	<div class="flex-1 me-sm-3">
																		<h4 class="fs-9 text-body-emphasis">Jane Foster</h4>
																		<p
																			class="fs-9 text-body-highlight mb-2 mb-sm-3 fw-normal">
																			<span class='me-1 fs-10'>📅</span>Created an event.<span
																				class="ms-2 text-body-quaternary text-opacity-75 fw-bold fs-10">20m</span>
																		</p>
																		<p class="text-body-secondary fs-9 mb-0">
																			<span class="me-1 fas fa-clock"></span><span
																				class="fw-bold">10:20 AM </span>August 7,2021
																		</p>
																	</div>
																</div>
																<div class="d-none d-sm-block">
																	<button
																		class="btn fs-10 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle"
																		type="button" data-bs-toggle="dropdown"
																		data-boundary="window" aria-haspopup="true"
																		aria-expanded="false" data-bs-reference="parent">
																		<span class="fas fa-ellipsis-h fs-10 text-body"></span>
																	</button>
																	<div class="dropdown-menu dropdown-menu-end py-2">
																		<a class="dropdown-item" href="#!">Mark as unread</a>
																	</div>
																</div>
															</div>
														</div>
														<div
															class="px-2 px-sm-3 py-3 notification-card position-relative unread border-bottom">
															<div
																class="d-flex align-items-center justify-content-between position-relative">
																<div class="d-flex">
																	<div class="avatar avatar-m status-online me-3">
																		<img class="rounded-circle avatar-placeholder"
																			src="resources/assets/img/team/40x40/avatar.webp"
																			alt="" />
																	</div>
																	<div class="flex-1 me-sm-3">
																		<h4 class="fs-9 text-body-emphasis">Jessie Samson</h4>
																		<p
																			class="fs-9 text-body-highlight mb-2 mb-sm-3 fw-normal">
																			<span class='me-1 fs-10'>👍</span>Liked your comment.<span
																				class="ms-2 text-body-quaternary text-opacity-75 fw-bold fs-10">1h</span>
																		</p>
																		<p class="text-body-secondary fs-9 mb-0">
																			<span class="me-1 fas fa-clock"></span><span
																				class="fw-bold">9:30 AM </span>August 7,2021
																		</p>
																	</div>
																</div>
																<div class="d-none d-sm-block">
																	<button
																		class="btn fs-10 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle"
																		type="button" data-bs-toggle="dropdown"
																		data-boundary="window" aria-haspopup="true"
																		aria-expanded="false" data-bs-reference="parent">
																		<span class="fas fa-ellipsis-h fs-10 text-body"></span>
																	</button>
																	<div class="dropdown-menu dropdown-menu-end py-2">
																		<a class="dropdown-item" href="#!">Mark as unread</a>
																	</div>
																</div>
															</div>
														</div>
														<div
															class="px-2 px-sm-3 py-3 notification-card position-relative unread border-bottom">
															<div
																class="d-flex align-items-center justify-content-between position-relative">
																<div class="d-flex">
																	<div class="avatar avatar-m status-online me-3">
																		<img class="rounded-circle"
																			src="resources/assets/img/team/40x40/57.webp" alt="" />
																	</div>
																	<div class="flex-1 me-sm-3">
																		<h4 class="fs-9 text-body-emphasis">Kiera
																			Anderson</h4>
																		<p
																			class="fs-9 text-body-highlight mb-2 mb-sm-3 fw-normal">
																			<span class='me-1 fs-10'>💬</span>Mentioned you in a
																			comment.<span
																				class="ms-2 text-body-quaternary text-opacity-75 fw-bold fs-10"></span>
																		</p>
																		<p class="text-body-secondary fs-9 mb-0">
																			<span class="me-1 fas fa-clock"></span><span
																				class="fw-bold">9:11 AM </span>August 7,2021
																		</p>
																	</div>
																</div>
																<div class="d-none d-sm-block">
																	<button
																		class="btn fs-10 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle"
																		type="button" data-bs-toggle="dropdown"
																		data-boundary="window" aria-haspopup="true"
																		aria-expanded="false" data-bs-reference="parent">
																		<span class="fas fa-ellipsis-h fs-10 text-body"></span>
																	</button>
																	<div class="dropdown-menu dropdown-menu-end py-2">
																		<a class="dropdown-item" href="#!">Mark as unread</a>
																	</div>
																</div>
															</div>
														</div>
														<div
															class="px-2 px-sm-3 py-3 notification-card position-relative unread border-bottom">
															<div
																class="d-flex align-items-center justify-content-between position-relative">
																<div class="d-flex">
																	<div class="avatar avatar-m status-online me-3">
																		<img class="rounded-circle"
																			src="resources/assets/img/team/40x40/59.webp" alt="" />
																	</div>
																	<div class="flex-1 me-sm-3">
																		<h4 class="fs-9 text-body-emphasis">Herman Carter</h4>
																		<p
																			class="fs-9 text-body-highlight mb-2 mb-sm-3 fw-normal">
																			<span class='me-1 fs-10'>👤</span>Tagged you in a
																			comment.<span
																				class="ms-2 text-body-quaternary text-opacity-75 fw-bold fs-10"></span>
																		</p>
																		<p class="text-body-secondary fs-9 mb-0">
																			<span class="me-1 fas fa-clock"></span><span
																				class="fw-bold">10:58 PM </span>August 7,2021
																		</p>
																	</div>
																</div>
																<div class="d-none d-sm-block">
																	<button
																		class="btn fs-10 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle"
																		type="button" data-bs-toggle="dropdown"
																		data-boundary="window" aria-haspopup="true"
																		aria-expanded="false" data-bs-reference="parent">
																		<span class="fas fa-ellipsis-h fs-10 text-body"></span>
																	</button>
																	<div class="dropdown-menu dropdown-menu-end py-2">
																		<a class="dropdown-item" href="#!">Mark as unread</a>
																	</div>
																</div>
															</div>
														</div>
														<div
															class="px-2 px-sm-3 py-3 notification-card position-relative read ">
															<div
																class="d-flex align-items-center justify-content-between position-relative">
																<div class="d-flex">
																	<div class="avatar avatar-m status-online me-3">
																		<img class="rounded-circle"
																			src="resources/assets/img/team/40x40/58.webp" alt="" />
																	</div>
																	<div class="flex-1 me-sm-3">
																		<h4 class="fs-9 text-body-emphasis">Benjamin
																			Button</h4>
																		<p
																			class="fs-9 text-body-highlight mb-2 mb-sm-3 fw-normal">
																			<span class='me-1 fs-10'>👍</span>Liked your comment.<span
																				class="ms-2 text-body-quaternary text-opacity-75 fw-bold fs-10"></span>
																		</p>
																		<p class="text-body-secondary fs-9 mb-0">
																			<span class="me-1 fas fa-clock"></span><span
																				class="fw-bold">10:18 AM </span>August 7,2021
																		</p>
																	</div>
																</div>
																<div class="d-none d-sm-block">
																	<button
																		class="btn fs-10 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle"
																		type="button" data-bs-toggle="dropdown"
																		data-boundary="window" aria-haspopup="true"
																		aria-expanded="false" data-bs-reference="parent">
																		<span class="fas fa-ellipsis-h fs-10 text-body"></span>
																	</button>
																	<div class="dropdown-menu dropdown-menu-end py-2">
																		<a class="dropdown-item" href="#!">Mark as unread</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div
													class="card-footer p-0 border-top border-translucent border-0">
													<div
														class="my-2 text-center fw-bold fs-10 text-body-tertiary text-opactity-85">
														<a class="fw-bolder"
															href="resources/pages/notifications.html">Notification
															history</a>
													</div>
												</div>
											</div>
										</div></li>
									<li class="nav-item dropdown"><a class="nav-link px-2"
										id="navbarDropdownUser" href="#" role="button"
										data-bs-toggle="dropdown" data-bs-auto-close="outside"
										aria-haspopup="true" aria-expanded="false"><span
											class="text-body-tertiary" data-feather="user"
											style="height: 20px; width: 20px;"></span></a>
										<div
											class="dropdown-menu dropdown-menu-end navbar-dropdown-caret py-0 dropdown-profile shadow border mt-2"
											aria-labelledby="navbarDropdownUser">
											<div class="card position-relative border-0">
												<div class="card-body p-0">
													<div class="text-center pt-4 pb-3">
														<div class="avatar avatar-xl ">
															<img class="rounded-circle "
																src="resources/assets/img/team/72x72/57.webp" alt="" />
														</div>
														<h6 class="mt-2 text-body-emphasis">Jerry Seinfield</h6>
													</div>
													<div class="mb-3 mx-3">
														<input class="form-control form-control-sm"
															id="statusUpdateInput" type="text"
															placeholder="Update your status" />
													</div>
												</div>
												<div class="overflow-auto scrollbar" style="height: 10rem;">
													<ul class="nav d-flex flex-column mb-2 pb-1">
														<li class="nav-item"><a class="nav-link px-3"
															href="#!"> <span class="me-2 text-body"
																data-feather="user"></span><span>Profile</span></a></li>
														<li class="nav-item"><a class="nav-link px-3"
															href="#!"><span class="me-2 text-body"
																data-feather="pie-chart"></span>Dashboard</a></li>
														<li class="nav-item"><a class="nav-link px-3"
															href="#!"> <span class="me-2 text-body"
																data-feather="lock"></span>Posts &amp; Activity
														</a></li>
														<li class="nav-item"><a class="nav-link px-3"
															href="#!"> <span class="me-2 text-body"
																data-feather="settings"></span>Settings &amp; Privacy
														</a></li>
														<li class="nav-item"><a class="nav-link px-3"
															href="#!"> <span class="me-2 text-body"
																data-feather="help-circle"></span>Help Center
														</a></li>
														<li class="nav-item"><a class="nav-link px-3"
															href="#!"> <span class="me-2 text-body"
																data-feather="globe"></span>Language
														</a></li>
													</ul>
												</div>
												<div class="card-footer p-0 border-top border-translucent">
													<ul class="nav d-flex flex-column my-3">
														<li class="nav-item"><a class="nav-link px-3"
															href="#!"> <span class="me-2 text-body"
																data-feather="user-plus"></span>Add another account
														</a></li>
													</ul>
													<hr />
													<div class="px-3">
														<a
															class="btn btn-phoenix-secondary d-flex flex-center w-100"
															href="logout.do"> <span class="me-2"
															data-feather="log-out"> </span>Sign out
														</a>
													</div>
													<div
														class="my-2 text-center fw-bold fs-10 text-body-quaternary">
														<a class="text-body-quaternary me-1" href="#!">Privacy
															policy</a>&bull;<a class="text-body-quaternary mx-1"
															href="#!">Terms</a>&bull;<a
															class="text-body-quaternary ms-1" href="#!">Cookies</a>
													</div>
												</div>
											</div>
										</div></li>
								</ul>
							</div>
							<div class="col-12 col-md-6">
								<div class="search-box ecommerce-search-box w-100">
									<form class="position-relative">
										<input
											class="form-control search-input search form-control-sm"
											type="search" placeholder="Search" aria-label="Search" /> <span
											class="fas fa-search search-box-icon"></span>
									</form>
								</div>
							</div>
						</div>
					</nav>
				</div>
			</div>
			<!-- end of .container-->
		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->

		<nav
			class="ecommerce-navbar navbar-expand navbar-light bg-body-emphasis justify-content-between">
			<div class="container-small d-flex flex-between-center"
				data-navbar="data-navbar">
				<div class="dropdown">
					<button
						class="btn text-body ps-0 pe-5 text-nowrap dropdown-toggle dropdown-caret-none"
						data-category-btn="data-category-btn" data-bs-toggle="dropdown">
						<span class="fas fa-bars me-2"></span>Category
					</button>
					<div
						class="dropdown-menu border border-translucent py-0 category-dropdown-menu">
						<div class="card border-0 scrollbar" style="max-height: 657px;">
							<div class="card-body p-6 pb-3">
								<div class="row gx-7 gy-5 mb-5">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="d-flex align-items-center mb-3">
											<span class="text-primary me-2" data-feather="pocket"
												style="stroke-width: 3;"></span>
											<h6 class="text-body-highlight mb-0 text-nowrap">Collectibles
												&amp; Art</h6>
										</div>
										<div class="ms-n2">
											<a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Collectibles</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Antiques</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Sports memorabilia </a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Art</a>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="d-flex align-items-center mb-3">
											<span class="text-primary me-2" data-feather="home"
												style="stroke-width: 3;"></span>
											<h6 class="text-body-highlight mb-0 text-nowrap">Home
												&amp; Gardan</h6>
										</div>
										<div class="ms-n2">
											<a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Yard, Garden &amp; Outdoor</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Crafts</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Home Improvement</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Pet Supplies</a>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="d-flex align-items-center mb-3">
											<span class="text-primary me-2" data-feather="globe"
												style="stroke-width: 3;"></span>
											<h6 class="text-body-highlight mb-0 text-nowrap">Sporting
												Goods</h6>
										</div>
										<div class="ms-n2">
											<a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Outdoor Sports</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Team Sports</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Exercise &amp; Fitness</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Golf</a>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="d-flex align-items-center mb-3">
											<span class="text-primary me-2" data-feather="monitor"
												style="stroke-width: 3;"></span>
											<h6 class="text-body-highlight mb-0 text-nowrap">Electronics</h6>
										</div>
										<div class="ms-n2">
											<a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Computers &amp; Tablets</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Camera &amp; Photo</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">TV, Audio &amp; Surveillance</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Cell Ohone &amp; Accessories</a>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="d-flex align-items-center mb-3">
											<span class="text-primary me-2" data-feather="truck"
												style="stroke-width: 3;"></span>
											<h6 class="text-body-highlight mb-0 text-nowrap">Auto
												Parts &amp; Accessories</h6>
										</div>
										<div class="ms-n2">
											<a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">GPS &amp; Security Devices</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Rader &amp; Laser Detectors</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Care &amp; Detailing</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Scooter Parts &amp; Accessories</a>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="d-flex align-items-center mb-3">
											<span class="text-primary me-2" data-feather="codesandbox"
												style="stroke-width: 3;"></span>
											<h6 class="text-body-highlight mb-0 text-nowrap">Toys
												&amp; Hobbies</h6>
										</div>
										<div class="ms-n2">
											<a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Radio Control</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Kids Toys</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Action Figures</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Dolls &amp; Bears</a>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="d-flex align-items-center mb-3">
											<span class="text-primary me-2" data-feather="watch"
												style="stroke-width: 3;"></span>
											<h6 class="text-body-highlight mb-0 text-nowrap">Fashion</h6>
										</div>
										<div class="ms-n2">
											<a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Women</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Men</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Jewelry &amp; Watches</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Shoes</a>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="d-flex align-items-center mb-3">
											<span class="text-primary me-2" data-feather="music"
												style="stroke-width: 3;"></span>
											<h6 class="text-body-highlight mb-0 text-nowrap">Musical
												Instruments &amp; Gear</h6>
										</div>
										<div class="ms-n2">
											<a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Guitar</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Pro Audio Equipment</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">String</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Stage Lighting &amp; Effects</a>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="d-flex align-items-center mb-3">
											<span class="text-primary me-2" data-feather="grid"
												style="stroke-width: 3;"></span>
											<h6 class="text-body-highlight mb-0 text-nowrap">Other
												Categories</h6>
										</div>
										<div class="ms-n2">
											<a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Video Games &amp; Consoles</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Health &amp; Beauty</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Baby</a><a
												class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2"
												href="#!">Business &amp; Industrial</a>
										</div>
									</div>
								</div>
								<div class="text-center border-top border-translucent pt-3">
									<a class="fw-bold" href="#!">See all Categories<span
										class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<ul class="navbar-nav justify-content-end align-items-center">
					<li class="nav-item" data-nav-item="data-nav-item"><a
						class="nav-link ps-0" href="main.do">Home</a></li>
					<li class="nav-item" data-nav-item="data-nav-item"><a
						class="nav-link"
						href="resources/apps/e-commerce/landing/favourite-stores.html">My
							Favorites Stores</a></li>
					<li class="nav-item" data-nav-item="data-nav-item"><a
						class="nav-link"
						href="resources/apps/e-commerce/landing/products-filter.html">Products</a></li>
					<li class="nav-item" data-nav-item="data-nav-item"><a
						class="nav-link"
						href="resources/apps/e-commerce/landing/wishlist.html">Wishlist</a></li>
					<li class="nav-item" data-nav-item="data-nav-item"><a
						class="nav-link"
						href="resources/apps/e-commerce/landing/shipping-info.html">Shipping
							Info</a></li>
					<li class="nav-item" data-nav-item="data-nav-item"><a
						class="nav-link"
						href="resources/apps/e-commerce/admin/add-product.html">Be a
							vendor</a></li>
					<li class="nav-item" data-nav-item="data-nav-item"><a
						class="nav-link"
						href="resources/apps/e-commerce/landing/order-tracking.html">Track
							order</a></li>
					<li class="nav-item" data-nav-item="data-nav-item"><a
						class="nav-link pe-0"
						href="resources/apps/e-commerce/landing/checkout.html">Checkout</a></li>
					<li class="nav-item dropdown" data-nav-item="data-nav-item"
						data-more-item="data-more-item"><a
						class="nav-link dropdown-toggle dropdown-caret-none fw-bold pe-0"
						href="javascript: void(0)" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-boundary="window" data-bs-reference="parent"> More<span
							class="fas fa-angle-down ms-2"></span></a>
						<div class="dropdown-menu dropdown-menu-end category-list"
							aria-labelledby="navbarDropdown"
							data-category-list="data-category-list"></div></li>
				</ul>
			</div>
		</nav>

		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="pt-5 pb-9">
			<div class="container-small">
				<nav class="mb-2" aria-label="breadcrumb">
					<ol class="breadcrumb mb-0">
						<li class="breadcrumb-item"><a href="#!">Page 1</a></li>
						<li class="breadcrumb-item"><a href="#!">Page 2</a></li>
						<li class="breadcrumb-item active" aria-current="page">Default</li>
					</ol>
				</nav>
				<div class="row align-items-center justify-content-between g-3 mb-4">
					<div class="col-auto">
						<h2 class="mb-0">Profile</h2>
					</div>
					<div class="col-auto">
						<div class="row g-2 g-sm-3">
							<div class="col-auto">
								<button class="btn btn-phoenix-danger"
									onclick="deleteAccount();">
									<span class="fas fa-trash-alt me-2"></span>계정 삭제하기
								</button>
							</div>
							<div class="col-auto">
								<button class="btn btn-phoenix-secondary">
									<span class="fas fa-key me-2"></span>비밀번호 변경
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row g-3 mb-6">
					<div class="col-12 col-lg-8">
						<div class="card h-100">
							<div class="card-body">
								<div class="border-bottom border-dashed pb-4">
									<div
										class="row align-items-center g-3 g-sm-5 text-center text-sm-start">
										<div class="col-12 col-sm-auto">
											<input class="d-none" id="avatarFile" type="file" /><label
												class="cursor-pointer avatar avatar-5xl" for="avatarFile"><img
												class="rounded-circle"
												src="resources/assets/img/team/15.webp" alt="" /></label>
										</div>
										<div class="col-12 col-sm-auto flex-1">
											<h3>${nickname}</h3>
											<p class="text-body-secondary">3달전 접속</p>
											<div>
												<a class="me-2" href="#!"><span
													class="fab fa-linkedin-in text-body-quaternary text-opacity-75 text-primary-hover"></span></a><a
													class="me-2" href="#!"><span
													class="fab fa-facebook text-body-quaternary text-opacity-75 text-primary-hover"></span></a><a
													href="#!"><span
													class="fab fa-twitter text-body-quaternary text-opacity-75 text-primary-hover"></span></a>
											</div>
										</div>
									</div>
								</div>
								<div class="d-flex flex-between-center pt-4">
									<div>
										<h6 class="mb-2 text-body-secondary">Total Spent</h6>
										<h4 class="fs-7 text-body-highlight mb-0">$894</h4>
									</div>
									<div class="text-end">
										<h6 class="mb-2 text-body-secondary">Last Order</h6>
										<h4 class="fs-7 text-body-highlight mb-0">1 week ago</h4>
									</div>
									<div class="text-end">
										<h6 class="mb-2 text-body-secondary">Total Orders</h6>
										<h4 class="fs-7 text-body-highlight mb-0">97</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-4">
						<div class="card h-100">
							<div class="card-body">
								<div class="border-bottom border-dashed">
									<h4 class="mb-3">
										기본 배송지
										<button class="btn btn-link p-0" type="button">
											<span class="fas fa-edit fs-9 ms-3 text-body-quaternary"></span>
										</button>
									</h4>
								</div>
								<div class="pt-4 mb-7 mb-lg-4 mb-xl-7">
									<div class="row justify-content-between">
										<div class="col-auto">
											<h5 class="text-body-highlight">내 주소</h5>
										</div>
										<div class="col-auto">
											<p class="text-body-secondary">
												Vancouver, British Columbia<br />Canada
											</p>
										</div>
									</div>
								</div>
								<div class="border-top border-dashed pt-4">
									<div class="row flex-between-center mb-2">
										<div class="col-auto">
											<h5 class="text-body-highlight mb-0">이메일</h5>
										</div>
										<div class="col-auto">
											<a class="lh-1">${email}</a>
										</div>
										<!-- <div class="col-auto">
											<a class="lh-1" href="mailto:shatinon@jeemail.com">shatinon@jeemail.com</a>
										</div> -->
									</div>
									<div class="row flex-between-center">
										<div class="col-auto">
											<%-- <c:if test="var" ></c:if> --%>
											<h5 class="text-body-highlight mb-0">전화번호</h5>
										</div>
										<div class="col-auto">
											<a href="tel:+1234567890">+1234567890</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="scrollbar">
						<ul class="nav nav-underline fs-9 flex-nowrap mb-3 pb-1"
							id="myTab" role="tablist">
							<li class="nav-item me-3"><a
								class="nav-link text-nowrap active" id="orders-tab"
								data-bs-toggle="tab" href="#tab-orders" role="tab"
								aria-controls="tab-orders" aria-selected="true"><span
									class="fas fa-shopping-cart me-2"></span>주문 <span
									class="text-body-tertiary fw-normal"> (주문개수)</span></a></li>
							<li class="nav-item me-3"><a class="nav-link text-nowrap"
								id="reviews-tab" data-bs-toggle="tab" href="#tab-reviews"
								role="tab" aria-controls="tab-orders" aria-selected="true"><span
									class="fas fa-star me-2"></span>리뷰<span
									class="text-body-tertiary fw-normal"> (리뷰개수)</span></a></li>
							<li class="nav-item me-3"><a class="nav-link text-nowrap"
								id="wishlist-tab" data-bs-toggle="tab" href="#tab-wishlist"
								role="tab" aria-controls="tab-orders" aria-selected="true"><span
									class="fas fa-heart me-2"></span>찜목록</a></li>
							<li class="nav-item me-3"><a class="nav-link text-nowrap"
								id="stores-tab" data-bs-toggle="tab" href="#tab-stores"
								role="tab" aria-controls="tab-stores" aria-selected="true"><span
									class="fas fa-home me-2"></span>Stores</a></li>
							<li class="nav-item"><a class="nav-link text-nowrap"
								id="personal-info-tab" data-bs-toggle="tab"
								href="#tab-personal-info" role="tab"
								aria-controls="tab-personal-info" aria-selected="true"><span
									class="fas fa-user me-2"></span>개인정보</a></li>
						</ul>
					</div>
					<div class="tab-content" id="profileTabContent">
						<div class="tab-pane fade show active" id="tab-orders"
							role="tabpanel" aria-labelledby="orders-tab">
							<div class="border-top border-bottom border-translucent"
								id="profileOrdersTable"
								data-list='{"valueNames":["order","status","delivery","date","total"],"page":6,"pagination":true}'>
								<div class="table-responsive scrollbar">
									<table class="table fs-9 mb-0">
										<thead>
											<tr>
												<th class="sort white-space-nowrap align-middle pe-3 ps-0"
													scope="col" data-sort="order"
													style="width: 15%; min-width: 140px">주문</th>
												<th class="sort align-middle pe-3" scope="col"
													data-sort="status" style="width: 15%; min-width: 180px">상태</th>
												<th class="sort align-middle text-start" scope="col"
													data-sort="delivery" style="width: 20%; min-width: 160px">DELIVERY
													METHOD</th>
												<th class="sort align-middle pe-0 text-end" scope="col"
													data-sort="date" style="width: 15%; min-width: 160px">날짜</th>
												<th class="sort align-middle text-end" scope="col"
													data-sort="total" style="width: 15%; min-width: 160px">총합</th>
												<th class="align-middle pe-0 text-end" scope="col"
													style="width: 15%;"></th>
											</tr>
										</thead>
										<tbody class="list" id="profile-order-table-body">
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="order align-middle white-space-nowrap py-2 ps-0"><a
													class="fw-semibold text-primary" href="#!">#2453</a></td>
												<td
													class="status align-middle white-space-nowrap text-start fw-bold text-body-tertiary py-2"><span
													class="badge badge-phoenix fs-10 badge-phoenix-success"><span
														class="badge-label">Shipped</span><span class="ms-1"
														data-feather="check"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td
													class="delivery align-middle white-space-nowrap text-body py-2">Cash
													on delivery</td>
												<td
													class="total align-middle text-body-tertiary text-end py-2">Dec
													12, 12:56 PM</td>
												<td
													class="date align-middle fw-semibold text-end py-2 text-body-highlight">$87</td>
												<td
													class="align-middle text-end white-space-nowrap pe-0 action py-2">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">모두보기</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="order align-middle white-space-nowrap py-2 ps-0"><a
													class="fw-semibold text-primary" href="#!">#2452</a></td>
												<td
													class="status align-middle white-space-nowrap text-start fw-bold text-body-tertiary py-2"><span
													class="badge badge-phoenix fs-10 badge-phoenix-info"><span
														class="badge-label">Ready to pickup</span><span
														class="ms-1" data-feather="info"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td
													class="delivery align-middle white-space-nowrap text-body py-2">Free
													shipping</td>
												<td
													class="total align-middle text-body-tertiary text-end py-2">Dec
													9, 2:28PM</td>
												<td
													class="date align-middle fw-semibold text-end py-2 text-body-highlight">$7264</td>
												<td
													class="align-middle text-end white-space-nowrap pe-0 action py-2">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="order align-middle white-space-nowrap py-2 ps-0"><a
													class="fw-semibold text-primary" href="#!">#2451</a></td>
												<td
													class="status align-middle white-space-nowrap text-start fw-bold text-body-tertiary py-2"><span
													class="badge badge-phoenix fs-10 badge-phoenix-warning"><span
														class="badge-label">Partially fulfilled</span><span
														class="ms-1" data-feather="clock"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td
													class="delivery align-middle white-space-nowrap text-body py-2">Local
													pickup</td>
												<td
													class="total align-middle text-body-tertiary text-end py-2">Dec
													4, 12:56 PM</td>
												<td
													class="date align-middle fw-semibold text-end py-2 text-body-highlight">$375</td>
												<td
													class="align-middle text-end white-space-nowrap pe-0 action py-2">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="order align-middle white-space-nowrap py-2 ps-0"><a
													class="fw-semibold text-primary" href="#!">#2450</a></td>
												<td
													class="status align-middle white-space-nowrap text-start fw-bold text-body-tertiary py-2"><span
													class="badge badge-phoenix fs-10 badge-phoenix-secondary"><span
														class="badge-label">Canceled</span><span class="ms-1"
														data-feather="x" style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td
													class="delivery align-middle white-space-nowrap text-body py-2">Standard
													shipping</td>
												<td
													class="total align-middle text-body-tertiary text-end py-2">Dec
													1, 4:07 AM</td>
												<td
													class="date align-middle fw-semibold text-end py-2 text-body-highlight">$657</td>
												<td
													class="align-middle text-end white-space-nowrap pe-0 action py-2">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="order align-middle white-space-nowrap py-2 ps-0"><a
													class="fw-semibold text-primary" href="#!">#2449</a></td>
												<td
													class="status align-middle white-space-nowrap text-start fw-bold text-body-tertiary py-2"><span
													class="badge badge-phoenix fs-10 badge-phoenix-success"><span
														class="badge-label">fulfilled</span><span class="ms-1"
														data-feather="check"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td
													class="delivery align-middle white-space-nowrap text-body py-2">Express</td>
												<td
													class="total align-middle text-body-tertiary text-end py-2">Nov
													28, 7:28 PM</td>
												<td
													class="date align-middle fw-semibold text-end py-2 text-body-highlight">$9562</td>
												<td
													class="align-middle text-end white-space-nowrap pe-0 action py-2">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="order align-middle white-space-nowrap py-2 ps-0"><a
													class="fw-semibold text-primary" href="#!">#2448</a></td>
												<td
													class="status align-middle white-space-nowrap text-start fw-bold text-body-tertiary py-2"><span
													class="badge badge-phoenix fs-10 badge-phoenix-danger"><span
														class="badge-label">Unfulfilled</span><span class="ms-1"
														data-feather="check"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td
													class="delivery align-middle white-space-nowrap text-body py-2">Local
													delivery</td>
												<td
													class="total align-middle text-body-tertiary text-end py-2">Nov
													24, 10:16 AM</td>
												<td
													class="date align-middle fw-semibold text-end py-2 text-body-highlight">$256</td>
												<td
													class="align-middle text-end white-space-nowrap pe-0 action py-2">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="order align-middle white-space-nowrap py-2 ps-0"><a
													class="fw-semibold text-body-tertiary text-opacity-85 pointers-events-none text-decoration-none"
													href="#!">#2447</a></td>
												<td
													class="status align-middle white-space-nowrap text-start fw-bold text-body-tertiary py-2"><span
													class="badge badge-phoenix fs-10 badge-phoenix-secondary"><span
														class="badge-label">Cancelled</span><span class="ms-1"
														data-feather="x" style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td
													class="delivery align-middle white-space-nowrap text-body py-2">Standard
													shipping</td>
												<td
													class="total align-middle text-body-tertiary text-end py-2">Nov
													10, 12:00 PM</td>
												<td
													class="date align-middle fw-semibold text-end py-2 text-body-tertiary text-opacity-85">$898</td>
												<td
													class="align-middle text-end white-space-nowrap pe-0 action py-2">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="order align-middle white-space-nowrap py-2 ps-0"><a
													class="fw-semibold text-primary" href="#!">#2446</a></td>
												<td
													class="status align-middle white-space-nowrap text-start fw-bold text-body-tertiary py-2"><span
													class="badge badge-phoenix fs-10 badge-phoenix-success"><span
														class="badge-label">shipped</span><span class="ms-1"
														data-feather="check"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td
													class="delivery align-middle white-space-nowrap text-body py-2">Express</td>
												<td
													class="total align-middle text-body-tertiary text-end py-2">Nov
													12, 12:20 PM</td>
												<td
													class="date align-middle fw-semibold text-end py-2 text-body-highlight">$4116</td>
												<td
													class="align-middle text-end white-space-nowrap pe-0 action py-2">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="order align-middle white-space-nowrap py-2 ps-0"><a
													class="fw-semibold text-body-tertiary text-opacity-85 pointers-events-none text-decoration-none"
													href="#!">#2445</a></td>
												<td
													class="status align-middle white-space-nowrap text-start fw-bold text-body-tertiary py-2"><span
													class="badge badge-phoenix fs-10 badge-phoenix-success"><span
														class="badge-label">fulfilled</span><span class="ms-1"
														data-feather="check"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td
													class="delivery align-middle white-space-nowrap text-body py-2">Free
													shipping</td>
												<td
													class="total align-middle text-body-tertiary text-end py-2">Oct
													19, 1:20 PM</td>
												<td
													class="date align-middle fw-semibold text-end py-2 text-body-tertiary text-opacity-85">$4116</td>
												<td
													class="align-middle text-end white-space-nowrap pe-0 action py-2">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div
									class="row align-items-center justify-content-between py-2 pe-0 fs-9">
									<div class="col-auto d-flex">
										<p class="mb-0 d-none d-sm-block me-3 fw-semibold text-body"
											data-list-info="data-list-info"></p>
										<a class="fw-semibold" href="#!" data-list-view="*">View
											all<span class="fas fa-angle-right ms-1"
											data-fa-transform="down-1"></span>
										</a><a class="fw-semibold d-none" href="#!" data-list-view="less">View
											Less<span class="fas fa-angle-right ms-1"
											data-fa-transform="down-1"></span>
										</a>
									</div>
									<div class="col-auto d-flex">
										<button class="page-link" data-list-pagination="prev">
											<span class="fas fa-chevron-left"></span>
										</button>
										<ul class="mb-0 pagination"></ul>
										<button class="page-link pe-0" data-list-pagination="next">
											<span class="fas fa-chevron-right"></span>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab-reviews" role="tabpanel"
							aria-labelledby="reviews-tab">
							<div class="border-y" id="profileRatingTable"
								data-list='{"valueNames":["product","rating","review","status","date"],"page":6,"pagination":true}'>
								<div class="table-responsive scrollbar">
									<table class="table fs-9 mb-0">
										<thead>
											<tr>
												<th class="sort white-space-nowrap align-middle" scope="col"
													style="min-width: 220px;" data-sort="product">PRODUCT</th>
												<th class="sort align-middle" scope="col" data-sort="rating"
													style="max-width: 10%;">RATING</th>
												<th class="sort align-middle" scope="col"
													style="min-width: 480px" data-sort="review">REVIEW</th>
												<th class="sort align-middle" scope="col"
													style="max-width: 12%;" data-sort="status">STATUS</th>
												<th class="sort text-end align-middle" scope="col"
													style="max-width: 10%;" data-sort="date">DATE</th>
												<th class="sort text-end pe-0 align-middle" scope="col"
													style="width: 7%"></th>
											</tr>
										</thead>
										<tbody class="list" id="profile-review-table-body">
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle product pe-3"><a
													class="fw-semibold line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">Fitbit
														Sense Advanced Smartwatch with Tools for Heart Health,
														Stress Management &amp; Skin Temperature Trends,
														Carbon/Graphite, One Size (S &amp; L Bands)</a></td>
												<td class="align-middle rating white-space-nowrap fs-10"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa-regular fa-star text-warning-light"></span></td>
												<td class="align-middle review pe-7">
													<p
														class="fw-semibold text-body-highlight mb-0 line-clamp-2">This
														Fitbit is fantastic! I was trying to be in better shape
														and needed some motivation, so I decided to treat myself
														to a new Fitbit.</p>
												</td>
												<td class="align-middle status pe-9"><span
													class="badge badge-phoenix fs-10 badge-phoenix-success">Approaved<span
														class="ms-1" data-feather="check"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td class="align-middle text-end date white-space-nowrap">
													<p class="text-body-tertiary mb-0">Just now</p>
												</td>
												<td class="align-middle white-space-nowrap text-end pe-0">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle product pe-3"><a
													class="fw-semibold line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">iPhone
														13 pro max-Pacific Blue-128GB storage</a></td>
												<td class="align-middle rating white-space-nowrap fs-10"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa-regular fa-star text-warning-light"></span></td>
												<td class="align-middle review pe-7">
													<p
														class="fw-semibold text-body-highlight mb-0 line-clamp-2">The
														order was delivered ahead of schedule. To give us
														additional time, you should leave the packaging sealed
														with plastic.</p>
												</td>
												<td class="align-middle status pe-9"><span
													class="badge badge-phoenix fs-10 badge-phoenix-warning">Pending<span
														class="ms-1" data-feather="clock"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td class="align-middle text-end date white-space-nowrap">
													<p class="text-body-tertiary mb-0">Dec 9, 2:28 PM</p>
												</td>
												<td class="align-middle white-space-nowrap text-end pe-0">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle product pe-3"><a
													class="fw-semibold line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">Apple
														MacBook Pro 13 inch-M1-8/256GB-space</a></td>
												<td class="align-middle rating white-space-nowrap fs-10"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star-half-alt star-icon text-warning"></span></td>
												<td class="align-middle review pe-7">
													<p
														class="fw-semibold text-body-highlight mb-0 line-clamp-2">It's
														a Mac, after all. Once you've gone Mac, there's no going
														back. My first Mac lasted over nine years, and this is my
														second.</p>
												</td>
												<td class="align-middle status pe-9"><span
													class="badge badge-phoenix fs-10 badge-phoenix-success">Approaved<span
														class="ms-1" data-feather="check"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td class="align-middle text-end date white-space-nowrap">
													<p class="text-body-tertiary mb-0">Dec 4, 12:56 PM</p>
												</td>
												<td class="align-middle white-space-nowrap text-end pe-0">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle product pe-3"><a
													class="fw-semibold line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">Apple
														iMac 24&quot; 4K Retina Display M1 8 Core CPU, 7 Core GPU,
														256GB SSD, Green (MJV83ZP/A) 2021</a></td>
												<td class="align-middle rating white-space-nowrap fs-10"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa-regular fa-star text-warning-light"></span><span
													class="fa-regular fa-star text-warning-light"></span></td>
												<td class="align-middle review pe-7">
													<p
														class="fw-semibold text-body-highlight mb-0 line-clamp-2">Personally,
														I like the minimalist style, but I wouldn't choose it if I
														were searching for a computer that I would use frequently.
														It's not horrible in terms of speed and power</p>
												</td>
												<td class="align-middle status pe-9"><span
													class="badge badge-phoenix fs-10 badge-phoenix-success">Approaved<span
														class="ms-1" data-feather="check"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td class="align-middle text-end date white-space-nowrap">
													<p class="text-body-tertiary mb-0">Nov 28, 7:28 PM</p>
												</td>
												<td class="align-middle white-space-nowrap text-end pe-0">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle product pe-3"><a
													class="fw-semibold line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">Razer
														Kraken v3 x Wired 7.1 Surroung Sound Gaming headset</a></td>
												<td class="align-middle rating white-space-nowrap fs-10"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span></td>
												<td class="align-middle review pe-7">
													<p
														class="fw-semibold text-body-highlight mb-0 line-clamp-2">It
														performs exactly as expected. There are three of these in
														the family.</p>
												</td>
												<td class="align-middle status pe-9"><span
													class="badge badge-phoenix fs-10 badge-phoenix-secondary">Cancelled<span
														class="ms-1" data-feather="x"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td class="align-middle text-end date white-space-nowrap">
													<p class="text-body-tertiary mb-0">Nov 24, 10:16 AM</p>
												</td>
												<td class="align-middle white-space-nowrap text-end pe-0">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle product pe-3"><a
													class="fw-semibold line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">PlayStation
														5 DualSense Wireless Controller</a></td>
												<td class="align-middle rating white-space-nowrap fs-10"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span></td>
												<td class="align-middle review pe-7">
													<p
														class="fw-semibold text-body-highlight mb-0 line-clamp-2">The
														controller is quite comfy for me. Despite its increased
														size, the controller still fits well in my hands.</p>
												</td>
												<td class="align-middle status pe-9"><span
													class="badge badge-phoenix fs-10 badge-phoenix-success">Approaved<span
														class="ms-1" data-feather="check"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td class="align-middle text-end date white-space-nowrap">
													<p class="text-body-tertiary mb-0">Just now</p>
												</td>
												<td class="align-middle white-space-nowrap text-end pe-0">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle product pe-3"><a
													class="fw-semibold line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">2021
														Apple 12.9-inch iPad Pro (Wi‑Fi, 128GB) - Space Gray</a></td>
												<td class="align-middle rating white-space-nowrap fs-10"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa-regular fa-star text-warning-light"></span></td>
												<td class="align-middle review pe-7">
													<p
														class="fw-semibold text-body-highlight mb-0 line-clamp-2">The
														response time and service I received when contacted the
														designers were Phenomenal!</p>
												</td>
												<td class="align-middle status pe-9"><span
													class="badge badge-phoenix fs-10 badge-phoenix-warning">Pending<span
														class="ms-1" data-feather="fas fa-stopwatch"
														style="height: 12.8px; width: 12.8px;"></span></span></td>
												<td class="align-middle text-end date white-space-nowrap">
													<p class="text-body-tertiary mb-0">Nov 07, 9:00 PM</p>
												</td>
												<td class="align-middle white-space-nowrap text-end pe-0">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div
									class="row align-items-center justify-content-between py-2 pe-0 fs-9">
									<div class="col-auto d-flex">
										<p class="mb-0 d-none d-sm-block me-3 fw-semibold text-body"
											data-list-info="data-list-info"></p>
										<a class="fw-semibold" href="#!" data-list-view="*">View
											all<span class="fas fa-angle-right ms-1"
											data-fa-transform="down-1"></span>
										</a><a class="fw-semibold d-none" href="#!" data-list-view="less">View
											Less<span class="fas fa-angle-right ms-1"
											data-fa-transform="down-1"></span>
										</a>
									</div>
									<div class="col-auto d-flex">
										<button class="page-link" data-list-pagination="prev">
											<span class="fas fa-chevron-left"></span>
										</button>
										<ul class="mb-0 pagination"></ul>
										<button class="page-link pe-0" data-list-pagination="next">
											<span class="fas fa-chevron-right"></span>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab-wishlist" role="tabpanel"
							aria-labelledby="wishlist-tab">
							<div class="border-y border-translucent"
								id="productWishlistTable"
								data-list='{"valueNames":["products","color","size","price","quantity","total"],"page":5,"pagination":true}'>
								<div class="table-responsive scrollbar">
									<table class="table fs-9 mb-0">
										<thead>
											<tr>
												<th class="sort white-space-nowrap align-middle fs-10"
													scope="col" style="width: 7%;"></th>
												<th class="sort white-space-nowrap align-middle" scope="col"
													style="width: 30%; min-width: 250px;" data-sort="products">PRODUCTS</th>
												<th class="sort align-middle" scope="col" data-sort="color"
													style="width: 16%;">COLOR</th>
												<th class="sort align-middle" scope="col" data-sort="size"
													style="width: 10%;">SIZE</th>
												<th class="sort align-middle text-end" scope="col"
													data-sort="price" style="width: 10%;">PRICE</th>
												<th class="sort align-middle text-end pe-0" scope="col"
													style="width: 35%;"></th>
											</tr>
										</thead>
										<tbody class="list" id="profile-wishlist-table-body">
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													class="border border-translucent rounded-2 d-inline-block"
													href="resources/apps/e-commerce/landing/product-details.html"><img
														src="resources/assets/img//products/1.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle pe-11"><a
													class="fw-semibold mb-0 line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">Fitbit
														Sense Advanced Smartwatch with Tools for Heart Health,
														Stress Management &amp; Skin Temperature Trends,
														Carbon/Graphite, One Size (S &amp; L Bands)</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body">Pure
													matte black</td>
												<td
													class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold">42</td>
												<td
													class="price align-middle text-body fs-9 fw-semibold text-end">$57</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end text-nowrap pe-0"><button
														class="btn btn-sm text-body-quaternary text-body-tertiary-hover me-2">
														<span class="fas fa-trash"></span>
													</button>
													<button class="btn btn-primary fs-10">
														<span class="fas fa-shopping-cart me-1 fs-10"></span>Add
														to cart
													</button></td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													class="border border-translucent rounded-2 d-inline-block"
													href="resources/apps/e-commerce/landing/product-details.html"><img
														src="resources/assets/img//products/7.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle pe-11"><a
													class="fw-semibold mb-0 line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">2021
														Apple 12.9-inch iPad Pro (Wi‑Fi, 128GB) - Space Gray</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body">Black</td>
												<td
													class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold">Pro</td>
												<td
													class="price align-middle text-body fs-9 fw-semibold text-end">$1,499</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end text-nowrap pe-0"><button
														class="btn btn-sm text-body-quaternary text-body-tertiary-hover me-2">
														<span class="fas fa-trash"></span>
													</button>
													<button class="btn btn-primary fs-10">
														<span class="fas fa-shopping-cart me-1 fs-10"></span>Add
														to cart
													</button></td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													class="border border-translucent rounded-2 d-inline-block"
													href="resources/apps/e-commerce/landing/product-details.html"><img
														src="resources/assets/img//products/6.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle pe-11"><a
													class="fw-semibold mb-0 line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">PlayStation
														5 DualSense Wireless Controller</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body">White</td>
												<td
													class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold">Regular</td>
												<td
													class="price align-middle text-body fs-9 fw-semibold text-end">$299</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end text-nowrap pe-0"><button
														class="btn btn-sm text-body-quaternary text-body-tertiary-hover me-2">
														<span class="fas fa-trash"></span>
													</button>
													<button class="btn btn-primary fs-10">
														<span class="fas fa-shopping-cart me-1 fs-10"></span>Add
														to cart
													</button></td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													class="border border-translucent rounded-2 d-inline-block"
													href="resources/apps/e-commerce/landing/product-details.html"><img
														src="resources/assets/img//products/3.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle pe-11"><a
													class="fw-semibold mb-0 line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">Apple
														MacBook Pro 13 inch-M1-8/256GB-space</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body">Space
													Gray</td>
												<td
													class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold">Pro</td>
												<td
													class="price align-middle text-body fs-9 fw-semibold text-end">$1,699</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end text-nowrap pe-0"><button
														class="btn btn-sm text-body-quaternary text-body-tertiary-hover me-2">
														<span class="fas fa-trash"></span>
													</button>
													<button class="btn btn-primary fs-10">
														<span class="fas fa-shopping-cart me-1 fs-10"></span>Add
														to cart
													</button></td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													class="border border-translucent rounded-2 d-inline-block"
													href="resources/apps/e-commerce/landing/product-details.html"><img
														src="resources/assets/img//products/4.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle pe-11"><a
													class="fw-semibold mb-0 line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">Apple
														iMac 24&quot; 4K Retina Display M1 8 Core CPU, 7 Core GPU,
														256GB SSD, Green (MJV83ZP/A) 2021</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body">Ocean
													Blue</td>
												<td
													class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold">21&quot;</td>
												<td
													class="price align-middle text-body fs-9 fw-semibold text-end">$65</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end text-nowrap pe-0"><button
														class="btn btn-sm text-body-quaternary text-body-tertiary-hover me-2">
														<span class="fas fa-trash"></span>
													</button>
													<button class="btn btn-primary fs-10">
														<span class="fas fa-shopping-cart me-1 fs-10"></span>Add
														to cart
													</button></td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													class="border border-translucent rounded-2 d-inline-block"
													href="resources/apps/e-commerce/landing/product-details.html"><img
														src="resources/assets/img//products/10.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle pe-11"><a
													class="fw-semibold mb-0 line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">Apple
														Magic Mouse (Wireless, Rechargable) - Silver</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body">White</td>
												<td
													class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold">Regular</td>
												<td
													class="price align-middle text-body fs-9 fw-semibold text-end">$30</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end text-nowrap pe-0"><button
														class="btn btn-sm text-body-quaternary text-body-tertiary-hover me-2">
														<span class="fas fa-trash"></span>
													</button>
													<button class="btn btn-primary fs-10">
														<span class="fas fa-shopping-cart me-1 fs-10"></span>Add
														to cart
													</button></td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													class="border border-translucent rounded-2 d-inline-block"
													href="resources/apps/e-commerce/landing/product-details.html"><img
														src="resources/assets/img//products/8.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle pe-11"><a
													class="fw-semibold mb-0 line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">Amazon
														Basics Matte Black Wired Keyboard - US Layout (QWERTY)</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body">Black</td>
												<td
													class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold">MD</td>
												<td
													class="price align-middle text-body fs-9 fw-semibold text-end">$40</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end text-nowrap pe-0"><button
														class="btn btn-sm text-body-quaternary text-body-tertiary-hover me-2">
														<span class="fas fa-trash"></span>
													</button>
													<button class="btn btn-primary fs-10">
														<span class="fas fa-shopping-cart me-1 fs-10"></span>Add
														to cart
													</button></td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													class="border border-translucent rounded-2 d-inline-block"
													href="resources/apps/e-commerce/landing/product-details.html"><img
														src="resources/assets/img//products/12.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle pe-11"><a
													class="fw-semibold mb-0 line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">HORI
														Racing Wheel Apex for PlayStation 4_3, and PC</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body">Black</td>
												<td
													class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold">45</td>
												<td
													class="price align-middle text-body fs-9 fw-semibold text-end">$130</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end text-nowrap pe-0"><button
														class="btn btn-sm text-body-quaternary text-body-tertiary-hover me-2">
														<span class="fas fa-trash"></span>
													</button>
													<button class="btn btn-primary fs-10">
														<span class="fas fa-shopping-cart me-1 fs-10"></span>Add
														to cart
													</button></td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													class="border border-translucent rounded-2 d-inline-block"
													href="resources/apps/e-commerce/landing/product-details.html"><img
														src="resources/assets/img//products/17.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle pe-11"><a
													class="fw-semibold mb-0 line-clamp-1"
													href="resources/apps/e-commerce/landing/product-details.html">Xbox
														Series S</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body">Space
													Gray</td>
												<td
													class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold">sm</td>
												<td
													class="price align-middle text-body fs-9 fw-semibold text-end">$99</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end text-nowrap pe-0"><button
														class="btn btn-sm text-body-quaternary text-body-tertiary-hover me-2">
														<span class="fas fa-trash"></span>
													</button>
													<button class="btn btn-primary fs-10">
														<span class="fas fa-shopping-cart me-1 fs-10"></span>Add
														to cart
													</button></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div
									class="row align-items-center justify-content-between py-2 pe-0 fs-9">
									<div class="col-auto d-flex">
										<p class="mb-0 d-none d-sm-block me-3 fw-semibold text-body"
											data-list-info="data-list-info"></p>
										<a class="fw-semibold" href="#!" data-list-view="*">View
											all<span class="fas fa-angle-right ms-1"
											data-fa-transform="down-1"></span>
										</a><a class="fw-semibold d-none" href="#!" data-list-view="less">View
											Less<span class="fas fa-angle-right ms-1"
											data-fa-transform="down-1"></span>
										</a>
									</div>
									<div class="col-auto d-flex">
										<button class="page-link" data-list-pagination="prev">
											<span class="fas fa-chevron-left"></span>
										</button>
										<ul class="mb-0 pagination"></ul>
										<button class="page-link pe-0" data-list-pagination="next">
											<span class="fas fa-chevron-right"></span>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab-stores" role="tabpanel"
							aria-labelledby="wishlist-tab">
							<div class="border-y mb-6" id="profileStoreTable"
								data-list='{"valueNames":["products","color","size","price","quantity","total"],"page":5,"pagination":true}'>
								<div class="table-responsive scrollbar">
									<table class="table table-sm fs-9 mb-0">
										<thead>
											<tr>
												<th class="sort white-space-nowrap align-middle fs-10"
													scope="col" style="width: 7%; min-width: 80px;"></th>
												<th class="sort white-space-nowrap align-middle" scope="col"
													style="width: 20%; min-width: 150px;" data-sort="products">VENDOR</th>
												<th class="sort align-middle" scope="col" data-sort="color"
													style="width: 15%; min-width: 150px;">STORE RATING</th>
												<th class="sort align-middle text-end" scope="col"
													data-sort="price" style="width: 12%; min-width: 150px;">ORDERS</th>
												<th class="sort align-middle text-end" scope="col"
													data-sort="size" style="width: 15%; min-width: 150px;">TOTAL
													SPENT</th>
												<th class="sort align-middle text-end" scope="col"
													data-sort="price" style="width: 15%; min-width: 150px;">LAST
													ORDER</th>
												<th class="sort align-middle text-end pe-0" scope="col"
													style="width: 30%; min-width: 150px;"></th>
											</tr>
										</thead>
										<tbody class="list" id="profile-stores-table-body">
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													href="#!"> <img
														src="resources/assets/img//brand2/dell.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle"><a
													class="fw-semibold mb-0" href="#!">Dell Technologies</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span></td>
												<td
													class="size align-middle white-space-nowrap text-primary fs-9 fw-bold text-end">3</td>
												<td
													class="price align-middle text-end text-body fw-semibold">$
													23987</td>
												<td
													class="price align-middle text-body-tertiary fs-9 text-end">Dec
													12, 12:56 PM</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													href="#!"> <img
														src="resources/assets/img//brand2/honda.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle"><a
													class="fw-semibold mb-0" href="#!">Honda</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa-regular fa-star text-warning-light"></span><span
													class="fa-regular fa-star text-warning-light"></span></td>
												<td
													class="size align-middle white-space-nowrap text-primary fs-9 fw-bold text-end">5</td>
												<td
													class="price align-middle text-end text-body fw-semibold">$
													1250</td>
												<td
													class="price align-middle text-body-tertiary fs-9 text-end">Dec
													09, 10:48 AM</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													href="#!"> <img
														src="resources/assets/img//brand2/xiaomi.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle"><a
													class="fw-semibold mb-0" href="#!">Xiaomi</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa-regular fa-star text-warning-light"></span><span
													class="fa-regular fa-star text-warning-light"></span></td>
												<td
													class="size align-middle white-space-nowrap text-primary fs-9 fw-bold text-end">6</td>
												<td
													class="price align-middle text-end text-body fw-semibold">$
													360</td>
												<td
													class="price align-middle text-body-tertiary fs-9 text-end">Dec
													03, 05:45 PM</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													href="#!"> <img
														src="resources/assets/img//brand/huawei.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle"><a
													class="fw-semibold mb-0" href="#!">Huawei Shop BD</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa-regular fa-star text-warning-light"></span><span
													class="fa-regular fa-star text-warning-light"></span></td>
												<td
													class="size align-middle white-space-nowrap text-primary fs-9 fw-bold text-end">1</td>
												<td
													class="price align-middle text-end text-body fw-semibold">$1,799</td>
												<td
													class="price align-middle text-body-tertiary fs-9 text-end">Nov
													27, 06:20 PM</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
											<tr
												class="hover-actions-trigger btn-reveal-trigger position-static">
												<td class="align-middle white-space-nowrap ps-0 py-0"><a
													href="#!"> <img
														src="resources/assets/img//brand2/intel-2.png" alt=""
														width="53" /></a></td>
												<td class="products align-middle"><a
													class="fw-semibold mb-0" href="#!">Intel</a></td>
												<td
													class="color align-middle white-space-nowrap fs-9 text-body"><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa fa-star text-warning"></span><span
													class="fa-regular fa-star text-warning-light"></span></td>
												<td
													class="size align-middle white-space-nowrap text-primary fs-9 fw-bold text-end">2</td>
												<td
													class="price align-middle text-end text-body fw-semibold">$65</td>
												<td
													class="price align-middle text-body-tertiary fs-9 text-end">Nov
													21, 10:25 AM</td>
												<td
													class="total align-middle fw-bold text-body-highlight text-end">
													<div class="btn-reveal-trigger position-static">
														<button
															class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
															type="button" data-bs-toggle="dropdown"
															data-boundary="window" aria-haspopup="true"
															aria-expanded="false" data-bs-reference="parent">
															<span class="fas fa-ellipsis-h fs-10"></span>
														</button>
														<div class="dropdown-menu dropdown-menu-end py-2">
															<a class="dropdown-item" href="#!">View</a><a
																class="dropdown-item" href="#!">Export</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item text-danger" href="#!">Remove</a>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div
									class="row align-items-center justify-content-between py-2 pe-0 fs-9">
									<div class="col-auto d-flex">
										<p class="mb-0 d-none d-sm-block me-3 fw-semibold text-body"
											data-list-info="data-list-info"></p>
										<a class="fw-semibold" href="#!" data-list-view="*">View
											all<span class="fas fa-angle-right ms-1"
											data-fa-transform="down-1"></span>
										</a><a class="fw-semibold d-none" href="#!" data-list-view="less">View
											Less<span class="fas fa-angle-right ms-1"
											data-fa-transform="down-1"></span>
										</a>
									</div>
									<div class="col-auto d-flex">
										<button class="page-link" data-list-pagination="prev">
											<span class="fas fa-chevron-left"></span>
										</button>
										<ul class="mb-0 pagination"></ul>
										<button class="page-link pe-0" data-list-pagination="next">
											<span class="fas fa-chevron-right"></span>
										</button>
									</div>
								</div>
							</div>
							<div class="d-flex flex-between-center mb-5">
								<div>
									<h3 class="text-body-emphasis mb-2">My Favorites Stores</h3>
									<h5 class="text-body-tertiary fw-semibold">Essential for a
										better life</h5>
								</div>
								<button class="btn btn-phoenix-primary">View all</button>
							</div>
							<div class="row gx-3 gy-5">
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100" src="resources/assets/img/brand2/dell.png"
											alt="Dell Technologies" />
									</div>
									<h5 class="mb-2">Dell Technologies</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa-regular fa-star text-warning-light"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(1263
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100" src="resources/assets/img/brand2/hp.png"
											alt="HP Global Store" />
									</div>
									<h5 class="mb-2">HP Global Store</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa-regular fa-star text-warning-light"></span><span
											class="fa-regular fa-star text-warning-light"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(365
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100"
											src="resources/assets/img/brand2/honda.png" alt="Honda" />
									</div>
									<h5 class="mb-2">Honda</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(596
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100"
											src="resources/assets/img/brand2/asus-rog.png" alt="Asus ROG" />
									</div>
									<h5 class="mb-2">Asus ROG</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa-regular fa-star text-warning-light"></span><span
											class="fa-regular fa-star text-warning-light"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(2365
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100"
											src="resources/assets/img/brand2/yamaha.png" alt="Yamaha" />
									</div>
									<h5 class="mb-2">Yamaha</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(1253
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100" src="resources/assets/img/brand2/ibm.png"
											alt="IBM" />
									</div>
									<h5 class="mb-2">IBM</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa-regular fa-star text-warning-light"></span><span
											class="fa-regular fa-star text-warning-light"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(996
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100"
											src="resources/assets/img/brand2/apple-2.png"
											alt="Apple Store" />
									</div>
									<h5 class="mb-2">Apple Store</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa-regular fa-star text-warning-light"></span><span
											class="fa-regular fa-star text-warning-light"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(365
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100" src="resources/assets/img/brand2/oppo.png"
											alt="Oppo" />
									</div>
									<h5 class="mb-2">Oppo</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa-regular fa-star text-warning-light"></span><span
											class="fa-regular fa-star text-warning-light"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(576
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100"
											src="resources/assets/img/brand2/redragon.png" alt="Redragon" />
									</div>
									<h5 class="mb-2">Redragon</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa-regular fa-star text-warning-light"></span><span
											class="fa-regular fa-star text-warning-light"></span><span
											class="fa-regular fa-star text-warning-light"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(1125
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100" src="resources/assets/img/brand2/xbox.png"
											alt="Microsoft XBOX" />
									</div>
									<h5 class="mb-2">Microsoft XBOX</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa-regular fa-star text-warning-light"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(830
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100"
											src="resources/assets/img/brand2/lenovo.png" alt="Lenovo" />
									</div>
									<h5 class="mb-2">Lenovo</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa-regular fa-star text-warning-light"></span><span
											class="fa-regular fa-star text-warning-light"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(1032
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-6 col-sm-4 col-md-3 col-lg-2 hover-actions-trigger btn-reveal-trigger">
									<div
										class="border border-translucent d-flex flex-center rounded-3 mb-3 p-4"
										style="height: 180px;">
										<img class="mw-100"
											src="resources/assets/img/brand2/xiaomi.png" alt="Xiaomi" />
									</div>
									<h5 class="mb-2">Xiaomi</h5>
									<div class="mb-1 fs-9">
										<span class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa fa-star text-warning"></span><span
											class="fa-regular fa-star text-warning-light"></span><span
											class="fa-regular fa-star text-warning-light"></span>
									</div>
									<p class="text-body-quaternary fs-9 mb-2 fw-semibold">(965
										people rated)</p>
									<a class="btn btn-link p-0" href="#!">Visit Store<span
										class="fas fa-chevron-right ms-1 fs-10"></span></a>
									<div class="hover-actions top-0 end-0 mt-2 me-3">
										<div class="btn-reveal-trigger">
											<button
												class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal p-2 lh-1 bg-body-highlight rounded-1"
												type="button" data-bs-toggle="dropdown"
												data-boundary="window" aria-haspopup="true"
												aria-expanded="false" data-bs-reference="parent">
												<span class="fas fa-ellipsis-h fs-9"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-end py-2">
												<a class="dropdown-item" href="#!">View</a><a
													class="dropdown-item" href="#!">Export</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item text-danger" href="#!">Remove</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab-personal-info" role="tabpanel"
							aria-labelledby="personal-info-tab">
							<div class="row g-3 mb-5">
								<div class="col-12 col-lg-6">
									<label
										class="form-label text-body-highlight fs-8 ps-0 text-capitalize lh-sm"
										for="fullName">Full name</label><input class="form-control"
										id="fullName" type="text" placeholder="Full name" />
								</div>
								<div class="col-12 col-lg-6">
									<label
										class="form-label text-body-highlight fs-8 ps-0 text-capitalize lh-sm"
										for="gender">Gender</label><select class="form-select"
										id="gender">
										<option value="male">Male</option>
										<option value="female">Female</option>
										<option value="non-binary">Non-binary</option>
										<option value="not-to-say">Prefer not to say</option>
									</select>
								</div>
								<div class="col-12 col-lg-6">
									<label
										class="form-label text-body-highlight fs-8 ps-0 text-capitalize lh-sm"
										for="email">Email</label><input class="form-control"
										id="email" type="text" placeholder="Email" />
								</div>
								<div class="col-12 col-lg-6">
									<div class="row g-2 gy-lg-0">
										<label
											class="form-label text-body-highlight fs-8 ps-1 text-capitalize lh-sm mb-1">Date
											of birth</label>
										<div class="col-6 col-sm-2 col-lg-3 col-xl-2">
											<select class="form-select" id="date">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
											</select>
										</div>
										<div class="col-6 col-sm-2 col-lg-3 col-xl-2">
											<select class="form-select" id="month">
												<option value="Jan">Jan</option>
												<option value="Feb">Feb</option>
												<option value="Mar">Mar</option>
												<option value="Apr">Apr</option>
												<option value="May">May</option>
												<option value="Jun">Jun</option>
												<option value="Jul">Jul</option>
												<option value="Aug">Aug</option>
												<option value="Sep">Sep</option>
												<option value="Oct">Oct</option>
												<option value="Nov">Nov</option>
												<option value="Dec">Dec</option>
											</select>
										</div>
										<div class="col-12 col-sm-8 col-lg-6 col-xl-8">
											<select class="form-select" id="year">
												<option value="1990">1990</option>
												<option value="1991">1991</option>
												<option value="1992">1992</option>
												<option value="1993">1993</option>
												<option value="1994">1994</option>
												<option value="1995">1995</option>
												<option value="1996">1996</option>
												<option value="1997">1997</option>
												<option value="1998">1998</option>
												<option value="1999">1999</option>
												<option value="2000">2000</option>
												<option value="2001">2001</option>
												<option value="2002">2002</option>
												<option value="2003">2003</option>
												<option value="2004">2004</option>
												<option value="2005">2005</option>
												<option value="2006">2006</option>
												<option value="2007">2007</option>
												<option value="2008">2008</option>
												<option value="2009">2009</option>
												<option value="2010">2010</option>
												<option value="2011">2011</option>
												<option value="2012">2012</option>
												<option value="2013">2013</option>
												<option value="2014">2014</option>
												<option value="2015">2015</option>
												<option value="2016">2016</option>
												<option value="2017">2017</option>
												<option value="2018">2018</option>
												<option value="2019">2019</option>
												<option value="2020">2020</option>
												<option value="2021">2021</option>
												<option value="2022">2022</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-12 col-lg-6">
									<label
										class="form-label text-body-highlight fw-bold fs-8 ps-0 text-capitalize lh-sm"
										for="phone">Phone</label><input class="form-control"
										id="phone" type="text" placeholder="+1234567890" />
								</div>
								<div class="col-12 col-lg-6">
									<label
										class="form-label text-body-highlight fw-bold fs-8 ps-0 text-capitalize lh-sm"
										for="alternative_phone">Alternative phone</label><input
										class="form-control" id="alternative_phone" type="text"
										placeholder="+1234567890" />
								</div>
								<div class="col-12 col-lg-4">
									<label
										class="form-label text-body-highlight fw-bold fs-8 ps-0 text-capitalize lh-sm"
										for="facebook">Facebook</label><input class="form-control"
										id="facebook" type="text" placeholder="Facebook" />
								</div>
								<div class="col-12 col-lg-4">
									<label
										class="form-label text-body-highlight fw-bold fs-8 ps-0 text-capitalize lh-sm"
										for="instagram">Instagram</label><input class="form-control"
										id="instagram" type="text" placeholder="Instagram" />
								</div>
								<div class="col-12 col-lg-4">
									<label
										class="form-label text-body-highlight fw-bold fs-8 ps-0 text-capitalize lh-sm"
										for="twitter">Twitter</label><input class="form-control"
										id="twitter" type="text" placeholder="Twitter" />
								</div>
							</div>
							<div class="text-end">
								<button class="btn btn-primary px-7">Save changes</button>
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
			<button class="btn p-0 border border-translucent btn-support-chat">
				<span class="fs-8 btn-text text-primary text-nowrap">Chat
					demo</span><span class="fa-solid fa-circle text-success fs-9 ms-2"></span><span
					class="fa-solid fa-chevron-down text-primary fs-7"></span>
			</button>
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
	<!-- ===============================================-->
	<!--    End of Main Content-->
	<!-- ===============================================-->

	<div class="offcanvas offcanvas-end settings-panel border-0"
		id="settings-offcanvas" tabindex="-1"
		aria-labelledby="settings-offcanvas">
		<div
			class="offcanvas-header align-items-start border-bottom flex-column border-translucent">
			<div
				class="pt-1 w-100 mb-6 d-flex justify-content-between align-items-start">
				<div>
					<h5 class="mb-2 me-2 lh-sm">
						<span class="fas fa-palette me-2 fs-8"></span>Theme Customizer
					</h5>
					<p class="mb-0 fs-9">Explore different styles according to your
						preferences</p>
				</div>
				<button class="btn p-1 fw-bolder" type="button"
					data-bs-dismiss="offcanvas" aria-label="Close">
					<span class="fas fa-times fs-8"> </span>
				</button>
			</div>
			<button class="btn btn-phoenix-secondary w-100"
				data-theme-control="reset">
				<span class="fas fa-arrows-rotate me-2 fs-10"></span>Reset to
				default
			</button>
		</div>
		<div class="offcanvas-body scrollbar px-card" id="themeController">
			<div class="setting-panel-item mt-0">
				<h5 class="setting-panel-item-title">Color Scheme</h5>
				<div class="row gx-2">
					<div class="col-4">
						<input class="btn-check" id="themeSwitcherLight"
							name="theme-color" type="radio" value="light"
							data-theme-control="phoenixTheme" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="themeSwitcherLight"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype mb-0"
								src="resources/assets/img/generic/default-light.png" alt="" /></span><span
							class="label-text">Light</span></label>
					</div>
					<div class="col-4">
						<input class="btn-check" id="themeSwitcherDark" name="theme-color"
							type="radio" value="dark" data-theme-control="phoenixTheme" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="themeSwitcherDark"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype mb-0"
								src="resources/assets/img/generic/default-dark.png" alt="" /></span><span
							class="label-text"> Dark</span></label>
					</div>
					<div class="col-4">
						<input class="btn-check" id="themeSwitcherAuto" name="theme-color"
							type="radio" value="auto" data-theme-control="phoenixTheme" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="themeSwitcherAuto"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype mb-0"
								src="resources/assets/img/generic/auto.png" alt="" /></span><span
							class="label-text"> Auto</span></label>
					</div>
				</div>
			</div>
			<div
				class="border border-translucent rounded-3 p-4 setting-panel-item bg-body-emphasis">
				<div class="d-flex justify-content-between align-items-center">
					<h5 class="setting-panel-item-title mb-1">RTL</h5>
					<div class="form-check form-switch mb-0">
						<input class="form-check-input ms-auto" type="checkbox"
							data-theme-control="phoenixIsRTL" />
					</div>
				</div>
				<p class="mb-0 text-body-tertiary">Change text direction</p>
			</div>
			<div
				class="border border-translucent rounded-3 p-4 setting-panel-item bg-body-emphasis">
				<div class="d-flex justify-content-between align-items-center">
					<h5 class="setting-panel-item-title mb-1">Support Chat</h5>
					<div class="form-check form-switch mb-0">
						<input class="form-check-input ms-auto" type="checkbox"
							data-theme-control="phoenixSupportChat" />
					</div>
				</div>
				<p class="mb-0 text-body-tertiary">Toggle support chat</p>
			</div>
			<div class="setting-panel-item">
				<h5 class="setting-panel-item-title">Navigation Type</h5>
				<div class="row gx-2">
					<div class="col-6">
						<input class="btn-check" id="navbarPositionVertical"
							name="navigation-type" type="radio" value="vertical"
							data-theme-control="phoenixNavbarPosition" disabled="disabled" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarPositionVertical"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none"
								src="resources/assets/img/generic/default-light.png" alt="" /><img
								class="img-fluid img-prototype d-light-none"
								src="resources/assets/img/generic/default-dark.png" alt="" /></span><span
							class="label-text">Vertical</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbarPositionHorizontal"
							name="navigation-type" type="radio" value="horizontal"
							data-theme-control="phoenixNavbarPosition" disabled="disabled" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarPositionHorizontal"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none"
								src="resources/assets/img/generic/top-default.png" alt="" /><img
								class="img-fluid img-prototype d-light-none"
								src="resources/assets/img/generic/top-default-dark.png" alt="" /></span><span
							class="label-text"> Horizontal</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbarPositionCombo"
							name="navigation-type" type="radio" value="combo"
							data-theme-control="phoenixNavbarPosition" disabled="disabled" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarPositionCombo"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none"
								src="resources/assets/img/generic/nav-combo-light.png" alt="" /><img
								class="img-fluid img-prototype d-light-none"
								src="resources/assets/img/generic/nav-combo-dark.png" alt="" /></span><span
							class="label-text"> Combo</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbarPositionTopDouble"
							name="navigation-type" type="radio" value="dual-nav"
							data-theme-control="phoenixNavbarPosition" disabled="disabled" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarPositionTopDouble"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none"
								src="resources/assets/img/generic/dual-light.png" alt="" /><img
								class="img-fluid img-prototype d-light-none"
								src="resources/assets/img/generic/dual-dark.png" alt="" /></span><span
							class="label-text"> Dual nav</span></label>
					</div>
				</div>
				<p class="text-warning-dark font-medium">
					<span class="fa-solid fa-triangle-exclamation me-2 text-warning"></span>You
					can't update navigation type in this page
				</p>
			</div>
			<div class="setting-panel-item">
				<h5 class="setting-panel-item-title">Vertical Navbar Appearance</h5>
				<div class="row gx-2">
					<div class="col-6">
						<input class="btn-check" id="navbar-style-default" type="radio"
							name="config.name" value="default"
							data-theme-control="phoenixNavbarVerticalStyle"
							disabled="disabled" /><label
							class="btn d-block w-100 btn-navbar-style fs-9"
							for="navbar-style-default"> <img
							class="img-fluid img-prototype d-dark-none"
							src="resources/assets/img/generic/default-light.png" alt="" /><img
							class="img-fluid img-prototype d-light-none"
							src="resources/assets/img/generic/default-dark.png" alt="" /><span
							class="label-text d-dark-none"> Default</span><span
							class="label-text d-light-none">Default</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbar-style-dark" type="radio"
							name="config.name" value="darker"
							data-theme-control="phoenixNavbarVerticalStyle"
							disabled="disabled" /><label
							class="btn d-block w-100 btn-navbar-style fs-9"
							for="navbar-style-dark"> <img
							class="img-fluid img-prototype d-dark-none"
							src="resources/assets/img/generic/vertical-darker.png" alt="" /><img
							class="img-fluid img-prototype d-light-none"
							src="resources/assets/img/generic/vertical-lighter.png" alt="" /><span
							class="label-text d-dark-none"> Darker</span><span
							class="label-text d-light-none">Lighter</span></label>
					</div>
				</div>
				<p class="text-warning-dark font-medium">
					<span class="fa-solid fa-triangle-exclamation me-2 text-warning"></span>You
					can't update vertical navbar appearance in this page
				</p>
			</div>
			<div class="setting-panel-item">
				<h5 class="setting-panel-item-title">Horizontal Navbar Shape</h5>
				<div class="row gx-2">
					<div class="col-6">
						<input class="btn-check" id="navbarShapeDefault"
							name="navbar-shape" type="radio" value="default"
							data-theme-control="phoenixNavbarTopShape" disabled="disabled" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarShapeDefault"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none mb-0"
								src="resources/assets/img/generic/top-default.png" alt="" /><img
								class="img-fluid img-prototype d-light-none mb-0"
								src="resources/assets/img/generic/top-default-dark.png" alt="" /></span><span
							class="label-text">Default</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbarShapeSlim" name="navbar-shape"
							type="radio" value="slim"
							data-theme-control="phoenixNavbarTopShape" disabled="disabled" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarShapeSlim"> <span class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none mb-0"
								src="resources/assets/img/generic/top-slim.png" alt="" /><img
								class="img-fluid img-prototype d-light-none mb-0"
								src="resources/assets/img/generic/top-slim-dark.png" alt="" /></span><span
							class="label-text"> Slim</span></label>
					</div>
				</div>
				<p class="text-warning-dark font-medium">
					<span class="fa-solid fa-triangle-exclamation me-2 text-warning"></span>You
					can't update horizontal navbar shape in this page
				</p>
			</div>
			<div class="setting-panel-item">
				<h5 class="setting-panel-item-title">Horizontal Navbar
					Appearance</h5>
				<div class="row gx-2">
					<div class="col-6">
						<input class="btn-check" id="navbarTopDefault"
							name="navbar-top-style" type="radio" value="default"
							data-theme-control="phoenixNavbarTopStyle" disabled="disabled" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarTopDefault"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none mb-0"
								src="resources/assets/img/generic/top-default.png" alt="" /><img
								class="img-fluid img-prototype d-light-none mb-0"
								src="resources/assets/img/generic/top-style-darker.png" alt="" /></span><span
							class="label-text">Default</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbarTopDarker"
							name="navbar-top-style" type="radio" value="darker"
							data-theme-control="phoenixNavbarTopStyle" disabled="disabled" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarTopDarker"> <span class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none mb-0"
								src="resources/assets/img/generic/navbar-top-style-light.png"
								alt="" /><img class="img-fluid img-prototype d-light-none mb-0"
								src="resources/assets/img/generic/top-style-lighter.png" alt="" /></span><span
							class="label-text d-dark-none">Darker</span><span
							class="label-text d-light-none">Lighter</span></label>
					</div>
				</div>
				<p class="text-warning-dark font-medium">
					<span class="fa-solid fa-triangle-exclamation me-2 text-warning"></span>You
					can't update horizontal navbar appearance in this page
				</p>
			</div>
			<a
				class="bun btn-primary d-grid mb-3 text-white mt-5 btn btn-primary"
				href="https://themes.getbootstrap.com/product/phoenix-admin-dashboard-webapp-template/"
				target="_blank">Purchase template</a>
		</div>
	</div>
	<a class="card setting-toggle" href="#settings-offcanvas"
		data-bs-toggle="offcanvas">
		<div class="card-body d-flex align-items-center px-2 py-1">
			<div class="position-relative rounded-start"
				style="height: 34px; width: 28px">
				<div class="settings-popover">
					<span class="ripple"><span
						class="fa-spin position-absolute all-0 d-flex flex-center"><span
							class="icon-spin position-absolute all-0 d-flex flex-center"><svg
									width="20" height="20" viewBox="0 0 20 20" fill="#ffffff"
									xmlns="http://www.w3.org/2000/svg">
									<path
										d="M19.7369 12.3941L19.1989 12.1065C18.4459 11.7041 18.0843 10.8487 18.0843 9.99495C18.0843 9.14118 18.4459 8.28582 19.1989 7.88336L19.7369 7.59581C19.9474 7.47484 20.0316 7.23291 19.9474 7.03131C19.4842 5.57973 18.6843 4.28943 17.6738 3.20075C17.5053 3.03946 17.2527 2.99914 17.0422 3.12011L16.393 3.46714C15.6883 3.84379 14.8377 3.74529 14.1476 3.3427C14.0988 3.31422 14.0496 3.28621 14.0002 3.25868C13.2568 2.84453 12.7055 2.10629 12.7055 1.25525V0.70081C12.7055 0.499202 12.5371 0.297594 12.2845 0.257272C10.7266 -0.105622 9.16879 -0.0653007 7.69516 0.257272C7.44254 0.297594 7.31623 0.499202 7.31623 0.70081V1.23474C7.31623 2.09575 6.74999 2.8362 5.99824 3.25599C5.95774 3.27861 5.91747 3.30159 5.87744 3.32493C5.15643 3.74527 4.26453 3.85902 3.53534 3.45302L2.93743 3.12011C2.72691 2.99914 2.47429 3.03946 2.30587 3.20075C1.29538 4.28943 0.495411 5.57973 0.0322686 7.03131C-0.051939 7.23291 0.0322686 7.47484 0.242788 7.59581L0.784376 7.8853C1.54166 8.29007 1.92694 9.13627 1.92694 9.99495C1.92694 10.8536 1.54166 11.6998 0.784375 12.1046L0.242788 12.3941C0.0322686 12.515 -0.051939 12.757 0.0322686 12.9586C0.495411 14.4102 1.29538 15.7005 2.30587 16.7891C2.47429 16.9504 2.72691 16.9907 2.93743 16.8698L3.58669 16.5227C4.29133 16.1461 5.14131 16.2457 5.8331 16.6455C5.88713 16.6767 5.94159 16.7074 5.99648 16.7375C6.75162 17.1511 7.31623 17.8941 7.31623 18.7552V19.2891C7.31623 19.4425 7.41373 19.5959 7.55309 19.696C7.64066 19.7589 7.74815 19.7843 7.85406 19.8046C9.35884 20.0925 10.8609 20.0456 12.2845 19.7729C12.5371 19.6923 12.7055 19.4907 12.7055 19.2891V18.7346C12.7055 17.8836 13.2568 17.1454 14.0002 16.7312C14.0496 16.7037 14.0988 16.6757 14.1476 16.6472C14.8377 16.2446 15.6883 16.1461 16.393 16.5227L17.0422 16.8698C17.2527 16.9907 17.5053 16.9504 17.6738 16.7891C18.7264 15.7005 19.4842 14.4102 19.9895 12.9586C20.0316 12.757 19.9474 12.515 19.7369 12.3941ZM10.0109 13.2005C8.1162 13.2005 6.64257 11.7893 6.64257 9.97478C6.64257 8.20063 8.1162 6.74905 10.0109 6.74905C11.8634 6.74905 13.3792 8.20063 13.3792 9.97478C13.3792 11.7893 11.8634 13.2005 10.0109 13.2005Z"
										fill="#2A7BE4"></path></svg></span></span></span>
				</div>
			</div>
			<small
				class="text-uppercase text-body-tertiary fw-bold py-2 pe-2 ps-1 rounded-end">customize</small>
		</div>
	</a>

	<!-- ===============================================-->
	<!--    JavaScripts-->
	<!-- ===============================================-->
	<script src="resources/vendors/popper/popper.min.js"></script>
	<script src="resources/vendors/bootstrap/bootstrap.min.js"></script>
	<script src="resources/vendors/anchorjs/anchor.min.js"></script>
	<script src="resources/vendors/is/is.min.js"></script>
	<script src="resources/vendors/fontawesome/all.min.js"></script>
	<script src="resources/vendors/lodash/lodash.min.js"></script>
	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="resources/vendors/list.js/list.min.js"></script>
	<script src="resources/vendors/feather-icons/feather.min.js"></script>
	<script src="resources/vendors/dayjs/dayjs.min.js"></script>
	<script src="resources/assets/js/phoenix.js"></script>
</body>

</html>