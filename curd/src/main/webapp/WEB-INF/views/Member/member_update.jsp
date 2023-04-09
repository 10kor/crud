<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_update</title>
</head>
<body>

<c:if test="${result > 0 }">
	<script>
	alert("회원 정보가 수정되었습니다.");
	location.href="member_account.do"; 
	</script>
</c:if>

</body>
</html>