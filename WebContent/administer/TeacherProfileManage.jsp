<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>


<style>

.btn-primary {
	float : right;
}

</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>보육의정석</title>
<%
	session.setAttribute("nav", 2);
%>

<script language="JavaScript">
function createProfile() {
   	url="CreateTeacherProfile.do?";
	
	window.open(url,"post78","toolbar=no ,width=500 ,height=470,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");
    }
    
function modifyProfile(formName) {
	//alert(formName.teacher_id.value)
   url="ModifyTeacherProfile.do?t_id="+formName.teacher_id.value;
    	
   window.open(url,"post79","toolbar=no ,width=500 ,height=470,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");
	
    }
   
function deletePro(formName) {
	
	var check = confirm("삭제하시겠습니까?");
	if(check){
		url="./TeacherProfileManagePro.do?t_id="+formName.teacher_id.value;
		alert("삭제되었습니다.");
		window.open(url,"post20");	
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
					<br>
					<div class="container">
						<h2>선생님 페이지 관리</h2>
						<p>선생님 프로필 화면을 관리합니다. </p><br><br>
						<button type="button" class="btn btn-primary" onclick="createProfile()">선생님 프로필 추가</button>
						<!-- 부트스트랩 Hover Rows 참조! -->
						<table class="table table-hover">
							<thead>
								<tr>
									<th>이 름</th>
									<th>보육경력</th>
									<th>연락처</th>
									<th>이미지</th>
									<th>소개말</th>
									<th>수 정</th>
									<th>&nbsp;&nbsp;삭 제</th>
								</tr>
							</thead>
							<tbody>
			
								<c:forEach var="pro" items="${profile}">
									<c:set var="t_id" value="${pro.t_id}" />
									<c:set var="name" value="${pro.t_name}" />
									<c:set var="career" value="${pro.t_career}" />
									<c:set var="tel" value="${pro.t_tel}" /> 
									<c:set var="img" value="${pro.t_img}" />
									<c:set var="intro" value="${pro.t_intro}" />
									
									<c:set var="img" value="${fn:substring(img,85,120)}" />
									<c:set var="img1" value="\teaSave\null" />
									<c:if test="${img eq img1 }">
										<c:set var="img" value="null" />	
									</c:if>
									<tr>
							<form name="profile">
								<td>${name}</td>
								<td>${career}</td>
								<td>${tel}</td>
								<td>${img}</td>
								<td>${intro}</td>
								<td>
									<input type="button" class="btn btn-info" onclick="modifyProfile(this.form)" value="수정" />
								</td>
								<td>
									<input type="hidden" name="teacher_id" value="${t_id}" />
									<input type="button" class="btn btn-danger" value="삭제" onclick="deletePro(this.form)" />
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