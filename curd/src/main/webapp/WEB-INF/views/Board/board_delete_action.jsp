<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>board_delete_action</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("삭제 성공");
			location.href = "board_list.do";
		</script>
	</c:if>
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
			alert("삭제 실패");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>