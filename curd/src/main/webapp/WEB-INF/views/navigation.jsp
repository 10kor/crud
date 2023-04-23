<%@ include file="header.jsp"%>
<ul class="nav justify-content-center">
	<c:if test="${sessionScope.md == null }">
		<div class="container">
	    <header class="py-3 mb-4 border-bottom">
	      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
	        <li><a href="board_list.do" class="nav-link px-2">Board</a></li>
	        <li><a href="member_login.do" class="nav-link px-2">Login</a></li>
	        <li><a href="member_sign.do" class="nav-link px-2">Sign</a></li>
	      </ul>
	    </header>
	</div>
	</c:if>
	<c:if test="${sessionScope.md != null }">
	<div class="container">
	    <header class="py-3 mb-4 border-bottom">
	      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
	        <li><a href="board_list.do" class="nav-link px-2">Board</a></li>
	        <li><a href="#" class="nav-link px-2">Message</a></li>
	        <li><a href="member_logout.do" class="nav-link px-2">Logout</a></li>
	        <li><a href="member_account.do" class="nav-link px-2">Account</a></li>
	      </ul>
	    </header>
	</div>
	</c:if> 
</ul>