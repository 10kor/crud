<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_delete</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<c:if test="${result > 0 }">
	<script>
		Swal.fire	({
			title: '회원 정보가 삭되었습니다.',
		    icon: 'success',
		    showConfirmButton: false,
		    timer: 1500,
		    timerProgressBar: true
		    }).then(() => {
		    	location.href="member_logout.do"; 
		    })
	</script>
</c:if>
</body>
</html>