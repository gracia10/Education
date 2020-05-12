<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>유저 마이페이지</title>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.1.1/js/all.js" integrity="sha384-BtvRZcyfv4r0x/phJt9Y9HhnN5ur1Z+kZbKVgzVBAlQZX4jvAuImlIz+bG7TS00a" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/Education/Sunghee/plugins/layout/bootstrap.css">
	
	<!-- SH CSS -->
	<link id="theme-style" rel="stylesheet" href="/Education/Sunghee/plugins/layout/main.css">
	
	<style>
	
		 a:hover, a:active {text-decoration: none;}
	
		.white {
			color: #fff;
			padding-top: 15px;
		}
		
		.no_child{
			text-align: center;
			font-size: 2em;
			font-weight: 800;
			color:#8383837a;
		
		}

	</style>
	
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	<div class="header">
		<jsp:include page="/main/header.jsp" flush="false"/>
	</div>	
	
	<article class="whole">

		<div class="head">
			<div class="hello">
				 <span class="font-small">안녕하세요</span><br>
				 &ensp;${u_name}님
			</div>
			
			<div class="user">
				회원정보 수정<br>
				<a href="/Education/Jo/logon/passCheckForm.do">
					<i class="fas fa-arrow-alt-circle-right white fa-3x"></i></a>
			</div>
		</div>
		
		<div class="list">
			
			<div class="list_title">
			내 자녀 보육일지
			</div>
			
			<div class="container">
					<c:if test="${empty studentList}">
						<div class="no_child">등록된 자녀가 없습니다</div>
					</c:if>
			
	        		<c:forEach var="student" items="${studentList}">
		        		<c:set var="img1" value="${fn:substring(student.s_img,85,120)}" />
						<c:set var="img2" value="\stuSave\null" />
						<c:if test="${img1 eq img2 }">
							<c:set var="img1" value="/stuSave/다운로드.jpg" />
						</c:if> 
		        		<div class="col-lg-4 col-sm-6 text-center mb-4 student">
			        		<div class="thumbnail test ">
			          			<img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}${img1}" alt="프로필사진" width="150" height="150">
			          			<h3>${student.s_name}<br></h3>
			          			<p><button type="button" class="btn btn-info width" 
			          					onclick="window.open('/Education/Diary/diary_list.do?s_no=${student.s_no}','학생페이지','width=screen.width, height=100%')">학생페이지로 이동</button>
								</p>
							</div>
		        		</div>
	        		</c:forEach>
	

			</div>		
		
		</div>		
	
	</article>


</div>
</body>
</html>