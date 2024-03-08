<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<style>
</style>
<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	//프로필사진 변경하기
	function changeMyProfilePicture(){
		
	}
	//프로필상태메시지 변경
	function changeMyStatusPost(){
		
	}
	//내주문 보기
	function viewingMyOrders(){
		
	}
	//내찜상품 보기
	function myWishlist(){
	
	}
	
	//내글보기
	function viewMyPosts(){
		//버튼 조회||닫기
		let btnElement = document.getElementById('btn_ViewMyPosts');
		if(btnElement.innerText == '닫기'){
			btnElement.innerText = '내글보기';
		}else{
			btnElement.innerText = '닫기';
			let url = "viewMyPosts.do"
			let param="";
			sendRequest(url,param,resultViewMyPosts,"POST");
		}
	}
	function resultViewMyPosts(){
		if(xhr.status ==4 && xhr.readyState==200){
			let myPostView= document.getElementById('result');
			//myPostView=
			//Text.
			//var obj = JSON.parse();
			document.getElementById("result").innerHTML = "#";
		}
	}
	/* function printResult(let text){
		let json = JSON.parse(text);
	} */
	//내가 작성한 댓글보기
	function viewMyComments(){
		let btnElement = document.getElementById('btn_ViewMyComments');
		if(btnElement.innerText == '닫기'){
			btnElement.innerText = '내가 작성한 댓글보기';
		}else{
			btnElement.innerText = '닫기';
			let url = "viewMyComments.do";
				let param="";
			sendRequest(url,param,resultViewMyComments,"POST");
		}
		
	}
	function resultViewMyComments(){
		if(xhr.status ==4 && xhr.readyState==200){
		//document.querySelector().append(temp);
		}
	}
	//비밀번호 변경하기
	function changeMyPwd(){
		let input_previous_ChangeMyPwd = document.getElementById("input_previous_ChangeMyPwd").value;
		let input_new_ChangeMyPwd = document.getElementById("input_new_ChangeMyPwd").value;
		let input_new_ChangeMyPwd2 = document.getElementById("input_new_ChangeMyPwd2").value;
		if(input_new_ChangeMyPwd != input_new_ChangeMyPwd2){
			alert("비밀번호가 같지않음");
			return;
		}
		let url = "changeMyPwd.do";
		let param="prepwd=" +input_previous_ChangeMyPwd +"&newpwd="+input_new_ChangeMyPwd;
		//location.href="/beauty/changeMyPwd.do?"+param;
		sendRequest(url,param,resultchangeMyPwd,"POST");
		
		
	}
	function resultchangeMyPwd(){
		if(xhr.status ==200 && xhr.readyState ==4){
			let result = decodeURI(decodeURIComponent(xhr.responseText));
			if(result === "Failed to find Account"){
				alert("기본 비밀번호를 틀렸습니다.");
				return;	
			}
			if(result === "Failed to check password"){
				alert("비밀번호 재설정오류\n다시 시도해 주시길 바랍니다.");
				return;
			}
			if(result === "Password changed successfully"){
				alert("비밀번호 변경에 성공했습니다.\n다시 로그인해 주시길 바랍니다.");
				location.href="login.do";
				return;
			}
		}
	}
	//계정삭제하기
	function deleteAccount(){
		let pwd = document.getElementById("input_DeleteAccount").value;
		let url = "deleteAccount.do";
		let param = "pwd="+pwd;
		sendRequest(url,param,resultDeleteAccount,"POST");
	}	
	function resultDeleteAccount(){
		if(xhr.status ==4 && xhr.readyState==200){
			let result = decodeURI(decodeURIComponent(xhr.responseText));
			if(result =="error102"){
				alert("탈퇴에에 실패했습니다.\n다시시도해주시길바랍니다.");
				return;
			}
			if(result =="success"){
				alert("탈퇴에 성공했습니다.\n이용해주셔서 감사합니다");
				location.href="logout.do";
				return;
			}
		}
	}
</script>
</head>
<body>
	<%-- <jsp:include page="header.jsp"></jsp:include> --%>
	<%-- <jsp:include page="comp/mytab.jsp"></jsp:include> --%>
	<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	<main class="container">
		<section class="row">
			<div class="col align-self-center">
				<button onclick="#();" id="btn_ChangeMyProfilePicture">프로필사진
					변경하기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="#();" id="btn_ChangeMyStatusPost">프로필상태메시지
					변경하기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="#();" id="btn_ViewingMyOrders">내주문 보기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="#();" id="btn_MyWishlist">내찜상품 보기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="location.href='viewMyPosts.do'"
					id="btn_ViewMyPosts">내글보기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="view-my-comments.do;" id="btn_ViewMyComments">내가
					작성한 댓글보기</button>
			</div>
			<div class="col align-self-center">
				<input type="password" id="input_previous_ChangeMyPwd"
					placeholder="이전 비밀번호"> <input type="password"
					id="input_new_ChangeMyPwd" placeholder="새 비밀번호"> <input
					type="password" id="input_new_ChangeMyPwd2" placeholder="새 비밀번호 확인">
				<button onclick="changeMyPwd();" id="btn_ChangeMyPwd">비밀번호
					변경하기</button>
			</div>
			<div class="col align-self-center">
				<input type="password" id="input_DeleteAccount"
					placeholder="비밀번호 입력">
				<button onclick="deleteAccount();" id="btn_DeleteAccount">계정삭제하기</button>
			</div>
		</section>
		<section class="row">
			<div id="tabl1"></div>
			<div id="tabl2"></div>
		</section>

	</main>
</body>
</html>