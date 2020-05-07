<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<title>회원 정보 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<style>
	#eunjoo{
		width:80;
		display:inline;
		margin-right:10;
	}
</style>
<script language="JavaScript">
	function check(formName) {

		 if(formName.t_name.value == ""){
		   alert("선생님 이름을 입력하세요");
		   return false;
		} 		

		 if(formName.t_pass.value == ""){
			   alert("비밀번호를 입력하세요");
			   return false;
			} 	
		 
		 if(formName.t_tel.value == ""){
			   alert("연락처을 입력하세요");
			   return false;
			} 	
		 
		 if(formName.t_birth.value == ""){
			   alert("생년월일을 입력하세요");
			   return false;
			} 
		 
		formName.update.value = "yes"

			$.ajax({
				type : "get",
				success : function() {
					alert("선생님 정보가 수정되었습니다");
					opener.parent.location.reload();
					self.close();
				}
			});
		}
	
	function zipCheck(){
 		url="/Education/administer/ZipCheck.do";
 		win =  window.open(url,"post1","_blank, toolbar=no ,width=500 ,height=300,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");
 	}

</script>
<body>
	<div class="container">
		<h2>회원 정보</h2>
		<form name="create_teacher">
			<!-- 선생님 회원 정보 수정하기 -->
			<div class="form-group">
				<label for="id">ID:</label> <input type="text" class="form-control"
					id="id" value="${t_id}" name="t_id" readonly /> <input
					type="hidden" name="teacher_id" value="${t_id}" />
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" value="${t_pass}" name="t_pass" />
			</div>
			<div class="form-group">
				<label for="name">이름:</label> <input type="text"
					class="form-control" id="name" value="${t_name}" name="t_name" />
			</div>
			<div class="form-group">
				<label for="tel">연락처:</label> <input type="tel" class="form-control"
					id="tel" value="${t_tel}" name="t_tel" />
			</div>
			<div class="form-group">
				<label for="birth">생년월일:</label>
				<c:set var="t_birth1" value="${fn:substring(t_birth,0,10)}" />
				<input type="text" class="form-control" id="birth"
					value="${t_birth1}" name="t_birth" />
			</div><br>
			<div class="form-group">
				<label>우편번호</label> <input type="text" class="form-control" name="zipcode" size="7" id="eunjoo"
					value="${zipcode}" readonly /> <input type="button" class="btn btn-default" value="우편번호찾기"
					onClick="zipCheck()" /> 우편번호를 검색하세요.
			</div>
			<div class="form-group">
				<label>주소</label> <input type="text" class="form-control"
					value="${t_addr}" name="t_addr" />
			</div>
			<input type="hidden" name="update" id="eunju" value="no" /><br>
			<center>
				<input type="submit" class="btn btn-default"
					onclick="check(this.form)" value="수정하기" />
			</center>
		</form>
	</div>

</body>
</html>