<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>

<script type="text/javascript">
	function sendCheckValue() {
		let openJoinfrm = opener.document.joinForm;
		if (document.checkIdForm.chResult.value == "N") {
			alert("이미 존재하는 아이디입니다.\n다른 아이디를 입력해주세요.");
			openJoinfrm.id.focus();
			window.close();
		} else {
			// 중복체크 결과인 idCheck 값을 전달
			openJoinfrm.idDuplication.value = "idCheck";
			openJoinfrm.dbCheckId.disabled = true;
			openJoinfrm.dbCheckId.style.opacity = 0.6;
			openJoinfrm.dbCheckId.style.cursor = "default";
			window.close();
		}
	}
	
	
</script>
</head>
<body>
	<div align="center" style="margin-top: 30px;">
		<b><font size="4" color="gray">ID 중복 확인</font></b> <br>
		<form name="checkIdForm">
			<input type="text" name="id" value="${user_id}" id="userId" disabled>
			<c:choose>
				<c:when test="${result==1}">
					<p style="color: red">이미 사용 중인 아이디입니다.</p>
					<input type="hidden" name="chResult" value="N" />
				</c:when>
				<c:when test="${result==0 }">
					<p style="color: red">사용가능한 아이디입니다.</p>
					<input type="hidden" name="chResult" value="Y" />
				</c:when>
				<c:otherwise>
					<p>오류 발생(-1)</p>
					<input type="hidden" name="chResult" value="N" />
				</c:otherwise>
			</c:choose>
			<input type="button" class="btn btn-primary" onclick="window.close()"
				value="취소" /> <input type="button" class="btn btn-primary"
				style="margin-left: 20px;" onclick="sendCheckValue()" value="사용하기" />

		</form>
	</div>
</body>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>