<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 회원가입 성공하면 알려주는 페이지 -->

<tiles:insertDefinition name="header" />
<tiles:insertDefinition name="nav" />
<tiles:insertDefinition name="footer" />

<html>

<head>
<title>회원가입 완료</title>
</head>

<body>

	<div name="회원가입 완료">
		<script>
			alert("회원가입이 완료되었습니다.\n확인을 클릭하시면 메인화면으로 이동합니다."); // 창이 뜰 때 나타나는 글.
			// 확인 버튼 클릭시 main.jsp 페이지로 이동하게 만듬.
			document.location.href = "/Education/main/Main.do";
		</script>
	</div>

</body>
</html>