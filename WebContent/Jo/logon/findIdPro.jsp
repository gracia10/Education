<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page import="logon.LogonDBBean"%>

<!-- 아이디 찾기 페이지, 아이디 알려주거나 입력한 정보가 틀리면 다시 입력하거나 -->


<style>
#findId {
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

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String u_name = request.getParameter("u_name");
	String u_birth = request.getParameter("u_birth");
	LogonDBBean manager = LogonDBBean.getInstance();
	String u_id = manager.findId(u_name, u_birth);
%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>아이디 찾기 Pro</title>
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

		<div name="아이디 찾기" id="findId">
			<%
				if (u_id == null) {
			%>
			<form method="post" action="findIdPro.jsp">
			<ul>
				<li style="text-align: center; font-size: large; padding-top: 100px;">
					해당하는 아이디가 없습니다.
					<br><b>이름</b>과 <b>생년월일</b>을 다시 입력하세요.
				</li>
				
			<hr size="1px" align="center">

				<li><div class="form-group">
					<label for="u_name">이름</label>
					<input type="text" class="form-control" id="u_name" name="u_name" maxlength="21" autofocus
					replace placeholder="이름" required>
					</div>
				</li>

				<li><div class="form-group">
					<label for="u_birth">생년월일</label>
					<input type="date" class="form-control" id="u_birth" name="u_birth" maxlength="10"
					replace placeholder="생년월일" required>
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

			<%
				} else {
			%>
			
			<ul>
				<li style="text-align: center; font-size: large; padding-top: 100px;">아이디는 <b><%=u_id%></b>입니다.
				<br><b>확인</b>을 누르시면 <b>메인</b>으로 이동합니다.
				</li>

			<hr size="1px" align="center">

				<li style="text-align: center;">
				<input type="button" class="btn btn-info" style="border-radius: 4px;"
				value="확인"
				onclick="document.location.href='/Education/main/Main.do'">
				</li>
			</ul>
			
			<%
				}
			%>
			
		</div> <!-- findId -->

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