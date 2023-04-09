<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Home</title>
</head>
<body>

		<!-- 테이블 -->
	<h2 align=center>게시판 리스트</h2>
	<table border=1 align=center>
	    <thead>
	        <tr>
	        	<th>no</th>
	        	<th>제목</th>
	        	<th>조회수</th>
	        	<th>작성자</th>
	        </tr>
	    </thead>
	    <tbody>
	        <tr>
	            <td>no</td>
	            <td>제목</td>
	            <td>조회수</td>
	            <td>작성자</td>
	        </tr>
	    </tbody>
	</table>

	<!-- 페이징 처리 -->
	<div id="save" style="display:block; visibility: visible;" align="center">
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			<a href="Board_list.do?pageNum=${pp.startPage - 1}">이전</a>
		</c:if>

		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<c:if test="${pp.currentPage==i}"></c:if>
			<a href="Board_list.do?pageNum=${i}">${i}</a>
		</c:forEach>

		<c:if test="${pp.endPage < pp.totalPage}">
			<a href="$Board_list.do?pageNum=${pp.endPage + 1}">다음</a>
		</c:if>
	</div>
		
</body>
</html>
