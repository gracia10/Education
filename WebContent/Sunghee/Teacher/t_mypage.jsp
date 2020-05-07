<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
	<title>선생님 마이페이지</title>
	
	
    <link href="/Education/Sunghee/plugins/layout/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	
	<!-- 타임테이블 -->
    <link rel="stylesheet" href="/Education/Sunghee/plugins/Grible_timetable/styles/timetablejs.css">
    <script src="/Education/Sunghee/plugins/Grible_timetable/scripts/timetable.js"></script>
    
   	<!-- FontAwesome JS-->
    <script defer src="https://use.fontawesome.com/releases/v5.1.1/js/all.js" integrity="sha384-BtvRZcyfv4r0x/phJt9Y9HhnN5ur1Z+kZbKVgzVBAlQZX4jvAuImlIz+bG7TS00a" crossorigin="anonymous"></script>
	
    
    <jsp:include page="/tiles/header.jsp" />
    <jsp:include page="/tiles/aside1.jsp" />

	<style>

		.img-fluid{
		max-width: 100%;
    height: auto;
		}

		.default{
			padding: 4px;
	    	margin-bottom: 20px;
  		  	line-height: 1.42857143;
  		  	background-color: #fff;
   			border: 1px solid #ddd;
    		border-radius: 4px;
		}
		
		.thumblist{
			margin-top: 20px;
			margin-left: auto!important;
			margin-right: auto!important;
			height:150px;
			width:150px;
			overflow:hidden;
			align:center;
			border-radius:50%!important;
			
		}
		
		.thumblist img{
   			
			min-width:auto;
			min-height:100%;
			-ms-interpolation-mode:bicubic;
		}
		
		.margin-bottom{
			margin-bottom:54px;
		}
		
		
		.plusbt{
			margin-top: 10px;
			margin-right: 20px;
			float:right;
			font-size: 15px;
		}
		
		.btn-primary {
			float : right;
		}
		
	</style>

</head>

<body> 

	<main class="mdl-layout__content mdl-color--grey-100">
		<div class="content margin-bottom">
			<div class="container">
				<br>
				<!-- 프로필 추가 -->
				<br>
				<button type="button" class="btn btn-primary" onclick="createProfile()">선생님 프로필 변경</button>
				
				<!-- 시간표 -->
				<div class="row">
					<div class="col-lg-12">
						<h5 class="my-4"><b>시간표</b></h5>
							<a href="#" onClick="writeWS()" class="plusbt"><i class="far fa-calendar-plus"></i> 일정 추가</a>
						<div class="default">
		          			<div class="timetable">타임테이블</div>
	          			</div>
	        		</div>
				</div>
				<br>
				
				<!-- 담당 학생프로필 -->
				<div class="row">
					<div class="col-lg-12">
	          			<h5 class="my-4 "><b>담당 학생프로필</b></h5>
	        		</div>
	        		<c:forEach var="student" items="${studentList}">
	        		

	        		<c:set var="img1" value="${fn:substring(student.s_img,85,120)}" />
					<c:set var="img2" value="\stuSave\null" />
					<c:if test="${img1 eq img2 }">
					<c:set var="img1" value="/stuSave/다운로드.jpg" />
					</c:if>    		
	        		<div class="col-lg-3 col-sm-6 text-center mb-4 ">
	        			<div class="thumbnail profile">
	        				<div class="thumblist">
		          				<img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}${img1}" alt="프로필사진">
		          			</div>
		          			<h4>${student.s_name}<br><small>${student.s_birth}</small></h4>
		          			<p><button type="button" class="btn btn-info" onclick="window.open('/Education/Diary/diary_list.do?s_no=${student.s_no}','학생페이지','width=screen.width, height=100%')">학생페이지로 이동</button>
							</p>
						</div>
	        		</div>
	        		</c:forEach>
				</div>
				
			</div>
		</div>
	</main>

	<script>
		var timetable = new Timetable();
		timetable.setScope(8,18);													
		timetable.addLocations(['월요일', '화요일', '수요일', '목요일', '금요일']);	
		
		<c:forEach var="ws" items="${wsList}">
			var schedule = '[${ws.schedule}] ${ws.starttime}-${ws.endtime}';
			var starttime = '${ws.starttime}'.split(':');
			var start = new Date(2015,5,15,parseInt(starttime[0]),parseInt(starttime[1]));
			var endtime = '${ws.endtime}'.split(':');
			var end = new Date(2015,5,15,parseInt(endtime[0]),parseInt(endtime[1]));
			
			timetable.addEvent(schedule,'${ws.ws_day}',start,end,{ 
				onClick:function(event) {
							if(confirm("삭제하시겠습니까")){
								location.href="/Education/Teacher/weeklyscheduledelete.do?ws_num=${ws.ws_num}";
							}
						} 
			});
		</c:forEach>  
		
	    var renderer = new Timetable.Renderer(timetable);
	    renderer.draw('.timetable');
	</script>
	
	<script>
		function createProfile() {
		   	url="/Education/administer/ModifyTeacherProfile.do?t_id=${memId}";
		   	window.open(url,"post","toolbar=no ,width=500 ,height=470,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");
	    }
	
		function writeWS() {	
		    url = "/Education/Sunghee/Teacher/weeklyschedule_write.jsp"; 
		    open(url, "confirm", ",width=500, height=400, toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no");
		}
	</script>
	
</body>
</html>