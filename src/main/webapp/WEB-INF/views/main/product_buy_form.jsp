<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <style>
        .product-image img {
            width: 100%; 
            max-width: 300px; 
            height: auto; 
        }
        .product-details {
            margin-top: 20px;
        }
        .product-actions {
            margin-top: 20px;
        }
    </style>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>

	<script type="text/javascript">
		IMP.init('imp73262104')

		function requestPay() {
			IMP.request_pay({
				pg : "danal_tpay",
				pay_method : "card",
				merchant_uid : "shop"+uuid(), // 주문번호는 항상 새번호를 넘겨야 한다.
				name : "${p_vo.p_name }", // 제품명
				amount : "${p_vo.p_totalprice }", // 숫자 타입, 결제 될 가격
				buyer_email : "${sessionScope.email}", // 구매자 이메일
				buyer_name : "${sessionScope.nickname}", // 구매자 이름
				buyer_tel : "010-8565-0864", // 구매자 전화번호
				buyer_addr : "서울특별시 마포구 신촌로 128", // 구매자 주소
				buyer_postcode : "04101" // 구매자 우편번호
			}, function(rsp) { // callback
				//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
				
				if(rsp.success){
					location.href="/result?imp_uid=" + rsp.imp_uid;
				}
			});
		}

		function uuid() {
			function _s4() {
				return ((1 + Math.random()) * 0x10000 | 0).toString(16)
						.substring(1);
			}
			return _s4() + _s4() + '-' + _s4() + '-' + _s4() + '-' + _s4()
					+ '-' + _s4() + _s4() + _s4();
		}
		console.log(uuid())
	</script>
<body>
<jsp:include page="nav.jsp" />
 <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 product-image">
                <!-- 상품 이미지 -->
                <img src="resources/productimages/${p_vo.p_image }" alt="상품 이미지">
            </div>
            <div class="col-md-6 product-details">
                <!-- 상품 이름 -->
                <h2>${p_vo.p_name }</h2>
                <!-- 수량 -->
                <p>${p_vo.quantity }</p>
                <!-- 가격 -->
                <p>${p_vo.p_totalprice }</p>
                <!-- 버튼 -->
                <div class="product-actions">
                    <button class="btn btn-primary">구매</button>
                    <button class="btn btn-secondary">취소</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>