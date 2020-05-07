<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 비밀번호 찾기에서 변경하거나 재입력 -->

<style>
#findPwd {
	float: left;
	width: 80%;
	font-size: large;
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 10%;
}

ul {
	list-style: none;
	margin-left: 10%;
	margin-right: 10%;
	padding-left: 0px;
}
</style>

<script>
	function checkIt() {
		var userinput = eval("document.userinput");

		// 숫자, 영문, 특수문자 각각 1개 이상 포함. 글자수 4-20 (비밀번호)
		var pass = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var userpass = userinput.u_pass.value;

		// 비밀번호 입력 여부
		if (!userinput.u_pass.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}

		// 비밀번호 확인
		if (userinput.u_pass.value != userinput.u_pass2.value) {
			alert("비밀번호를 동일하게 입력하세요");
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

		return true;
	}
</script>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>비밀번호 찾기 Pro</title>
<!-- Bootstrap -->
<link href="../../LogonBoot/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="../../LogonBoot/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="../../LogonBoot/css/style.css" media="screen" title="no title" charset="utf-8">
</head>

<body>
<jsp:include page="header.jsp" flush="false"/>
<div class="col-md-6 col-md-offset-3">

		<!-- 비밀번호 맞으면 1, 새 비밀번호로 변경 -->
		<div id="findPwd" name="비밀번호 찾기/변경">
			<c:choose>
				<c:when test="${pwcheck == 1 || tpwcheck == 1}">
					<form name="userinput" method="post" action="/Education/Jo/logon/updatePwdPro.do"
					onSubmit="return checkIt()">
						<ul>
						<li style="text-align: center; font-size: large; padding-top: 100px;">
							<b>새 비밀번호</b>를 입력해주세요.</li>

					<hr size="1px" align="center">

						<li><input type="hidden" name="u_id" value="${users.u_id}"></li>
						<li><div class="form-group">
							<label for="u_pass">비밀번호</label>
							<input type="password" class="form-control" id="u_pass" name="u_pass" maxlength="20" autofocus
							replace placeholder="비밀번호" required>
							</div>
						</li>

						<li><div class="form-group">
							<label for="u_pass2">비밀번호 재확인</label>
							<input type="password" class="form-control" id="u_pass2" name="u_pass2"
							onblur="u_passchk()" maxlength="20" replace
							placeholder="비밀번호 재확인" required>
							</div>
						</li>

					<hr size="1px" align="center">

						<li style="text-align: center;">
							<input type="submit" class="btn btn-info" style="border-radius: 4px;"
							name="findpwd" value="비밀번호 변경">
							<input type="button" class="btn btn-danger" style="border-radius: 4px;"
							value="취소"
							onclick="document.location.href='/Education/Jo/logon/login.do'">
						</li>
						</ul>
					</form>
				</c:when>

				<c:otherwise>
					<form name="checkForm" method="post" action="/Education/Jo/logon/findPwdPro.do">
						<ul>
						<li style="text-align: center; font-size: large; padding-top: 100px;" >
							해당하는 계정 정보가 없습니다.
						<br><b>아이디</b>와 <b>이름</b>을 다시 입력하세요.
						</li>

					<hr size="1px" align="center">
						<li><div class="form-group">
							<label for="userid">아이디</label>
							<input type="text" class="form-control" id="userid" name="u_id" maxlength="12" autofocus
							placeholder="아이디" required>
							</div>
						</li>

						<li><div class="form-group">
							<label for="username">이름</label>
							<input type="text" class="form-control" id="username" name="u_name" maxlength="10"
							placeholder="이름" required>
							</div>
						</li>

					<hr size="1px" align="center">

						<li style="text-align: center;">
							<input type="submit" class="btn btn-info" style="border-radius: 4px;"
							value="확인">
							<input type="button" class="btn btn-danger" style="border-radius: 4px;"
							value="취소"
							onclick="document.location.href='/Education/Jo/logon/findIdPwd.do'">
						</li>
						</ul>
					</form>
				</c:otherwise>
			</c:choose>
		</div> <!-- id findPwd -->
		
</div> 
<div class="fixed-bottom">
	<jsp:include page="footer45.jsp" flush="false"/>
</div><!-- css -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../LogonBoot/js/bootstrap.min.js"></script>
</body>
</html>