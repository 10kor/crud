var mail_YN = 0;

// 회원가입 데이터 유효성 검사
function check(){
	
	if ($.trim($("#mail_id").val()) == "") {
		alert("이메일을 입력하세요.");
		$("#mail_id").val("").focus();
		return false;
	}	
	if ($.trim($("#mpw").val()) == "") {
		alert("비밀번호를 입력하세요.");
		$("#mpw").val("").focus();
		return false;
	}
	if ($.trim($("#mpw").val()).length < 4) {
		alert("비밀번호 4글자 이상 입력하세요.");
		$("#mpw").val("").focus();
		return false;
	}
	if ($.trim($("#mpw").val()).length > 20) {
		alert("비밀번호 20자 이내로 입력하세요.");
		$("#mpw").val("").focus();
		return false;
	}
	if ($.trim($("#mpwcheck").val()) == "") {
		alert("비밀번호 확인란을 입력하세요.");
		$("#mpwcheck").val("").focus();
		return false;
	}
	if ($.trim($("#mpw").val()) != $.trim($("#mpwcheck").val()) ) {
		alert("비밀번호가 다릅니다. 다시 입력하세요.");
		$("#mpwcheck").val("");
		$("#mpw").val("").focus();
		return false;
	}
	if ($.trim($("#gender").val()) == "성별선택") {
		alert("성별을 선택하세요.");
		$("#gender").val("").focus();
		return false;
	}
	if ($.trim($("#location").val()) == "지역선택") {
		alert("거주지역을 선택하세요.");
		$("#location").val("").focus();
		return false;
	}
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
	if(mailYN == 0){
		alert('이메일 중복확인하세요.');
		return false;
	}
	
}

// 이메일 중복검사
function mail_check(){
	
	$("#mailchecking").hide();
	var mail = $("#mail_id").val()+"@"+$("#mail_domain").val();
	
	// ajax 중복확인
	$.ajax({
	type : 'POST',
	url : 'member_mail.do',
	data : {mail : mail},
	success : function(result) {
			if (result == 1) { // 중복 ID
				var newtext = '<font color="red">중복된 mail입니다.</font>';
				$("#mailchecking").text('');
				$("#mailchecking").show();
				$("#mailchecking").append(newtext);
				$("#mail_id").val('').focus();
				return false;
			} else { // 사용 가능한 아이디
				var newtext = '<font color="blue">사용가능한 mail입니다.</font>';
				$("#mailchecking").text('');
				$("#mailchecking").show();
				$("#mailchecking").append(newtext);
				$("#mpw").focus();
				mail_YN = 1;
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	});
}
