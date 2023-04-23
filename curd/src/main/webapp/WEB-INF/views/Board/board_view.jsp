<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>board_view</title>
	<style>
		textarea.form-control { min-height: 50px; }
	</style>
	<script>
		function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
		}
	</script>
</head>
<body>
<%@ include file="../navigation.jsp"%>

	<h2 align=center>게시판 내용보기</h2>
	
	<div class="container text-center">
	<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
	    
<c:forEach var="bv" items="${boardview}">

	<div class="input-group">
	  <span class="input-group-text">제목</span>
	  <input type="text" class="form-control" value="${bv.bsubject}" readonly>
	</div>
	<br>
	
	<c:if test="${bv.bupdate eq null}">
		<div class="input-group">
		  	<span class="input-group-text">작성일시</span>
		  	<input type="text" class="form-control"
		  	 	value="<fmt:formatDate value="${bv.bdate}" pattern="yy-MM-dd a HH:mm:ss" />" readonly>
			<span class="input-group-text">조회수</span>
			<input type="text" class="form-control" value="${bv.bcount}" readonly>
		</div>
	</c:if>
	<c:if test="${bv.bupdate ne null}">
		<div class="input-group">
		  	<span class="input-group-text">수정일시</span>
		  	<input type="text" class="form-control" 
		  	 	value="<fmt:formatDate value="${bv.bupdate}" pattern="yy-MM-dd HH:mm:ss"/>" readonly>
			<span class="input-group-text">조회수</span>
			<input type="text" class="form-control" value="${bv.bcount}" readonly>
		</div>
	</c:if>
	<br>
	
	<div class="input-group">
		<span class="input-group-text">내용</span>
		<textarea class="form-control" rows="20" readonly="readonly" style="overflow-y:scroll; overflow-x:hidden; resize:none;">${bv.bcontent}</textarea>
	</div> 
	<br>
	
	<c:if test="${bv.mno eq smno}">
	<input type="button" value='수정' class="btn btn-outline-warning btn-sm"
		onclick="location.href='board_update.do?bno=${bv.bno}&pageNum=${pageNum}'" />
	<input type="button" value='삭제' class="btn btn-outline-secondary btn-sm"
		onclick="if(confirm('삭제하시겠습니까?')) {location.href='board_delete.do?bno=${bv.bno}&mno=${bv.mno}'}"/>
	<br><br>
	</c:if>
	
	<c:if test="${sessionScope.md == null }">
		<h2 align=center>댓글 작성하려면 로그인 하세요</h2>
	</c:if>
	<c:if test="${sessionScope.md != null }">
		<form method="post" action="reply_add.do" align=center>
			<input type="hidden" name="bno" value="${bv.bno}">
			<input type="hidden" name="mno" value="${smno}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			
			
			<div class="input-group">
				<span class="input-group-text">댓글</span>
				<textarea class="form-control" rows="1" name="rcontent" style="overflow-y:scroll; overflow-x:hidden; resize:none;" 
					onkeydown="resize(this)" onkeyup="resize(this)" required></textarea>
				<button class="btn btn-outline-secondary" type="submit" id="button-addon2">작성</button>
			</div> 
		</form>
	</c:if>
</c:forEach>

	<table class="table" border=1>
	<c:forEach var="rv" items="${ReplyList}">
		<tr align="left"><td>${rv.rcontent} 
			<a style="font-size : 10px;"> (<fmt:formatDate value="${rv.rdate}" pattern="yy.MM.dd a HH:mm:ss"/>)</a>	
			<c:if test="${rv.mno eq smno}">
				<br>
				<a href=# style="font-size : 15px;">수정</a>  <a href=# style="font-size : 15px;">삭제</a>
			</c:if>	
		</td></tr>
	</c:forEach>
	</table>
	
</div></div></div>
</body>
	<%@ include file="../footer.jsp"%>
</html>
