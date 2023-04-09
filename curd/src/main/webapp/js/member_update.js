function member_update() {
	var a = document.getElementById("showForm");
	var b = document.getElementById("updateForm");
	a.style.display = 'none';
	a.style.visibility = 'hidden';
	b.style.display = 'block';
	b.style.visibility = 'visible';
}
function update() {
	
	if ($.trim($("#phone1").val()) == "") {
		alert("핸드폰 번호를 입력하세요.");
		$("#phone1").val("").focus();
		return false;
	}
	if ($.trim($("#phone2").val()) == "") {
		alert("핸드폰 번호를 입력하세요.");
		$("#phone2").val("").focus();
		return false;
	}
	if ($.trim($("#phone3").val()) == "") {
		alert("핸드폰 번호를 입력하세요.");
		$("#phone3").val("").focus();
		return false;
	}
	if ($.trim($("#phone1").val()).length != 3) {
		alert("핸드폰번호가 올바르지 않습니다.");
		$("#phone1").val("").focus();
		return false;
	}
	if ($.trim($("#phone2").val()).length != 4) {
		alert("핸드폰번호가 올바르지 않습니다.");
		$("#phone2").val("").focus();
		return false;
	}
	if ($.trim($("#phone3").val()).length != 4) {
		alert("핸드폰번호가 올바르지 않습니다.");
		$("#phone3").val("").focus();
		return false;
	}
	
}