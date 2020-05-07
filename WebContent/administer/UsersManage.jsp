<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%> --%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
   content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>보육의 정석</title>


<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
   content="images/touch/ms-touch-icon-144x144-precomposed.png">
<meta name="msapplication-TileColor" content="#3372DF">

<link rel="shortcut icon" href="images/favicon.png">

<!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
<!--
    <link rel="canonical" href="http://www.example.com/">
    -->

<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
   href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet" href="styles.css">
<style>
#view-source {
   position: fixed;
   display: block;
   right: 0;
   bottom: 0;
   margin-right: 40px;
   margin-bottom: 40px;
   z-index: 900;
}
</style>

<style>
/* .content {
	position: absolute;
	left: 17.5%;
	width: 81.5%;
	height: 86%;
	bottom: 2%;
} */

.btn-primary {
	float: right;
}
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<title>보육의정석</title>
<%
	session.setAttribute("nav", 6);
%>

<script language="JavaScript">  
    
    function createT() {
   	url="./CreateTeacher.do";
	
	window.open(url,"post7","toolbar=no ,width=500 ,height=650,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=200");
    }
    
    function modifyUser(formName) {
    	url="./ModifyUsers.do?u_id="+formName.user_id.value;
    	/* alert(formName.user_id.value); */
    	window.open(url,"post8","toolbar=no ,width=500 ,height=700,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=180");
     }
    
    function modifyTeacher(formName) {
       	url="./ModifyTeacher.do?t_id="+formName.teacher_id.value;
       	
    	window.open(url,"post9","toolbar=no ,width=500 ,height=700,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=180");
        }
        
    function deleteUser(formName) {   	
    	if(formName.user_grade.value == "학부모"){
    		alert("학부모 계정은 삭제할 수 없습니다.");
    		return false;
    	} else {
    		var check = confirm("삭제하시겠습니까?");
    		if(check){
    	    	 url="./UsersManagePro.do?u_id="+formName.user_id.value;
    	       	 alert("삭제되었습니다.");
    	       	 window.open(url, "post");	
    		}	    		
    	}     
 }

    function deleteTeacher(formName) {
    	var check = confirm("삭제하시겠습니까?");
    	if(check){
	       	 url="./UsersManagePro_T.do?t_id="+formName.teacher_id.value;
	       	 alert("삭제되었습니다.");
	       	 window.open(url, "post");	
    	}	
 }

    
    
</script>
</head>
<body>

	<c:choose>
		<c:when test="${sessionScope.memId eq 'admin'}">

			<jsp:include page="../tiles/header.jsp" />
			<jsp:include page="../tiles/aside.jsp" />


<main class="mdl-layout__content mdl-color--grey-100">
	<div class="content">
		<div class="container">
			<br>
			<h2>회원 관리</h2>
			<!-- 부트스트랩 Hover Rows 참조! -->
			<p>회원들의 정보를 수정할 수 있습니다.</p><br><br>
			<button type="button" class="btn btn-primary" onclick="createT()">선생님 계정 추가</button>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>등 급</th>
						<th>아이디</th>
						<th>이 름</th>
						<th>생년월일</th>
						<th>연락처</th>
						<th>&nbsp;수 정</th>
						<th>&nbsp;&nbsp;삭 제</th>
					</tr>
				</thead>
				<tbody>
						<!-- users테이블과 조인해서 학부모 이름 가져오기 -->
						<!-- teacher테이블과 조인해서 담당선생님 이름 가져오기 -->
					<c:forEach var="user" items="${totalList}">
						<c:set var="userid" value="${user.u_id}" />
						<c:set var="username" value="${user.u_name}" />
						<c:set var="userbirth1" value="${user.u_birth}" />
						<c:set var="userbirth" value="${fn:substring(userbirth1,0,10)}" />
						<c:set var="usertel" value="${user.u_tel}" />
						<c:set var="usergrade" value="${user.u_grade}" />
						<form name="userForm" method="post" action="UsersManagePro.do">
							<tr>
								<td>${usergrade}<input type="hidden" name="user_grade" value="${usergrade}"></td>
								<td>${userid}<input type="hidden" name="user_id" value="${userid}"></td>
								<td>${username}</td>
								<td>${userbirth}</td>
								<td>${usertel}</td>
								<td>
									<input type="button" class="btn btn-info" value="수정" onclick="modifyUser(this.form)" /> 
								</td>
								<td>
									<input type="button" class="btn btn-danger" value="삭제" onclick="deleteUser(this.form)" /></td>
							</tr>
						</form>
					</c:forEach>
	
					<c:forEach var="teacher" items="${teacherList}">
						<c:set var="teacherid" value="${teacher.t_id}" />
						<c:set var="teachername" value="${teacher.t_name}" />
						<c:set var="teacherbirth1" value="${teacher.t_birth}" />
						<c:set var="teacherbirth" value="${fn:substring(teacherbirth1,0,10)}" />
						<c:set var="teachertel" value="${teacher.t_tel}" />
						<form name="teacherForm" method="post">
							<tr>
								<td>선생님</td>
								<td>${teacherid}
								<input type="hidden" name="teacher_id" value="${teacherid}">
								</td>
								<td>${teachername}</td>
								<td>${teacherbirth}</td>
								<td>${teachertel}</td>
								<td>
									<input type="button" class="btn btn-info" value="수정" onclick="modifyTeacher(this.form)" /> 
								</td>
								<td>
									<input type="button" class="btn btn-danger" value="삭제" onclick="deleteTeacher(this.form)" />
								</td>
							</tr>
						</form>
					</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</main>


        </c:when>
		<c:otherwise>
			잘못된 접근입니다.
		</c:otherwise>
	</c:choose>	


</body>
</html>