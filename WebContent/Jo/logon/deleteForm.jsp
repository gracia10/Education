<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%-- <tiles:insertDefinition name="header" />
<tiles:insertDefinition name="nav" />
<tiles:insertDefinition name="footer" /> --%>

<!-- 회원 탈퇴 확인 페이지 -->

<style>
#deleteForm {
	float: left;
	width: 80%;
	font-size: large;
	margin-left: 10%;
	margin-right: 10%;
}

ul {
	list-style: none;
	margin-left: 10%;
	margin-right: 10%;
	padding-left: 0px;
}
</style>

<script>
	function checkIt() {
		var userinput = eval("document.userinput");

		// 체크박스 확인
		var chk1 = document.userinput.agree1.checked;

		if (!document.userinput.u_pass.value) {
			alert("비밀번호를 입력하지 않으셨습니다.");
			document.userinput.u_pass.focus();
			return false;
		}

		if (!chk1) {
			alert('안내사항을 확인하고 동의해주세요.');
			return false;
		}
	}
</script>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>회원 탈퇴</title>
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

		<form name="userinput" action="/Education/Jo/logon/deletePro.do"
			method="post" onSubmit="return checkIt()">
			<div id="deleteForm">
				<ul>
					<li style="text-align: center; font-size: large; padding-top: 100px;">
					<h3><b>회원 탈퇴</b></h3>
					</li>

					<hr size="1px" align="center">

					<li><b>[필수] 회원 탈퇴 전 안내사항을 꼭 확인해주세요.</b>
						<br>
					<div style="overflow: auto; border: 1px solid #A9D0F5; height: 150px; padding: 10px; margin: 0 auto;">
						<b>① 회원정보 및 개인 이용 기록 삭제 안내</b>
						<br> 회원정보 및 개인 이용 기록은 <b>모두 삭제</b>되며, 삭제된 데이터는 <b>복구 불가능</b>합니다.
						<br>
						<br><b>② 게시판형 서비스에 등록한 게시글 삭제 안내</b>
						<br> 삭제를 원하는 게시물이 있다면 반드시 <b>탈퇴 전 삭제</b>하시기 바랍니다.
						<br> 탈퇴 후에는 회원정보가 삭제되어 본인의 게시물임을 확인할 방법이 없어 임의로 <b>삭제해드릴 수가 없습니다.</b>
					</div>
						<label>
						<input type="checkbox" name="chk[]" id="agree1" value="1" class="ab" />
						<b>안내사항을 확인했으며 이에 동의합니다.</b>
						</label>
					</li>

					<hr size="1px" align="center">
						
					<li>
					<div class="form-group">
						<label for="u_id">아이디</label>
						<input type="text" class="form-control"
						id="u_id" name="u_id" maxlength="12" replace placeholder="아이디"
						value="${sessionScope.memId}" style="background-color: #E0F2F7;" readonly required>
						<input type="hidden" name="u_id" value="${sessionScope.memId}">
					</div>

					</li>

					<li>
					<div class="form-group">
						<label for="u_pass">비밀번호</label>
						<input type="password" class="form-control"
						id="u_pass" name="u_pass" maxlength="20" autofocus replace placeholder="비밀번호 확인" required>
						<input type="hidden" name="u_id" value="${sessionScope.memId}">
						</div>
					</li>

					<hr size="1px" align="center">
					
					<li style="text-align: center;">
						<input type="submit" class="btn btn-info" style="border-radius: 4px;"
						value="회원 탈퇴">
						<input type="button" class="btn btn-danger" style="border-radius: 4px;"
						value="취소"
						onclick="document.location.href='/Education/Jo/logon/modifyForm.do'">
					</li>
				</ul>
			</div> <!-- div id=deleteForm -->
		</form> <!-- form name=userinput -->

</div> <!-- css -->

<jsp:include page="footer45.jsp" flush="false"/>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../LogonBoot/js/bootstrap.min.js"></script>
</body>
</html>