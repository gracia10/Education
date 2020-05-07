<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	session.invalidate();
%>

<!-- 로그아웃 후 알림 -->

<script>
	alert("로그아웃 되었습니다.\n확인을 클릭하시면 메인 화면으로 이동합니다.");
	document.location.href = "/Education/main/Main.do";
</script>