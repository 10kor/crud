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
	<%@ include file="../header.jsp"%>

	<c:if test="${result > 0 }">
	<script>
	Swal.fire	({
				title: '회원 정보가 수정되었습니다.',
			    icon: 'success',
			    showCancelButton: false,
			    confirmButtonText: '확인'
				}).then((result) => {
					  if (result.isConfirmed) {
						  location.href="member_account.do"; 
					  }
					})
	</script>
	</c:if>

</body>
</html>