<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<title>회원 정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	#eunjoo{
		width:80;
		display:inline;
		margin-right:10;
	}
</style>
<script language="JavaScript">
function modify(formName){
	if(formName.u_pass.value == ""){
	       alert("회원 비밀번호를 입력하세요");
	       return false;
	    } 
	
	if(formName.u_name.value == ""){
	       alert("회원 이름을 입력하세요");
	       return false;
	    }
	 
	if(formName.u_tel.value == ""){
	       alert("연락처를 입력하세요");
	       return false;
	    }
	
	if(formName.u_birth.value == ""){
	       alert("생년월일을 입력하세요");
	       return false;
	    }
	
	
	 $.ajax({      
	       type : "get",
	       success : function(){
	          alert("회원 정보가 수정되었습니다");
	          opener.parent.location.reload();
	          self.close();       
	       }
	    });
}

function zipCheck(){
		url="/Education/administer/ZipCheckUser.do";
		win =  window.open(url,"post1","_blank, toolbar=no ,width=500 ,height=300,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");
	}
</script>
<body>
	<div class="container">
		<h2>회원 정보</h2>
		<form name="create_teacher">

			<div class="form-group">
				<label for="id">ID:</label> <input type="text" class="form-control"
					id="id" value="${u_id}" name="u_id" readonly>
				<%-- <input type="hidden" name="id" value="${sessionScope.memId}"> --%>
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" value="${u_pass}" name="u_pass">
			</div>
			<div class="form-group">
				<label for="name">이름:</label> <input type="text"
					class="form-control" id="name" value="${u_name}" name="u_name" />
			</div>
			<div class="form-group">
				<label for="tel">연락처:</label> <input type="tel" class="form-control"
					id="tel" value="${u_tel}" name="u_tel" />
			</div>
			<div class="form-group">
				<label for="birth">생년월일:</label>
				<c:set var="u_birth1" value="${fn:substring(u_birth,0,10)}" />
				<input type="text" class="form-control" id="birth" value="${u_birth1}" name="u_birth" />
			</div><br>
			<div class="form-group"> 
       <label>우편번호</label>
       <input type="text" class="form-control" id="eunjoo" name="zipcode" size="7" value="${zipcode}" readonly />
       <input type="button" class="btn btn-default" value="우편번호찾기" onClick="zipCheck()" />
               우편번호를 검색하세요.
    </div>
    <div class="form-group">
    	<label>주소</label>
    	<input type="text" class="form-control" value="${u_addr}" name="u_addr" />
    </div>
			<hr />
			<div class="form-group">
				<label for="u_grade">등급</label> &nbsp;&nbsp;&nbsp;&nbsp; <select
					name="u_grade">
					<option value='학부모' selected>학부모</option>
					<option value='일반회원'>일반회원</option>
				</select>
			</div>
			<input type="hidden" name="update" id="eunju" value="no" />
			<center><button type="submit" class="btn btn-default" onclick="modify(this.form)">수정하기</button></center>
		</form>
	</div>

</body>
</html>