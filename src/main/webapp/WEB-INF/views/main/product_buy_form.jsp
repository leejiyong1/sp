<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
<body>
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