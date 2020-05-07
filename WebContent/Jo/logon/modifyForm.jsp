<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 회원정보 변경 페이지 -->

<%-- <tiles:insertDefinition name="header" />
<tiles:insertDefinition name="nav" />
<tiles:insertDefinition name="footer" /> --%>

<style>
#modifyForm {
	float: left;
	width: 80%;
	font-size: large;
	margin-left: 10%;
	margin-right: 10%;
}

ul {
	list-style: none;
	padding-left: 0px;
}

.scrollbar {
height: 78%;
overflow-y: scroll;
}

body{
	height: auto;
}

</style>

<script language="JavaScript">
	function checkIt() {
		var userinput = eval("document.userinput");

		// 생년월일 정규식
		var birth = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

		// 연락처 유효성 검사
		/* var telnum = /^[0-9]+$/; */
		// 휴대폰
		var telnum = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		var usertel = userinput.u_tel.value;

		// 숫자, 영문, 특수문자 각각 1개 이상 포함. 글자수 4-20 (비밀번호)
		var pass = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var userpass = userinput.u_pass.value;

		// 이름 유효성 검사, 한글 2~4자, 영문 FirstName 2~10, LastName 2~10
		var name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		var username = userinput.u_name.value;

		// 비밀번호 입력 여부
		if (!userinput.u_pass.value) {
			alert("비밀번호를 입력하세요");
			document.userinput.u_pass.focus()
			return false;
		}

		// 비밀번호 확인
		if (userinput.u_pass.value != userinput.u_pass2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			document.userinput.u_pass2.focus()
			return false;
		}

		// 사용자 이름 입력 여부
		if (!userinput.u_name.value) {
			alert("사용자 이름을 입력하세요");
			document.userinput.u_name.focus()
			return false;
		}

		// 이름 유효성 검사, 한글 2~4자, 영문 FirstName 2~10, LastName 2~10
		if (name.test(username) === false) {
			alert("한글은 2~4자,\n영문은 FirstName(2~10자), LastName(2~10자)로 입력해 주세요.");
			document.userinput.u_name.focus()
			return false;
		}

		//비밀번호 길이 체크(4~20자 까지 허용)
		if (document.userinput.u_pass.value.length<4 || document.userinput.u_pass.value.length>20) {
			alert("비밀번호를 4~20자까지 입력해주세요.")
			document.userinput.u_pass.focus()
			document.userinput.u_pass.select()
			return false;
		}

		// 아이디와 비번은 다르게
		if (userinput.u_pass.value == userinput.u_id.value) {
			alert("아이디와 비밀번호를 다르게 입력해주세요.")
			document.userinput.u_pass.focus()
			return false;
		}

		// 비밀번호는 영어 숫자 특문만, 최소 1개 숫자 혹은 특문, 유효성
		if (pass.test(userpass) === false) {
			alert("비밀번호는 영어와 숫자만 입력이 가능합니다. (4~20자)\n숫자, 영문, 특수문자를 각각 1개 이상 포함해주세요.");
			document.userinput.u_pass.value = ""
			document.userinput.u_pass.focus()
			return false;
		}

		// 휴대폰 유효성
		if (telnum.test(usertel) === false) {
			alert("잘못된 휴대폰 번호 형식입니다.\n010-1234-5678 / 01012345678");
			document.userinput.u_tel.value = ""
			document.userinput.u_tel.focus()
			return false;
		}

		// 생년월일 유효성 검사
		if (birth.test(userbirth) === false) {
			alert("생년월일을 정확하게 입력해주세요.");
			document.userinput.u_birth.value = ""
			document.userinput.u_birth.focus()
			return false;
		}
	}

	function zipCheck() {

		url = "/Education/Jo/logon/ZipCheck.do?check=y";

		window
				.open(
						url,
						"post",
						"toolbar=no ,width=500 ,height=300,directories=no,status=yes,scrollbars=yes,menubar=no");
	}
</script>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>회원정보 변경</title>
<!-- Bootstrap -->
<link href="../../LogonBoot/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="../../LogonBoot/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="../../LogonBoot/css/style.css" media="screen" title="no title" charset="utf-8">
</head>

<body>

<jsp:include page="header.jsp" flush="false"/>

<div class="col-md-6 col-md-offset-3" style="padding-bottom: 0; padding-left: 195; padding-right: 195;">

		<!-- <div class="scrollbar" id="modifyForm" name="회원정보 변경"> -->
			<form method="post" action="/Education/Jo/logon/modifyPro.do"
			name="userinput" onsubmit="return checkIt(); ZipCheck();">

				<ul>
					<li style="text-align: center;">
					<h3><b>회원정보 변경</b></h3>
					</li>

			<hr size="1px" align="center">

					<li><div class="form-group" style="width:216px;">
						<label for="u_id">아이디</label>
						<input type="text" class="form-control" style="width:126px; background-color: #E0F2F7;"
						id="u_id" name="u_id" maxlength="12"
						replace placeholder="아이디 (4~12자)" value="${sessionScope.memId}" readonly required>
						<input type="hidden" name="u_id" value="${sessionScope.memId}">
						</div>
					</li>
					
<!-- 					            <div class="form-group">
              <label for="u_id">아이디</label>
              <div class="input-group" style="width:216px;">
                <input type="text" class="form-control"  style="width:126px; border-radius: 4px;"
                id="u_id" name="u_id" placeholder="아이디 (4~12자)" maxlength="12" autofocus required>
                <span class="input-group-btn">
                <input type="hidden" name="u_id1" maxlength="12">
                <input type="button" class="btn btn-info" style="border-radius: 4px;"
                value="중복체크" OnClick="openConfirmid(this.form)">
                </span>
              </div>
            </div> -->
					
					

					<li><div class="form-group">
						<label for="u_pass">비밀번호</label>
						<input type="password" class="form-control" id="u_pass" name="u_pass" maxlength="20" autofocus
						value="${users.u_pass}" replace placeholder="비밀번호 (4~20자 / 숫자, 영문, 특수문자를 각각 1개 이상 포함)" required>
						</div>
					</li>

					<li><div class="form-group">
						<label for="u_pass2">비밀번호 재확인</label>
						<input type="password" class="form-control" id="u_pass2" name="u_pass2" maxlength="20"
						onblur="u_passchk()"
						value="${users.u_pass}" replace placeholder="비밀번호 재확인 (4~20자 / 숫자, 영문, 특수문자를 각각 1개 이상 포함)" required>
						</div>
					</li>

			<hr size="1px" align="center">

					<li><div class="form-group">
						<label for="u_name">이름</label>
						<input type="text" class="form-control" id="u_name" name="u_name" maxlength="21"
						value="${users.u_name}" replace placeholder="이름 (한글: 2~4자 / 영문: FirstName(2~10자) LastName(2~10자))" required>
						</div>
					</li>

					<c:set var="birth" value="${users.u_birth}" />
					<li><div class="form-group">
						<label for="u_birth">생년월일</label>
						<input type="date" class="form-control" id="u_birth" name="u_birth" maxlength="10"
						value="${fn:substring(birth,0,10)}" replace placeholder="생년월일" required>
						</div>
					</li>

					<li><div class="form-group">
						<label for="u_tel">휴대폰</label>
						<input type="tel" class="form-control" id="u_tel" name="u_tel" maxlength="13"
						value="${users.u_tel}" replace placeholder="01012345678 / 010-1234-5678" required>
						</div>
					</li>

						<div class="form-group">
						<label for="u_addr">주소</label>
						<div class="input-group" style="width:216px;">
							<input type="text" class="form-control" id="zipcode" name="zipcode"
							style="width:96px; background-color: #E0F2F7; border-radius: 4px;"
							value="${users.zipcode}"
							placeholder="우편번호"
							style="background-color: #E0F2F7;" required readonly>
							<span class="input-group-btn">
							<input type="button" class="btn btn-info" style="border-radius: 4px;"
							value="우편번호 찾기" onClick="zipCheck()">
							</span>
						</div>
						<div class="form-group" style="margin-top: 11px;">
							<input type="text" class="form-control" id="u_addr" name="u_addr" maxlength="100"
							value="${users.u_addr}" replace placeholder="주소를 입력해주세요." required>
						</div>
						
						
						
<!--             <div class="form-group">
              <label for="u_addr">주소</label>
              <div class="input-group" style="width:216px;">
                <input type="text" class="form-control" id="zipcode" name="zipcode"
                style="width:96px; background-color: #E0F2F7; border-radius: 4px;"
                placeholder="우편번호" required readonly>
                <span class="input-group-btn">
            	<input type="button" class="btn btn-info" style="border-radius: 4px;"
            	value="우편번호 찾기" onClick="zipCheck()">
                </span>
              </div>
              <div class="form-group" style="margin-top: 11px;">
                 <input type="text" class="form-control" id="u_addr" name="u_addr" maxlength="100"
                 replace placeholder="주소를 입력해주세요." required>
            </div> -->
						
						

				<hr size="1px" align="center">

					<li style="text-align: center;">
						<input type="button" class="btn btn-warning" style="border-radius: 4px;"
						value="회원 탈퇴"
						onclick="document.location.href='/Education/Jo/logon/deleteForm.do'">

						<input type="submit" class="btn btn-info" name="modifyForm"
						style="border-radius: 4px;" value="변경 완료">
						<input type="button" class="btn btn-danger" style="border-radius: 4px;"
						value="취소"
						onclick="document.location.href='/Education/main/Main.do'">
					</li>
				</ul>
			</form> <!-- name userinput -->
		<!-- </div> id modifyForm -->

</div> <!-- css -->

		<div class="fixed-bottom" style="text-align:left">
			<jsp:include page="footer456.jsp" flush="false" />
		</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../LogonBoot/js/bootstrap.min.js"></script>
</body>
</html>