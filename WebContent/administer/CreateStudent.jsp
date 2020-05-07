<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>학생 추가</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
  
  <script src="http://code.jquery.com/jquery-1.12.1.js"></script> 
 
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
			  alert(" 선생님 아이디를 입력하십시오.");
			  document.create_student.t_id.focus();
			  return false;
			}
	 	}); 	  	
	 });

</script> 
</head>

<body>


	<c:choose>
		<c:when test="${sessionScope.memId eq 'admin'}">


<div class="container">
  <h2>학생 추가하기</h2>
  <form id="form1" name="create_student" action="/Education/administer/CreateStudentPro.do" method="post" enctype="multipart/form-data">
  
    <div class="form-group">
      <label for="s_name">이름:</label>
      <input type="text" class="form-control" name="s_name">
    </div>
    <div class="form-group">
      <label for="s_tel">연락처:</label>
      <input type="text" class="form-control" name="s_tel">
    </div>
    <div class="form-group">
      <label for="s_birth">생년월일: </label>
      <input type="text" class="form-control" name="s_birth" placeholder="yyyy/mm/dd"/>
    </div>
   
    <div class="from-group">
    	<label>이미지 : </label>
    	<input type="file" class="form-control" name="s_img" />
    </div>
    <div class="form-group">
    	<label>학부모ID : </label>
    	<input type="text" class="form-control" name="u_id" />
    </div>
    <div class="form-group">
    	<label>담당선생님ID : </label>
    	<input type="text" class="form-control" name="t_id" />
    	<input type="hidden" name="check" value="no" />
    </div><br>
    <center><input type="submit" class="btn btn-default" value="계정 등록하기"></button></center>
  </form>
</div>


      	</c:when>
		<c:otherwise>
			잘못된 접근입니다.
		</c:otherwise>
	</c:choose>


</body>
</html>