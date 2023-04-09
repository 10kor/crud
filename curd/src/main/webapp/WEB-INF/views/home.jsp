<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<h1>로그인</h1>
	<form method="post" action="admin_login_action.do" onsubmit="return check()">
		<table border=1 width=200>
			<tr><td>ID</td>
				<td><input type=text size=20 id="id" name="id"
					autofocus="autofocus" placeholder="아이디 입력" value="" />
			</tr>
			<br>
			<tr><td>PW</td>
				<td><input type="password" size=20 id="passwd" name="passwd"
					placeholder="비밀번호 입력" value="" />
			</tr>
			<tr>
				<td colspan=2 align=center><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>
