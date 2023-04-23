<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>board_add</title>
	
</head>
<body>
<%@ include file="../navigation.jsp"%>
	<script>
	 function check(){
		 if($.trim($("#bsubject").val())==""){
			 Swal.fire	({
					title: '제목을 입력하세요',
				    icon: 'warning',
				    showConfirmButton: false,
				    timer: 1500,
				    timerProgressBar: true
				    }).then(() => {
						 $("#bsubject").val("").focus();
						 return false;
				    })
		 }
		 if($.trim($("#bcontent").val())==""){
			 Swal.fire	({
					title: '내용을 입력하세요',
				    icon: 'warning',
				    showConfirmButton: false,
				    timer: 1500,
				    timerProgressBar: true
				    }).then(() => {
						 $("#bcontent").val("").focus();
						 return false;
				    })
		 }
	 }
	</script>
	<h2>게시물 작성</h2>
	<br>
	<div class="container text-center">
	<div class="row">
	    <div class="col-lg-1"></div>
	    <div class="col-lg-10">
			<form method="post" action="board_add_action.do">
				<input type="hidden" id="mno" name="mno" value="${mno}"/>
				<div class="input-group">
				  <span class="input-group-text">제목</span>
				  <input type="text" id="bsubject" name="bsubject" 
				  	class="form-control" aria-label="With textarea" required>
				</div>
				<br>
				<div class="input-group">
				  <span class="input-group-text">내용</span>
				  <textarea id="bcontent" name="bcontent" style="overflow-y:scroll; overflow-x:hidden; resize:none;"
				  	class="form-control" aria-label="With textarea" rows="20"required></textarea>
				</div>
				<br>
				<input type="submit" value='작성' class="btn btn-warning btn-sm">
			</form>
		</div>
	</div>
	</div>
</body>
	<%@ include file="../footer.jsp"%>
</html>
