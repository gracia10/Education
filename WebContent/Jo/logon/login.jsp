<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 로그인 페이지 -->

<style>
#Login {
	float: left;
	width: 80%;
	/* 	border: 1px solid #A9D0F5; */
	font-size: large;
	margin-left: 10%;
	margin-right: 10%;
}

h1 {
	text-align: center;
}

ul {
	font-size: large;
	text-align: center;
	list-style: none;
	padding-left: 0px;
	margin-left: 10%;
	margin-right: 10%;
}
</style>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>로그인</title>
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
	
		<div id="Login" name="로그인">
			<c:if test="${empty sessionScope.memId}">
				<form name="inform" method="post"
				action="/Education/Jo/logon/loginCkPro.do">
					
					<ul style="text-align: center; padding-top: 60px;">
						<li>
							<h1><b>로그인</b></h1>
						</li>
					</ul>

					<hr size="1px" align="center">

					<div class="form-group">
						<label for="u_id"><b>아이디</b></label>
						<input type="text" class="form-control"
						id="u_id" name="u_id" maxlength="12" autofocus
						replace placeholder="아이디" required>
					</div>
					
					<div class="form-group">
						<label for="u_pass"><b>비밀번호</b></label>
						<input type="password" class="form-control"
						id="u_pass" name="u_pass" maxlength="20"
						replace placeholder="비밀번호" required>
					</div>

					<hr size="1px" align="center">

					<ul style="font-size: large;">
					<li style="padding-bottom: 11px;"><b>아이디</b>를 잊어버렸나요?
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn btn-info" style="border-radius: 4px;"
						value="아이디 찾기"
						onclick="document.location.href='/Education/Jo/logon/findIdPwd.do'">
					</li>
					<li style="padding-bottom: 11px;"><b>비밀번호</b>를 잊어버렸나요?
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn btn-info" style="border-radius: 4px;"
						value="비밀번호 찾기"
						onclick="document.location.href='/Education/Jo/logon/findIdPwd.do'">
					</li>
					<li>아직 <b>홈페이지 회원</b>이 아니신가요? &nbsp;&nbsp;
						<input type="button" class="btn btn-info" style="border-radius: 4px;"
						value="회원가입"
						onclick="document.location.href='/Education/Jo/logon/inputForm.do'">
					</li>
					</ul>

					<hr size="1px" align="center">

					<ul>
					<li><input type="submit"
						class="btn btn-info" style="border-radius: 4px;"
						value="로그인">
						
						<input type="button"
						class="btn btn-danger" style="border-radius: 4px;"
						value="취소"
						onclick="document.location.href='/Education/main/Main.do'">
					</li>
					</ul>
					
				</form> <!-- inform -->
			</c:if>
		</div> <!-- id=login -->
</div>
<div class="fixed-bottom">
	<jsp:include page="footer45.jsp" flush="false"/>
</div>
		
 <!-- css -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../LogonBoot/js/bootstrap.min.js"></script>
</body>
</html>