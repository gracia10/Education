<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 로그인 체크 페이지 -->
<!-- 기본 -1, 1 인증 성공, 0 비번 틀림, -1 해당 아이디 없음 -->
<!-- 세션 지정 -->

<c:if test="${check==1}">
	<c:set var="memId" value="${u_id}" scope="session" />
	<meta http-equiv="Refresh" content="0;url=/Education/main/Main.do" />
</c:if>

<c:if test="${tcheck==1}">
	<c:set var="memId" value="${u_id}" scope="session" />
	<meta http-equiv="Refresh"
	content="0;url=/Education/main/Main.do" />
</c:if>

<c:if test="${check==0 || tcheck==0}">
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${check==-1 && tcheck==-1}">
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>