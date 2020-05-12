<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%-- <tiles:insertDefinition name="header" />
<tiles:insertDefinition name="nav" />
<tiles:insertDefinition name="footer" /> --%>

<style>
#passCheck {
	float: left;
	width: 80%;
	font-size: large;
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 10%;
}

b {
	text-align: center;
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
		if (!document.myform.u_pass.value) {
			alert("비밀번호를 입력하지 않으셨습니다.");
			document.myform.u_pass.focus();
			return false;
		}
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

<div class="col-md-6 col-md-offset-3">

		<form id="passCheck" name="비밀번호 확인" action="/Education/Jo/logon/passCheckPro.do" method="post"
		onSubmit="return checkIt()">
			<ul>
				<li style="text-align: center; font-size: large;">
				<b>비밀번호 확인</b>
				</li>

		<hr size="1px" align="center">

				<li><div class="form-group">
					<label for="u_id">아이디</label>
					<input type="text" class="form-control" id="u_id" name="u_id" maxlength="12"
					replace placeholder="아이디" value="${sessionScope.memId}"
					style="background-color: #E0F2F7;" readonly required>
					<input type="hidden" name="u_id" value="${sessionScope.memId}">
					</div>
				</li>

				<li><div class="form-group">
					<label for="u_pass">비밀번호</label>
					<input type="password" class="form-control" id="u_pass" name="u_pass" maxlength="12" autofocus
					replace placeholder="비밀번호 확인" required>
					<input type="hidden" name="u_id" value="${sessionScope.memId}">
					</div>

		<hr size="1px" align="center">
		
				<li style="text-align: center;">
					<input type="hidden" name="u_id" value="${sessionScope.memId}">
					<input type="submit" class="btn btn-info" style="border-radius: 4px;"
					value="회원정보 변경">
					<input type="button" class="btn btn-danger" style="border-radius: 4px;"
					value="취소"
					onclick="document.location.href='/Education/main/Main.do'">
				</li>
			</ul>
		</form>

</div> <!-- css -->

<jsp:include page="footer45.jsp" flush="false"/>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../LogonBoot/js/bootstrap.min.js"></script>
</body>
</html>