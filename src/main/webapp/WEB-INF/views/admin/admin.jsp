<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>쇼핑몰 관리자 페이지</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dHㄴ/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">쇼핑몰 관리자 페이지</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <!-- <li class="nav-item active">
                <a class="nav-link" href="#">대시보드 <span class="sr-only">(current)</span></a>
            </li> -->
            <li class="nav-item">
                <a class="nav-link" href="admin_product.do">상품 관리</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin_add_product.do">상품 추가</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin_order.do">주문 관리</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin_member.do">맴버 관리</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="temp.do">메인</a>
            </li>
            <!-- 다른 메뉴 항목들을 추가할 수 있습니다. -->
        </ul>
    </div>
</nav>

<!-- <div class="container mt-3">
    <h2>대시보드</h2>
    <p>이곳에 대시보드 내용이 표시됩니다.</p> -->
    
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>