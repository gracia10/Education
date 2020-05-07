<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 아이디와 비밀번호 찾는 페이지 -->


<style>
#findIdPwd {
	float: left;
	width: 90%;
	height: 40%;
	font-size: large;
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 10%;
}

.in1 {
	display: inline-block;
	width: 40%;
	height: 250px;
}

.in2 {
	display: inline-block;
	width: 40%;
	height: 250px;
}

ul {
	list-style: none;
	margin-left: 10%;
	margin-right: 10%;
	padding-left: 0px;
}

#findId{
	border-right:1px solid gray;
	height:500px;
    padding-right: 130px;
    width: 600px;
	
}

#findPwd{
	height:500px;
	margin-left:100px;
}

#findIdPwd{
	overflow: hidden;
}
</style>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>아이디 / 비밀번호 찾기</title>
<!-- Bootstrap -->
<link href="../../LogonBoot/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="../../LogonBoot/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="../../LogonBoot/css/style.css" media="screen" title="no title" charset="utf-8">
</head>

<body>

<jsp:include page="header.jsp" flush="false"/>
<div class="col-md-6 col-md-offset-3" style="margin-left:200px;">

		<div class="out" id="findIdPwd" style="height: 502px; width: 1202px;" name="아이디/비밀번호 찾기">
			<div class="in1" id="findId" name="아이디 찾기">
				<form method="post" action="findIdPro.jsp">
				<ul>
					<li style="text-align: center; padding-top: 100px;">
						<h4><b>이름</b>과 <b>생년월일</b>을<br>입력하세요.</h4>
					</li>

				<hr size="1px" align="center">

					<li><div class="form-group">
						<label for="u_name"><b>이름</b></label>
						<input type="text" class="form-control"
						id="u_name" name="u_name" maxlength="21"
						replace placeholder="이름">
						</div>
					</li>

					<li><div class="form-group">
						<label for="u_birth"><b>생년월일</b></label>
						<input type="date" class="form-control"
						id="u_birth" name="u_birth" maxlength="10"
						placeholder="생년월일">
							</div>
						</li>

				<hr size="1px" align="center">

					<li style="text-align: center;">
						<input type="submit" class="btn btn-info" style="border-radius: 4px;"
						value="아이디 찾기">

						<input type="button" class="btn btn-danger" style="border-radius: 4px;"
						value="취소"
						onclick="document.location.href='/Education/Jo/logon/login.do'">
					</li>
				</ul>
				</form>
			</div> <!-- class in1 -->
			
			<div class="in2" id="findPwd" name="비밀번호 찾기">
				<form name="findpwdform" method="post"
				action="/Education/Jo/logon/findPwdPro.do">
				<ul>
					<li style="text-align: center; padding-top: 100px;">
						<h4><b>아이디</b>와 <b>이름</b>을<br>입력하세요.</h4>
					</li>

				<hr size="1px" align="center">

						<div class="form-group">
						<label for="u_id">아이디</label>
						<input type="text" class="form-control"
						id="u_id" name="u_id" maxlength="12"
						replace placeholder="아이디">
						</div>

						<div class="form-group">
						<label for="u_name2">이름</label>
						<input type="text" class="form-control"
						id="u_name2" name="u_name" maxlength="21"
						replace placeholder="이름">
						</div>

				<hr size="1px" align="center">

					<li style="text-align: center;">
						<input type="submit" class="btn btn-info" style="border-radius: 4px;"
						value="비밀번호 찾기">
						<input type="button" class="btn btn-danger" style="border-radius: 4px;"
						value="취소"
						onclick="document.location.href='/Education/Jo/logon/login.do'">
					</li>
				</ul>
				</form>
			</div> <!-- class in2 -->
		</div>

</div>
<div class="fixed-bottom">
	<jsp:include page="footer45.jsp" flush="false"/>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../LogonBoot/js/bootstrap.min.js"></script>
</body>
</html>