<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>시간표 추가</title>
	
	<!-- 부스스트랩,제이쿼리 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">    
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>

    <!-- 타임시간하고 분만 받아오기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js" type="text/javascript" ></script>
	<script src=" https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js" type="text/javascript" ></script>
    <script src="/Education/Sunghee/plugins/jquery-timepicker-1.3.5/jquery.timepicker.min.js"></script>
    <link rel="stylesheet" href="/Education/Sunghee/plugins/jquery-timepicker-1.3.5/jquery.timepicker.css">
    
	<script type='text/javascript'> 
	$(document).ready(function(){
		$('input.timepicker').timepicker({
		    timeFormat: 'HH:mm',
		    interval: 30,
		    minTime: '09:00',
		    maxTime: '18:00',
		    defaultTime: '09:00',
		    startTime: '09:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: false
		});
	});
	

	   function check(){
		      
	        if($("#starttime").val() > $("#endtime").val()){
	           	alert("시작시간은 종료시간보다 클 수 없습니다.");
	           	return false;
	        }else if($("#starttime").val() == $("#endtime").val()){
	        	alert("시작시간과 종료시간은 같을 수 없습니다.");
		      	return false;
	        }

	       window.opener.name = "parent";
	       document.ws_form.target = "parent";
	       document.ws_form.action = "/Education/Teacher/weeklyschedulewrite.do";
	       document.ws_form.submit();
	       self.close();
	   }
	
	</script>
</head>
<body>

<div class="container">
	<form name="ws_form" method="get" action="/Education/Teacher/weeklyschedulewrite.do" onsubmit="return check()" class="form-inline">
		<fieldset>
			<h3>시간표 추가</h3>
			<hr>
				<div class="form-group">
					<label>요일 지정:</label> 
						<select name="ws_day" required class="form-control">
								<option value="월요일">월요일</option>
								<option value="화요일">화요일</option>
								<option value="수요일">수요일</option>
								<option value="목요일">목요일</option>
								<option value="금요일">금요일</option>
						</select>
				</div>
				<div class="form-group">
					<label>시작 시간:</label> 
						<input class="timepicker" name="starttime" id="starttime" required class="form-control" />
				</div>
				<div class="form-group">
					<label>종료 시간:</label> 
						<input class="timepicker" name="endtime" id="endtime" required class="form-control"/>
				</div>
				<div class="form-group">
					<label>등록 정보:</label> 
						<input type="text" name="schedule" required />
				</div>
				<div align="center">
					<input type="submit" value="등록" class="btn btn-info">
				</div>
		</fieldset>
	</form>
</div>
</body>
</html>