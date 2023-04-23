<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>member_account</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="./js/member_update.js"></script>
</head>
<body>
<%@ include file="../navigation.jsp"%>
	<h2>가입내역</h2>
	<br>
	<div class="container text-center">
	<div class="row">
	    <div class="col-lg-1"></div>
	    <div class="col-lg-10">
	    
<form id="updateForm" style="display:none; visibility:hidden;" method="post" action="member_update.do" onsubmit="return update()"> 
	<input type="hidden" id="mno" name="mno" value="${lists.mno}"/>
	<input type="hidden" id="mail" name="mail" value="${lists.mail}"/>	
	<table class="table">
			<tr>
				<th>이메일</th>
				<td style="width:70%; vertical-align: middle;">
					${lists.mail}
				</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>
					<fmt:formatDate value="${lists.register}" pattern="yy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<c:choose>
						<c:when test="${lists.gender==0}">
							<div class="col-md-auto" >
							<select name="gender" id="gender" class="form-select" required>
								<option value=0 selected="selected">남성</option>
								<option value=1>여성</option>
							</select>
							</div>
						</c:when>
						<c:when test="${lists.gender==1}">
							<div class="col-md-auto">
							<select name="gender" id="gender" class="form-select" required>
								<option value=0>남성</option>
								<option value=1 selected="selected">여성</option>
							</select>
							</div>
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>거주지역</th>
				<td>
					<div class="col-md-auto">
					<select name="location" id="location" class="form-select" required>
						<option selected>${lists.location}</option>
						<option value="서울시">서울시</option>
						<option value="세종시">세종시</option>
						<option value="인천시">인천시</option>
						<option value="부산시">부산시</option>
						<option value="대구시">대구시</option>
						<option value="광주시">광주시</option>
						<option value="대전시">대전시</option>
						<option value="울산시">울산시</option>
						<option value="경기북부">경기북부</option>
						<option value="경기남부">경기남부</option>
						<option value="강원도">강원도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="제주도">제주도</option>
					</select>
					</div>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<div class="input-group">
					<input name="phone1" id="phone1" class="form-control" value="${p1}" required/>
					<span class="input-group-text">-</span>
					<input name="phone2" id="phone2" class="form-control" value="${p2}" required/>
					<span class="input-group-text">-</span>
					<input name="phone3" id="phone3" class="form-control" value="${p3}" required/>
					</div>
				</td>
			</tr>
	</table>
		<input type="submit" value="수정완료" class="btn btn-outline-warning btn-sm" />
</form>

<form id="showForm" style="display:block; visibility: visible;">
	<table class="table">
			<tr>
				<th>이메일</th>
				<td>
					${lists.mail}
				</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>
					<fmt:formatDate value="${lists.register}" pattern="yy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<c:choose>
						<c:when test="${lists.gender==0}">
							남성
						</c:when>
						<c:when test="${lists.gender==1}">
							여성
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>거주지역</th>
				<td>
					${lists.location}
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					${lists.phone}
				</td>
			</tr>
			
	</table>
		<input type="button" value="수정" onclick="member_update()" class="btn btn-outline-warning btn-sm" />
		<input type="button" value='탈퇴' class="btn btn-outline-secondary btn-sm"
				onclick="if(confirm('탈퇴하시겠습니까?')) {location.href='member_delete.do?mno=${lists.mno}'}">
</form>

</div></div></div>
</body>
	<%@ include file="../footer.jsp"%>
</html>
