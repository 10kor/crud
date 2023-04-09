<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>member_sign</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="./js/member_check.js"></script>
</head>
<body>
<%@ include file="../navigation.jsp"%>

	<h2>회원가입</h2>
	<br>
	<div class="container text-center">
	<div class="row">
	    <div class="col-lg-1"></div>
	    <div class="col-lg-10">
	    
	<form method="post" action="member_sign_action.do" onsubmit="return check()"> 
		<table>
			<tr>
				<th>E-Mail</th>
				<td style="width:70%; vertical-align: middle;">
					<div class="input-group mb-3">
					  <input type="text" class="form-control" name="mail_id" id="mail_id" required>
					  <span class="input-group-text">@</span>
					  <select class="form-select" name="mail_domain" id="mail_domain" required>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.com">hanmail.com</option>
					  </select>
					  <input type="button" value="중복체크" onclick="mail_check()" class="btn btn-secondary">
					</div>
					<div id="mailchecking" class="valid-feedback"></div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" class="form-control" id="mpw" name="mpw" required>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" class="form-control" name="mpwcheck" id="mpwcheck" required>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<select name="gender" id="gender" class="form-select" required>
						<option>성별선택</option>
						<option value=0>남성</option>
						<option value=1>여성</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>
					<select name="location" id="location" class="form-select" required>
						<option>지역선택</option>
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
				</td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td>
					<div class="input-group">
					<input name="phone1" id="phone1" class="form-control" required/>
					<span class="input-group-text">-</span>
					<input name="phone2" id="phone2" class="form-control" required/>
					<span class="input-group-text">-</span>
					<input name="phone3" id="phone3" class="form-control" required/>
					</div>
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" value="작성완료" class="btn btn-outline-warning btn-sm" />
	</form>

	</div></div></div>

</body>
</html>