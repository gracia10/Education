<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>학생 정보 수정</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.12.1.js"></script> 
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
  
 
<script> 


	$(function() {
		$("#form1").bind("submit", function() {
	  		/** 입력여부 검사 */
			if(document.create_student.s_name.value==""){
			  alert("학생 이름을 입력하십시오.");
			  document.create_student.s_name.focus();
			  return false;
			}
			if(document.create_student.s_birth.value==""){
			  alert("생년월일을 입력하십시오.");
			  document.create_student.s_birth.focus();
			  return false;
			}
			
			if(document.create_student.u_id.value==""){
			  alert("학부모 아이디를 입력하십시오.");
			  document.create_student.u_id.valuefocus();
			  return false;
			}
			       
			if(document.create_student.t_id.value==""){
			  alert("선생님 아이디를 입력하십시오.");
			  document.create_student.t_id.focus();
			  return false;
			}
	 	}); 	  	
	 });
  

</script> 
</head>

<body>
<div class="container">
  <h2>학생 정보 수정하기</h2>
  <form id="form1" name="create_student" action="/Education/administer/ModifyStudentPro.do" method="post" enctype="multipart/form-data">
  
    <div class="form-group">
      <label for="s_name">이름:</label>
      <input type="hidden" name="s_no" value="${s_no}" />
      <input type="text" class="form-control" name="s_name" value="${s_name}" />
    </div>
    <div class="form-group">
      <label for="s_tel">연락처:</label>
      <input type="text" class="form-co]ntrol" name="s_tel" value="${s_tel}" />
    </div>
    <div class="form-group">
      <label for="s_birth">생년월일: </label>
      <c:set var="s_birth1" value="${fn:substring(s_birth,0,10)}" />
      <input type="text" class="form-control" name="s_birth" value="${s_birth1}" placeholder="yyyy/mm/dd"/>
    </div>
   
    <div class="from-group">
    	<label>이미지 : </label>
    	<input type="file" class="form-control" name="s_img" value="${s_img}"/>
    </div>
    <div class="form-group">
    	<label>학부모ID : </label>
    	<input type="text" class="form-control" name="u_id" value="${u_id}"/>
    </div>
    <div class="form-group">
    	<label>담당선생님ID : </label>
    	<input type="text" class="form-control" name="t_id" value="${t_id}"/>
    	<input type="hidden" name="update" id="eunju" value="no" />
    </div><br>
    <center><input type="submit" class="btn btn-default" value="수정하기"></button></center>
  </form>
</div>

</body>
</html>