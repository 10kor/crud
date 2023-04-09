<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>board_update</title>
</head>
<body>
<%@ include file="../navigation.jsp"%>
	<h2 align=center>게시물 수정</h2>
	<br>
	<div class="container text-center">
	<div class="row">
	    <div class="col-lg-1"></div>
	    <div class="col-lg-10">
			<form method="post" action="board_update_action.do">
				<input type="hidden" id="bno" name="bno" value="${list.bno}"/>
				<div class="input-group">
				  <span class="input-group-text">제목</span>
				  <input type="text" id="bsubject" name="bsubject" 
				  	class="form-control" aria-label="With textarea" value="${list.bsubject}" required>
				</div>
				<br>
				<div class="input-group">
				  <span class="input-group-text">내용</span>
				  <textarea id="bcontent" name="bcontent" 
				  	class="form-control" rows="20" required>${list.bcontent}</textarea>
				</div>
				<br>
				<input type="submit" value='작성' class="btn btn-warning btn-sm">
			</form>
		</div>
	</div>
	</div>
</body>
</html>

