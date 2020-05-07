<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.time.LocalDate" %>
<c:set var="now_year" value="<%= LocalDate.now().getYear()%>" />

<html>
<head>
<title>학생페이지</title>

    <!-- FontAwesome JS-->
    <script defer src="https://use.fontawesome.com/releases/v5.1.1/js/all.js" integrity="sha384-BtvRZcyfv4r0x/phJt9Y9HhnN5ur1Z+kZbKVgzVBAlQZX4jvAuImlIz+bG7TS00a" crossorigin="anonymous"></script>

    <!-- Theme CSS --> 
	<link id="theme-style" rel="stylesheet" href="/Education/Sunghee/plugins/layout/pillar-3.css">
	
	<script>
		function check() {
	
			var when = eval("document.when");
			if (!when.d_yy.value) {
				alert("일자를 선택해주세요");
				return false;
			}
	
			if (!when.d_mm.value) {
				alert("일자를 선택해주세요");
				return false;
			}
			document.when.submit()
		}
	</script>
	<style>
	
		.test:hover {
			background-color:#e0e0e0b8;
		}
		
		.thumblist{
			
			padding:0;
			margin:0;
			height:220px;
			width:220px;
			overflow:hidden;
		}
		
		.thumblist img{
			vertical-align: middle;
			max-width: 100%;
			min-height:100%;
			-ms-interpolation-mode:bicubic;
			margin-left: 50%;
			height: auto
		}
		
		.margin-bottom{
			margin-bottom: 3em;
		}
		
		
		.second li{
			width:240px;
			font-size: 1rem;
			line-height: 1.5;
		}
		
		.btn-plus{
			background-color: #FFF;
			border-color: #FFF;
			color:#22A162;
			width:100%;
		}
		
		.hi{
			height:220px;
		}
	</style>
	
</head>
<body>
	<article class="resume-wrapper text-center position-relative">
		<div class="resume-wrapper-inner mx-auto text-left bg-white shadow-lg">
			<header class="resume-header pt-4 pt-md-0">
				<div class="media flex-column flex-md-row ">
					<div class="thumblist" >
					
						<c:set var="img1" value="${fn:substring(student.s_img,85,120)}" />
						<c:set var="img2" value="\stuSave\null" />
						<c:if test="${img1 eq img2 }">
						<c:set var="img1" value="/stuSave/다운로드.jpg" />
						</c:if>
						
						<img class="mr-3 mx-auto img-fluid" src="${pageContext.request.contextPath}${img1}" alt="이미지">
					</div>
					
					<div class="media-body p-4 d-flex flex-column flex-md-row mx-auto mx-lg-0 hi">
						<div class="primary-info">
							<h2 class="name mt-0 mb-1 text-white text-uppercase text-uppercase">${student.s_name}의 보육일지</h2>
							<br><br>
						    <ul class="list-unstyled">
								<li><i class="fas fa-heart"></i> 담당선생님 :&nbsp; ${t_name}</li>
								<li><i class="fas fa-heart"></i> 학부모님&emsp;&nbsp;:&nbsp; ${user.u_name}</li>
						    </ul>
						</div><!--//primary-info-->
						
						<div class="secondary-info ml-md-auto mt-2 second">
							<ul class="resume-social list-unstyled">
								<li><i class="fas fa-birthday-cake"></i> 생년월일 : ${student.s_birth}</li>
								<li><i class="fas fa-phone"></i> 연락처&emsp; : ${user.u_tel}</li>
								<li><i class="fas fa-home"></i> 주소&emsp;&emsp; : [${user.zipcode}]<br>${user.u_addr}</li>
								<br>
								<c:if test="${fn:contains(sessionScope.memId,'teacher')}">
										<button class="btn btn-plus" onclick="document.location.href='/Education/Diary/dairy_write.do?s_no=${student.s_no}'">
											<i class="fas fa-plus-circle" style="margin-bottom:3px"></i> 일지 작성
										</button>
								</c:if>
							</ul>
						</div><!--//secondary-info-->
					</div> 
				</div> 
			</header>
			<div class="resume-body p-5">

				<section class="resume-section summary-section mb-5">
					<form name="when" action="/Education/Diary/diary_list.do" method="get">
				    	<h2 class="resume-section-title text-uppercase font-weight-bold pb-3 mb-3" >날짜 선택
				    		<span style="color:black"><small>
					    		<input type="hidden" name="s_no" value="${student.s_no}">
					    		<select name="d_yy" onchange="check()" required>
									<option selected value="${d_yy}" hidden>${d_yy}</option>
									<c:forEach var="i" begin="0" end="${now_year-2005}">
									<option value="${now_year-i}">${now_year-i}</option>
									</c:forEach>
								</select> 년 
								<select name="d_mm" onchange="check()" required>
									<option selected value="${d_mm}" hidden>${d_mm}</option>
									<c:forEach var="i" begin="1" end="12" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select> 월 
				    		</small></span>
				    	</h2>
				 	</form>
				 	
				 	<c:set var="j" value="0" />
					<c:forEach var="i" begin="1" end="${end_day}" step="1">
						<c:choose>
				    		<c:when test="${j < articleList.size() && articleList[j].d_dd == i}">
					<div class="resume-timeline position-relative test">
						    <article class="resume-timeline-item position-relative pb-5">
									    <div class="resume-timeline-item-header mb-2">
										    <div class="d-flex flex-column flex-md-row">
										        <h3 class="resume-position-title font-weight-bold mb-1">${i}일</h3>
										        <div class="resume-company-name ml-auto">${articleList[j].d_date}</div>
										   </div><!--//row-->
										   
									    </div><!--//resume-timeline-item-header-->
									    <div class="resume-timeline-item-desc">
											<h4 style="text-align:center"><a href="/Education/Diary/dairy_content.do?d_num=${articleList[j].d_num}">${articleList[j].d_subject}</a></h4>									    	
									    		
									    </div><!--//resume-timeline-item-desc-->
						    </article><!--//resume-timeline-item-->
					</div><!--//resume-timeline-->
						
							<c:set var="j" value="${j+1}"/>
							</c:when>
							<c:otherwise>

					<div class="resume-timeline position-relative test">
						    <article class="resume-timeline-item position-relative pb-5">
									    <div class="resume-timeline-item-header mb-2">
										   <div class="d-flex flex-column flex-md-row">
										        <h3 class="resume-position-title font-weight-bold mb-1">${i}일 </h3>
										        <div class="resume-company-name ml-auto">-- : --</div>
										   </div><!--//row-->
									    </div><!--//resume-timeline-item-header-->
									    <div class="resume-timeline-item-desc" align="center">
									    	<small class="text-muted"> 해당 일지 없음 </small>
									    </div><!--//resume-timeline-item-desc-->
						    </article><!--//resume-timeline-item-->
					</div><!--//resume-timeline-->

							</c:otherwise>
						</c:choose>
					</c:forEach>
			    </section><!--//summary-section-->
			</div><!--//resume-body-->
			
		</div>
	</article>


</body>
</html>