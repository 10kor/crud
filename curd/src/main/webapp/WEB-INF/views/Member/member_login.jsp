<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_login</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	 function check(){
		 if($.trim($("#mail").val())==""){
			 alert("이메일을 입력하세요!");
			 $("#mail").val("").focus();
			 return false;
		 }
		 if($.trim($("#mpw").val())==""){
			 alert("비밀번호를 입력하세요!");
			 $("#mpw").val("").focus();
			 return false;
		 }
	 }
	</script>
</head>
<body>
<%@ include file="../navigation.jsp"%>
	<h2>로그인</h2>
	
	<div class="container text-center">
	<div class="row">
	    <div class="col-lg-1"></div>
	    <div class="col-lg-10">
	<form method="post" action="member_login_action.do" onsubmit="return check()">
		
		<div class="row mb-3">
	    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
	    <div class="col-sm-10">
	      <input type="email" class="form-control" id="mail" name="mail" >
	    </div></div>
	    
		<div class="row mb-3">
			<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
			<div class="col-sm-10">
			<input type="password" class="form-control" id="mpw" name="mpw">
		</div></div>
		<input type="submit" value="Login" class="btn btn-warning btn-sm"/>
	</form>
	</div></div></div>
	
<br>

</body>
</html>