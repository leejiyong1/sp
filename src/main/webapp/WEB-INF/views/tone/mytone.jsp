<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function upload(f) {
		let url = "/mytone.do";
		let param = "asd";
		sendRequest(url, param, resultFn, "post");
	}
	function resultFn() {
		if (xhr.status == 4 && xhr.readyState == 200) {
			alert("정상 수신");
		} else {
			alert("에러발생");
		}
	}
</script>
<body>
	<div>내색깔찾기</div>
	<div>내 색깔을 찾아보아요</div>
	<div>피부사진을 올려주세요</div>
	<div>내 피부 사진등록</div>
	<form method="post" action="upload" enctype="multipart/form-data">
		<div>
			<input alt="내피부 등록" name="file" type="file" id="imageFileOpenInput"
				accept="image/*">
		</div>
		<div>
			<input type="button" name="내색깔을 찾아줘!" onclick="upload();">
		</div>
	</form>
	<c:if test="${color.tone ne null}">
		<div>내 피부색깔은 ${color.tone}입니다!</div>
		<div>
			<!-- 피부색깔네모 출력 -->
		</div>
		<div>해당 피부색에 알맞는 추천상품을보시려면 클릭</div>
		<button>내피부톤에 맞는 잇템을 보러가자!</button>
	</c:if>
</body>
</html>