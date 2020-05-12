<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%-- <tiles:insertDefinition name="header" />
<tiles:insertDefinition name="nav" />
<tiles:insertDefinition name="footer" /> --%>

<style>
#passCheckPro {
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

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>비밀번호 확인 Pro</title>
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
		<div id="passCheckPro">
		<!-- 기본 -1, 인증 성공(비밀번호 맞음) 1, 비밀번호 틀림 0 -->
		<!-- 틀리면 페이지 뒤로, 맞으면 비밀번호 변경 화면으로 이동 -->
			<c:if test="${check==1}">
				<form name="myform" action="/Education/Jo/logon/modifyForm.do" method="post">
					<ul><li style="text-align: center; font-size: large;">
						비밀번호가 확인되었습니다.
					<br><b>확인</b>을 누르시면 <b>회원정보 변경 화면</b>으로 이동합니다.
						</li>

				<hr size="1px" align="center">

						<li style="text-align: center;">
						<input type="hidden" name="u_id" value="${sessionScope.memId}">
						<input type="submit" class="btn btn-info" style="border-radius: 4px;"
						value="확인">
						<input type="button" class="btn btn-danger" style="border-radius: 4px;"
						value="취소"
						onclick="document.location.href='/Education/main/Main.do'">
						</li>
					</ul>
				</form>
			</c:if>

			<c:if test="${check==0}">
				<script>
					alert("비밀번호가 맞지 않습니다.");
					history.go(-1);
				</script>
			</c:if>
		</div>
		
</div>

<jsp:include page="footer45.jsp" flush="false"/>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../LogonBoot/js/bootstrap.min.js"></script>
</body>
</html>
