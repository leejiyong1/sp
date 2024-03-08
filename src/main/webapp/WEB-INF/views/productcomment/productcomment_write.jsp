<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰 작성 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
	
<style>
.star-rating {
	line-height: 32px;
	font-size: 1.25em;
}

.star-rating .fa-star {
	color: #ddd;
	cursor: pointer;
}

.star-rating .fa-star.checked {
	color: #ffc107;
}
</style>
<script>
	function send(f) {
		
		if(f.pc_content.value.trim() == ''){
			alert('리뷰내용작성해주세요');
			return;
		}
		if(f.pc_star.value == 0){
			alert('별점체크해주세요.');
			return;
		}
		
		f.submit();
	}
</script>
</head>
<body>
	<div class="container mt-5">
		<h2>상품 리뷰 작성하기</h2>
		<form action="product_comment_write.do" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="reviewContent">리뷰 내용</label>
				<textarea class="form-control" rows="5" name="pc_content"
					placeholder="리뷰를 작성해주세요."></textarea>
			</div>
			<div class="form-group">
				<label for="reviewImage">상품 사진</label> <input type="file"
					class="form-control-file" name="photo">
			</div>
			<div class="form-group star-rating">
				<label for="reviewRating">별점 평가</label> <br />
				<div class="star-rating">
					<i class="fa fa-star" data-index="0"></i> <i class="fa fa-star"
						data-index="1"></i> <i class="fa fa-star" data-index="2"></i> <i
						class="fa fa-star" data-index="3"></i> <i class="fa fa-star"
						data-index="4"></i>
				<input type="hidden" name="pc_star" id="pc_star" value="0"><!-- 별점 값을 넘겨야해서 설정 -->
				</div>

			</div>
			<button type="button" class="btn btn-primary" onclick="send(this.form)">리뷰 작성하기</button>
		</form>
	</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
	 // 별 클릭 이벤트
    $(document).ready(function() {
      $('.fa-star').click(function() {
        $('.fa-star').removeClass('checked'); // 모든 별의 체크 상태를 초기화
        $(this).addClass('checked'); // 클릭된 별에 체크 클래스 추가
        var current_index = $(this).data('index');
        // 클릭된 별과 그 이전의 모든 별에 체크 클래스 추가
        for(var i = 0; i <= current_index; i++) {
          $('.fa-star[data-index="' + i + '"]').addClass('checked');
        }
        $('#pc_star').val(current_index + 1);
      });
    });
  </script>
	
</body>
</html>