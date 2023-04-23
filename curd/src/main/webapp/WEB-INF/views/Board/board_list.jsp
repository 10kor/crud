<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>board_list</title>
	<%@ include file="../navigation.jsp"%>
</head>
<body>
	<h2 class="testt">게시판 리스트</h2>
	<br>
	
	<div class="container text-center">
	<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
	
	<table class="table" border=1 align=center style="table-layout:fixed;">
	    <thead>
	        <tr>
	        	<th>no</th>
	        	<th>제목</th>
	        	<th>등록일</th>
	        	<th>조회수</th>
	        </tr>
	    </thead>
	    <tbody>
			<c:if test="${empty boardlist }">
				<tr>
					<td colspan="4">게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty boardlist }">
				<c:forEach var="q" items="${boardlist}">
				<c:if test="${q.bdeldate eq null}">
					<tr>
						<td>${q.bno}</td>
						<td style="table-layout:text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">
							<a href="board_view.do?bno=${q.bno}&pageNum=${pp.currentPage}">${q.bsubject}</a></td>
						<td><fmt:formatDate value="${q.bdate}" pattern="yy.MM.dd " /></td>
						<td>${q.bcount}</td>
					</tr>
				</c:if>
				<c:if test="${q.bdeldate ne null}">
					<tr>
						<td class="table-secondary">${q.bno}</td>
						<td colspan="3" class="table-secondary">삭제된 게시글입니다.</td>
					</tr>
				</c:if>
				</c:forEach>
			</c:if>
	    </tbody>
	</table>

	<!-- 글쓰기 버튼 -->
<div class="d-flex justify-content-end">
	<c:if test="${not empty sessionScope.md}">
	<input 	type="button" value='글쓰기' onclick="location.href='board_add.do'" 
			class="btn btn-warning btn-sm" style="float:right;">
	</c:if>
</div>
	<!-- 페이징 처리 -->
<div class="d-flex justify-content-center">
<div id="save" style="display:block; visibility: visible;" align="center">
	<ul class="pagination">
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			 <li class="page-item"><a class="page-link" href="board_list.do?pageNum=${pp.startPage - 1}">이전</a></li>
		</c:if>

		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<c:if test="${pp.currentPage==i}"></c:if>
			 <li class="page-item"><a class="page-link" href="board_list.do?pageNum=${i}">${i}</a></li>
		</c:forEach>

		<c:if test="${pp.endPage < pp.totalPage}">
			 <li class="page-item"><a class="page-link" href="board_list.do?pageNum=${pp.endPage + 1}">다음</a></li>
		</c:if>
	</ul>
</div>
</div>
</div>
</div>
</div>	
</body>
	<%@ include file="../footer.jsp"%>
</html>
