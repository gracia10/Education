<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 회원 탈퇴 후 확인 알림, 혹은 비번 틀림 -->

<html>

<head>
<title>회원 탈퇴</title>
</head>

<body>

	<div>
		<c:if test="${check==1}">
			<c:remove var="memId" scope="session" />
			<form method="post" action="/Education/main/Main.do"
				name="userinput">
				<script>
					alert("회원정보가 삭제되었습니다.\n확인을 클릭하시면 메인화면으로 이동합니다.");
					document.location.href = "/Education/main/Main.do";
				</script>
			</form>
		</c:if>

		<c:if test="${check==0}">
			<script>
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
		</c:if>
	</div>

</body>
</html>
