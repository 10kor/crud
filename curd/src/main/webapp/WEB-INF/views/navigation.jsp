<%@ include file="header.jsp"%>

<ul class="nav justify-content-center">
	<c:if test="${sessionScope.md == null }">
		<a class="nav-link" href="board_list.do">Board</a>
		<a class="nav-link" href="member_login.do">Login</a>
		<a class="nav-link" href="member_sign.do">Sign</a>
	</c:if>
	<c:if test="${sessionScope.md != null }">
		<a class="nav-link" href="member_logout.do">Logout</a>
		<a class="nav-link" href="member_account.do">Account</a>
		<a class="nav-link" href="board_list.do">Board</a>
		<a class="nav-link" href=#>Message</a>
	</c:if>
</ul>
<hr>