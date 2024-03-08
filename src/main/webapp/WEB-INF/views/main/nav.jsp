<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <link rel="apple-touch-icon" sizes="180x180" href="resources/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="resources/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="resources/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="resources/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="resources/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="resources/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="resources/vendors/simplebar/simplebar.min.js"></script>
    <script src="resources/assets/js/config.js"></script>

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link href="resources/vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link href="resources/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
    <link href="resources/assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    <link href="resources/assets/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl">
    <link href="resources/assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
    <script src="/beauty/resources/js/httpRequest.js"></script>
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
      document.addEventListener('DOMContentLoaded', function() {
  		let searchInput = document.getElementById('searchInput');
  		let dropdownMenu = document.getElementById('searchDropdown');
  		
  		searchInput.addEventListener('input', function() {
  			let keyword = this.value.trim();
  			if (keyword === '') {
  				dropdownMenu.innerHTML = '';
  				dropdownMenu.classList.remove('show');
  			} else {
  				// AJAX 요청 대신 예시에서는 직접 함수 호출
  				searchkeyword(keyword);
  			}
  		});

  		searchInput.addEventListener('focus', function() {
  			if (dropdownMenu.childElementCount > 0) {
  				dropdownMenu.classList.add('show');
  			}
  		});

  		searchInput.addEventListener('blur', function() {
  			setTimeout(function() {
  				dropdownMenu.classList.remove('show');
  			}, 100);
  		});
  	});

  	function searchkeyword(keyword) {
  		// 키워드가 있을 때만 검색을 수행
  		let url = "search_keyword.do";
  		let param = "keyword=" + keyword;
  		sendRequest(url, param, resultKeyword, 'post');
  	}

  	function resultKeyword() {
  		if (xhr.readyState == 4 && xhr.status == 200) {
  			let data = xhr.responseText;
  			let productNames = JSON.parse(data); // JSON 문자열을 문자열 배열로 변환
  			// 드롭다운 메뉴를 찾고 기존 항목을 지움
  			let dropdownMenu = document.querySelector('#searchDropdown');
  			dropdownMenu.innerHTML = '';
  			if (productNames.length > 0) {
  				productNames
  						.forEach(function(productName) {
  							let listItem = document.createElement('li'); // li 요소 생성
  							let dropdownItem = document.createElement('a');
  							dropdownItem.classList.add('dropdown-item');
  							dropdownItem.href = 'search_list.do?keyword='
  									+ productName;
  							dropdownItem.textContent = productName;
  							listItem.appendChild(dropdownItem); // li 요소 안에 a 요소 추가
  							dropdownMenu.appendChild(listItem); // 드롭다운 메뉴에 li 요소 추가
  						});

  				// 드롭다운 메뉴를 보이도록
  				dropdownMenu.classList.add('show');
  	        } else {
  	            dropdownMenu.classList.remove('show');
  	        }
  		}
  	}
  	function search_list(f) {
  		let keyword = f.keyword.value.trim();
  		if (keyword == '') {
  			alert('검색어를 입력하세요');
  			return;
  		}
  		f.submit();
  	}
  	
    </script>
<link href="resources/vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
<style type="text/css">
	.search-form {
    display: inline-block;
    width: 100%;
}

.search-form .dropdown-menu {
    width: 100%; /* 드롭다운 메뉴의 너비를 form 태그의 너비와 동일하게 설정 */
}
</style>
  </head>
  <body>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
   
		<section class="py-0">
	        <div class="container-small">
	          <div class="ecommerce-topbar">
	            <nav class="navbar navbar-expand-lg navbar-light px-0">
	              <div class="row gx-0 gy-2 w-100 flex-between-center">
	                <div class="col-auto"><a class="text-decoration-none" href="resources/index.html">
	                    <div class="d-flex align-items-center"><img src="resources/assets/img/icons/logo.png" alt="phoenix" width="27" />
	                      <p class="logo-text ms-2">phoenix</p>
	                    </div>
	                  </a></div>

	                <div class="col-auto order-md-1">
	                  <ul class="navbar-nav navbar-nav-icons flex-row me-n2">
	                  	
	                  	<!-- 장바구니 -->
	                    <li class="nav-item d-flex align-items-center">
	                      <div class="theme-control-toggle fa-icon-wait px-2"><input class="form-check-input ms-0 theme-control-toggle-input" type="checkbox" data-theme-control="phoenixTheme" value="dark" id="themeControlToggle" /><label class="mb-0 theme-control-toggle-label theme-control-toggle-light" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch theme"><span class="icon" data-feather="moon"></span></label><label class="mb-0 theme-control-toggle-label theme-control-toggle-dark" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch theme"><span class="icon" data-feather="sun"></span></label></div>
	                    </li>
	                    <!-- 장바구니 목록 수 -->
	                    <li class="nav-item"><a class="nav-link px-2 icon-indicator icon-indicator-primary" href="resources/apps/e-commerce/landing/cart.html" role="button"><span class="text-body-tertiary" data-feather="shopping-cart" style="height:20px;width:20px;"></span><span class="icon-indicator-number">3</span></a></li>
	                    
	                    <!-- 로그인 / 마이페이지 -->
	                    <li class="nav-item dropdown"><a class="nav-link px-2" id="navbarDropdownUser" href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-haspopup="true" aria-expanded="false"><span class="text-body-tertiary" data-feather="user" style="height:20px;width:20px;"></span></a>
	                      <div class="dropdown-menu dropdown-menu-end navbar-dropdown-caret py-0 dropdown-profile shadow border mt-2" aria-labelledby="navbarDropdownUser">
	                        <div class="card position-relative border-0">
	                        
	                        	<!-- 비회원인 경우 -->
	                        	<div style="margin-top:15px;">
		                            <div class="px-3"> <a class="btn btn-phoenix-secondary d-flex flex-center w-100" href="#!"> <span class="me-2" data-feather="log-in"> </span>로그인</a></div>
		                        	<div class="px-3"> <a class="btn btn-phoenix-secondary d-flex flex-center w-100" href="#!"> <span class="me-2" data-feather="log-in"> </span>회원가입</a></div>
		                            <div class="my-2 text-center fw-bold fs-10 text-body-quaternary"><a class="text-body-quaternary me-1" href="#!">Privacy policy</a>&bull;<a class="text-body-quaternary mx-1" href="#!">Terms</a>&bull;<a class="text-body-quaternary ms-1" href="#!">Cookies</a></div>
		                        </div>
	                        	
	                        	
	                        	<!-- 로그인한 유저인 경우 -->
	                          <!-- <div class="card-body p-0">
	                            <div class="text-center pt-4 pb-3">
	                              <div class="avatar avatar-xl ">
	                                <img class="rounded-circle " src="resources/assets/img/team/72x72/57.webp" alt="" />
	                              </div>
	                              <h6 class="mt-2 text-body-emphasis">Jerry Seinfield</h6>
	                            </div>
	                            <div class="mb-3 mx-3"><input class="form-control form-control-sm" id="statusUpdateInput" type="text" placeholder="Update your status" /></div>
	                          </div>
	                          <div class="overflow-auto scrollbar" style="height: 10rem;">
	                            <ul class="nav d-flex flex-column mb-2 pb-1">
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="user"></span><span>Profile</span></a></li>
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"><span class="me-2 text-body" data-feather="pie-chart"></span>Dashboard</a></li>
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="lock"></span>Posts &amp; Activity</a></li>
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="settings"></span>Settings &amp; Privacy </a></li>
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="help-circle"></span>Help Center</a></li>
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="globe"></span>Language</a></li>
	                            </ul>
	                          </div>
	                          <div class="card-footer p-0 border-top border-translucent">
	                            <ul class="nav d-flex flex-column my-3">
	                              <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-body" data-feather="user-plus"></span>Add another account</a></li>
	                            </ul>
	                            <hr />
	                            <div class="px-3"> <a class="btn btn-phoenix-secondary d-flex flex-center w-100" href="#!"> <span class="me-2" data-feather="log-out"> </span>Sign out</a></div>
	                            <div class="my-2 text-center fw-bold fs-10 text-body-quaternary"><a class="text-body-quaternary me-1" href="#!">Privacy policy</a>&bull;<a class="text-body-quaternary mx-1" href="#!">Terms</a>&bull;<a class="text-body-quaternary ms-1" href="#!">Cookies</a></div>
	                          </div> -->
	                        </div>
	                      </div>
	                    </li>
	                  </ul>
	                </div>
	                <div class="col-12 col-md-6">
	                  <div class="search-box ecommerce-search-box w-100">
									<form class="position-relative search-form" action="search_list.do" method="get">
										<input
											class="form-control search-input search form-control-sm"
											id="searchInput" type="search" placeholder="검색"
											aria-label="Search" name="keyword" /> <span
											class="fas fa-search search-box-icon"></span>
										<div class="dropdown-menu" id="searchDropdown"
											aria-labelledby="searchInput"></div>
									</form>
								</div>
	                </div>
	              </div>
	            </nav>
	          </div>
	        </div><!-- end of .container-->
	      </section><!-- <section> close ============================-->
	      <!-- ============================================-->
	
	      <nav class="ecommerce-navbar navbar-expand navbar-light bg-body-emphasis justify-content-between">
	        <div class="container-small d-flex flex-between-center" data-navbar="data-navbar">
	        
	        	<!-- 카테고리 -->
	          <div class="dropdown"><button class="btn text-body ps-0 pe-5 text-nowrap dropdown-toggle dropdown-caret-none" data-category-btn="data-category-btn" data-bs-toggle="dropdown"><span class="fas fa-bars me-2"></span>카테고리</button>
	            <div class="dropdown-menu border border-translucent py-0 category-dropdown-menu">
	              <div class="card border-0 scrollbar" style="max-height: 657px;">
	                <div class="card-body p-6 pb-3">
	                  <div class="row gx-7 gy-5 mb-5">
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="pocket" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Collectibles &amp; Art</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Collectibles</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Antiques</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Sports memorabilia </a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Art</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="home" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Home &amp; Gardan</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Yard, Garden &amp; Outdoor</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Crafts</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Home Improvement</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Pet Supplies</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="globe" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Sporting Goods</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Outdoor Sports</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Team Sports</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Exercise &amp; Fitness</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Golf</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="monitor" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Electronics</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Computers &amp; Tablets</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Camera &amp; Photo</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">TV, Audio &amp; Surveillance</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Cell Ohone &amp; Accessories</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="truck" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Auto Parts &amp; Accessories</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">GPS &amp; Security Devices</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Rader &amp; Laser Detectors</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Care &amp; Detailing</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Scooter Parts &amp; Accessories</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="codesandbox" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Toys &amp; Hobbies</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Radio Control</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Kids Toys</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Action Figures</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Dolls &amp; Bears</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="watch" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Fashion</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Women</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Men</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Jewelry &amp; Watches</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Shoes</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="music" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Musical Instruments &amp; Gear</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Guitar</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Pro Audio Equipment</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">String</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Stage Lighting &amp; Effects</a></div>
	                    </div>
	                    <div class="col-12 col-sm-6 col-md-4">
	                      <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="grid" style="stroke-width:3;"></span>
	                        <h6 class="text-body-highlight mb-0 text-nowrap">Other Categories</h6>
	                      </div>
	                      <div class="ms-n2"><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Video Games &amp; Consoles</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Health &amp; Beauty</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Baby</a><a class="text-body-emphasis d-block mb-1 text-decoration-none bg-body-highlight-hover px-2 py-1 rounded-2" href="#!">Business &amp; Industrial</a></div>
	                    </div>
	                  </div>
	                  <div class="text-center border-top border-translucent pt-3"><a class="fw-bold" href="#!">See all Categories<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a></div>
	                </div>
	              </div>
	            </div>
	          </div>
	          
	          <!-- 네비게이션 바 -->
	          <ul class="navbar-nav justify-content-end align-items-center">
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link ps-0 active" href="resources/apps/e-commerce/landing/homepage.html">게시판</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/favourite-stores.html">세일 상품</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/products-filter.html">인기 상품</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/wishlist.html">추천 상품</a></li>
	            <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link" href="resources/apps/e-commerce/landing/shipping-info.html">이벤트</a></li>
	          </ul>
	        </div>
	      </nav>
	      
	         <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="resources/vendors/popper/popper.min.js"></script>
    <script src="resources/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="resources/vendors/anchorjs/anchor.min.js"></script>
    <script src="resources/vendors/is/is.min.js"></script>
    <script src="resources/vendors/fontawesome/all.min.js"></script>
    <script src="resources/vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="resources/vendors/list.js/list.min.js"></script>
    <script src="resources/vendors/feather-icons/feather.min.js"></script>
    <script src="resources/vendors/dayjs/dayjs.min.js"></script>
    <script src="resources/assets/js/phoenix.js"></script>
    <script src="resources/vendors/swiper/swiper-bundle.min.js"></script>
</body>
</html>