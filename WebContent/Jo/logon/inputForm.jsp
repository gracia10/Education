<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 회원가입 페이지 -->

<script src="//code.jquery.com/jquery-3.2.1.js"></script>


<html>

<style>
#inputForm {
 	float: left;
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
	font-size: large;
}

ul {
	list-style: none;
	padding-left: 0px;
}

.scrollbar {
height: 78%;
overflow-y: scroll;
}

body{
	height: auto;
}

</style>

<script>
	// 체크박스 전체 체크, 해제
	$(document).ready(function() {
		$('.check-all').click(function() {
			$('.ab').prop('checked', this.checked);
		});
	});
</script>

<script>
	function checkIt() {
		var userinput = eval("document.userinput");

		// 생년월일 정규식
		var birth = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		var userbirth = userinput.u_birth.value;

		// 연락처 유효성 검사
		/* var telnum = /^[0-9]+$/; */
		// 휴대폰
		var telnum = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		var usertel = userinput.u_tel.value;

		// 영어/숫자 정규식 (아이디)
		var a1 = /[a-z]|[0-9]/gi;

		// 숫자, 영문, 특수문자 각각 1개 이상 포함. 글자수 4-20 (비밀번호)
		var pass = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var userpass = userinput.u_pass.value;

		// 이름 유효성 검사, 한글 2~4자, 영문 FirstName 2~10, LastName 2~10
		var name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		var username = userinput.u_name.value;

		// 체크박스 확인
		var chk1 = document.userinput.agree1.checked;
		var chk2 = document.userinput.agree2.checked;

		// 아이디 입력 여부
		if (!userinput.u_id.value) {
			alert("아이디를 입력하세요");
			document.userinput.u_id.focus()
			return false;
		}

		// 비밀번호 입력 여부
		if (!userinput.u_pass.value) {
			alert("비밀번호를 입력하세요");
			document.userinput.u_pass.focus()
			return false;
		}

		// 비밀번호 확인
		if (userinput.u_pass.value != userinput.u_pass2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			document.userinput.u_pass2.focus()
			return false;
		}

		// 사용자 이름 입력 여부
		if (!userinput.u_name.value) {
			alert("사용자 이름을 입력하세요");
			document.userinput.u_name.focus()
			return false;
		}

		// 이름 유효성 검사, 한글 2~4자, 영문 FirstName 2~10, LastName 2~10
		if (name.test(username) === false) {
			alert("이름을 다시 입력해주세요.\n한글: 2~4자\n영문: FirstName(2~10자) LastName(2~10자)");
			document.userinput.u_name.focus()
			return false;
		}

		// 아이디 중복 확인 필수
		if (userinput.u_id.value !== userinput.u_id1.value) {
			alert("아이디 중복을 확인하세요");
			return false;
		}

		// 아이디는 영어와 숫자만, 유효성
		if (a1.test(u_id) === false) {
			alert("아이디는 영어와 숫자만 입력이 가능합니다.");
			document.userinput.u_id.value = ""
			document.userinput.u_id.focus()
			return false;
		}

		//아이디 길이 체크 (4~12자) (쓴다면)
		if (document.userinput.u_id.value.length<4 || document.userinput.u_id.value.length>12) {
			alert("아이디를 4~12자까지 입력해주세요.")
			document.userinput.u_id.focus()
			document.userinput.u_id.select()
			return false;
		}

		//비밀번호 길이 체크(4~20자 까지 허용)
		if (document.userinput.u_pass.value.length<4 || document.userinput.u_pass.value.length>20) {
			alert("비밀번호를 4~20자까지 입력해주세요.")
			document.userinput.u_pass.focus()
			document.userinput.u_pass.select()
			return false;
		}

		// 아이디와 비번은 다르게
		if (userinput.u_pass.value == userinput.u_id.value) {
			alert("아이디와 비밀번호를 다르게 입력해주세요.")
			document.userinput.u_pass.focus()
			return false;
		}

		// 비밀번호는 영어 숫자 특문만, 최소 1개 숫자 혹은 특문, 유효성
		if (pass.test(userpass) === false) {
			alert("비밀번호는 영어와 숫자만 입력이 가능합니다. (4~20자)\n숫자, 영문, 특수문자를 각각 1개 이상 포함해주세요.");
			document.userinput.u_pass.value = ""
			document.userinput.u_pass.focus()
			return false;
		}

		// 휴대폰 유효성
		if (telnum.test(usertel) === false) {
			alert("잘못된 휴대폰 번호 형식입니다.\n01012345678 / 010-1234-5678");
			document.userinput.u_tel.value = ""
			document.userinput.u_tel.focus()
			return false;
		}

		// 우편번호
		if (!userinput.zipcode.value) {
			alert("우편번호를 입력해주세요.");
			return false;
		}

		// 주소
		if (!userinput.u_addr.value) {
			alert("상세 주소를 입력해주세요.");
			document.userinput.u_addr.focus()
			return false;
		}

		//체크박스 체크여부 확인 [하나]
		if (!chk1) {
			alert('이용약관에 동의해 주세요');
			return false;
		}
		if (!chk2) {
			alert('개인정보 수집 및 이용에 동의해 주세요');
			return false;
		}

		// 생년월일 유효성 검사
		if (birth.test(userbirth) === false) {
			alert("생년월일을 정확하게 입력해주세요.");
			document.userinput.u_birth.value = ""
			document.userinput.u_birth.focus()
			return false;
		}

	}
</script>

<script>
	// 아이디 중복 여부를 판단
	function openConfirmid(userinput) {

		// 영/숫만 가능하게
		var string1 = userinput.u_id.value;
		// 단어 금지용
		var string2 = userinput.u_id.value;

		var teacher = "teacher";
		var admin = "admin";
		var a1 = /[a-z]|[0-9]/gi;
		string1 = string1.replace(a1, '');

		if (userinput.u_id.value == "") {
			alert("아이디를 입력하세요");
			return;
		}

		else if (string1 != '') {
			alert("아이디는 영어와 숫자만 입력이 가능합니다.");
			return;
		}

		//아이디 길이 체크 (4~12자) (쓴다면)
		else if (document.userinput.u_id.value.length<4 || document.userinput.u_id.value.length>12) {
			alert("아이디를 4~12자까지 입력해주세요.")
			document.userinput.u_id.focus()
			document.userinput.u_id.select()
			return false;
		}

		else if (string2.match(teacher) !== null) {
			alert("사용할 수 없는 아이디 입니다.(teacher)");
			return;
		}

		else if (string2.match(admin) !== null) {
			alert("사용할 수 없는 아이디 입니다.(admin)");
			return;
		}

		// url과 사용자 입력 id를 조합합니다.
		url = "/Education/Jo/logon/confirmId.do?u_id=" + userinput.u_id.value;

		// 새로운 윈도우를 엽니다.
		open(
				url,
				"confirm",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=350, height=150, left=600, top=200,");
	}
</script>

<script>
	function zipCheck() {

		url = "/Education/Jo/logon/ZipCheck.do?check=y";

		window
				.open(
						url,
						"post",
						"toolbar=no, width=550, height=300, left=500, top=200, directories=no, status=yes, scrollbars=yes, menubar=no");
	}
</script>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>회원가입</title>
<!-- Bootstrap -->
<link href="../../LogonBoot/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="../../LogonBoot/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="../../LogonBoot/css/style.css" media="screen" title="no title" charset="utf-8">
</head>

<body>
<jsp:include page="header.jsp" flush="false"/>

<!-- 	<div class="scrollbar" id="inputForm" name="간편 회원가입"> -->
		<div id="join" name="회원정보">
			<form method="post" action="/Education/Jo/logon/inputPro.do"
				name="userinput" onSubmit="return checkIt()">

				<ul style="text-align: center;">
					<li><h3><b>회원가입</b></h3></li>
				</ul>

				<hr size="1px" align="center">
				
		<div class="col-md-6 col-md-offset-3" style="padding-bottom:0; padding-left: 195; padding-right: 195; box-sizing:none;">

            <div class="form-group">
              <label for="u_id">아이디</label>
              <div class="input-group" style="width:216px;">
                <input type="text" class="form-control"  style="width:126px; border-radius: 4px;"
                id="u_id" name="u_id" placeholder="아이디 (4~12자)" maxlength="12" autofocus required>
                <span class="input-group-btn">
                <input type="hidden" name="u_id1" maxlength="12">
                <input type="button" class="btn btn-info" style="border-radius: 4px;"
                value="중복체크" OnClick="openConfirmid(this.form)">
                </span>
              </div>
            </div>
            
            
            

			<div class="form-group">
              <label for="u_pass">비밀번호</label>
              <input type="password" class="form-control" id="u_pass" name="u_pass" maxlength="20"
              replace placeholder="비밀번호 (4~20자 / 숫자, 영문, 특수문자를 각각 1개 이상 포함)" required>
            </div>

			<div class="form-group">
              <label for="u_pass2">비밀번호 재확인</label>
              <input type="password" class="form-control" id="u_pass2" name="u_pass2" maxlength="20"
              onblur="u_passchk()"
              replace placeholder="비밀번호 재확인 (4~20자 / 숫자, 영문, 특수문자를 각각 1개 이상 포함)" required>
            </div>

			<div class="form-group">
              <label for="u_name">이름</label>
              <input type="text" class="form-control" id="u_name" name="u_name" maxlength="21"
              replace placeholder="이름 (한글: 2~4자 / 영문: FirstName(2~10자) LastName(2~10자))" required>
            </div>

			<div class="form-group">
              <label for="u_tel">휴대폰</label>
              <input type="tel" class="form-control" id="u_tel" name="u_tel" maxlength="13"
              replace placeholder="01012345678 / 010-1234-5678" required>
            </div>

			<div class="form-group">
              <label for="u_birth">생년월일</label>
              <input type="date" class="form-control" id="u_birth" name="u_birth" maxlength="10"
              replace placeholder="생년월일" required>
            </div>
            
            <div class="form-group">
              <label for="u_addr">주소</label>
              <div class="input-group" style="width:216px;">
                <input type="text" class="form-control" id="zipcode" name="zipcode" style="width:96px; background-color: #E0F2F7; border-radius: 4px;"
                placeholder="우편번호" required readonly>
                <span class="input-group-btn">
            	<input type="button" class="btn btn-info" style="border-radius: 4px;"
            	value="우편번호 찾기" onClick="zipCheck()">
                </span>
              </div>
              <div class="form-group" style="margin-top: 11px;">
                 <input type="text" class="form-control" id="u_addr" name="u_addr" maxlength="100"
                 replace placeholder="주소를 입력해주세요." required>
            </div>
            
            
            </div>

		<hr size="1px" align="center">
		
			<ul>
				<li><label>
					<input type="checkbox" name="all" class="check-all">
					<b>전체 이용약관에 동의합니다.</b>
					</label>
				</li>
				<li>
				<br><b>[필수] 이용약관 동의</b>
				<br>
				<div style="overflow: auto; border: 1px solid #A9D0F5; height: 150px; padding: 10px; margin: 0 auto;">
					<b>① 개인정보의 처리목적</b>
					<br>
					<br> 보육의 정석은 다음의 목적을 위하여 개인정보를 처리합니다.
					<br>
					<br> 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제 18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
				</div>
					<label>
					<input type="checkbox" name="chk[]" id="agree1" value="1" class="ab" />
					<b>이용약관에 동의함</b>
					</label>
					<br>
					<br><b>[필수] 개인정보 수집 및 이용 동의</b><br>
				<div style="overflow: auto; border: 1px solid #A9D0F5; height: 150px; padding: 10px; margin: 0 auto;">
					<b>① 개인정보의 수집·이용목적</b>
					<br>
					<br> 상담, 관리, ...
					<br>
					<br>
					<b>② 수집하려는 개인정보의 항목</b>
					<br>
					<br> 성명, 번화번호, 주소, 이메일, 학년, ...
					<br>
					<br><b>③ 개인정보의 보유 및 이용기간(근거법률)</b>
					<br>
					<br> 1년, 수강기간, 퇴사후 3년, ...
					<br>
					<br><b>거래기록</b><br>
					<br> 5년(전자상거래 등에서의 소비자 보호에 관한 법률)
					<br>
					<br><b>④ 동의를 거부할 수 있으며, 동의 거부시 서비스가 제공되지 않습니다.</b>
				</div>
					<label>
					<input type="checkbox" name="chk[]" id="agree2" value="2" class="ab" />
					<b>개인정보 수집 및 이용에 동의함</b>
					</label>
				</ul>
				
		<hr size="1px" align="center">

			<div name="회원가입 완료" id="suc">
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">가입하기<i class="fa fa-check spaceLeft"></i></button>
              <button type="reset" class="btn btn-secondary">다시입력<i class="fa fa-refresh spaceLeft"></i></button>
              <input type="button" class="btn btn-danger" value="가입 안 함" onclick="document.location.href='/Education/main/Main.do'"></button>
            </div>
			</div> 

		</div> <!-- css -->
			</form> 
			</div>
			
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../LogonBoot/js/bootstrap.min.js"></script>
		
		<div class="fixed-bottom" style="text-align:left">
			<jsp:include page="footer.jsp" flush="false" />
		</div>
</body>
</html>
