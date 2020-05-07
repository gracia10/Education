<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>선생님 프로필 수정</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script src="http://code.jquery.com/jquery-1.12.1.js"></script>

</head>
<body>


	<c:choose>
		<c:when test="${sessionScope.memId eq 'admin' || fn:substring(sessionScope.memId, 0, 7) eq 'teacher'}">


<div class="container">
  <h2>선생님 프로필</h2>
  <form name="t_profile" action="/Education/administer/ModifyTeacherProfilePro.do" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label>선생님 ID: *</label>
      <input type="text" class="form-control" name="t_id" value="${t_id}" readonly />
    </div>
    <div class="form-group">
    	<label>이미지</label>
    	<input type="file" class="form-control" name="t_img" value="${t_img}"/>
    </div>
    <div class="form-group">
    	<label>보육경력</label>
    	<input type="text" class="form-control" name="t_career" value="${t_career}"/>
    </div>
    <div class="form-group">
    	<label>소개말</label>
    	<input type="text" class="form-control" name="t_intro" value="${t_intro}"/>
    	<input type="hidden" name="update" id="eunju" value="no" />
    </div>
    <div></div><br>
    <center><input type="submit" class="btn btn-default" value="수정하기"></center>
  </form>
</div>


      	</c:when>
		<c:otherwise>
			잘못된 접근입니다.
		</c:otherwise>
	</c:choose>


</body>
</html>