<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="../header.jsp"%>
<c:if test="${result == 1}">
	<script>
		Swal.fire	({
			title: '등록되지 않는 회원 입니다.',
		    icon: 'error',
		    showConfirmButton: false,
		    timer: 1500,
		    timerProgressBar: true
		    }).then(() => {
		    	history.go(-1);
		    })
	</script>
</c:if>
<c:if test="${result == 2}">
	<script>
		Swal.fire	({
			title: '회원정보가 틀렸습니다.',
		    icon: 'error',
		    showConfirmButton: false,
		    timer: 1500,
		    timerProgressBar: true
		    }).then(() => {
		    	history.go(-1);
		    })
	</script>
</c:if>
