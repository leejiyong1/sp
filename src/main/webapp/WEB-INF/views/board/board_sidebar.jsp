<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			/* 사이드 바 */
			.sidebar {
			  margin-left: 100px;
			  padding: 15px;
			  width: 200px;
			  background-color: #f3f3f3;
			  position: fixed;
			}
			
			.sidebar a {
			  display: block;
			  color: black;
			  padding: 16px;
			  text-decoration: none;
			}
			
			ul {
			  list-style: none;
			  margin: 0;
			  padding: 0;
			}
			
			.sidebar-label{
				display:block;
				font-size:20px;
				border-bottom:1px solid #ff66c4;
			}
			
			ul li {
			  font-size:15px;
			  margin:5px;
			  margin-left:17px;
			  position:relative;
			  cursor:pointer;
			}
			
			ul li label {
			  display: inline-block;
			  width: 8rem;
			  cursor:pointer;
			}
			
			.check-btn{
				padding:5px;
				font-size:16px;
				border:none;
				background-color:#ff66c4;
				color:white;
				width:60px;
				margin-top:5px;
			}
			
			.check-btn:hover{
				background-color:#ccc;
				color:black;
			}
			
			/* check box */
			ul li input{
				position:absolute;
				right:2px;
				cursor:pointer;
				height:25px;
				width:25px;
				z-index:1;
				opacity:0;
			}
				
			.checkmark {
			  position: absolute;
			  right: 2px;
			  height:25px;
			  width:25px;
			  background-color: white;
			  z-index:0;
			}
			
			ul li:hover input ~ .checkmark {
			  background-color: #ccc;
			}
			
			/* When the checkbox is checked, add a blue background */
			input:checked ~ .checkmark {
			  background-color: #ff66c4;
			}
			
			/* Create the checkmark/indicator (hidden when not checked) */
			.checkmark:after {
			  content: "";
			  position: absolute;
			  display: none;
			}
			
			/* Show the checkmark when checked */
			ul li input:checked ~ .checkmark:after {
			  display: block;
			}
			
			/* Style the checkmark/indicator */
			.checkmark:after {
			  left: 9px;
			  top: 5px;
			  width: 5px;
			  height: 10px;
			  border: solid white;
			  border-width: 0 3px 3px 0;
			  -webkit-transform: rotate(45deg);
			  -ms-transform: rotate(45deg);
			  transform: rotate(45deg);
			}
			
			.btn{text-align:right;
				 margin-right:90px;
				 vertical-align:middle;}
				 
			.btn_write{display: inline-block;
				 border-radius: 4px;
				 color: #FFFFFF;
				 background-color: #00A56B;
				 border: none;
				 text-align: center;
				 font-size: 15px;
				 padding: 10px;
				 width: 110px;
				 transition: all 0.5s;
				 cursor: pointer;
				 margin: 2px;}
				 
			.write{cursor: pointer;
				      display: inline-block;
				      position: relative;
				      transition: 0.5s;}
						
			.write:after {content:'\00bb';
						 position:absolute;
						 opacity:0;
						 top:0;
						 right:-20px;
						 transition:0.5s;}
						  		
			.btn_write:hover .write {padding-right: 15px;}
			
			.btn_write:hover .write:after {opacity: 1; right: 0;}
		</style>
		
		<script>
			/* 체크박스 하나만 선택 가능하게 함 */
			function onCheck(checkbox, name){
			    let checkboxes = document.getElementsByName(name);
			    for(let i = 0; i < checkboxes.length; i++){
			    	if(checkboxes[i].value != checkbox) {
			    		checkboxes[i].checked = false;
			    	}
			    }
			}
			
			function order_list(){
				let tone = 0;
				let product = 0;
				let order_by = 0;
				
				let tone_checkboxes = document.getElementsByName('tone');
				for(let i = 0; i < tone_checkboxes.length; i++){
					if(tone_checkboxes[i].checked == true){
						tone = tone_checkboxes[i].value;
					}
				}
				
				let product_checkboxes = document.getElementsByName('product');
				for(let i = 0; i < product_checkboxes.length; i++){
					if(product_checkboxes[i].checked == true){
						product = product_checkboxes[i].value;
					}
				}
				
				let order_by_checkboxes = document.getElementsByName('order_by');
				for(let i = 0; i < order_by_checkboxes.length; i++){
					if(order_by_checkboxes[i].checked == true){
						order_by = order_by_checkboxes[i].value;
					}
				}
				
				/* 모든 체크박스가 비어있다면 */
				if(tone == 0 && product == 0 && order_by == 0){
					location.href = "board_list.do";
				}else{
					location.href = "board_order_by.do?tone=" + tone + "&product=" + product + "&order_by=" + order_by;
				}
				
				
			}
			
		</script>
	</head>
	<body>
		<div class="sidebar">
			<!-- <form> -->
				<label class="sidebar-label">톤</label>
					<ul>
					  <li>
					    <label for="spring">봄 웜톤</label>
					    <input type="checkbox" id="spring" name="tone" value="1" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					  <li>
					    <label for="summer">여름 쿨톤</label>
					    <input type="checkbox" id="summer" name="tone" value="2" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					  <li>
					    <label for="fall">가을 웜톤</label>
					    <input type="checkbox" id="fall" name="tone" value="3" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					  <li>
					    <label for="winter">겨울 쿨톤</label>
					    <input type="checkbox" id="winter" name="tone" value="4" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					</ul>
					<br>
				<label class="sidebar-label">제품</label>
					<ul>
					  <li>
					    <label for="lip">립</label>
					    <input type="checkbox" id="lip" name="product" value="1" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					  <li>
					    <label for="eyeshadow">아이셰도우</label>
					    <input type="checkbox" id="eyeshadow" name="product" value="2" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					  <li>
					    <label for="cheek">블러셔</label>
					    <input type="checkbox" id="cheek" name="product" value="3" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					  <li>
					    <label for="foundation">파운데이션</label>
					    <input type="checkbox" id="foundation" name="product" value="4" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					</ul>
					<br>
				<!-- <label class="sidebar-label">순서</label>
					<ul>
					  <li>
					    <label for="order_view">조회순</label>
					    <input type="checkbox" id="order_view" name="order_by" value="readhit" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					  <li>
					    <label for="order_comment">댓글순</label>
					    <input type="checkbox" id="order_comment" name="order_by" value="comment_count" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					  <li>
					    <label for="order_like">좋아요순</label>
					    <input type="checkbox" id="order_like" name="order_by" value="likes_count" onclick="onCheck(this.value, this.name);"/>
					    <span class="checkmark"></span>
					  </li>
					</ul> -->
					<button class="check-btn" onclick="order_list();">적용</button>
					<div class="btn"><button class="btn_write" onclick="location.href='board_write.do'">
						<span class="write">New Post </span></button></div>
			<!-- </form> -->
		</div>
	</body>
</html>