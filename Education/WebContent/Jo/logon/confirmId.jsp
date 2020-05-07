<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 아이디 중복 체크 페이지 -->

<style>
#confirmId {
	text-align: center;
	border: 1px solid #A9D0F5;
	height: 100%;
	font-size: large;
	overflow: hidden;
}

ul {
	text-align: center;
	list-style: none;
	padding-left: 0px;
	padding-top: 5%;
	padding-bottom: 5%;
}
</style>

<script>
	function setu_id() {
		opener.document.userinput.u_id.value = "${u_id}";
		opener.document.userinput.u_id1.value = "${u_id}";
		self.close();
	}
</script>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta charset="utf-8">
<title>아이디 중복 확인</title>
<!-- Bootstrap -->
<link href="../../LogonBoot/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="../../LogonBoot/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="../../LogonBoot/css/style.css" media="screen" title="no title" charset="utf-8">
</head>

<body>
<div id="confirmId" name="아이디 중복 확인">
		
		<!-- 기본 -1, 해당 아이디 있음 1, 해당 아이디 없음 -1 -->
		<!-- 중복된 아이디 -->
		<c:if test="${check == 1}">
			<ul>
				<li></li>
				<li><b>${u_id}</b>은/는
					<br>이미 <b>사용 중인 아이디</b>입니다.</li>
				<li><br></li>
				<li><input type="button" class="btn btn-info" style="border-radius: 4px;"
					value="닫기" onclick="window.close();"></li>
				<li></li>
			</ul>
		</c:if>

		<!-- 사용 가능 -->
		<c:if test="${check == -1}">
			<ul>
				<li>입력하신 <b>${u_id}</b>은/는
				<br><b>사용할 수 있는 아이디</b>입니다.</li>
				<li><br></li>
				<li><input type="button" class="btn btn-info" style="border-radius: 4px;"
					value="닫기" onclick="setu_id()"></li>
			</ul>
		</c:if>
		
</div> <!-- css -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../LogonBoot/js/bootstrap.min.js"></script>
</body>
</html>