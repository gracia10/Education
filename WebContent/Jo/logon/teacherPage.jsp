<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 선생님 마이 페이지가 없어 만든 임시 페이지 -->
<!-- 선생님용 헤더 -->
<tiles:insertDefinition name="headerTeacher" />
<tiles:insertDefinition name="nav" />
<tiles:insertDefinition name="footer" />

<html>

<head>
<meta charset=UTF-8>
<title>선생님 페이지</title>
</head>

<body>

	<div id="LoginSuc" name="로그인 성공" style="border: 1px solid gold;">
		<c:if test="${!empty sessionScope.memId}">
	선생님 페이지
			<ul>
				<li>
					<form method="post" action="/Education/Jo/logon/logout.do">
						<input type="submit" value="로그아웃"> <input type="button"
							value="마이페이지(선생님 페이지 jsp 임시)"
							onclick="document.location.href='/Education/Jo/logon/teacherPage.jsp'">
					</form>
				</li>
			</ul>

			<ul>
				<li>${sessionScope.memId}님이방문하셨습니다.</li>
			</ul>

		</c:if>
	</div>


</body>
</html>