<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시</title>
<style type="text/css">
.menu_bar {
	width: 100%;
}


table, th, td {
	border: 1px solid black;
	width: 600px;
}

th, td {
	text-align: center;
	height: 40px;
	width: 100px;
}
</style>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>
	<div id="wrap">
		<!-- 헤더 -->
		<div id="header">
			<jsp:include page="../comp/top.jsp" flush="false" />
		</div>
		<!-- 컨텐츠 -->
		<div id="container col">
			<div class="menu_bar">
				<jsp:include page="../main/index.jsp" flush="false" />
			</div>
			<hr>
			<h1 align="center">임시페이지</h1>
			<hr>
			<div class="row">
				<div class="col" style="width: 20px"></div>
				<div class="col">
					<table class="table">
						<caption>컴포넌트로 이동</caption>
						<tr>
							<td><a href="top.do">top</a></td>
							<td><a href="menubar.do">menubar</a></td>
							<td><a href="footer.do">footer</a></td>
							<td><a href="index.do">index</a></td>
						</tr>
						<tr>
							<th><a href="header.do">header</a></th>
							<th><a href="admin/admin_login_view.do">adm1n</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>

						<tr>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>
						<tr>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>

					</table>
					<br> <br> <br>
					<table class="table">
						<caption>페이지로 이동</caption>
						<tr>
							<th><a href="login.do">login</a></th>
							<th><a href="regist.do">regist</a></th>
							<th><a href="main.do">main</a></th>
							<th><a href="mypage.do">mypage</a></th>
						</tr>
						<tr>
							<th><a href="findid.do">findid</a></th>
							<th><a href="findpw.do">findpw</a></th>
							<th></th>
							<th></th>
						</tr>
						<tr>
							<th><a href="board_list.do">board_list</a></th>
							<th><a href="board_write.do">board_write===</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>
						<tr>
							<th><a href="product_category_list.do">product_category_list</a></th>
							<th><a href="product_view.do">product_view</a></th>
							<th><a href="product_search_list.do">product_search_list</a></th>
							<th><a href="#">====</a></th>
						</tr>
						<tr>
							<th><a href="myInfo.do">myInfo</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>
						<tr>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>
					</table>
				</div>
				<div class="col" style="width: 20px"></div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<div>
		<jsp:include page="../comp/footer.jsp" flush="false" />
	</div>
</body>
</html>