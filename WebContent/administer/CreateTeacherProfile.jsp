<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>

<title>선생님 프로필 추가</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script src="http://code.jquery.com/jquery-1.12.1.js"></script>

<script> 

	$(function() {
		
		$("#form1").bind("submit", function() {
	  		/** 입력여부 검사 */
			if(document.t_profile.t_id.value==""){
			  alert("선생님 아이디를 입력하십시오.");
			  document.t_profile.t_id.focus();
			  return false;
			}
	  		alert("추가됐습니다.");
	 	}); 	  	
	 });

</script> 
</head>
<body>

	<c:choose>
		<c:when test="${sessionScope.memId eq 'admin'}">
		

<div class="container">
  <h2>선생님 프로필</h2>
  
  <form id="form1" name="t_profile" action="/Education/administer/CreateTeacherProfilePro.do" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label>선생님 ID: *</label>
      <input type="text" class="form-control" name="t_id" />
    </div>
    <div class="form-group">
    	<label>이미지</label>
    	<input type="file" class="form-control" name="t_img" />
    </div>
    <div class="form-group">
    	<label>보육경력</label>
    	<input type="text" class="form-control" name="t_career" />
    </div>
    <div class="form-group">
    	<label>소개말</label>
    	<input type="text" class="form-control" name="t_intro" />
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