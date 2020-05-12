<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.LocalDate" %>
<c:set var="now_year" value="<%= LocalDate.now().getYear()%>" />
<html>
<head>
<title>일지페이지</title>

	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
	
	<!-- 성희쓰 -->
	<link href="/Education/Sunghee/plugins/layout/write.css" rel="stylesheet">
		
		
	<!-- 부트스트랩 -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- 썸머노트 에디터 --> 
	<link href="/Education/Sunghee/plugins/summernote/summernote.css" rel="stylesheet"> 
	<script src="/Education/Sunghee/plugins/summernote/summernote.js"></script>
	<script src="/Education/Sunghee/plugins/summernote/lang/summernote-ko-KR.js"></script>
	
	<!-- FontAwesome JS-->
    <script defer src="https://use.fontawesome.com/releases/v5.1.1/js/all.js" integrity="sha384-BtvRZcyfv4r0x/phJt9Y9HhnN5ur1Z+kZbKVgzVBAlQZX4jvAuImlIz+bG7TS00a" crossorigin="anonymous"></script>
	

	<script type="text/javascript">
	
		$(document).ready(function() {
			$('#summernote').summernote({ 
				height: 300,          
				focus: true, 
				lang: 'ko-KR', 
				callbacks:{
						onImageUpload: function(files, editor, welEditable){
				            	sendFile(files[0],this);
					} 
				}
			});
		});
	
	  	function sendFile(file, editor) {
			var data  = new FormData();
			data.append('file', file);
	      	$.ajax({
	        	data: data,
	        	type: 'post',
	        	url: '<c:url value='/Diary/imageUpload.do'/>',
	        	dataType : "json",
	        	cache: false,
	        	contentType:false,
	        	processData: false,
	        	success: function(data){
	        		$('#summernote').summernote('insertImage',data.url); 
	        	},
	        	error: function(jqXHR, textStatus, errorThrown) {
		 	   		alert(jqXHR+"~"+textStatus+"~"+errorThrown);
				}
	      	});
	    } 
	  	
	  	function checking(){
	  		
	  		var userinput = eval("document.userinput");
	  		
	  		var dateList = new Array();
	  		
	  		<c:forEach var="date" items="${dateList}">
	  			dateList.push("${date}");
	  		</c:forEach>
	
	  		for (var i = 0; i < dateList.length; i++) {
	  		    if(dateList[i] == userinput.input_date.value){
	  		    	alert("해당 일자의 일지가 있습니다.");
	  		    	return false;
	  		    }
	  		}
	
	  		var date = userinput.input_date.value;
	  		var strarr = date.split('-');
	  		userinput.d_yy.value = strarr[0];
	  		userinput.d_mm.value = strarr[1];
	  		userinput.d_dd.value = strarr[2];
	
	  	}
	  	
	</script>
	<style>
	
	.bt {		
		color: #fff;
   		background-color: #22A162 
	}	
	
	.icon{
		color:#22A162;
	}
	
	.icon:hover{
		color:#256143;
	}
	
	.modal_body{
		margin-left:15px;
		margin-right:15px;
	}
	</style>


</head>
<body>
	<article class="resume-wrapper position-relative">
		<div class="resume-wrapper-inner mx-auto text-left bg-white shadow-lg">
			<div class="resume-body p-5">		
				<!-- 뒤로가기 -->
				<a href="/Education/Diary/diary_list.do?s_no=${s_no}"><i class="fas fa-arrow-alt-circle-left fa-3x icon"></i></a>
			
				<h2 class="resume-section-title">│새일지 작성</h2>
			
				<!-- 본문 -->
				<div class="d-flex flex-column">
				
					<form method="get" action="/Education/Diary/dairy_writePro.do" onsubmit="return checking()" name="userinput" class="form-horizontal">
							<input type="hidden" name="d_yy">
							<input type="hidden" name="d_mm">
							<input type="hidden" name="d_dd">
							<input type="hidden" name="s_no" value="${s_no}">
					
							<input type="date" name="input_date" min="2005-01-01" max="${now_year}-12-31" required class="form-control pb-3"><br>
							<input type="text" placeholder="제목" name="d_subject" required class="form-control pb-3" ><br>
							<textarea name="d_content" id="summernote" rows="100">일지를 등록해주세요</textarea>
							<input type="submit" value="등록" class="form-control bt">

					</form>
			
				</div><!-- 본문 -->
			
			
			</div><!-- resume-body -->
		</div>
	</article>



</body>
</html>